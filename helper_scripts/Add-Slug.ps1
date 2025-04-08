$docsPath = (Get-Item $PSScriptRoot).Parent.FullName + "\docs"
$docs = Get-ChildItem $docsPath -Recurse -Filter "*.md"
foreach ($doc in $docs) {
    $insideFrontMatter = $false
    $content = Get-Content $doc.FullName
    $slugIndex = -1
    $idIndex = -1
    $slug = ""
    for ($i = 0; $i -lt $content.Length; $i++) {
        $isStartMatterDelimiter = $content[$i] -eq "---"
        if($insideFrontMatter) {
            if ($isStartMatterDelimiter) {
                break
            }
            if($content[$i] -match "id: (.*)") {
                $slug = "/" + ($matches[1] -replace "'|""", "")
                $idIndex = $i
            }
            if($content[$i] -match "slug:") {
                $slugIndex = $i
                break
            }
        } elseif($isStartMatterDelimiter) {
            $insideFrontMatter = $true
        }
    }
    if($slugIndex -ne -1) {
        Write-Information -MessageData "Slug already exists in $doc"
        continue
    }
    if($slug -eq "") {
        Write-Error "Id not found in $doc"
        continue
    }
    $content[$idIndex] = "$($content[$idIndex])`nslug: $slug"
    $content -join "`n" | Out-File $doc.FullName -NoNewline
    Write-Information "Slug $slug added to $doc"
}