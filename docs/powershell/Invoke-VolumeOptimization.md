---
id: '931ab6f1-d49a-430b-bc21-4d2fc8b228d0'
slug: /931ab6f1-d49a-430b-bc21-4d2fc8b228d0
title: 'Invoke-VolumeOptimization'
title_meta: 'Invoke-VolumeOptimization'
keywords: ['volume', 'optimization', 'defragment', 'trim']
description: 'Documentation for the Invoke-VolumeOptimization command to defragment or trim a drive using the Optimize-Volume command or standard defrag method.'
tags: ['performance', 'windows']
draft: false
unlisted: false
---

## Description
This command will utilize the Optimize-Volume command to defragment or trim a drive if it is compatible. If the drive is not compatible, the standard defrag method will be used.

## Usage
1. Determine the scope of drives to defragment.
2. For each drive, log a baseline of an analysis scan (works for compatible and non-compatible drives).
3. Defragment the drive if it is compatible with Optimize-Volume; if not, call the standard defrag method.
4. Log the results of the defragmentation.

```powershell
.\Invoke-VolumeOptimization.ps1
```
This command will attempt a defragmentation of all drives.

```powershell
.\Invoke-VolumeOptimization.ps1 -Drives C,E
```
This command will defragment drives C and E.

## Parameters
| Parameter         | Alias | Required  | Default   | Type      | Description                               |
| ----------------- | ----- | --------- | --------- | --------- | ----------------------------------------- |
| `Drives`          |       | False     | all drives| String[]  | The drives you wish to scan. If left blank, defaults to all drives. |

## Output
The location of output for log, result, and error files:

```
.\Invoke-VolumeOptimization-log.txt
```

## Notes
This script may take more than 30 minutes to complete.


