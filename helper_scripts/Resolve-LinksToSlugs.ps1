$docsPath = (Get-Item $PSScriptRoot).Parent.FullName + '\docs'
$docs = Get-ChildItem $docsPath -Recurse -Filter '*.md'
foreach ($doc in $docs) {
    Push-Location -Path $doc.DirectoryName
    $content = Get-Content $doc.FullName
    $targetLinks = $null
    $targetLinks = $content | Select-String -Pattern '\[.*?\]\(<?(.*?\.mdx?)>?\)' -AllMatches | ForEach-Object { $_.Matches } | ForEach-Object { $_.Groups[1].Value -replace '\.mdx', '.md' -replace '%20', ' ' } | Sort-Object | Get-Unique
    if ($targetLinks.Count -eq 0 -or $null -eq $targetLinks) {
        Pop-Location
        continue
    }
    foreach ($link in $targetLinks) {
        $targetLinkItem = $null
        $targetLinkItem = $link | Resolve-Path -ErrorAction SilentlyContinue | Get-Item -ErrorAction SilentlyContinue
        if ($null -eq $targetLinkItem) {
            Write-Warning "Link $link not resolved. Skipping..."
            continue
        }
        $slug = Get-Content $targetLinkItem.FullName | Select-String -Pattern 'slug: (.*)' | ForEach-Object { $_.Matches } | ForEach-Object { $_.Groups[1].Value }
        $content = $content -replace "<?$([regex]::Escape($link))>?", "/docs$slug"
    }
    $content -join "`n" | Out-File $doc.FullName -NoNewline
    Pop-Location
}