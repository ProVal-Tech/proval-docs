param(
    # Only docs whose last commit is on or after this date are sent to Gemini for an impact score.
    [datetime]$ImpactScoreSince = (Get-Date).AddMonths(-3),
    [string]$GeminiApiKey = $env:GEMINI_API_KEY,
    [string]$GeminiModel = 'gemini-3.5-flash-lite',
    # Docs are scored in batches so many docs share one Gemini request. A batch closes at this many docs or characters.
    [int]$ImpactScoreBatchSize = 20,
    [int]$ImpactScoreBatchMaxChars = 100000,
    # Pause between Gemini requests to stay under API rate limits
    [int]$GeminiRequestDelayMs = 4000
)

$impactScoreInstruction = @'
You are scoring documentation for MSP (managed service provider) automation solutions.
You will receive one or more documents, each wrapped in <document id="N"> tags.
For each document, return an integer impact score from 0 to 100 that reflects how much impact the described solution can make.
Score each document independently on an absolute scale. Do not compare documents to each other or spread scores across the batch.
Base each score ONLY on the information in that document. Do not assume capabilities, scope, or benefits the document does not state.
Weigh these three factors equally:
1. Breadth of applicability: how many clients, endpoints, or environments could use it.
2. Time saved / automation: how much manual technician work it eliminates.
3. Security and risk reduction: patching, vulnerability remediation, compliance, or outage prevention.
Thin, vague, or purely reference documents should score lower.
Return exactly one result for every document, using its id.
'@

function Get-ImpactScores {
    param(
        [string[]]$Documents,
        [string]$ApiKey,
        [string]$Model
    )

    # Send the whole batch in one request, tagging each document with its 1-based position as its id
    $prompt = (0..($Documents.Count - 1) | ForEach-Object { "<document id=`"$($_ + 1)`">`n$($Documents[$_])`n</document>" }) -join "`n`n"

    $uri = "https://generativelanguage.googleapis.com/v1beta/models/$($Model):generateContent"
    $headers = @{ 'x-goog-api-key' = $ApiKey }
    $body = @{
        systemInstruction = @{ parts = @(@{ text = $impactScoreInstruction }) }
        contents          = @(@{ role = 'user'; parts = @(@{ text = $prompt }) })
        # Gemini 3.x models are tuned for the default temperature, so it is intentionally not set
        generationConfig  = @{
            responseMimeType = 'application/json'
            responseSchema   = @{
                type  = 'ARRAY'
                items = @{
                    type       = 'OBJECT'
                    properties = @{
                        id          = @{ type = 'INTEGER' }
                        impactScore = @{ type = 'INTEGER' }
                    }
                    required   = @('id', 'impactScore')
                }
            }
        }
    } | ConvertTo-Json -Depth 10 -Compress

    $response = $null
    $maxAttempts = 5
    for ($attempt = 1; $attempt -le $maxAttempts; $attempt++) {
        try {
            $response = Invoke-RestMethod -Uri $uri -Method Post -Headers $headers -Body ([System.Text.Encoding]::UTF8.GetBytes($body)) -ContentType 'application/json; charset=utf-8' -TimeoutSec 120
            break
        }
        catch {
            $err = $_
            $statusCode = $null
            if ($err.Exception.Response) { $statusCode = [int]$err.Exception.Response.StatusCode }

            # Gemini's error body explains the failure and can include quota details and a suggested retry delay
            $apiError = $null
            if ($err.ErrorDetails.Message) {
                try { $apiError = ($err.ErrorDetails.Message | ConvertFrom-Json).error } catch { }
            }
            $reason = if ($apiError.message) { $apiError.message } else { $err.Exception.Message }
            $quotaIds = @($apiError.details | Where-Object { $_.'@type' -like '*QuotaFailure' } | ForEach-Object { $_.violations.quotaId })
            $retryDelay = $apiError.details | Where-Object { $_.'@type' -like '*RetryInfo' } | ForEach-Object { $_.retryDelay } | Select-Object -First 1

            # Retry on rate limits, server errors, and connection failures (no status code), unless the daily quota is used up
            $dailyQuotaReached = ($statusCode -eq 429) -and ($quotaIds -match 'PerDay')
            $retryable = (-not $dailyQuotaReached) -and (($null -eq $statusCode) -or ($statusCode -eq 429) -or ($statusCode -ge 500))
            if ($retryable -and $attempt -lt $maxAttempts) {
                # Wait as long as Gemini asks when it says, otherwise back off 5s, 10s, 20s, 40s
                $waitSeconds = if ("$retryDelay" -match '^(\d+(\.\d+)?)s$') { [Math]::Ceiling([double]$Matches[1]) + 1 } else { 5 * [Math]::Pow(2, $attempt - 1) }
                Start-Sleep -Seconds ([Math]::Min($waitSeconds, 60))
                continue
            }
            Write-Warning "Impact score request failed (status: $statusCode): $reason"
            return $null
        }
    }

    # Returns a hashtable of document id (1-based position) to score
    $scores = @{}
    try {
        # Skip any thought parts and join the JSON answer text
        $text = ($response.candidates[0].content.parts | Where-Object { $_.text -and -not $_.thought } | ForEach-Object { $_.text }) -join ''
        foreach ($result in @($text | ConvertFrom-Json)) {
            $id = $result.id -as [int]
            $score = $result.impactScore -as [int]
            if ($null -eq $id -or $null -eq $score -or $id -lt 1 -or $id -gt $Documents.Count -or $scores.ContainsKey($id)) {
                continue
            }
            $scores[$id] = [Math]::Max(0, [Math]::Min(100, $score))
        }
    }
    catch {
        Write-Warning "Could not read impact scores from Gemini response: $($_.Exception.Message)"
        return $null
    }

    if ($scores.Count -eq 0) {
        Write-Warning "Gemini response did not include any usable impact scores."
        return $null
    }
    if ($scores.Count -lt $Documents.Count) {
        Write-Warning "Gemini returned scores for $($scores.Count) of $($Documents.Count) documents in the batch."
    }
    return $scores
}

function Get-FirstH2Summary {
    param(
        [string[]]$Lines
    )

    if (-not $Lines -or $Lines.Length -eq 0) {
        return ""
    }

    for ($i = 0; $i -lt $Lines.Length; $i++) {
        $line = $Lines[$i]
        if ($line -match '^\s*##\s*(.+)$') {
            $summaryLines = @()
            for ($j = $i + 1; $j -lt $Lines.Length; $j++) {
                $nextLine = $Lines[$j]
                if ($nextLine -match '^\s*##\s+') {
                    break
                }
                $summaryLines += $nextLine
            }
            return ($summaryLines -join "`n").Trim()
        }
    }

    return ""
}

