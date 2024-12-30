---
id: ps-new-djoinfile
title: 'New-DJoinFile'
title_meta: 'New-DJoinFile Command'
keywords: ['djoin', 'offline', 'domain', 'join']
description: 'Documentation for the New-DJoinFile command to create a new Djoin file for an offline domain join.'
tags: ['active-directory', 'configuration', 'windows']
draft: false
unlisted: false
---
## Description
This Script creates a new Djoin file to accomplish an offline domain join.


## Requirements
The target of this script must be have the AD-Domain-Services windows feature.

## Usage
1. If the machine is not a domain controller log an error and exit.
2. Obtain the domain controller's domain name
3. Run the Djoin.exe command using the domain name and target.
4. If the expected file is missing log an error and return the results of the djoin.exe command.
5. If the expected file is founnd log the success and return the results of the djoin.exe command.



```powershell
.\New-DJoinFile.ps1 -TargetName Dev-Win10-2
```
Will create a file named Dev-Win10-2-OfflineJoin.txt file in the working directory of this script.

## Parameters
| Parameter         | Alias | Required  | Default   | Type      | Description                               |
| ----------------- | ----- | --------- | --------- | --------- | ----------------------------------------- |
| `TargetName`      |       | True      |           | String    | The name of the target computer to be joined to the domain.                                          |


## Output
Logs -

    .\New-DJoinFile-log.txt
    .\New-DJoinFile-error.txt

Console -

    Djoin.exe command results.
