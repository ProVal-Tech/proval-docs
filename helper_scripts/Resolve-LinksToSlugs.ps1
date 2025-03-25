$docsPath = (Get-Item $PSScriptRoot).Parent.FullName + "\docs"
$docs = Get-ChildItem $docsPath -Recurse -Filter "*.md"
foreach($doc in $docs) {
    Push-Location -Path $doc.DirectoryName
    $content = Get-Content $doc.FullName
    $targetLinks = $content | Select-String -Pattern "\[.*?\]\(<?(.*?\.md)>?\)" -AllMatches | ForEach-Object { $_.Matches } | ForEach-Object { $_.Groups[1].Value } | Sort-Object | Get-Unique
    foreach($link in $targetLinks) {
        $targetLinkItem = $link | Resolve-Path | Get-Item
        $slug = Get-Content $targetLinkItem.FullName | Select-String -Pattern "slug: (.*)" | ForEach-Object { $_.Matches } | ForEach-Object { $_.Groups[1].Value }
        $content = $content -replace "<?$([regex]::Escape($link))>?", "/docs$slug"
    }
    $content | Out-File $doc.FullName
    Pop-Location
}