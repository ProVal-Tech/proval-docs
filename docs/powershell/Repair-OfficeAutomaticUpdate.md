---
id: ps-repair-officeautomaticupdate
title: 'Repair-OfficeAutomaticUpdate'
title_meta: 'Repair-OfficeAutomaticUpdate Command'
keywords: ['repair', 'office365', 'update', 'automatic']
description: 'Documentation for the Repair-OfficeAutomaticUpdate command to check and resolve common failure points in Office automatic updates.'
tags: ['office365', 'update', 'configuration']
draft: false
unlisted: false
---

## Description
Checks common failure points in Office automatic updates and automatically resolves them.

## Requirements
Office 365 (C2R) Version 16.x installed on the endpoint

## Usage
Checks the following common failures:
- UpdateEnabled set to True
- Channel is properly filled
  - If the Channel is empty, it will be set to the uri for Microsoft's 'Current Channel.
- CDN is properly filled
- Scheduled task that launches the Microsoft Office Update process exists and is enabled.
  - Task will be created to match the Official Microsoft task as closely as possible.
  - If the task is present but not in a 'ready' state, the task will be enabled.


```powershell
    PS C:\> Repair-OfficeAutomaticUpdate.ps1
    Performs a check and repair of Office365.
```

## Output
.\Repair-OfficeAutomaticUpdate-log.txt

.\Repair-OfficeAutomaticUpdate-error.txt