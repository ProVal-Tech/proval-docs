$docsPath = (Get-Item $PSScriptRoot).Parent.FullName + '\docs'
$docs = Get-ChildItem $docsPath -Recurse -Filter '*.md'
foreach ($doc in $docs) {
    if($doc.Name -eq "README.md" -or $doc.Name -eq "_template.md" -or $doc.Name -eq "template.md") {
        Write-Host "Skipping $($doc.Name)"
        continue
    }
    $titleFM = (Get-Content $doc.FullName | Where-Object { $_ -match "^title: (.*)" })
    if ($null -eq $titleFM -or [string]::IsNullOrWhiteSpace(($titleFM))) {
        Write-Host "No title found in $($doc.Name)"
        continue
    }
    $filename = ($titleFM -replace "(^title: )|'", "" -replace "[^a-zA-Z0-9]", "-" -replace "-+", "-").Trim('-').ToLower() + ".md"
    if ($doc.Name -cne $filename) {
        Write-Host "Renaming $($doc.Name) to $filename"
        git mv $doc.FullName "$($doc.Directory.FullName)\$filename" -f
    } else {
        Write-Host "$($doc.Name) is already named correctly."
    }
    #Read-Host "Press Enter to continue"
}