function Get-Changelog {
    param(
        [string[]]$Lines
    )

    if (-not $Lines -or $Lines.Length -eq 0) {
        return @()
    }

    # Find the ## Changelog heading
    $changelogStart = -1
    for ($i = 0; $i -lt $Lines.Length; $i++) {
        if ($Lines[$i] -match '^\s*##\s+Changelog\s*$') {
            $changelogStart = $i
            break
        }
    }

    if ($changelogStart -lt 0) {
        return @()
    }

    $entries = @()
    $currentDate = $null
    $currentChanges = @()

    for ($j = $changelogStart + 1; $j -lt $Lines.Length; $j++) {
        $line = $Lines[$j]

        # Stop if we hit another H2 section
        if ($line -match '^\s*##\s+(?!#)') {
            break
        }

        # Match ### YYYY-MM-DD date subheading
        if ($line -match '^\s*###\s+(\d{4}-\d{2}-\d{2})\s*$') {
            # Save previous entry if exists
            if ($currentDate -and $currentChanges.Count -gt 0) {
                $entries += [PSCustomObject]@{
                    Date    = $currentDate
                    Changes = @($currentChanges)
                }
            }
            $currentDate = $Matches[1]
            $currentChanges = @()
            continue
        }

        # Match bullet list items (- or *)
        if ($currentDate -and $line -match '^\s*[-*]\s+(.+)$') {
            $currentChanges += $Matches[1].Trim()
        }
        # Append continuation lines (non-empty, non-heading, non-bullet) to the last bullet
        elseif ($currentDate -and $currentChanges.Count -gt 0 -and $line.Trim() -ne '' -and $line -notmatch '^\s*###?\s+') {
            $currentChanges[$currentChanges.Count - 1] += ' ' + $line.Trim()
        }
    }

    # Save last entry
    if ($currentDate -and $currentChanges.Count -gt 0) {
        $entries += [PSCustomObject]@{
            Date    = $currentDate
            Changes = @($currentChanges)
        }
    }

    return $entries
}

