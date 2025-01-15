---
id: ps-get-dcuscanresult
title: 'Get-DCUScanResult'
title_meta: 'Get-DCUScanResult Command'
keywords: ['dell', 'dcu', 'scan', 'result']
description: 'Documentation for the Get-DCUScanResult command to fetch the scan result from dcu-cli for Dell machines.'
tags: ['report', 'windows', 'software']
draft: false
unlisted: false
---
## Description
Fetches the scan result from dcu-cli for Dell machines.

## Requirements
- Run with elevated permission.
- Must be a Dell machine.
- Dell Command Update 4.0+ version installed.

## Usage
After ensuring the fulfillment of requirements, it stores the result of dcu-cli scan into an XML file and imports the content of the file into an object.


Fetches the scan result from dcu-cli for Dell machines.

```powershell
.\Get-DCUScanResult.ps1
```

## Output
.\Get-DCUScanResult-log.txt
.\Get-DCUScanResult-error.txt
.\DCUReport\DCUApplicableUpdates.xml




