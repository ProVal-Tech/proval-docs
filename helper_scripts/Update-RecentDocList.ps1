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
$output = foreach ($doc in $recentDocs) {
    $content = Get-Content $doc.FullName
    $title = $content | Select-String -Pattern "^title: (`"|')(.*)(`"|')"
    $slug = $content | Select-String -Pattern "^slug: (`"|')?(.*)(`"|')?"
    $summary = Get-FirstH2Summary -Lines $content
    $changelog = Get-Changelog -Lines $content
    if ($doc.LastCommitTime) {
        Set-LastUpdateFrontMatter -FilePath $doc.FullName -LastCommit $doc.LastCommitTime
    }
    [PSCustomObject]@{
        Title       = if ($title) { $title.Matches[0].Groups[2].Value } else { "No Title" }
        Slug        = if ($slug) { $slug.Matches[0].Groups[2].Value } else { $doc.BaseName }
        LastCommit  = $doc.LastCommitTime
        Category    = $doc.Category
        ContentType = $doc.ContentType
        GitAdded    = $doc.GitAddedTime
        Summary     = $summary
        Changelog   = @($changelog)
    }
}
$output | Where-Object { $_.Slug -match "[0-9A-Fa-f]{8}(?:-[0-9A-Fa-f]{4}){3}-[0-9A-Fa-f]{12}" -and $_.Title.Trim() -ne "" } | ConvertTo-Json -Depth 5 | Out-File -FilePath "$((Get-Item $PSScriptRoot).Parent.FullName)\static\api\recentDocs.json" -Encoding UTF8