<#
.SYNOPSIS
    Adds an initial changelog entry to each document based on its git added date.

.DESCRIPTION
    For each .md file in the docs/ folder, retrieves the git added date and inserts
    a "### YYYY-MM-DD" entry with "- Initial version of the document" under the
    ## Changelog section. If the document already has changelog entries, the initial
    entry is appended at the bottom (oldest-last ordering). Skips template and
    README files.

.PARAMETER WhatIf
    If specified, shows what would be done without making changes.
#>
param(
    [switch]$WhatIf
)

$docsPath = (Get-Item $PSScriptRoot).Parent.FullName + '\docs'
$excludeNames = @('_template.md', '_Template.md', 'README.md', 'index.md', '_internal-monitor_template.md', '_remote-monitor_template.md')
$docs = Get-ChildItem $docsPath -Recurse -Filter '*.md' -File | Where-Object { $_.Name -notin $excludeNames }

$updatedCount = 0
$skippedCount = 0
$errorCount = 0

foreach ($doc in $docs) {
    # Get git added date
    $gitAddedRaw = (git log --diff-filter=A --format="%ci" -- $doc.FullName 2>$null) -split "`n" | Select-Object -Last 1
    if (-not $gitAddedRaw) {
        if (-not $WhatIf) {
            Write-Warning "No git history for: $($doc.FullName)"
        }
        $errorCount++
        continue
    }

    try {
        $gitAddedDate = [datetime]::Parse($gitAddedRaw).ToString('yyyy-MM-dd')
    } catch {
        Write-Warning "Could not parse date '$gitAddedRaw' for: $($doc.FullName)"
        $errorCount++
        continue
    }

    $content = Get-Content $doc.FullName -Raw
    $lines = Get-Content $doc.FullName

    # Check if ## Changelog exists
    $changelogIndex = -1
    for ($i = 0; $i -lt $lines.Length; $i++) {
        if ($lines[$i] -match '^\s*##\s+Changelog\s*$') {
            $changelogIndex = $i
            break
        }
    }

    if ($changelogIndex -lt 0) {
        $skippedCount++
        continue
    }

    # Check if this exact initial entry already exists
    $initialEntryPattern = "### $gitAddedDate"
    $hasInitialEntry = $false
    for ($i = $changelogIndex + 1; $i -lt $lines.Length; $i++) {
        if ($lines[$i] -match '^\s*##\s+(?!#)') {
            break  # Hit the next ## section
        }
        if ($lines[$i].Trim() -eq $initialEntryPattern) {
            $hasInitialEntry = $true
            break
        }
    }

    if ($hasInitialEntry) {
        $skippedCount++
        continue
    }

    # Find where to insert: after the last ### entry's content, or right after ## Changelog if empty
    # Determine if there are existing ### entries
    $hasExistingEntries = $false
    $lastContentLineIndex = $changelogIndex
    for ($i = $changelogIndex + 1; $i -lt $lines.Length; $i++) {
        if ($lines[$i] -match '^\s*##\s+(?!#)') {
            break  # Hit the next ## section
        }
        if ($lines[$i] -match '^\s*###\s+') {
            $hasExistingEntries = $true
        }
        if ($lines[$i].Trim() -ne '') {
            $lastContentLineIndex = $i
        }
    }

    $entryText = @("", "### $gitAddedDate", "", "- Initial version of the document")

    if ($WhatIf) {
        Write-Host "[WhatIf] Would add initial entry ($gitAddedDate) to: $($doc.FullName)"
    } else {
        # Insert after the last content line in the changelog section
        $newLines = @()
        $newLines += $lines[0..$lastContentLineIndex]
        $newLines += $entryText
        if ($lastContentLineIndex -lt ($lines.Length - 1)) {
            $newLines += $lines[($lastContentLineIndex + 1)..($lines.Length - 1)]
        }
        Set-Content -Path $doc.FullName -Value $newLines -Encoding UTF8
        Write-Host "Updated: $($doc.FullName) (added $gitAddedDate)"
    }
    $updatedCount++
}

$action = if ($WhatIf) { 'WhatIf Summary' } else { 'Summary' }
Write-Host "$action`: $updatedCount file(s) updated, $skippedCount file(s) skipped, $errorCount error(s)."
