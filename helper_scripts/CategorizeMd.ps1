using namespace System.Collections.Generic
[CmdletBinding()]
param (
    [Parameter(Mandatory)]
    [string]$DocPath,
    [Parameter(Mandatory)]
    [string]$apiKey
)

$endpoint = 'https://api.openai.com/v1/chat/completions'
$systemMessage = @'
From the following list of types, and only these types, determine what type of content the following text is documenting. Return only the type name.
- dataview
- monitor
- role
- script
- table
- view
'@
function Invoke-OpenAI {
    param (
        [string]$prompt
    )
    [List[Hashtable]]$messages = @()
    $messages.Add(@{role = 'system'; content = $systemMessage })
    $messages.Add(@{role = 'user'; content = $($prompt | ConvertTo-Json -Compress) })
    $headers = @{
        'Content-Type' = 'application/json'
        'Authorization' = "Bearer $apiKey"
    }
    $body = @{
        model = 'gpt-4o-mini'
        messages = $messages
        temperature = 0.5
    }
    $response = Invoke-RestMethod -Uri $endpoint -Method Post -Headers $headers -Body ($body | ConvertTo-Json -Compress)
    return $response.choices[0].message.content
}

$data = Get-Content $DocPath -Raw
$typeOfContent = Invoke-OpenAI -prompt $data
Write-Host "Content name: $DocPath"
Write-Host "Type of content: $typeOfContent"
switch ($typeOfContent) {
    'dataview' {
        $newPath = 'D:\source\proval-docs\docs\cwa\dataviews'
        break
    }
    'monitor' {
        $newPath = 'D:\source\proval-docs\docs\cwa\monitors'
        break
    }
    'role' {
        $newPath = 'D:\source\proval-docs\docs\cwa\roles'
        break
    }
    'script' {
        $newPath = 'D:\source\proval-docs\docs\cwa\scripts'
        break
    }
    'table' {
        $newPath = 'D:\source\proval-docs\docs\cwa\tables'
        break
    }
    'view' {
        $newPath = 'D:\source\proval-docs\docs\cwa\views'
        break
    }
    default {
        $newPath = 'D:\source\proval-docs\docs\cwa'
        break
    }
}
Move-Item -Path $DocPath -Destination $newPath