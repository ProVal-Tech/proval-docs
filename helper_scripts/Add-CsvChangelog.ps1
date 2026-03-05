<#
.SYNOPSIS
    Adds changelog entries to documents based on a CSV of content updates.

.DESCRIPTION
    Reads content_updates.csv (or a specified CSV), extracts the GUID from the
    Documentation Link column, maps it to a markdown file by searching for the
    matching frontmatter id, and inserts changelog entries using the QA Approved
    Date and Notes columns. Multiple entries for the same file/date are grouped
    under a single date heading. Entries are inserted in chronological order
    (newest first) above any existing changelog entries.

.PARAMETER CsvPath
    Path to the CSV file. Defaults to content_updates.csv in the repo root.

.PARAMETER WhatIf
    If specified, shows what would be done without making changes.
#>
param(
    [string]$CsvPath,
    [switch]$WhatIf
)

$repoRoot = (Get-Item $PSScriptRoot).Parent.FullName
$docsPath = Join-Path $repoRoot 'docs'

if (-not $CsvPath) {
    $CsvPath = Join-Path $repoRoot 'content_updates.csv'
}

if (-not (Test-Path $CsvPath)) {
    Write-Error "CSV file not found: $CsvPath"
    exit 1
}

# --- Step 1: Build GUID-to-file index ---
Write-Host 'Building GUID-to-file index...'
$guidIndex = @{}
$excludeNames = @('_template.md', '_Template.md', 'README.md', 'index.md', '_internal-monitor_template.md', '_remote-monitor_template.md')
$allDocs = Get-ChildItem $docsPath -Recurse -Filter '*.md' -File | Where-Object { $_.Name -notin $excludeNames }

foreach ($doc in $allDocs) {
    $firstLines = Get-Content $doc.FullName -TotalCount 5
    foreach ($line in $firstLines) {
        if ($line -match '^id:\s*[''"]?([0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12})[''"]?\s*$') {
            $guidIndex[$Matches[1]] = $doc.FullName
            break
        }
    }
}
Write-Host "Indexed $($guidIndex.Count) documents with GUIDs."

# --- Step 2: Parse CSV and group by GUID then date ---
$csv = Import-Csv $CsvPath
$guidPattern = '([0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12})'

# Build a hashtable: GUID -> sorted list of { Date, Notes }
$changesByGuid = @{}

foreach ($row in $csv) {
    $link = $row.'Documentation Link'
    $notes = $row.Notes
    $dateRaw = $row.'QA Approved Date'

    # Skip rows with no link, no notes, or empty notes
    if (-not $link -or -not $notes -or $notes.Trim() -eq '') {
        continue
    }

    if ($link -notmatch $guidPattern) {
        Write-Warning "No GUID found in link: $link"
        continue
    }
    $guid = $Matches[1]

    # Parse date
    try {
        $date = [datetime]::Parse($dateRaw).ToString('yyyy-MM-dd')
    } catch {
        Write-Warning "Could not parse date '$dateRaw' for: $($row.'Content Name')"
        continue
    }

    # Clean up notes: trim whitespace
    $cleanNotes = $notes.Trim()

    if (-not $changesByGuid.ContainsKey($guid)) {
        $changesByGuid[$guid] = [System.Collections.ArrayList]::new()
    }

    [void]$changesByGuid[$guid].Add(@{ Date = $date; Notes = $cleanNotes })
}

Write-Host "Parsed $($changesByGuid.Count) unique documents from CSV."

# --- Step 3: Apply changelog entries ---
$updatedCount = 0
$skippedCount = 0
$notFoundCount = 0
$errorCount = 0

