---
id: 'e36d9583-23da-4dfa-96c8-3467e36e30cf'
slug: /e36d9583-23da-4dfa-96c8-3467e36e30cf
title: 'Get-VolumeThresholds'
title_meta: 'Get-VolumeThresholds'
keywords: ['volume', 'threshold', 'disk', 'space']
description: 'Documentation for the Get-VolumeThresholds command to gather and return information about each applicable volume and their requested threshold for space remaining.'
tags: ['disk-encryption', 'performance']
draft: false
unlisted: false
---

## Description
Gathers and returns information about each applicable volume and their requested threshold for space remaining. The script has two modes: Dynamic and Static.

### Dynamic Mode
In Dynamic mode, the script uses the [Get-VolumeExhaustionEstimate](/docs/21bc13d3-b2fb-42d5-8f38-da9b43990e06) script to generate data points for the size of the volume over time. Once the number of data points crosses a threshold (defined by the parameter `MinimumSamples`), an estimation of the volume space X days before exhaustion is generated (where X is the value of `DaysToLead`). This estimation is then returned as a threshold for the target volume.

If not enough samples have been gathered or the [Get-VolumeExhaustionEstimate](/docs/21bc13d3-b2fb-42d5-8f38-da9b43990e06) script fails to download, the script falls back to Static mode.

### Static Mode
In Static mode, a `hashtable` array is passed into the `ThresholdDefinitions` parameter. Each hashtable must have the following name-value pairs:

```powershell
@{
    MaxSize = value1 # The maximum size for this threshold (1GB, 200GB, 1TB ...)
    ThresholdType = value2 # The type of threshold (Percent or Number)
    Threshold = value3 # The value for the threshold. 1 - 100 if ThresholdType is percent, otherwise can be any number greater than 0.
},
@{
    MaxSize = value4
    ThresholdType = value5
    Threshold = value6
},
## ...
```

These hashtables are used to categorize the volumes and assign the best fit threshold based on that categorization. If a volume is found to be greater than the greatest `MaxSize` in the `hashtable` array, then it is assigned the threshold of that greatest `MaxSize` definition.

### Example
A server has 3 volumes: C, D, and F.

```
C - 50GB
D - 2048GB
F - 10240GB
```

The hashtables passed into the script are as follows:

```powershell
@{
    MaxSize = 40GB
    ThresholdType = Percent
    Threshold = 10
},
@{
    MaxSize = 1024GB
    ThresholdType = Percent
    Threshold = 5
},
@{
    MaxSize = 4096GB
    ThresholdType = Number
    Threshold = 100GB
}
```

The following assignments are generated:

```
C - Threshold 5% (Greater than 40GB and less than 1024GB)
D - Threshold 100GB (Greater than 1024GB and less than 4096GB)
F - Threshold 100GB (Greater than all MaxSize definitions. Uses the greatest MaxSize definition available.)
```

## Requirements
- PowerShell v5
- Must be run as an Administrator
- Internet access (for Dynamic mode)

## Usage
1. All parameters are validated before processing.
2. Variable initialization is performed based on the requested mode (Dynamic or Static).
    - If variable initialization fails for Dynamic mode, the script falls back to Static mode.
3. Volumes to process are gathered based on the passed parameters.
4. Each gathered volume is then looped through.

    ### Dynamic Mode
    - Attempt to match the current volume with an entry in the `$estimates` variable.
        - If no match is found, then fall back to Static mode.
    - Set the threshold for the volume based on the matched estimate.

    <br/>### Static Mode
    - Determine what size type the volume is based on the passed thresholds.
    - Apply the threshold rule set based on the size type.
    - Calculate the threshold if applicable.
    - Add the generated object to the list of return objects.
    <br/><br/>
5. Return the list of objects.

Searches for all fixed volumes with drive letters.

```powershell
.\Get-VolumeThresholds.ps1
```

Searches for all fixed volumes with drive letters, and with a size greater than or equal to 100MB. Any volume less than or equal to 256GB will have a threshold of 11% of space. Any volume less than or equal to 1024GB will have a threshold of 10 gigabytes of space. Any volume greater than 1024GB will have a threshold of 10 gigabytes of space.

```powershell
.\Get-VolumeThresholds.ps1 -MinimumSize 100MB -ThresholdDefinitions @(
    @{ MaxSize = 256GB; ThresholdType = 'Percent'; Threshold = 11 },
    @{ MaxSize = 1024GB; ThresholdType = 'Number'; Threshold = 10GB }
)
```

