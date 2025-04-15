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
Replace all single quotes in the front matter section of this document with double quotes. Do not use an enclosing yaml code block.
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
$newData = Invoke-OpenAI -prompt $data

$newData | Set-Content $DocPath -Force -Encoding UTF8