<#
.SYNOPSIS
    Adds a standard '## Changelog' section to all markdown documents that don't already have one.

.DESCRIPTION
    Scans all .md files in the docs/ directory (excluding templates, README, and index files)
    and appends a '## Changelog' section at the end of each file that doesn't already contain one.

    Use -WhatIf to preview which files would be modified without making changes.

.PARAMETER WhatIf
    Preview which files would be modified without making any changes.

.EXAMPLE
    .\Add-Changelog.ps1 -WhatIf
    # Preview which files would be modified

.EXAMPLE
    .\Add-Changelog.ps1
    # Add ## Changelog to all documents missing it
#>
param(
    [switch]$WhatIf
)

$docsPath = (Get-Item $PSScriptRoot).Parent.FullName + '\docs'
$docs = Get-ChildItem $docsPath -Recurse -Filter '*.md' -File | Where-Object {
    $_.Name -notmatch '_template\.md' `
        -and $_.Name -notmatch '_Template\.md' `
        -and $_.Name -notmatch 'README\.md' `
        -and $_.Name -notmatch 'index\.md' `
        -and $_.Name -notmatch '_internal-monitor_template\.md' `
        -and $_.Name -notmatch '_remote-monitor_template\.md'
}

$updated = 0
$skipped = 0

foreach ($doc in $docs) {
    $content = Get-Content $doc.FullName -Raw

    if ($content -match '(?m)^##\s+Changelog\s*$') {
        $skipped++
        continue
    }

    if ($WhatIf) {
        Write-Host "[WhatIf] Would add ## Changelog to: $($doc.FullName)" -ForegroundColor Yellow
        $updated++
        continue
    }

    # Trim trailing whitespace/newlines and append the changelog section
    $content = $content.TrimEnd()
    $content += "`n`n## Changelog`n"
    Set-Content -Path $doc.FullName -Value $content -NoNewline -Encoding UTF8
    Write-Host "Updated: $($doc.FullName)" -ForegroundColor Green
    $updated++
}

Write-Host ''
if ($WhatIf) {
    Write-Host "WhatIf Summary: $updated file(s) would be updated, $skipped file(s) already have a Changelog section." -ForegroundColor Cyan
}
else {
    Write-Host "Summary: $updated file(s) updated, $skipped file(s) skipped (already had Changelog)." -ForegroundColor Cyan
}
