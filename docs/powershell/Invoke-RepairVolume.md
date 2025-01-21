---
id: ps-invoke-repairvolume
title: 'Invoke-RepairVolume'
title_meta: 'Invoke-RepairVolume Command'
keywords: ['repair', 'volume', 'disk', 'health']
description: 'Documentation for the Invoke-RepairVolume command to run the PowerShell equivalent of chkdsk on any or all drives, with the option to repair any found issues.'
tags: ['performance', 'windows']
draft: false
unlisted: false
---

## Description
This script allows a technician to run the PowerShell equivalent of chkdsk on any or all drives, with the option to repair any found issues.

## Usage
1. If no drive letters are provided, get all drive letters.
2. Determine the scope:
    1. **No Repair option** - Runs `Repair-Volume` on that drive with the `-Scan` switch.  
        To prevent disrupting a volume’s availability, you can scan a volume without attempting to repair it. All detected corruptions are added to the `$corrupt` system file. This is equivalent to running `chkdsk /scan`.
    2. **Repair - non-full** - Runs `Repair-Volume` on that drive with the `-SpotFix` switch.  
        This option will temporarily take the volume offline for the time needed to fix those identified errors. This is equivalent to running `chkdsk /spotfix`.
    3. **Repair - Full** - Runs `Repair-Volume` on that drive with the `-OfflineScanAndFix` switch.  
        This option will take the volume offline in order to perform a full scan and fix any errors found along the way. This requires the most time but is also the most comprehensive. This is equivalent to running `chkdsk /f`.
3. Return the results of running the command.

```powershell
.\Invoke-RepairVolume.ps1
```
Returns the state of all internal drives' health and adds any corruptions to the `$Corrupt` system file.

```powershell
.\Invoke-RepairVolume.ps1 -DriveLetter C
```
Returns the state of the C drive's health.

```powershell
.\Invoke-RepairVolume.ps1 -DriveLetter C -Repair
```
Will attempt to repair any found issues on the C drive, stopping the C drive only when necessary.

```powershell
.\Invoke-RepairVolume.ps1 -Repair -Full
```
Will attempt to repair any found issues on all drives; this will render the hard drive offline during the process.

## Parameters
| Parameter         | Alias | Required  | Default   | Type      | Description                               |
| ----------------- | ----- | --------- | --------- | --------- | ----------------------------------------- |
| `DriveLetters`    |       | False     |           | String[]  | A string array to hold target drives.    |
| `Repair`          |       | False     |           | Switch    | Toggles the repair option.               |
| `Full`            |       | False     |           | Switch    | Toggles the full offline repair option when using repair. |

## Output
**Logs**
```
.\Invoke-RepairVolume-log.txt
```

**Console**
```
System-Object
```
Formatted as:
| DriveLetter   | ScanResults    |
