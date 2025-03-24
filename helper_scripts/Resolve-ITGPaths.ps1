[CmdletBinding()]
param (
    [Parameter(Mandatory)][string]$Path,
    [Parameter()][switch]$Quiet
)
Clear-Host
Write-Host $Path
$pathDoc = Get-Item -Path $Path
$content = Get-Content -Path $Path -Raw
[regex]$itgRegex = 'https:\/\/proval\.itglue\.com\/DOC-\d+-\d+'
$regexMatches = $itgRegex.Matches($content)
$possibleIDs = Get-ChildItem 'C:\Users\stephen.nix\Downloads\export\documents' -Recurse -Directory `
| Where-Object { $_.Name -match 'DOC-\d+-\d+' } `
| Select-Object Name
$docList = Get-ChildItem 'D:\source\proval-docs\docs' -Recurse -File
foreach ($match in $regexMatches) {
    Clear-Host
    Write-Host $Path
    $itgUrl = $match.Value
    $itgId = $itgUrl -replace 'https:\/\/proval\.itglue\.com\/', ''
    $targetTitle = ($possibleIDs | Where-Object { $_.Name -match "^$itgId" } | Select-Object -ExpandProperty Name -First 1) -replace 'DOC-\d+-\d+ |\[|\]', ''
    if([string]::IsNullOrWhiteSpace($targetTitle)) {
        Write-Warning "No document title found for $itgUrl"
        continue
    }
    Write-Host "Looking for $targetTitle"
    $targetDocs = $docList | Where-Object { $_.BaseName -eq $targetTitle }
    while(!$targetDocs) {
        if($targetTitle -notmatch '-') {
            break
        }
        $targetTitle = ($targetTitle -split '-',2)[1].Trim()
        Write-Host "Looking for $targetTitle"
        $targetDocs = $docList | Where-Object { $_.BaseName -eq $targetTitle }
    }
    if(!$targetDocs -or $targetDocs.Count -eq 0 -or [string]::IsNullOrEmpty($targetDocs)) {
        Write-Warning "No document found for $itgUrl"
        continue
    }
    if($targetDocs.Count -gt 1) {
        Write-Warning "Multiple documents found for $itgUrl"
        if($Quiet) {
            Add-Content -Path 'C:\Users\stephen.nix\multiple-docs.txt' -Value $Path
            Add-Content -Path 'C:\Users\stephen.nix\multiple-docs.txt' -Value $itgUrl
            for($i = 0; $i -lt $targetDocs.Count; $i++) {
                Add-Content -Path 'C:\Users\stephen.nix\multiple-docs.txt' -Value "$i`: $($targetDocs[$i].FullName)"
            }
            Add-Content -Path 'C:\Users\stephen.nix\multiple-docs.txt' -Value "`n-------------------`n"
            continue
        }
        for($i = 0; $i -lt $targetDocs.Count; $i++) {
            Write-Host "$i`: $($targetDocs[$i].FullName)"
        }
        $choice = Read-Host "Choose a document"
        $targetDoc = $targetDocs[$choice]
    } else {
        $targetDoc = $targetDocs
    }
    $targetPath = Resolve-Path -Path $targetDoc.FullName -RelativeBasePath $pathDoc.Directory.FullName -Relative
    Write-Host "Replacing $itgUrl with $targetPath"
    $content = $content -replace "\($itgUrl\)", ("(<" + ($targetPath -replace "\\","/") + ">)")
    Set-Content -Path $Path -Value $content
}