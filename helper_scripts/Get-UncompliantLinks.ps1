$docsPath = (Get-Item $PSScriptRoot).Parent.FullName + "\docs"
$docs = Get-ChildItem $docsPath -Recurse -Filter "*.md"
foreach($doc in $docs) {
    Push-Location -Path $doc.DirectoryName
    $content = Get-Content $doc.FullName
    $targetLinks = $null
    $targetLinks = $content | Select-String -Pattern "\[.*?\]\(<?(.*?\.mdx?)>?\)" -AllMatches | ForEach-Object { $_.Matches } | ForEach-Object { $_.Groups[1].Value -replace "\.mdx",".md" } | Sort-Object | Get-Unique
    $targetLinks += $content | Select-String -Pattern "https://proval\.itglue\.com/\d+/docs/\d+" -AllMatches | ForEach-Object { $_.Matches[0].Value } | Sort-Object | Get-Unique
    $targetLinks += $content | Select-String -Pattern "https://proval\.itglue\.com/DOC-\d+-\d+" -AllMatches | ForEach-Object { $_.Matches[0].Value } | Sort-Object | Get-Unique
    if($targetLinks.Count -eq 0 -or $null -eq $targetLinks) {
        Pop-Location
        continue
    }
    foreach($link in $targetLinks) {
        $targetLinkItem = $null
        $targetLinkItem = $link | Resolve-Path -ErrorAction SilentlyContinue | Get-Item -ErrorAction SilentlyContinue
        $slug = $null
        if($targetLinkItem) {
            $slug = Get-Content $targetLinkItem.FullName | Select-String -Pattern "slug: (.*)" | ForEach-Object { $_.Matches } | ForEach-Object { $_.Groups[1].Value }
        }
        [PSCustomObject]@{
            Document = $doc.FullName
            Link = $link
            ResolvedLink = $targetLinkItem
            LinkSlug = $slug
        }
    }
    Pop-Location
}