---
id: ps-repair-windowsupdate
title: 'Repair-WindowsUpdate'
title_meta: 'Repair-WindowsUpdate Command'
keywords: ['repair', 'windowsupdate', 'reset', 'troubleshoot']
description: 'Documentation for the Repair-WindowsUpdate command to reset Windows Update settings and troubleshoot update issues.'
tags: ['windows', 'update', 'configuration']
draft: false
unlisted: false
---

## Description
Script used to reset windows update settings.

🚨 This script is provided "without warranty". 🚨

It is not necessary that running the script will resolve any issue with the windows updates. It will simply attempt to reset windows update settings.

🚨 *YOU HAVE BEEN WARNED* 🚨

## Requirements
- PowerShell v5
- Must be executed as administrator
- Windows must be licensed 

## Usage
- Stop the services related to windows updates.
- Perform System File Check.
- Rename cache directories for windows update.
- Start the services related to windows updates.
- Logs any failures to the error log.


Attempt to reset windows update settings as a primary troubleshooting step for windows update issues.

```powershell
.\Repair-WindowsUpdate.ps1
```

Attempt to reset windows update settings as a primary troubleshooting step, with an optional sfc scan, for windows update issues.
```powershell
.\Repair-WindowsUpdate.ps1 -SFCScan
```
## Parameters
| Parameter         | Alias | Required  | Default   | Type      | Description                               |
| ----------------- | ----- | --------- | --------- | --------- | ----------------------------------------- |
| `-SFCScan`        |       | False     |           | Switch    | Toggles an optional sfc scan as a repair option for windows updates.|

## Output
Location of output for log, result, and error files.

    .\Reset-WindowsUpdates-log.txt
    .\Reset-WindowsUpdates-error.txt