function Set-LastUpdateFrontMatter {
    param(
        [string]$FilePath,
        [datetime]$LastCommit
    )

    if (-not (Test-Path $FilePath)) {
        return
    }

    $dateValue = $LastCommit.ToString("yyyy-MM-dd")
    $lines = Get-Content $FilePath

    if (-not $lines -or $lines.Length -lt 2) {
        return
    }

    $startIndex = $lines.IndexOf('---')
    if ($startIndex -lt 0) {
        return
    }

    $endIndex = -1
    for ($i = $startIndex + 1; $i -lt $lines.Length; $i++) {
        if ($lines[$i] -eq '---') {
            $endIndex = $i
            break
        }
    }

    if ($endIndex -lt 0) {
        return
    }

    if ($endIndex -le ($startIndex + 1)) {
        $frontMatter = @()
    }
    else {
        $frontMatter = $lines[(($startIndex + 1))..($endIndex - 1)]
    }
    $updatedFrontMatter = @()
    $lastUpdateFound = $false
    $skipNextDateLine = $false

    for ($i = 0; $i -lt $frontMatter.Length; $i++) {
        $line = $frontMatter[$i]

        if ($skipNextDateLine) {
            if ($line -match '^\s{2}date\s*:') {
                $updatedFrontMatter += "  date: $dateValue"
                $skipNextDateLine = $false
                $lastUpdateFound = $true
                continue
            }
            $skipNextDateLine = $false
        }

        if ($line -match '^last_update\s*:') {
            $updatedFrontMatter += 'last_update:'
            $skipNextDateLine = $true
            continue
        }

        $updatedFrontMatter += $line
    }

    if (-not $lastUpdateFound) {
        $updatedFrontMatter += 'last_update:'
        $updatedFrontMatter += "  date: $dateValue"
    }

    $newContent = @()
    $newContent += $lines[0..$startIndex]
    $newContent += $updatedFrontMatter
    $newContent += $lines[$endIndex..($lines.Length - 1)]

    Set-Content -Path $FilePath -Value $newContent -Encoding UTF8
}

$docsPath = (Get-Item $PSScriptRoot).Parent.FullName + "\docs"
$docs = Get-ChildItem $docsPath -Recurse -Filter "*.md"
$recentDocs = $docs | ForEach-Object {
    $parentPath = Split-Path $_.FullName
    if ((Get-Item $parentPath).Name -in ("docs", "unsorted")) {
        return
    }
    if ((Get-Item (Split-Path $parentPath)).Name -ne "docs") {
        $parentPath = Split-Path $parentPath
        while ((Get-Item (Split-Path $parentPath)).Name -ne "docs") {
            $parentPath = Split-Path $parentPath
        }
    }
    $parentName = (Get-Item $parentPath).Name
    $immediateParent = (Get-Item (Split-Path $_.FullName)).Name
    $contentType = if ($immediateParent -eq $parentName) { '' } else { $immediateParent }
    $excludeCommits = @('790524fac17396e3a43f773f680285e1986b22b3')
    $lastCommitRaw = (git log --format="%H %ci" -- $_.FullName 2>$null) -split "`n" |
    Where-Object { $_ -and ($excludeCommits -notcontains $_.Substring(0, [Math]::Min($_.Length, 40))) } |
    Select-Object -First 1
    $lastCommitTime = if ($lastCommitRaw) { [datetime]::Parse($lastCommitRaw.Substring(41)) } else { $null }
    $_ | `
        Add-Member -NotePropertyName "LastCommitTime" -NotePropertyValue $lastCommitTime -PassThru | `
        Add-Member -NotePropertyName "Category" -NotePropertyValue $parentName -PassThru | `
        Add-Member -NotePropertyName "ContentType" -NotePropertyValue $contentType -PassThru | `
        Add-Member -NotePropertyName "GitAddedTime" -NotePropertyValue (
        [datetime]::Parse(((git log --diff-filter=A --format="%ci" -- $_.FullName 2>$null) -split ("`n") | Select-Object -Last 1))
    ) -PassThru
} | Where-Object { $_.LastCommitTime -ne $null } | Sort-Object LastCommitTime -Descending

$recentDocsPath = "$((Get-Item $PSScriptRoot).Parent.FullName)\static\api\recentDocs.json"

# Carry forward impact scores already stored in recentDocs.json so docs are only scored once
$existingScores = @{}
if (Test-Path $recentDocsPath) {
    try {
        foreach ($entry in (Get-Content $recentDocsPath -Raw | ConvertFrom-Json)) {
            if ($entry.Slug -and $null -ne $entry.ImpactScore) {
                $existingScores[$entry.Slug] = [int]$entry.ImpactScore
            }
        }
    }
    catch {
        Write-Warning "Could not read existing impact scores from recentDocs.json: $($_.Exception.Message)"
    }
}

