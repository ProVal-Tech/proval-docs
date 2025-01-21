---
id: ps-measure-volumespace
title: 'Measure Volume Space'
title_meta: 'Measure Volume Space with PowerShell'
keywords: ['volume', 'space', 'threshold', 'disk', 'storage']
description: 'Guide to measuring volume space and identifying low space volumes using PowerShell.'
tags: ['performance', 'windows']
draft: false
unlisted: false
---

## Description
This document provides a guide to measuring volume space and determining if volumes are low on space based on specified parameters.

## Requirements
- PowerShell v5
- Must be run as an Administrator

## Usage
1. All parameters are validated before processing.
2. Volumes to process are gathered based on the passed parameters.
3. Each gathered volume is then looped through:
    - Determine the size type (Small, Medium, Large, X-Large) of the volume.
    - Apply the threshold rule set based on the size type.
    - Add the volume to the list of low space volumes if it is found to be low.
4. Return the list of low space volumes.

Searches for all fixed volumes with drive letters and returns those that are low on space based on the default parameters.

```powershell
.\Measure-VolumeSpace.ps1
```

Searches for all fixed volumes with drive letters and a size greater than or equal to 100MB, returning volumes that are low on space. The maximum size for a 'small' drive is 20GB, meaning that medium drives will be between 20GB and the default 1024GB. The medium drive type uses a percentage-based threshold of 20%.

```powershell
.\Measure-VolumeSpace.ps1 -MinimumSize 100MB -SmallVolumeMaxSize 20GB -MediumVolumeThresholdType 'Percent' -MediumVolumeThreshold 20
```

Searches for all fixed and removable volumes, with or without drive letters, returning those that are low on space based on the default parameters.

```powershell
.\Measure-VolumeSpace.ps1 -d 'Fixed', 'Removable' -u
```

Searches for all fixed volumes with drive letters except 'C', returning those that are low on space based on the default parameters.

```powershell
.\Measure-VolumeSpace.ps1 -e 'C'
```

Searches for all fixed volumes with drive letters, suppressing all console output except for the return object, and returning volumes that are low on space based on the default parameters.

```powershell
.\Measure-VolumeSpace.ps1 -Quiet
```

## Parameters
| Parameter                   | Alias | Required  | Default      | Type     | Description                               |
| --------------------------- | ----- | --------- | ------------ | -------- | ----------------------------------------- |
| `MinimumSize`               | `sm`  | False     | `1MB`        | Int64    | The minimum size of the volume to search for. Any volume under this limit will be excluded. |
| `SmallVolumeMaxSize`        | `ss`  | False     | `256GB`      | Int64    | The maximum size of what should be considered a 'small' drive. |
| `SmallVolumeThreshold`      | `st`  | False     | `11`         | Int64    | The threshold to consider a 'small' volume low on space. If `$SmallVolumeThresholdType` is set to `'Percent'`, this should be less than or equal to `100`. |
| `SmallVolumeThresholdType`  | `stt` | False     | `'Percent'`  | String   | The type of threshold calculation to perform for 'small' drives. Valid options are `'Percent'` and `'Number'`. |
| `MediumVolumeMaxSize`       | `ms`  | False     | `1024GB`     | Int64    | The maximum size of what should be considered a 'medium' drive. |
| `MediumVolumeThreshold`     | `mt`  | False     | `11`         | Int64    | The threshold to consider a 'medium' volume low on space. If `$MediumVolumeThresholdType` is set to `'Percent'`, this should be less than or equal to `100`. |
| `MediumVolumeThresholdType` | `mtt` | False     | `'Percent'`  | String   | The type of threshold calculation to perform for 'medium' drives. Valid options are `'Percent'` and `'Number'`. |
| `LargeVolumeMaxSize`        | `ls`  | False     | `2048GB`     | Int64    | The maximum size of what should be considered a 'large' drive. |
| `LargeVolumeThreshold`      | `lt`  | False     | `5`          | Int64    | The threshold to consider a 'large' volume low on space. If `$LargeVolumeThresholdType` is set to `'Percent'`, this should be less than or equal to `100`. |
| `LargeVolumeThresholdType`  | `ltt` | False     | `'Percent'`  | Int64    | The type of threshold calculation to perform for 'large' drives. Valid options are `'Percent'` and `'Number'`. |
| `XLargeVolumeThreshold`     | `xt`  | False     | `5`          | Int64    | The threshold to consider an 'x-large' volume low on space. If `$XLargeVolumeThresholdType` is set to `'Percent'`, this should be less than or equal to `100`. |
| `XLargeVolumeThresholdType` | `xtt` | False     | `'Percent'`  | Int64    | The type of threshold calculation to perform for 'x-large' drives. Valid options are `'Percent'` and `'Number'`. |
| `DriveTypes`                | `d`   | False     | `'Fixed'`    | String[] | A list of the types of drives to review space for. Valid options are:<br/>- 'Unknown'<br/>- 'Invalid Root Path'<br/>- 'Removable'<br/>- 'Fixed'<br/>- 'Remote'<br/>- 'CD-ROM'<br/>- 'RAM Disk' |
| `IncludeUnassignedVolumes`  | `u`   | False     | `False`      | Switch   | Use this switch to include volumes that have not been assigned a drive letter. |
| `ExcludeDriveLetters`       | `e`   | False     |              | String[] | A list of drive letters to exclude from the review. |
| `Quiet`                     | `q`   | False     | `False`      | Switch   | Suppresses all console output other than the return object by overwriting the Write-Host function. |

## Output
`Microsoft.Management.Infrastructure.CimInstance#ROOT/Microsoft/Windows/Storage/MSFT_Volume`

- `.\Measure-VolumeSpace-log.txt`
- `.\Measure-VolumeSpace-error.txt`

