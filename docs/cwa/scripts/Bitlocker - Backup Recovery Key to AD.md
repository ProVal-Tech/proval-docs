---
id: 'cwa-backup-bitlocker-recovery-key'
title: 'Backup Bitlocker Recovery Key to AD Domain'
title_meta: 'Backup Bitlocker Recovery Key to Active Directory Domain'
keywords: ['bitlocker', 'backup', 'recovery', 'ad', 'encryption', 'script']
description: 'This document provides a detailed overview of a script that automates the process of backing up the existing Bitlocker recovery key to a joined Active Directory domain, saving significant time in the process. It includes sample runs, dependencies, variables, and the overall process involved in executing the script.'
tags: ['backup', 'encryption', 'active-directory', 'windows', 'security']
draft: false
unlisted: false
---
## Summary

This script backs up the existing Bitlocker recovery key to the joined AD domain.

Time Saved by Automation: 10 Minutes

## Sample Run

![Sample Run](5078775/docs/8165866/images/11377037)

## Dependencies

[https://file.provaltech.com/repo/script/Send-BitlockerADRecovery.ps1](https://file.provaltech.com/repo/script/Send-BitlockerADRecovery.ps1)

## Variables

| Variable        | Description                                                                                     |
|------------------|-------------------------------------------------------------------------------------------------|
| BaseURL          | It contains file server address                                                                  |
| WorkingDirectory  | It contains destination path where file server file is kept                                    |
| PS1URL           | This contains the file complete path in the file server for direct download                    |
| PS1Path          | This denotes the complete path where file is stored to local machine after downloading from file server |
| PS1TempPath      | This stores the downloaded file as a temporary to local system directory.                       |
| PS1Log           | This stores the complete powershell execution log.                                             |
| PS1DataLog       | This stores the powershell data log                                                             |
| PS1ErrorLog      | This stores the powershell error log.                                                          |

## Process

The script gathers information about existing Bitlocker volumes. It then loops through each volume and runs the `Backup-BitLockerKeyProtector` cmdlet against each encrypted drive. If the process fails, then the `-data.txt` file will have `FAIL` written to it and the `-error.txt` log file will be generated. Otherwise, `SUCCESS` will be written to the data log file.

Machine must be using Bitlocker for encryption.

## Output

- Script log


