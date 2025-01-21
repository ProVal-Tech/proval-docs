---
id: ps-repair-printspooler
title: 'Repair-PrintSpooler'
title_meta: 'Repair-PrintSpooler Command'
keywords: ['repair', 'printspooler', 'service', 'reset']
description: 'Documentation for the Repair-PrintSpooler command to repair and reset the Windows Print Spooler service.'
tags: ['print', 'windows']
draft: false
unlisted: false
---

## Description
This script is used to repair and reset the Windows Print Spooler service.

## Requirements
- PowerShell v5
- Must be executed as an administrator

## Usage
- Checks and starts the Print Spooler service and its dependencies.
- Clears the print queue if specified.
- Logs the status of the Print Spooler service before and after the repair process.
- Logs any failures to the error log.

Attempt to repair and reset the Print Spooler service as a primary troubleshooting step for Print Spooler issues.

```powershell
.\Repair-PrintSpooler.ps1
```

Attempt to repair and reset the Print Spooler service while clearing the print queue, as an additional troubleshooting step for Print Spooler issues.

```powershell
.\Repair-PrintSpooler.ps1 -ClearQueue
```

## Parameters
| Parameter         | Alias | Required  | Default   | Type      | Description                                   |
| ----------------- | ----- | --------- | --------- | --------- | --------------------------------------------- |
| `-ClearQueue`     |       | False     |           | Switch    | Clears the print queue as part of the repair. |

## Output
Location of output for log and error files:

```
.\Repair-PrintSpooler-log.txt
.\Repair-PrintSpooler-error.txt
```
