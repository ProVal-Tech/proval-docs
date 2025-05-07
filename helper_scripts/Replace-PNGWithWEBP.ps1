$docsPath = (Get-Item $PSScriptRoot).Parent.FullName + '\docs'
$docs = Get-ChildItem $docsPath -File -Recurse -Filter '*.md'

$docCount = 0
foreach ($doc in $docs) {
    $docCount++
    Write-Host "Processing document $docCount of $($docs.Count): $($doc.FullName)"
    $docContent = (Get-Content -Path $doc.FullName) -replace '\.png\)', '.webp)' -replace '\.png\>\)', '.webp>)'
    $docContent -join "`n" | Out-File $doc.FullName -NoNewline
}