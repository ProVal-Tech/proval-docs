---
id: ps-invoke-userlogout
title: 'Invoke-UserLogout'
title_meta: 'Invoke-UserLogout Command'
keywords: ['logout', 'user', 'session', 'windows']
description: 'Documentation for the Invoke-UserLogout command to log a specified user or users out of the system.'
tags: ['windows', 'security', 'configuration']
draft: false
unlisted: false
---
## Description
Logs a specified user(s) out of the system

## Requirements
Windows OS

## Usage
Uses Get-Process to check if a provided username or matching regex string is logged into the system, then logs out that user.



```powershell
    c:\> Invoke-UserLogout.ps1 -user john.doe
    C:\> Invoke-UserLogout.ps1 -regex '^PROVAL\' (Logs out members of the PROVAL domain)
```

## Parameters
| Parameter         | Alias | Required  | Default   | Type      | Description                               |
| ----------------- | ----- | --------- | --------- | --------- | ----------------------------------------- |
| `user      `      |       | False     |           | String    |  Searches for an explicit username        |
| `regex     `      |       | False     |           | String    |  Searches (loops) for a regex match       |

## Output
Location of output for log, result, and error files.

    .\Invoke-UserLogout-log.txt
    .\Invoke-UserLogout-data.txt
    .\Invoke-UserLogout-error.txt