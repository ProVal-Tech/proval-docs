---
id: 'ae748a86-1683-4d69-9c96-17a6a8f79950'
slug: /ae748a86-1683-4d69-9c96-17a6a8f79950
title: 'Reset-KrbtgtKeys'
title_meta: 'Reset-KrbtgtKeys'
keywords: ['krbtgt', 'reset', 'active-directory', 'security']
description: 'Documentation for the Reset-KrbtgtKeys command to reset the KRBTGT Active Directory account password.'
tags: ['active-directory', 'security', 'windows']
draft: false
unlisted: false
---

## Description
This script is used to reset the KRBTGT Active Directory account. It is adapted from [New-KrbtgtKeys.ps1](https://github.com/microsoft/New-KrbtgtKeys.ps1/blob/master/New-KrbtgtKeys.ps1).

🚨 This script is provided "without warranty." 🚨

Essentially, it is a streamlined version of the adapted script that always runs the live account reset, with some modernization of PowerShell included.

Due to this, results are not guaranteed. If at all possible, it should always be run manually, and logins should be immediately tested.

🚨 *YOU HAVE BEEN WARNED* 🚨

## Requirements
- Must be run on an Active Directory server.
- PowerShell v5

## Usage
See [New-KrbtgtKeys.ps1](https://github.com/microsoft/New-KrbtgtKeys.ps1) for detailed process information. This script will always run in "Mode 4."

The script runs the process of resetting the KRBTGT account password.

```powershell
.\Reset-KrbtgtKeys.ps1
```

The script can also run the process of resetting the KRBTGT account password without actually resetting it. It is recommended to run this first and review the output before executing the live reset.

```powershell
.\Reset-KrbtgtKeys.ps1 -DryRun
```

## Parameters
| Parameter         | Alias | Required  | Default   | Type          | Description                               |
| ----------------- | ----- | --------- | --------- | -------------- | ----------------------------------------- |
| `DryRun`          |       | False     |           | Switch (Bool) | Use this switch to run the script up to and after resetting the KRBTGT account without actually resetting the password. |

## Output
The output for log, result, and error files will be located at:

```
.\Reset-KrbtgtKeys-log.txt
.\Reset-KrbtgtKeys-error.txt
```