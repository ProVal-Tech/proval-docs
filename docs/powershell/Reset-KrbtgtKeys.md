---
id: ps-reset-krbtgtkeys
title: 'Reset-KrbtgtKeys'
title_meta: 'Reset-KrbtgtKeys Command'
keywords: ['krbtgt', 'reset', 'active-directory', 'security']
description: 'Documentation for the Reset-KrbtgtKeys command to reset the KRBTGT Active Directory account password.'
tags: ['active-directory', 'security', 'windows']
draft: false
unlisted: false
---

## Description
Script used to reset the KRBTGT Active Directory account. Adapted from https://github.com/microsoft/New-KrbtgtKeys.ps1/blob/master/New-KrbtgtKeys.ps1

🚨 This script is provided "without warranty". 🚨

It is in essence a streamlined version of the adapted script to always run the live account reset with some modernization of the PowerShell mixed in.

Due to this, results are not guaranteed, and if at all possible should always be run manually and logins should be immediately tested.

🚨 *YOU HAVE BEEN WARNED* 🚨

## Requirements
- Must be run on an Active Directory server.
- PowerShell v5

## Usage
See https://github.com/microsoft/New-KrbtgtKeys.ps1 for detailed process information. This script will always run in "Mode 4".


Runs the process of resetting the KRBTGT account password.

```powershell
.\Reset-KrbtgtKeys.ps1
```

Runs the process of resetting the KRBTGT account password without actually resetting it. Recommended to be run and reviewed before running the live reset.

```powershell
.\Reset-KrbtgtKeys.ps1 -DryRun
```

## Parameters
| Parameter         | Alias | Required  | Default   | Type          | Description                               |
| ----------------- | ----- | --------- | --------- | ---------     | ----------------------------------------- |
| `DryRun`          |       | False     |           | Switch (Bool) | Use this switch to run the script up to and after resetting the KRBTGT account without actually resetting the password. |


## Output
Location of output for log, result, and error files.

    .\Reset-KrbtgtKeys-log.txt
    .\Reset-KrbtgtKeys-error.txt