foreach ($guid in $changesByGuid.Keys) {
    if (-not $guidIndex.ContainsKey($guid)) {
        Write-Warning "No file found for GUID: $guid"
        $notFoundCount++
        continue
    }

    $filePath = $guidIndex[$guid]
    $lines = Get-Content $filePath

    # Find ## Changelog line
    $changelogIndex = -1
    for ($i = 0; $i -lt $lines.Length; $i++) {
        if ($lines[$i] -match '^\s*##\s+Changelog\s*$') {
            $changelogIndex = $i
            break
        }
    }

    if ($changelogIndex -lt 0) {
        Write-Warning "No ## Changelog section in: $filePath"
        $skippedCount++
        continue
    }

    # Find the boundary of the changelog section (next ## or end of file)
    $changelogEndIndex = $lines.Length
    for ($i = $changelogIndex + 1; $i -lt $lines.Length; $i++) {
        if ($lines[$i] -match '^\s*##\s+(?!#)') {
            $changelogEndIndex = $i
            break
        }
    }

    # Parse existing changelog entries to avoid duplicates
    $existingDates = @{}
    $existingEntries = @{} # date -> list of notes
    $currentDate = $null
    for ($i = $changelogIndex + 1; $i -lt $changelogEndIndex; $i++) {
        if ($lines[$i] -match '^\s*###\s+(\d{4}-\d{2}-\d{2})\s*$') {
            $currentDate = $Matches[1]
            $existingDates[$currentDate] = $true
            if (-not $existingEntries.ContainsKey($currentDate)) {
                $existingEntries[$currentDate] = [System.Collections.ArrayList]::new()
            }
        } elseif ($currentDate -and $lines[$i] -match '^\s*-\s+(.+)$') {
            [void]$existingEntries[$currentDate].Add($Matches[1])
        }
    }

    # Group new entries by date 
    $newEntriesByDate = @{}
    foreach ($entry in $changesByGuid[$guid]) {
        $d = $entry.Date
        if (-not $newEntriesByDate.ContainsKey($d)) {
            $newEntriesByDate[$d] = [System.Collections.ArrayList]::new()
        }
        [void]$newEntriesByDate[$d].Add($entry.Notes)
    }

    # Filter out entries that already exist (same date AND same note text)
    $entriesToAdd = @{}
    foreach ($d in $newEntriesByDate.Keys) {
        $newNotes = $newEntriesByDate[$d]
        foreach ($note in $newNotes) {
            $isDuplicate = $false
            if ($existingEntries.ContainsKey($d)) {
                foreach ($existing in $existingEntries[$d]) {
                    if ($existing.Trim() -eq $note.Trim()) {
                        $isDuplicate = $true
                        break
                    }
                }
            }
            if (-not $isDuplicate) {
                if (-not $entriesToAdd.ContainsKey($d)) {
                    $entriesToAdd[$d] = [System.Collections.ArrayList]::new()
                }
                [void]$entriesToAdd[$d].Add($note)
            }
        }
    }

    if ($entriesToAdd.Count -eq 0) {
        $skippedCount++
        continue
    }

    # Build the new changelog lines to insert
    # All dates (existing + new) need to be sorted newest-first
    # We only insert new date sections; for existing dates we append bullets
    
    # Reconstruct the entire changelog section
    # Merge existing and new entries
    $allDates = @{}
    foreach ($d in $existingEntries.Keys) {
        $allDates[$d] = [System.Collections.ArrayList]::new()
        foreach ($n in $existingEntries[$d]) {
            [void]$allDates[$d].Add($n)
        }
    }
    foreach ($d in $entriesToAdd.Keys) {
        if (-not $allDates.ContainsKey($d)) {
            $allDates[$d] = [System.Collections.ArrayList]::new()
        }
        foreach ($n in $entriesToAdd[$d]) {
            [void]$allDates[$d].Add($n)
        }
    }

    # Sort dates newest-first
    $sortedDates = $allDates.Keys | Sort-Object -Descending

    # Build new changelog content
    $newChangelogLines = @()
    foreach ($d in $sortedDates) {
        $newChangelogLines += ""
        $newChangelogLines += "### $d"
        $newChangelogLines += ""
        foreach ($note in $allDates[$d]) {
            $newChangelogLines += "- $note"
        }
    }

    if ($WhatIf) {
        $addedCount = ($entriesToAdd.Values | ForEach-Object { $_.Count } | Measure-Object -Sum).Sum
        Write-Host "[WhatIf] Would add $addedCount entry/entries to: $filePath"
    } else {
        # Rebuild the file: everything before ## Changelog, then ## Changelog, then new content, then rest
        $newLines = @()
        # Lines before and including ## Changelog
        $newLines += $lines[0..$changelogIndex]
        # New changelog content
        $newLines += $newChangelogLines
        # Lines after the changelog section (if any)
        if ($changelogEndIndex -lt $lines.Length) {
            # Add a blank line before the next section
            $newLines += ""
            $newLines += $lines[$changelogEndIndex..($lines.Length - 1)]
        }
        Set-Content -Path $filePath -Value $newLines -Encoding UTF8
        $addedCount = ($entriesToAdd.Values | ForEach-Object { $_.Count } | Measure-Object -Sum).Sum
        Write-Host "Updated: $filePath (+$addedCount entries)"
    }
    $updatedCount++
}

$action = if ($WhatIf) { 'WhatIf Summary' } else { 'Summary' }
Write-Host "$action`: $updatedCount file(s) updated, $skippedCount file(s) skipped, $notFoundCount GUID(s) not found, $errorCount error(s)."