$scoredCount = 0
$carriedCount = 0
$failedCount = 0
$pendingDocs = [System.Collections.Generic.List[object]]::new()

$output = foreach ($doc in $recentDocs) {
    $content = Get-Content $doc.FullName
    $title = $content | Select-String -Pattern "^title: (`"|')(.*)(`"|')"
    $slug = $content | Select-String -Pattern "^slug: (`"|')?(.*)(`"|')?"
    $titleValue = if ($title) { $title.Matches[0].Groups[2].Value } else { "No Title" }
    $slugValue = if ($slug) { $slug.Matches[0].Groups[2].Value } else { $doc.BaseName }
    $summary = Get-FirstH2Summary -Lines $content
    $changelog = Get-Changelog -Lines $content
    if ($doc.LastCommitTime) {
        Set-LastUpdateFrontMatter -FilePath $doc.FullName -LastCommit $doc.LastCommitTime
    }

    # Docs without a GUID slug or title are left out of recentDocs.json, so don't spend API calls on them
    if ($slugValue -notmatch "[0-9A-Fa-f]{8}(?:-[0-9A-Fa-f]{4}){3}-[0-9A-Fa-f]{12}" -or $titleValue.Trim() -eq "") {
        continue
    }

    $impactScore = $existingScores[$slugValue]
    if ($null -ne $impactScore) {
        $carriedCount++
    }

    $entry = [PSCustomObject]@{
        Title       = $titleValue
        Slug        = $slugValue
        LastCommit  = $doc.LastCommitTime
        Category    = $doc.Category
        ContentType = $doc.ContentType
        GitAdded    = $doc.GitAddedTime
        Summary     = $summary
        Changelog   = @($changelog)
        ImpactScore = $impactScore
    }
    if ($null -eq $impactScore -and $GeminiApiKey -and $doc.LastCommitTime -ge $ImpactScoreSince) {
        $pendingDocs.Add([PSCustomObject]@{ Entry = $entry; Content = ($content -join "`n") })
    }
    $entry
}

# Group unscored docs into batches so many docs share one Gemini request (free-tier limits count requests, not docs)
$batches = [System.Collections.Generic.List[object]]::new()
$currentBatch = [System.Collections.Generic.List[object]]::new()
$currentBatchChars = 0
foreach ($pendingDoc in $pendingDocs) {
    if ($currentBatch.Count -gt 0 -and ($currentBatch.Count -ge $ImpactScoreBatchSize -or ($currentBatchChars + $pendingDoc.Content.Length) -gt $ImpactScoreBatchMaxChars)) {
        $batches.Add($currentBatch)
        $currentBatch = [System.Collections.Generic.List[object]]::new()
        $currentBatchChars = 0
    }
    $currentBatch.Add($pendingDoc)
    $currentBatchChars += $pendingDoc.Content.Length
}
if ($currentBatch.Count -gt 0) {
    $batches.Add($currentBatch)
}

$consecutiveFailures = 0
foreach ($batch in $batches) {
    Start-Sleep -Milliseconds $GeminiRequestDelayMs
    $scores = Get-ImpactScores -Documents @($batch | ForEach-Object { $_.Content }) -ApiKey $GeminiApiKey -Model $GeminiModel
    if ($null -eq $scores) {
        $failedCount += $batch.Count
        $consecutiveFailures++
        # Stop calling Gemini if it keeps failing (outage or quota used up); unscored docs are retried next run
        if ($consecutiveFailures -ge 3) {
            Write-Warning "Gemini failed $consecutiveFailures times in a row. Skipping impact scoring for the rest of this run."
            break
        }
        continue
    }
    $consecutiveFailures = 0
    for ($i = 0; $i -lt $batch.Count; $i++) {
        $score = $scores[$i + 1]
        if ($null -eq $score) {
            $failedCount++
        }
        else {
            $batch[$i].Entry.ImpactScore = $score
            $scoredCount++
        }
    }
}
$skippedCount = $pendingDocs.Count - $scoredCount - $failedCount

$output | ConvertTo-Json -Depth 5 | Out-File -FilePath $recentDocsPath -Encoding UTF8
Write-Host "Impact scores: $scoredCount scored, $carriedCount carried forward, $failedCount failed, $skippedCount skipped ($($pendingDocs.Count) unscored docs in $($batches.Count) Gemini requests)."