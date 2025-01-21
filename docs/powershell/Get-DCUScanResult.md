---
id: ps-get-dcuscanresult
title: 'Get-DCUScanResult'
title_meta: 'Get-DCUScanResult Command'
keywords: ['dell', 'dcu', 'scan', 'result']
description: 'Documentation for the Get-DCUScanResult command to fetch the scan result from dcu-cli for Dell machines.'
tags: ['report', 'software', 'windows']
draft: false
unlisted: false
---

## Description
Fetches the scan result from dcu-cli for Dell machines.

## Requirements
- Run with elevated permissions.
- Must be a Dell machine.
- Dell Command Update version 4.0 or higher must be installed.

## Usage
After ensuring the fulfillment of the requirements, this command stores the result of the dcu-cli scan into an XML file and imports the content of the file into an object.

```powershell
.\Get-DCUScanResult.ps1
```

## Output
- `.\Get-DCUScanResult-log.txt`
- `.\Get-DCUScanResult-error.txt`
- `.\DCUReport\DCUApplicableUpdates.xml`
