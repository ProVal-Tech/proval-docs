---
id: '6f73dc4e-4ded-4cbb-a62d-7a98e485764b'
title: 'Invoke-UserLogout'
title_meta: 'Invoke-UserLogout'
keywords: ['logout', 'user', 'session', 'windows']
description: 'Documentation for the Invoke-UserLogout command to log a specified user or users out of the system.'
tags: ['security', 'windows']
draft: false
unlisted: false
---

## Description
Logs a specified user(s) out of the system.

## Requirements
- Windows OS

## Usage
Uses `Get-Process` to check if a provided username or matching regex string is logged into the system, then logs out that user.

```powershell
C:> Invoke-UserLogout.ps1 -user john.doe
C:> Invoke-UserLogout.ps1 -regex '^PROVAL\\'  # Logs out members of the PROVAL domain
```

## Parameters
| Parameter         | Alias | Required  | Default   | Type      | Description                               |
| ----------------- | ----- | --------- | --------- | --------- | ----------------------------------------- |
| `user`            |       | False     |           | String    | Searches for an explicit username        |
| `regex`           |       | False     |           | String    | Searches (loops) for a regex match       |

## Output
Location of output for log, result, and error files.

- `.\Invoke-UserLogout-log.txt`
- `.\Invoke-UserLogout-data.txt`
- `.\Invoke-UserLogout-error.txt`


