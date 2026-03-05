<#
.SYNOPSIS
    Adds a changelog entry to each document based on the latest git commit date and message.

.DESCRIPTION
    For each .md file in the docs/ folder, retrieves the latest git commit (excluding
    specified bulk/automated commits) and inserts a changelog entry with the commit date
    and message. The entry is placed at the top of the ## Changelog section (newest-first
    ordering). Skips files where the latest commit is the same as the initial (git-added)
    commit, since those already have the "Initial version" entry. Skips template and
    README files.

.PARAMETER WhatIf
    If specified, shows what would be done without making changes.
#>
param(
    [switch]$WhatIf
)

$docsPath = (Get-Item $PSScriptRoot).Parent.FullName + '\docs'
$excludeNames = @('_template.md', '_Template.md', 'README.md', 'index.md', '_internal-monitor_template.md', '_remote-monitor_template.md')
$excludeCommits = @('790524fac17396e3a43f773f680285e1986b22b3')
$docs = Get-ChildItem $docsPath -Recurse -Filter '*.md' -File | Where-Object { $_.Name -notin $excludeNames }

$updatedCount = 0
$skippedCount = 0
$errorCount = 0

foreach ($doc in $docs) {
    # Get all commits excluding bulk/automated ones
    $commits = (git log --format="%H %ci %s" -- $doc.FullName 2>$null) -split "`n" |
        Where-Object { $_ -and ($excludeCommits -notcontains $_.Substring(0, [Math]::Min($_.Length, 40))) }

    if (-not $commits -or $commits.Count -eq 0) {
        $skippedCount++
        continue
    }

    # Get git-added commit (last in the list)
    $addedCommit = $commits | Select-Object -Last 1
    $latestCommit = $commits | Select-Object -First 1

    # If latest commit is the same as the added commit, skip (already has "Initial version" entry)
    $latestHash = $latestCommit.Substring(0, 40)
    $addedHash = $addedCommit.Substring(0, 40)
    if ($latestHash -eq $addedHash) {
        $skippedCount++
        continue
    }

    # Parse latest commit date and message
    # Format: "<hash> <date> <tz> <message>"
    # Example: "d0525ff02... 2025-05-09 14:48:32 -0400 PNG to WebP"
    try {
        $commitParts = $latestCommit.Substring(41)  # Everything after the hash + space
        # Date is the first 25 characters (YYYY-MM-DD HH:MM:SS +/-HHMM)
        $commitDateRaw = $commitParts.Substring(0, 25)
        $commitMessage = $commitParts.Substring(26).Trim()
        $commitDate = [datetime]::Parse($commitDateRaw).ToString('yyyy-MM-dd')
    } catch {
        Write-Warning "Could not parse commit info for: $($doc.FullName) - Raw: $latestCommit"
        $errorCount++
        continue
    }

    if (-not $commitMessage) {
        $commitMessage = 'Updated document'
    }

    $lines = Get-Content $doc.FullName

    # Find ## Changelog heading
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

    # Check if an entry for this date already exists
    $dateHeading = "### $commitDate"
    $hasDateEntry = $false
    for ($i = $changelogIndex + 1; $i -lt $lines.Length; $i++) {
        if ($lines[$i] -match '^\s*##\s+(?!#)') {
            break  # Hit the next ## section
        }
        if ($lines[$i].Trim() -eq $dateHeading) {
            $hasDateEntry = $true
            break
        }
    }

    if ($hasDateEntry) {
        $skippedCount++
        continue
    }

    # Insert new entry at the top of the changelog (after ## Changelog line)
    $entryText = @("", $dateHeading, "", "- $commitMessage")

    if ($WhatIf) {
        Write-Host "[WhatIf] Would add entry ($commitDate - $commitMessage) to: $($doc.FullName)"
    } else {
        $newLines = @()
        $newLines += $lines[0..$changelogIndex]
        $newLines += $entryText
        if ($changelogIndex -lt ($lines.Length - 1)) {
            $newLines += $lines[($changelogIndex + 1)..($lines.Length - 1)]
        }
        Set-Content -Path $doc.FullName -Value $newLines -Encoding UTF8
        Write-Host "Updated: $($doc.FullName) ($commitDate - $commitMessage)"
    }
    $updatedCount++
}

$action = if ($WhatIf) { 'WhatIf Summary' } else { 'Summary' }
Write-Host "$action`: $updatedCount file(s) updated, $skippedCount file(s) skipped, $errorCount error(s)."