Searches for all fixed and removable volumes, with or without drive letters.

```powershell
.\Get-VolumeThresholds.ps1 -d 'Fixed', 'Removable' -u
```

Searches for all fixed volumes with drive letters except 'C'.

```powershell
.\Get-VolumeThresholds.ps1 -e 'C'
```

Searches for all fixed volumes with drive letters. Suppresses all console output other than the return object.

```powershell
.\Get-VolumeThresholds.ps1 -Quiet
```

Searches for all fixed volumes where their drive letter is not 'X' and their size is greater than or equal to 10GB. Generates a dynamic threshold based on the trending drive space of the discovered volumes. Suppresses all console output other than the return object.

```powershell
.\Get-VolumeThresholds.ps1 -DynamicThresholds -e 'X' -MinimumSize 10GB -Quiet
```

## Parameters
| Parameter                  | Alias | Required | Default      | Type        | Description                                                                                                                                                                                                                                                                                                                                                                                                  |
| -------------------------- | ----- | -------- | ------------ | ----------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `MinimumSize`              | `m`   | False    | `1MB`        | Int64       | The minimum size of the volume to search for. Any volume under this limit will be excluded.                                                                                                                                                                                                                                                                                                                  |
| `ThresholdDefinitions`     | `t`   | False    | `See script` | hashtable[] | A list of hashtables representing the thresholds to check for. The hashtables must have the following properties:<br/>- MaxSize - The maximum volume size that the specified threshold applies to.<br/>- ThresholdType - The type of threshold to use. Must be either 'Percent' or 'Number'<br/>- Threshold - The threshold to calculate for the volume. If ThresholdType is 'Percent', this must be under 100. |
| `SkipFallback`             | `sf`  | False    | `False`      | Switch      | Prevent the use of fallback thresholds. Volumes with too few samples will not have a threshold returned. This requires that Dynamic thresholds are being used.                                                                                                                                                                                                                                               |
| `DynamicThresholds`        | `dt`  | False    | `False`      | Switch      | Use this switch to set the script to 'Dynamic' mode. This will download and run the `Get-VolumeExhaustionEstimate` script and calculate a threshold if a valid number of samples are found.                                                                                                                                                                                                                  |
| `MinimumSamples`           | `s`   | False    | `30`         | Int         | The minimum number of samples required to generate an estimation. If a volume does not meet this number of samples, the estimation will be skipped.                                                                                                                                                                                                                                                          |
| `DaysToReport`             | `r`   | False    | `14`         | Int         | The maximum age of samples to use for generating an estimation.                                                                                                                                                                                                                                                                                                                                              |
| `DaysToLead`               | `l`   | False    | `7`          | Int         | The number of days before volume exhaustion to generate a volume space estimation for.                                                                                                                                                                                                                                                                                                                       |
| `DriveTypes`               | `d`   | False    | `'Fixed'`    | String[]    | A list of the types of drives to review space for. Valid options are:<br/>- 'Unknown'<br/>- 'Invalid Root Path'<br/>- 'Removable'<br/>- 'Fixed'<br/>- 'Remote'<br/>- 'CD-ROM'<br/>- 'RAM Disk'                                                                                                                                                                                                                      |
| `IncludeUnassignedVolumes` | `u`   | False    | `False`      | Switch      | Use this switch to include volumes that have not been assigned a drive letter.                                                                                                                                                                                                                                                                                                                               |
| `ExcludeDriveLetters`      | `e`   | False    |              | String[]    | A list of drive letters to exclude from the review.                                                                                                                                                                                                                                                                                                                                                          |
| `Quiet`                    | `q`   | False    | `False`      | Switch      | Suppresses all console output other than the return object by overwriting the Write-Host function.                                                                                                                                                                                                                                                                                                           |

## Output
```
System.Management.Automation.PSCustomObject

Name          MemberType
----          ----------
DriveLetter   NoteProperty
Size          NoteProperty
SizeRemaining NoteProperty
Threshold     NoteProperty
ThresholdType NoteProperty
```

```
.\Get-VolumeThresholds-log.txt
.\Get-VolumeThresholds-error.txt
.\Get-VolumeExhaustionEstimate-log.txt
.\Get-VolumeExhaustionEstimate-error.txt
```
