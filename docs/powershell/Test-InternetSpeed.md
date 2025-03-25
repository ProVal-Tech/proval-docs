---
id: '12946fed-d74f-4977-b59d-85d5c639b56b'
slug: /12946fed-d74f-4977-b59d-85d5c639b56b
title: 'Test-InternetSpeed'
title_meta: 'Test-InternetSpeed'
keywords: ['speedtest', 'internet', 'network', 'performance']
description: 'Documentation for the Test-InternetSpeed command to run an internet speed test via the Ookla SpeedTest CLI application.'
tags: ['networking', 'performance', 'software']
draft: false
unlisted: false
---

## Description
Runs an internet speed test via the Ookla SpeedTest CLI application.

## Requirements
PowerShell 5

## Usage
```powershell
$results = .\Test-InternetSpeed.ps1
Write-Information "Download: $($results.downloadMbps) Mbps"
Write-Information "Upload: $($results.uploadMbps) Mbps"
```

## Output
Outputs an object representing the JSON data from the result of the speed test. Returns null if the speed test fails to run.
```
type         : result
timestamp    : 2022-01-21T20:20:28Z
ping         : @{jitter=0.66600000000000004; latency=9.2989999999999995}
download     : @{bandwidth=115530744; bytes=994952419; elapsed=8710}
upload       : @{bandwidth=116982513; bytes=897208635; elapsed=7725}
packetLoss   : 0
isp          : Name of ISP
interface    : @{internalIp=192.168.1.100; name=; macAddr=00:00:00:00:00:00; isVpn=False; externalIp=000.000.000.000}
server       : @{id=16495; host=speedtest10g.bhm.slfiber.com; port=8080; name=Uniti Fiber; location=Birmingham, AL; country=United States; ip=170.249.165.226}
result       : @{id=00000000-0000-0000-0000-000000000000; url=https://www.speedtest.net/result/c/00000000-0000-0000-0000-000000000000; persisted=True}
downloadMbps : 924.245952
uploadMbps   : 935.860104
```


