---
id: '3567c5e7-f5ae-46d6-b15f-4410b0be85d1'
slug: /3567c5e7-f5ae-46d6-b15f-4410b0be85d1
title: 'Get-DCUScanResult'
title_meta: 'Get-DCUScanResult'
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
