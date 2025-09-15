$serialNumber = (Get-CimInstance -ClassName 'Win32_BIOS').SerialNumber
$data = @{
    'serialNumber' = "$serialNumber"
    'country' = 'us'
    'language' = 'en'
}
$json = $data | ConvertTo-Json

$Response = Invoke-WebRequest -Uri 'https://pcsupport.lenovo.com/us/en/api/v4/upsell/redport/getIbaseInfo' `
    -UseBasicParsing `
    -Method Post `
    -Headers @{
    'User-Agent' = 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:128.0) Gecko/20100101 Firefox/128.0'
    'Accept' = 'application/json, text/plain, */*'
    'Accept-Language' = 'en-US,en;q=0.5'
    'Content-Type' = 'application/json'
} `
    -Body $json | Select-Object -ExpandProperty Content

$warrantyStart = $Response | ConvertFrom-Json | Select-Object -ExpandProperty Data | Select-Object -ExpandProperty baseWarranties | Select-Object -ExpandProperty startDate
$warrantyStart = $warrantyStart | Sort-Object $_ -Desc -Unique | Select-Object -First 1

$warrantyEnd = $Response | ConvertFrom-Json | Select-Object -ExpandProperty Data | Select-Object -ExpandProperty baseWarranties | Select-Object -ExpandProperty EndDate
$warrantyEnd = $warrantyEnd | Sort-Object $_ -Desc -Unique | Select-Object -First 1

$daysLeft = (New-TimeSpan -Start $warrantyStart -End $warrantyEnd).TotalDays

$asset = [PSCustomObject]@{
    warrantyEnd = "warrantyEnd on $warrantyEnd"
}

Write-Output "warrantyEnd on $warrantyEnd"
