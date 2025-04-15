[CmdletBinding()]
param (
    [Parameter(Mandatory)][string]$Path
)
$tags = Get-Content -LiteralPath 'C:\Users\stephen.nix\tags.txt'
$content = Get-Content -Path $Path
$contentTags = $content | Select-String 'tags:.*' | ForEach-Object { $_.ToString() -replace "tags: |\[|\]|""|'| ", '' -split ',' | ForEach-Object { $_.Trim() } }
$correctTags = Compare-Object -ReferenceObject $tags -DifferenceObject $contentTags -PassThru -IncludeEqual | Where-Object { $_.SideIndicator -eq '==' }
$newTagArray = ($correctTags | ForEach-Object { "'$_'" }) -join ', '
$content | ForEach-Object { $_ -replace 'tags:.*', "tags: [$newTagArray]" } | Set-Content -Path $Path