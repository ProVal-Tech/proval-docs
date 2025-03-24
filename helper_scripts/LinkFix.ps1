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
In the provided Markdown document, find all file references that use backslashes for pathing and replace them with a forward slash. Do not use double forward slashes. Only one. Do not use any enclosing Markdown code block or quotes, and return the resulting document.
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

$newData.Trim('"') | Set-Content $DocPath -Force -Encoding UTF8