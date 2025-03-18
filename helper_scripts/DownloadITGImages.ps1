[CmdletBinding()]
param (
    [Parameter(Mandatory)][string]$Path,
    [Parameter(Mandatory)]
    [string]$itgKey
)
$itgApiUrl = 'https://api.itglue.com'
$itgUrl = 'https://proval.itglue.com'
$docFile = Get-Item -Path $Path

$headers = @{
    'x-api-key' = $itgKey
}
[regex]$imageLinkRegex = '!\[.*?\]\((?<slug>(?<orgid>\d+)\/docs\/(?<docid>\d+)\/images\/\d+)'

$content = Get-Content -Path $Path -Raw
$linkMatches = $imageLinkRegex.Match($content)
if ($linkMatches.Success) {
    $orgId = $linkMatches.Groups['orgid'].Value
    $docId = $linkMatches.Groups['docid'].Value
    Write-Host $linkMatches.Value
    $url = "$itgApiUrl/organizations/$orgId/relationships/documents/$docId"
    Write-Host $url
    $response = Invoke-RestMethod -Uri $url -ContentType 'application/vnd.api+json' -Headers $headers -Method Patch -Body @'
{
  "data": {
    "type": "documents",
    "attributes": {
      "public": true
    }
  }
}
'@
    Write-Host $response
}
while ($linkMatches.Success) {
    $dirName = $docFile.BaseName.Replace(' ', '-')
    $targetImageDirectory = "D:\source\proval-docs\static\img\$dirName"
    if (-not (Test-Path -Path $targetImageDirectory)) {
        New-Item -Path $targetImageDirectory -ItemType Directory | Out-Null
    }
    Push-Location -Path $docFile.Directory.FullName
    $targetImagePath = Resolve-Path -Path $targetImageDirectory -Relative
    Pop-Location
    $imageSuffix = (Get-ChildItem $targetImageDirectory).Count + 1
    Invoke-WebRequest -Uri "$itgUrl/$($linkMatches.Groups['slug'].Value)" -OutFile "$targetImageDirectory\image_$imageSuffix.png"
    $content = [regex]::Replace($content, [regex]::Escape($linkMatches.Groups["slug"].Value), "$targetImagePath\image_$imageSuffix.png")
    $linkMatches = $imageLinkRegex.Match($content)
}
Set-Content -Path $Path -Value $content