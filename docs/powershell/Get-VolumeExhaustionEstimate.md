---
id: ps-get-volumeexhaustionestimate
title: 'Get-VolumeExhaustionEstimate'
title_meta: 'Get-VolumeExhaustionEstimate Command'
keywords: ['volume', 'exhaustion', 'estimate', 'disk']
description: 'Documentation for the Get-VolumeExhaustionEstimate command to estimate disk space exhaustion for volumes based on linear regression.'
tags: ['performance', 'disk-encryption', 'windows']
draft: false
unlisted: false
---
## Description
Takes a sample of the current volume space for each target volume and gets a list of space exhaustion estimations for them based on linear regression.

## Requirements
- PowerShell v5

## Usage
Note: This process requires a data gathering period no shorter than 15 hours. This is due to the 30 samples that are by default required to start making estimations. This time can be shortened by changing the `MinimumSamples` parameter to something smaller. However, the less samples that you begin with, the less accurate the initial results will be.

- Gets the target volumes based on the passed parameters.
- Creates the `$Path` if is does not exist.
- Starts looping through the target volumes.
    - If the drive letter of the volume equals `0` then skip it as this could be the Recovery volume.
    - Gets the current UNIX timestamp in UTC.
    - If the volume does not have a drive letter, then attempt to gather a GUID from the DeviceID instead.
        - If a GUID cannot be found, the volume is skipped.
    - If the last write time of the report file for the volume is 30 minutes or greater, then add a new entry to the report `$Path\$driveLetter.csv`.
        | DriveLetter | SizeRemaining | Epoch      |
        | ----------- | ------------- | ---------- |
        | C           | 2483572834    | 1648488169 |
        | C           | ...           | ...        |
        - Excessive entries to the report may skew results, thus a hard limit of 30 minutes is set here.
    - Datapoints are gathered from the report based on the `$DaysToReport` parameter.
    - If the number of datapoints gathered is less than `$MinimumSamples` then the volume is skipped until the requested number of samples have been gathered.
    - The means of the UNIX timestamps and remaining volume space from the datapoints are gathered.
    - The [Least squares method](https://en.wikipedia.org/wiki/Least_squares) is used to approximate the slope (*m*) of the Line of Best Fit for the datapoints.

        [Equation](https://latex.codecogs.com/png.image?\LARGE&space;\dpi{110}\bg{white}m=\frac{\sum_{i=1}^{n}(x_{i}&space;-&space;\overline{X})(y_{i}&space;-&space;\overline{Y})}{\sum_{i=1}^{n}(x_{i}&space;-&space;\overline{X})^{2}})
        
    - The y-intercept (*c*) is calculated by the following equation:

        [Equation](https://latex.codecogs.com/png.image?\LARGE&space;\dpi{110}\bg{white}c&space;=&space;\overline{Y}&space;-&space;m\overline{X})

    - If the slope is greater than or equal to 0 then the current trend of volume space is constant or upward and the volume is skipped.
    - The epoch time of volume space exhaustion (when the remaining space on the volume = 0) is calculated by the following equation:

        [Equation](https://latex.codecogs.com/png.image?\LARGE&space;\dpi{110}\bg{white}\\y=mx&plus;c\\*0=mx&plus;c\\$-$c=mx\\x=\frac{\text{-}c}{m})
        
        - If the date of exhaustion is over three years, then the volume will be skipped.
    - With this value calculated we can determine the amount of space that will be left `$DaysToLead` days before exhaustion.
    - A `PSObject` with the following properties is generated and added to the return array:

        | Name                 | MemberType   | Definition      | Description                                                           |
        | -------------------- | ------------ | --------------- | --------------------------------------------------------------------- |
        | DriveLetter          | NoteProperty | char            | The drive letter of the volume                                        |
        | EstimatedLeadSpace   | NoteProperty | double          | The amount of space estimated to be remaining after $DaysToLead days. |
        | ExhaustionEstimation | NoteProperty | System.TimeSpan | The amount of estimated time remaining before volume exhaustion.      |
- The `PSObject` array is returned.
    

Returns estimations with the default parameters.

```powershell
.\Get-VolumeExhaustionEstimate.ps1
```

Returns estimations with the reports going to the `C:\temp` path.

```powershell
.\Get-VolumeExhaustionEstimate.ps1 -Path 'C:\temp'
```

Returns estimations after 60 samples have been taken.

The script will use samples that are up to 30 days old to make the estimations.

The return object will include the estimated space 40 days before exhaustion.

```powershell
.\Get-VolumeExhaustionEstimate.ps1 -MinimumSamples 60 -DaysToReport 30 -DaysToLead 40
```

Returns estimations of volumes greater than 60MB in size that are Fixed or Removable.

Excludes the D and E drive letters if they exist.

Suppresses all informational, warning, and error console output.

```powershell
.\Get-VolumeExhaustionEstimate.ps1 -MinimumSize 60MB -DriveTypes "Fixed", "Removable" -ExcludeDriveLetters "D", "E" -Quiet
```

## Parameters
| Parameter                  | Alias | Required | Default | Type     | Description                                                                                                                                                                   |
| -------------------------- | ----- | -------- | ------- | -------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `Path`                     | `p`   | False    | `pwd`   | String   | The path to save the raw volume report data to. Will be created if it does not exist.                                                                                         |
| `MinimumSamples`           | `s`   | False    | `30`    | Int      | The minimum number of samples required to generate an estimation. If a volume does not meet this number of samples, the estimation will be skipped.                           |
| `DaysToReport`             | `r`   | False    | `14`    | String   | The maximum age of samples to use for generating an estimation.                                                                                                               |
| `DaysToLead`               | `l`   | False    | `7`     | Int      | The number of days before volume exhaustion to generate a volume space estimation for.                                                                                        |
| `MinimumSize`              | `m`   | False    | `1MB`   | Int64    | The minimum size of volume to generate an estimation for.                                                                                                                     |
| `DriveTypes`               | `d`   | False    | `Fixed` | String[] | A list of the types of drives to review. Valid options are:<br/>- 'Unknown'<br/>- 'Invalid Root Path'<br/>- 'Removable'<br/>- 'Fixed'<br/>- 'Remote'<br/>- 'CD-ROM'<br/>- 'RAM Disk' |
| `IncludeUnassignedVolumes` | `u`   | False    | `False` | Switch   | Include volumes that have not been assigned a drive letter.                                                                                                                   |
| `ExcludeDriveLetters`      | `e`   | False    | `@()`   | String[] | A list of drive letters to exclude from the review.                                                                                                                           |
| `Force`                    | `f`   | False    | `False` | Switch   | Return estimates for all drives regardless of status (trending upward or unreliable exhaustion date)                                                                          |
| `Quiet`                    | `q`   | False    | `False` | Switch   | Suppress all console output other than the return object by overwriting the Write-Host function.                                                                              |

## Output
    System.Management.Automation.PSCustomObject
    Name                     MemberType   Definition      Description
    ----                     ----------   ----------      ----------
    DriveLetter              NoteProperty char            The drive letter of the volume
    EstimatedLeadSpace       NoteProperty double          The amount of space estimated to be remaining after $DaysToLead days.
    ExhaustionEstimation     NoteProperty System.TimeSpan The amount of estimated time remaining before volume exhaustion.
    ExhaustionEstimationDate NoteProperty System.DateTime The estimated date of volume exhaustion.
