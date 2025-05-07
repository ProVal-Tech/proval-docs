---
id: '39345bfd-d9e2-4e68-9d7a-3e8b443140cc'
slug: /39345bfd-d9e2-4e68-9d7a-3e8b443140cc
title: 'Repair-WindowsUpdate'
title_meta: 'Repair-WindowsUpdate'
keywords: ['repair', 'windowsupdate', 'reset', 'troubleshoot', 'sfc', 'dism']
description: 'Documentation for the Repair-WindowsUpdate command to reset Windows Update settings and troubleshoot update issues.'
tags: ['update', 'windows']
draft: false
unlisted: false
---

## Description
This script is used to reset Windows Update settings.

🚨 This script is provided "without warranty." 🚨

Running the script may not necessarily resolve any issues with Windows updates. It simply attempts to reset Windows Update settings.

🚨 *YOU HAVE BEEN WARNED* 🚨

## Requirements
- PowerShell v5
- Must be executed as an administrator
- Windows must be licensed 

## Usage
1. Stop the services related to Windows updates.
2. Perform a System File Check.
3. Rename cache directories for Windows Update.
4. Reset the Windows Component by installing the PSWindowsUpdate module.
5. Start the services related to Windows updates.
6. It provides optional feature of sfcscan and dism repair.
7. Log any failures to the error log.

Attempt to reset Windows Update settings as a primary troubleshooting step for Windows Update issues.

```powershell
.\Repair-WindowsUpdate.ps1
```

Attempt to reset Windows Update settings as a primary troubleshooting step, with an optional SFC scan or dism repair or both, for Windows Update issues.

```powershell
.\Repair-WindowsUpdate.ps1 -SFCScan
```

```powershell
.\Repair-WindowsUpdate.ps1 -DISMRepair
```

```powershell
.\Repair-WindowsUpdate.ps1 -SFCScan -DISMRepair
```

## Parameters
| Parameter   | Alias | Required | Default | Type   | Description                                                        |
|-------------|-------|----------|---------|--------|--------------------------------------------------------------------|
| `-SFCScan`  |       | False    |         | Switch | Toggles an optional SFC scan as a repair option for Windows updates. |
| `-DISMRepair` |     | False    |         | Switch | Toggles an optional DISM repair                                     |

## Output
Location of output for log, result, and error files:

```
.\Reset-WindowsUpdates-log.txt
.\Reset-WindowsUpdates-error.txt
```

