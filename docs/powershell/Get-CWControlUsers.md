---
id: ps-get-cwcontrolusers
title: 'Get-CWControlUsers'
title_meta: 'Get-CWControlUsers Command'
keywords: ['connectwise', 'control', 'users', 'properties']
description: 'Documentation for the Get-CWControlUsers command to return a list of users and their respective properties on the ConnectWise Control server.'
tags: ['configuration', 'software', 'report']
draft: false
unlisted: false
---
## Description
This Script is intended to run on the Control Server. It will return a list of users and their respective properties.

## Requirements
This must be run on the Control Server.
Returns all users and their respective properties for the ConnectWise Control server.

## Usage
1. A user object is configured.
2. Determines the location of the desired xml file that holds this information.
3. Creates a new users object using the data from the xml.
4. Outputs the results.



```powershell
.\Get-CWControlUsers.ps1
```
Returns all users and their respective properties for the ConnectWise Control server.

| Object Property       | Type     |
| --------------------- | -------- |
| `Name`                | String   |
| `DisplayName`         | String   |
| `Email`               | String   |
| `Comment`             | String   |
| `CreationDate`        | DateTime |
| `LastActivityDate`    | DateTime |
| `LastLockoutDate`     | DateTime |
| `LastPasswordChangedDate` | DateTime  |
| `PasswordAttemptWindowStartTime`  | DateTime |
| `InvalidPasswordWindowAttemptCount`  | Int   |
| `InvalidPasswordAbsoluteAttemptCount`  | Int   |
| `PasswordQuestion`    | String   |
| `Roles`               | String[] |
| `PasswordHashHistory` | String[] |
| `IsApproved`          | Bool     |
| `IsLockedOut`         | Bool     |

## Output
    System Object
    .\Get-CWControlUsers-Log.txt
    .\Get-CWControlUsers.txt




