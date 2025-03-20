[CmdletBinding()]
param (
    [Parameter(Mandatory)][string]$File
)

$content = Get-Content -Path $file -Raw
$content = $content -replace "{", "\{" -replace "}", "\}"
$content | Set-Content -Path $file