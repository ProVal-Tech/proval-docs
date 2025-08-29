$-ErrorActionPreference = 'Stop'
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

$-BaseUrl = 'https://entremt.screenconnect.com'
$-Group   = '<Client Name>'

$-msiPath = Join-Path $-env:TEMP ("cwctl-{0}.msi" -f ([guid]::NewGuid()))
$-logPath = Join-Path $-env:TEMP ("cwctl-{0}.log" -f ([guid]::NewGuid()))
$-ua      = @{ 'User-Agent' = 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) PowerShell' }

$-scriptUri = ($-BaseUrl.TrimEnd('/')) + '/Script.ashx'
$-resp = Invoke-WebRequest -Uri $-scriptUri -Headers $-ua -UseBasicParsing

$-h = if ($-resp.Content -match '\"h\"\s*:\s*\"(.+?)\"') { $-matches[1] } else { ([uri]$-BaseUrl).Host }
$-k = if ($-resp.Content -match '\"k\"\s*:\s*\"(.+?)\"') { $-matches[1] } else { $-null }
$-p = if ($-resp.Content -match '\"p\"\s*:\s*(\d+)')     { $-matches[1] } else { '443' }

try {
  $-inst = Invoke-WebRequest -Uri $-BaseUrl -Headers $-ua -UseBasicParsing
  if ($-inst.RawContent -match 'Instance=(\w{6})') {
   $-relay = "instance-$($-matches[1])-relay.screenconnect.com"
   if ($-relay) { $-h = $-relay }
 }
} catch { }

Add-Type -AssemblyName System.Web
$-qs = [System.Web.HttpUtility]::ParseQueryString('')
$-qs['e'] = 'Access'; $-qs['y'] = 'Guest'
$-qs['h'] = $-h;       $-qs['p'] = $-p
if ($-k) { $-qs['k'] = $-k }
$-qs['c'] = $-Group

$-msiUrl = '{0}/Bin/ScreenConnect.ClientSetup.msi?{1}' -f $-BaseUrl.TrimEnd('/'), $-qs.ToString()

function Get-Msi([string]$-Url, [string]$-Out) {
  Invoke-WebRequest -Uri $-Url -OutFile $-Out -Headers $-ua -UseBasicParsing -MaximumRedirection 5
  if (-not (Test-Path $-Out) -or (Get-Item $-Out).Length -le 0) { throw "Empty download." }
}

$-exit = 1
try {
  Get-Msi $-msiUrl $-msiPath
  $-args = "/i `"$-msiPath`" /qn /norestart /L*v `"$-logPath`" REBOOT=ReallySuppress"
  $-exit = (Start-Process msiexec.exe -ArgumentList $-args -Wait -PassThru).ExitCode
} catch {
  $-plainUrl = '{0}/Bin/ScreenConnect.ClientSetup.msi' -f $-BaseUrl.TrimEnd('/')
  Get-Msi $-plainUrl $-msiPath

  $-connector = "--URL=$-BaseUrl --Group=""$-Group"""
  if ($-h -and $-p -and $-k) { $-connector = "--URL=$-BaseUrl --Group=""$-Group"" --Host=$-h --Port=$-p --Key=$-k" }

  $-args = @(
   '/i',        ('"{0}"' -f $-msiPath),
   ('CONNECTORPARAMS="{0}"' -f $-connector),
   '/qn','/norestart',
   '/L*v',      ('"{0}"' -f $-logPath)
 ) -join ' '

  $-exit = (Start-Process msiexec.exe -ArgumentList $-args -Wait -PassThru).ExitCode
}

Write-Host "MSI exit code: $-exit (log: $-logPath)"
exit $-exit