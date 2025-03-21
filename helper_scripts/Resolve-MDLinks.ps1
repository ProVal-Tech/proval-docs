[CmdletBinding()]
param (
    [Parameter(Mandatory)]
    [string]
    $Path
)

function Get-CPath {
    <#
    .SYNOPSIS
    Get the case-sensitive path of a file or directory.
    #>
    [CmdletBinding()]
    param (
        [Parameter(Mandatory)]
        [string]$Path,
        [Parameter()]
        [switch]$Relative
    )
    $parent = Split-Path $Path
    $leaf = Split-Path $Path -Leaf
    $item = Get-ChildItem -Path $parent | Where-Object { $_.Name -eq $leaf }
    return Resolve-Path -Path $item.FullName -Relative:$Relative
}

$targetItem = Get-Item -Path $Path

if(!$targetItem) {
    Write-Warning "No item found at $Path"
    return
}
Push-Location -Path $targetItem.Directory.FullName

$targetContent = Get-Content -Path $Path
$changed = $false

foreach($line in $targetContent) {
    if($line -match '!\[.*?\]\((?<path>.*?)\)') {
        $linkPath = (Resolve-Path -Path $matches['path'] -Relative) -replace '\\', '/'
        $cLinkPath = (Get-CPath -Path $linkPath -Relative) -replace '\\', '/'
        if($linkPath -cne $cLinkPath) {
            Write-Information "Replacing $linkPath with $cLinkPath"
            $targetContent = $targetContent -replace [regex]::Escape($linkPath), $cLinkPath
            $changed = $true
        }
    }
}
Pop-Location
if($changed) {
    Write-Information "Changes required. Press any key to continue."
    $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown") | Out-Null
    $targetContent -join "`n" | Out-File -FilePath $Path -NoNewline
} else {
    Write-Information "No changes required."
}