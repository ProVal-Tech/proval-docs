---
id: ps-set-servicelogin
title: 'Set-ServiceLogin'
title_meta: 'Set-ServiceLogin'
keywords: ['service', 'login', 'account', 'change']
description: 'Documentation for the Set-ServiceLogin command to change the service login account for a target service.'
tags: ['security', 'windows']
draft: false
unlisted: false
---

## Description
Used to change the service login account for a target service.

## Requirements
PowerShell v5

## Usage
The script has two primary modes: **User** and **System**. User mode is denoted by passing the `-User` and `-Pass` parameters. System mode is denoted by passing the `-System` switch.

### User Mode
1. If the `-Force` switch is applied, the script will attempt to grant the user denoted by the `-User` parameter the **Logon as a Service** right via `secedit`.
2. The service will then be edited via the `Change()` function of the `win32_service` class.
    - If the service fails to be changed, the error code will be translated to a message, and the `-error.txt` log will be generated with that message before the script exits.
3. The script will then attempt to restart the service.
    - If the service fails to restart, the error code will be translated to a message, and the `-error.txt` log will be generated with that message before the script exits.

### System Mode
1. The service will be edited via the `Change()` function of the `win32_service` class.
    - If the service fails to be changed, the error code will be translated to a message, and the `-error.txt` log will be generated with that message before the script exits.
2. The script will then attempt to restart the service.
    - If the service fails to restart, the error code will be translated to a message, and the `-error.txt` log will be generated with that message before the script exits.

### Examples
Sets the Print Spooler service to run as User1.

```powershell
.\\Set-ServiceLogin.ps1 -DisplayName "Print Spooler" -User "User1" -Pass "p@55w0rD"
```

Sets the Print Spooler service to run as User1 and grants User1 the Logon as a Service right.

```powershell
.\\Set-ServiceLogin.ps1 -Name Spooler -User "User1" -Pass "p@55w0rD" -Force
```

Sets the Print Spooler service to run as 'Local System'.

```powershell
.\\Set-ServiceLogin.ps1 -Name Spooler -System
```

## Parameters
| Parameter         | Required  | Default   | Type          | Description                               |
| ----------------- | --------- | --------- | ------------- | ----------------------------------------- |
| `--Name`          | True      |           | String        | ParamSet=Name,NameSystem - The service name to alter. |
| `--DisplayName`   | True      |           | String        | ParamSet=DisplayName,DisplayNameSystem - The service display name to alter. |
| `--User`          | True      |           | String        | ParamSet=Name,DisplayName - The username of the account to set the service to run as. |
| `--Pass`          | True      |           | String        | ParamSet=Name,DisplayName - The password of the account to set the service to run as. |
| `--System`        | True      |           | Switch (Bool) | ParamSet=NameSystem,DisplayNameSystem - Use this switch to set the service to run as the Local System account. |
| `--Force`         | False     | `False`   | Switch (Bool) | ParamSet=Name,DisplayName - Used with the -User and -Pass parameters. Grants Logon as a Service rights to the user. |

## Output
Location of output for log, result, and error files.

```
.\\Set-ServiceLogin-log.txt
.\\Set-ServiceLogin-data.txt
.\\Set-ServiceLogin-error.txt
```



