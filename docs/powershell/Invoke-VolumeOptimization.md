---
id: ps-invoke-volumeoptimization
title: 'Invoke-VolumeOptimization'
title_meta: 'Invoke-VolumeOptimization Command'
keywords: ['volume', 'optimization', 'defragment', 'trim']
description: 'Documentation for the Invoke-VolumeOptimization command to defragment or trim a drive using the Optimize-Volume command or standard defrag method.'
tags: ['performance', 'windows', 'configuration']
draft: false
unlisted: false
---
## Description
Will Utilize the Optimize-Volume command to defragment or trim a drive if compatible, if not compatible we will use the standard defrag method.

## Usage
1. Determine the scope of drives to defragment.
2. Foreach drive log a baseline of an analyze scan. (works for compatible and non compatible drives)
3. Defragment the drive if compatible with Optimize-Volume, if not compatible call the standard defrag method.
4. Log the results of the defrag.



```powershell
.\Invoke-VolumeOptimization.ps1
```
Will attempt a defrag of all drives

```powershell
.\Invoke-VolumeOptimization.ps1 -Drives C,E
```
Will defragment Drives C and E


## Parameters
| Parameter         | Alias | Required  | Default   | Type      | Description                               |
| ----------------- | ----- | --------- | --------- | --------- | ----------------------------------------- |
| `Drives`          |       | False     | all drives| String[]  |  The drives you wish to scan.  If left blank defaults to all drives                                         |


## Output
Location of output for log, result, and error files.

    .\ Invoke-VolumeOptimization-log.txt

## Notes
This script may exceed 30 minutes to complete.

