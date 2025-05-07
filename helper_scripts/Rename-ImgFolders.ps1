function Move-File {
    param (
        [string]$Path,
        [string]$TargetPath
    )

    if (-not (Test-Path -Path $TargetPath)) {
        New-Item -Path $TargetPath -ItemType Directory | Out-Null
    }
    $targetFile = Get-Item -Path $Path
    $targetFileName = $targetFile.Name
    $index = 0
    while ( Test-Path -Path (Join-Path -Path $TargetPath -ChildPath $targetFileName)) {
        $index++
        $targetFileName = $targetFile.BaseName + "_$index" + $targetFile.Extension
    }
    $targetFilePath = Join-Path -Path $TargetPath -ChildPath $targetFileName
    Write-Host "Moving $($targetFile.FullName) to $targetFilePath"
    Move-Item -Path $targetFile.FullName -Destination $targetFilePath -Force
    return (Get-Item $targetFilePath)
}

$docsPath = (Get-Item $PSScriptRoot).Parent.FullName + '\docs'
$docs = Get-ChildItem $docsPath -Recurse -Filter '*.md' -File
$guidRegex = '[0-9A-Fa-f]{8}-[0-9A-Fa-f]{4}-[0-9A-Fa-f]{4}-[0-9A-Fa-f]{4}-[0-9A-Fa-f]{12}'
$imgFolders = Get-ChildItem ((Get-Item $PSScriptRoot).Parent.FullName + '\static\img') -Recurse -Directory | Where-Object { $_.Name -notmatch $guidRegex -and $_.Name -notmatch 'docs' }
$associations = foreach ($imgFolder in $imgFolders) {
    $targetMatchRegex = '(\/|\\)img(\/|\\)(docs(\/|\\))?' + [regex]::Escape($imgFolder.Name)
    $relatedDocs = $docs | Where-Object { (Get-Content -Path $_.FullName -Raw) -match $targetMatchRegex }
    $targetDirectory = '00000000-0000-0000-0000-000000000000'
    if ($relatedDocs.Count -gt 0) {
        foreach ($doc in $relatedDocs) {
            $docId = Get-Content $doc.FullName | Where-Object { $_ -match "^id: '?""?($guidRegex)'?""?" }
            if ($docId) {
                $targetDirectory = $matches[1]
                break
            }
        }
    }
    [pscustomobject]@{
        'img' = $imgFolder.FullName
        'target' = $targetDirectory
    }
}
$associations | Export-Csv -Path "$PSScriptRoot\img-folder-associations.csv" -NoTypeInformation -Force

$csvData = Import-Csv -Path "$PSScriptRoot\img-folder-associations.csv"

foreach ($entry in $csvData) {
    $imgFolder = Get-Item $entry.img
    if (-not $imgFolder) {
        Write-Host "Image folder $($entry.img) not found, skipping..."
        continue
    }

    $targetReplacementRegex = "(\/|\\)img(\/|\\)(docs(\/|\\))?$([regex]::Escape($imgFolder.Name))"
    $targetDirectoryFragment = "/img/docs/$($entry.target)"
    $targetDirectory = "$((Get-Item $PSScriptRoot).Parent.FullName)\static\img\docs\$($entry.target)"
    $files = Get-ChildItem -Path $imgFolder.FullName -File
    $fileAssociations = foreach($file in $files) {
        $targetFile = Move-File -Path $file.FullName -TargetPath $targetDirectory
        [PSCustomObject]@{
            OldFile = $file
            NewFile = $targetFile
            TargetingRegex = "$targetReplacementRegex(\/|\\)$($file.Name)"
            Replacement = "$targetDirectoryFragment/$($targetFile.Name)"
        }
    }
}
$fileReplacements = Import-Csv -Path "$PSScriptRoot\img-file-associations.csv"

$docCount = 0
foreach ($doc in $docs) {
    $docCount++
    Write-Host "Processing document $docCount of $($docs.Count): $($doc.FullName)"
    $docContent = Get-Content -Path $doc.FullName
    foreach ($file in $fileReplacements) {
        $docContent = $docContent -replace $file.TargetingRegex, $file.Replacement
    }
    $docContent -join "`n" | Out-File $doc.FullName -NoNewline
}