[CmdletBinding()]
param (
    [Parameter(Mandatory)]
    [string]
    $Path
)
Write-Information $Path
$content = Get-Content -Path $Path
$codeBlockRegex = [regex]::new('^```')
$dfsRegex = [regex]::new("(?<!https?:)//")
$lteRegex = [regex]::new("\\+<")
$gteRegex = [regex]::new("\\+>")
$sqeRegex = [regex]::new("/'")
$comRegex = [regex]::new('-command ?\\"')
$dqsqRegex = [regex]::new("\\`" ?'")

if(-not ($content | Where-Object { $codeBlockRegex.IsMatch($_) })) {
    Write-Information "No code blocks found in file"
    return
}

$inCodeBlock = $false
$changed = $false
for ($i = 0; $i -lt $content.Length; $i++) {
    $line = $content[$i]
    if ($codeBlockRegex.IsMatch($line)) {
        Write-Information "$(if($inCodeBlock -eq $true) {"End"} else {"Start"}) code block"
        $inCodeBlock = -not $inCodeBlock
    }

    if ($inCodeBlock -eq $true) {
        $newLine = $dfsRegex.Replace($line, "\\")
        $newLine = $lteRegex.Replace($newLine, "<")
        $newLine = $gteRegex.Replace($newLine, ">")
        $newLine = $sqeRegex.Replace($newLine, "\'")
        $newLine = $comRegex.Replace($newLine, '-command "')
        $newLine = $dqsqRegex.Replace($newLine, "`"'")
        if($newLine -ne $line) {
            $changed = $true
            $content[$i] = $newLine
        }
    }
}
if(-not $changed) {
    Write-Information "No changes made"
    return
}
$content -join "`n" | Out-File -FilePath $Path -NoNewline