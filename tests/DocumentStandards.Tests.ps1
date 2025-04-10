$docsPath = (Get-Item $PSScriptRoot).Parent.FullName + "\docs"
$docs = Get-ChildItem $docsPath -Recurse -Filter "*.md" | Where-Object {
    $_.Name -notmatch "index\.md" `
    -and $_.Name -notmatch "README\.md" `
    -and $_.Name -notmatch "_template\.md"
}
$errorList = @()
foreach($doc in $docs) {
    # Check for valid file name
    $fileName = $doc.Name
    $fileNamePattern = "^[a-z0-9][a-z0-9\-]+[a-z0-9]\.md$"
    if($fileName -cnotmatch $fileNamePattern) {
        $errorList += [PSCustomObject]@{
            Path = $doc.FullName
            Type = "InvalidFileName"
            Value = $fileName
        }
    }

    # Check for uncompliant links in the document
    Push-Location -Path $doc.DirectoryName
    $content = Get-Content $doc.FullName
    $targetLinks = $content | Select-String -Pattern "\[.*?\]\(<?(.*?\.mdx?)>?\)" -AllMatches | ForEach-Object { $_.Matches } | ForEach-Object { $_.Groups[1].Value -replace "\.mdx",".md" } | Sort-Object | Get-Unique
    $targetLinks += $content | Select-String -Pattern "https://proval\.itglue\.com/\d+/docs/\d+" -AllMatches | ForEach-Object { $_.Matches[0].Value } | Sort-Object | Get-Unique
    $targetLinks += $content | Select-String -Pattern "https://proval\.itglue\.com/DOC-\d+-\d+" -AllMatches | ForEach-Object { $_.Matches[0].Value } | Sort-Object | Get-Unique
    foreach($link in $targetLinks) {
        $errorList += [PSCustomObject]@{
            Path = $doc.FullName
            Type = "UncompliantLink"
            Value = $link
        }
    }

    # Check for uncompliant ID in the document
    $id = $null
    $id = $content | Select-String -Pattern "^id: '?`"?[\da-zA-Z]{8}-([\da-zA-Z]{4}-){3}[\da-zA-Z]{12}'?`"?"
    if(!$id) {
        $errorList += [PSCustomObject]@{
            Path = $doc.FullName
            Type = "MissingID"
            Value = $null
        }
    }

    # Check for uncompliant slug in the document
    $slug = $null
    $slug = $content | Select-String -Pattern "^slug: /[\da-zA-Z]{8}-([\da-zA-Z]{4}-){3}[\da-zA-Z]{12}"
    if(!$slug) {
        $errorList += [PSCustomObject]@{
            Path = $doc.FullName
            Type = "MissingSlug"
            Value = $null
        }
    }
}

$errorList
if($errorList.Count -gt 0) {
    Write-Host "Document standards check failed. Please fix the issues above." -ForegroundColor Red
    exit 1
} else {
    Write-Host "All documents passed the standards check." -ForegroundColor Green
    exit 0
}