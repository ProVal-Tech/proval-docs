---
id: ps-get-bitlockerstate
title: 'Get-BitLockerState'
title_meta: 'Get-BitLockerState Command'
keywords: ['bitlocker', 'encryption', 'status', 'drive']
description: 'Documentation for the Get-BitLockerState command to check and report the BitLocker encryption status of drives on a Windows system.'
tags: ['disk-encryption', 'security', 'windows', 'report']
draft: false
unlisted: false
---

## Description
Script to check and report the BitLocker encryption status of drives on a Windows system.

## Requirements
- PowerShell v5 or higher
- Administrative privileges are required for correct execution

## Description
The `Get-BitLockerState.ps1` script provides detailed information about the BitLocker encryption status of each drive on a system. It checks various aspects of BitLocker configuration, such as protection status, volume status, encryption percentage, and conversion status. The script outputs its findings to designated log files and can be configured to run specific checks based on the parameters passed.

## Usage
To execute the script with all checks:
```powershell
.\Get-BitLockerState.ps1
```

To execute the script with specific checks, use the corresponding switch parameters:
```powershell
## To check only the state of BitLocker protection
.\Get-BitLockerState.ps1 -CheckState

## To check only the volume status of BitLocker
.\Get-BitLockerState.ps1 -CheckVolumeStatus

## To check only the encryption percentage of the drive
.\Get-BitLockerState.ps1 -CheckEncryptionPercentage

## To check only the conversion status of BitLocker on the drive
.\Get-BitLockerState.ps1 -CheckConversionStatus
```

## Parameters
| Parameter                  | Required | Default | Type    | Description                                                   |
|----------------------------|----------|---------|---------|---------------------------------------------------------------|
| `-CheckState`              | False    |         | Switch  | Check the state of BitLocker protection.                      |
| `-CheckVolumeStatus`       | False    |         | Switch  | Check the volume status of BitLocker.                         |
| `-CheckEncryptionPercentage` | False  |         | Switch  | Check the encryption percentage of the drive.                 |
| `-CheckConversionStatus`   | False    |         | Switch  | Check the conversion status of BitLocker on the drive.        |

## Output
The script generates the following output files in the same directory where it is executed:
- `Get-BitLockerState-log.txt` - Log file with detailed execution logs
- `Get-BitLockerState-data.txt` - File containing data points gathered during execution
- `Get-BitLockerState-error.txt` - Error log file capturing any issues encountered during script execution

## Notes
- The script is designed to be run on systems with BitLocker enabled.
- Administrative rights are required to access BitLocker status information.
- The script does not modify any system settings or BitLocker configurations.
