$itgAttachmentDirs = Get-ChildItem -LiteralPath 'D:\source\proval-docs\static\attachments\itg' -Directory
$itgExportDocs = Get-ChildItem -LiteralPath 'C:\Users\stephen.nix\Downloads\export\documents' -Recurse -Directory | Where-Object { $_.Name -match 'DOC-\d+-\d+' }
$docList = Get-ChildItem 'D:\source\proval-docs\docs' -Recurse -File
foreach ($itgAttachmentDir in $itgAttachmentDirs) {
    $targetExportPath = $itgExportDocs | Where-Object { $_.Name -match "DOC-5078775-$($itgAttachmentDir.Name) " }
    if (!$targetExportPath) {
        Write-Warning "No export document found for $itgAttachmentDir"
        continue
    }
    $targetDocumentName = $targetExportPath.Name -replace 'DOC-\d+-\d+ |\[|\]', ''
    $targetTitle = $targetDocumentName
    Write-Host "Looking for $targetTitle"
    $targetDocs = $docList | Where-Object { $_.BaseName -eq $targetTitle }
    while (!$targetDocs) {
        if ($targetTitle -notmatch '-') {
            break
        }
        $targetTitle = ($targetTitle -split '-', 2)[1].Trim()
        Write-Host "Looking for $targetTitle"
        $targetDocs = $docList | Where-Object { $_.BaseName -eq $targetTitle }
    }
    if (!$targetDocs -or $targetDocs.Count -eq 0 -or [string]::IsNullOrEmpty($targetDocs)) {
        Write-Warning "No document found for $itgUrl"
        continue
    }
    if ($targetDocs.Count -gt 1) {
        Write-Warning "Multiple documents found for $itgUrl"
        $possibleTargetDocs = $targetDocs | Where-Object { $targetDocumentName -match $_.Directory.BaseName }
        if ($possibleTargetDocs.Count -eq 1) {
            Write-Warning "Found a single document that matches the directory name $($possibleTargetDocs.Directory.BaseName)"
            Write-Host "Using $($possibleTargetDocs.FullName)"
            $targetDoc = $possibleTargetDocs
        } else {
            for ($i = 0; $i -lt $targetDocs.Count; $i++) {
                Write-Host "$i`: $($targetDocs[$i].FullName)"
            }
            $choice = Read-Host 'Choose a document'
            $targetDoc = $targetDocs[$choice]
        }
    } else {
        Write-Host "Using $($targetDocs.FullName)"
        $targetDoc = $targetDocs
    }
    $attachmentBlock = @'
## Attachments
'@
    Get-ChildItem -LiteralPath $itgAttachmentDir.FullName -File | ForEach-Object {
        $targetPath = Resolve-Path -Path $_.FullName -RelativeBasePath $targetDoc.Directory.FullName -Relative
        $attachmentBlock += @"

[$($_.Name)](<$targetPath>)
"@
    }
    $targetDocLines = Get-Content -Path $targetDoc.FullName
    for ($i = $targetDocLines.count - 1; $i -ge 0; $i--) {
        if (![string]::IsNullOrWhiteSpace($targetDocLines[$i])) { break }
    }
    $targetDocLines = $targetDocLines[0..$i]
    $targetDocLines += $attachmentBlock
    $targetDocLines | Set-Content -Path $targetDoc.FullName
}