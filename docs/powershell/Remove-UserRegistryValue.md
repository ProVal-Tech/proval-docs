---
id: ps-remove-sentinelone
title: 'Remove-SentinelOne'
title_meta: 'Remove-SentinelOne Command'
keywords: ['remove', 'sentinelone', 'uninstall', 'security']
description: 'Documentation for the Remove-SentinelOne command to uninstall the SentinelOne agent from a Windows system.'
tags: ['uninstallation', 'security', 'windows']
draft: false
unlisted: false
---

## Description
Remove specific registry values for all users

## Requirements
Just the parameters required by the script

## Usage
1. Find all user profiles' username, SID, and location of ntuser.dat files
2. Query against the hive for SIDs 
3. Loop through the hive loading the hive and remove the registry value at the path specified for they key specified if exists
4. If not exists write to the log
5. If not excluded load the default user hive and Remove the registry value at the path specified for the key specified if exists
6. If not exists write to the log



Explanation of the usage of the below example.

```powershell
.\Remove-UserRegistryValue.ps1 -Path "path" -Keyname "keyname" -ExcludeDefault
```

## Parameters
| Parameter         | Alias | Required  | Default   | Type      | Description                               |
| ----------------- | ----- | --------- | --------- | --------- | ----------------------------------------- |
| `Path`             |       | True      |           | String    |  path following the SID and to the specified KEY   |
| `KeyName`          |       | True      |           | String     | Name of the specific key       |
| `ExcludeDefault` |         | False     |          | Switch    | excludes the default account when querying accounts |

## Output
Location of output for log, result, and error files.
    
    .\Remove-UserRegistryValue-log.txt
