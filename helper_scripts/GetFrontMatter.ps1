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
Return a front matter section for this markdown document. The front matter should include the following fields: id, title, title_meta, keywords, description, tags, draft, and unlisted. The id should be a unique identifier for the document using the title as a base, and it should be prefixed with either 'ps' for PowerShell content, 'cwa' for ConnectWise Automate content, 'vsa' for Kaseya VSA content, or 'rmm' for ConnectWise RMM content. The title should be the title of the document. The title_meta should be the title of the document as seen by search engines. The keywords should be an array of keywords related to the document. The description should be a longer description of the content. The tags should be an array of tags related to the document. The draft field should be set to false. The unlisted field should be set to false. Use the following tags if applicable: active-directory, adobe, backup, chrome, configuration, database, disk-encryption, dns, firefox, hyper-v, installation, networking, n-able, notification, office365, performance, print, recovery, report, security, setup, software, uninstallation, update, virtualization, web-browser, windows, wireless. Feel free to add any additional tags that you think are relevant. Do not use "PowerShell", "Automation", or the name of the script as a tag or keyword and try to not use generic words. Tags and keywords must only be one word each and lowercase. The title, title_meta, keywords, and description should be enclosed in single quotes. Do not enclose the response in a code block.
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
$fm = Invoke-OpenAI -prompt $data
$newContent = @"
$fm
$data
"@
$newContent | Set-Content $DocPath -Force -Encoding UTF8