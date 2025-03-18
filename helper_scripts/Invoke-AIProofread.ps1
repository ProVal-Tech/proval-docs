using namespace System.Collections.Generic
[CmdletBinding()]
param (
    [Parameter(Mandatory)]
    [string]$DocPath,
    [Parameter(Mandatory)]
    [string]$apiKey
)
$endpoint = 'https://api.openai.com/v1/chat/completions'
$systemMessage = 'Proofread and correct this markdown document. The document should be free of spelling and grammatical errors. Ensure that the document is well-structured and easy to read. Make sure that the document is formatted correctly and adheres to the markdown syntax. Do not use top-level markdown code blocks, and only return the corrected markdown content.'
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
$markdown = Invoke-OpenAI -prompt $data
Set-Content -Path $DocPath -Value $markdown