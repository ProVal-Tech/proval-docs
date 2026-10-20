param(
    # Only docs whose last commit is on or after this date are sent to Gemini for an impact score.
    [datetime]$ImpactScoreSince = (Get-Date).AddMonths(-3),
    [string]$GeminiApiKey = $env:GEMINI_API_KEY,
    [string]$GeminiModel = 'gemini-3.8-flash',
    # Pause between Gemini requests to stay under API rate limits
    [int]$GeminiRequestDelayMs = 1000
)

$impactScoreInstruction = @'
You are scoring documentation for an MSP (managed service provider) automation solution.
Return an integer impact score from 0 to 100 that reflects how much impact the described solution can make.
Base the score ONLY on the information in the document. Do not assume capabilities, scope, or benefits the document does not state.
Weigh these three factors equally:
1. Breadth of applicability: how many clients, endpoints, or environments could use it.
2. Time saved / automation: how much manual technician work it eliminates.
3. Security and risk reduction: patching, vulnerability remediation, compliance, or outage prevention.
Thin, vague, or purely reference documents should score lower.
'@

function Get-ImpactScore {
    param(
        [string]$Content,
        [string]$ApiKey,
        [string]$Model
    )

    $uri = "https://generativelanguage.googleapis.com/v1beta/models/$($Model):generateContent"
    $headers = @{ 'x-goog-api-key' = $ApiKey }
    $body = @{
        systemInstruction = @{ parts = @(@{ text = $impactScoreInstruction }) }
        contents          = @(@{ role = 'user'; parts = @(@{ text = $Content }) })
        # Gemini 3.x models are tuned for the default temperature, so it is intentionally not set
        generationConfig  = @{
            responseMimeType = 'application/json'
            responseSchema   = @{
                type       = 'OBJECT'
                properties = @{ impactScore = @{ type = 'INTEGER' } }
                required   = @('impactScore')
            }
        }
    } | ConvertTo-Json -Depth 10 -Compress

    $response = $null
    $maxAttempts = 3
    for ($attempt = 1; $attempt -le $maxAttempts; $attempt++) {
        try {
            $response = Invoke-RestMethod -Uri $uri -Method Post -Headers $headers -Body ([System.Text.Encoding]::UTF8.GetBytes($body)) -ContentType 'application/json; charset=utf-8' -TimeoutSec 60
            break
        }
        catch {
            $statusCode = $null
            if ($_.Exception.Response) { $statusCode = [int]$_.Exception.Response.StatusCode }
            # Retry on rate limits, server errors, and connection failures (no status code)
            $retryable = ($null -eq $statusCode) -or ($statusCode -eq 429) -or ($statusCode -ge 500)
            if ($retryable -and $attempt -lt $maxAttempts) {
                Start-Sleep -Seconds ([Math]::Pow(2, $attempt) * 2)
                continue
            }
            Write-Warning "Impact score request failed (status: $statusCode): $($_.Exception.Message)"
            return $null
        }
    }

    try {
        # Skip any thought parts and join the JSON answer text
        $text = ($response.candidates[0].content.parts | Where-Object { $_.text -and -not $_.thought } | ForEach-Object { $_.text }) -join ''
        $parsed = $text | ConvertFrom-Json
        if ($null -eq $parsed.impactScore) {
            throw "Response did not include an impactScore."
        }
        return [Math]::Max(0, [Math]::Min(100, [int]$parsed.impactScore))
    }
    catch {
        Write-Warning "Could not read impact score from Gemini response: $($_.Exception.Message)"
        return $null
    }
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
$consecutiveFailures = 0
$geminiDisabled = -not $GeminiApiKey

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
    elseif (-not $geminiDisabled -and $doc.LastCommitTime -ge $ImpactScoreSince) {
        Start-Sleep -Milliseconds $GeminiRequestDelayMs
        $impactScore = Get-ImpactScore -Content ($content -join "`n") -ApiKey $GeminiApiKey -Model $GeminiModel
        if ($null -eq $impactScore) {
            $failedCount++
            $consecutiveFailures++
            # Stop calling Gemini if the connection appears to be down; unscored docs are retried next run
            if ($consecutiveFailures -ge 3) {
                Write-Warning "Gemini failed $consecutiveFailures times in a row. Skipping impact scoring for the rest of this run."
                $geminiDisabled = $true
            }
        }
        else {
            $scoredCount++
            $consecutiveFailures = 0
        }
    }

    [PSCustomObject]@{
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
}
$output | ConvertTo-Json -Depth 5 | Out-File -FilePath $recentDocsPath -Encoding UTF8
Write-Host "Impact scores: $scoredCount scored, $carriedCount carried forward, $failedCount failed."