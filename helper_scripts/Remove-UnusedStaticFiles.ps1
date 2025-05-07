$docsPath = (Get-Item $PSScriptRoot).Parent.FullName + '\docs'
$docs = Get-ChildItem $docsPath -Recurse -Filter '*.md' -File
$docsContent = ($docs | ForEach-Object {
        Get-Content $_.FullName -Raw
    }) -join "`n"
$staticFilesPath = (Get-Item $PSScriptRoot).Parent.FullName + '\static'
$staticFiles = Get-ChildItem "$staticFilesPath\attachments", "$staticFilesPath\img" -Recurse -File

$files = foreach ($file in $staticFiles) {
    if ($file.DirectoryName -eq "$staticFilesPath\img") {
        continue
    }
    $filePathSegmentRegex = [regex]::Escape($file.Directory.Name) + '\/|\\' + [regex]::Escape($file.Name)
    if ($docsContent -notmatch $filePathSegmentRegex) {
        Write-Host "Removing unused static file: $($file.FullName)" -ForegroundColor Yellow
        $file
    }
}
if ($files) {
    $fileCount = $files.Count
    $fileSizeMB = [math]::round(($files | Measure-Object -Property Length -Sum).Sum / 1MB, 2)   
    $files | Remove-Item -Force
    Write-Host "$fileCount unused static files removed." -ForegroundColor Green
    Write-Host "$fileSizeMB MB of unused static files removed." -ForegroundColor Green
} else {
    Write-Host 'No unused static files found.' -ForegroundColor Green
}