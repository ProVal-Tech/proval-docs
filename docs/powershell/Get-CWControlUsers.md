---
id: '29210a5a-f967-488d-992d-e7e8b59c0a15'
title: 'Get-CWControlUsers'
title_meta: 'Get-CWControlUsers'
keywords: ['connectwise', 'control', 'users', 'properties']
description: 'Documentation for the Get-CWControlUsers command to return a list of users and their respective properties on the ConnectWise Control server.'
tags: ['report', 'software']
draft: false
unlisted: false
---

## Description
This script is intended to run on the Control Server. It will return a list of users and their respective properties.

## Requirements
This script must be run on the Control Server. It returns all users and their respective properties for the ConnectWise Control server.

## Usage
1. A user object is configured.
2. The location of the desired XML file that holds this information is determined.
3. A new users object is created using the data from the XML.
4. The results are outputted.

```powershell
.\Get-CWControlUsers.ps1
```
This command returns all users and their respective properties for the ConnectWise Control server.

| Object Property                       | Type     |
| ------------------------------------- | -------- |
| `Name`                                | String   |
| `DisplayName`                         | String   |
| `Email`                               | String   |
| `Comment`                             | String   |
| `CreationDate`                        | DateTime |
| `LastActivityDate`                   | DateTime |
| `LastLockoutDate`                    | DateTime |
| `LastPasswordChangedDate`            | DateTime |
| `PasswordAttemptWindowStartTime`     | DateTime |
| `InvalidPasswordWindowAttemptCount`   | Int      |
| `InvalidPasswordAbsoluteAttemptCount` | Int      |
| `PasswordQuestion`                    | String   |
| `Roles`                               | String[] |
| `PasswordHashHistory`                 | String[] |
| `IsApproved`                          | Bool     |
| `IsLockedOut`                         | Bool     |

## Output
- System Object
- `.\Get-CWControlUsers-Log.txt`
- `.\Get-CWControlUsers.txt`



