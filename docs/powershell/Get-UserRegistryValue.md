---
id: ps-get-userregistryvalue
title: 'Get-UserRegistryValue'
title_meta: 'Get-UserRegistryValue Command'
keywords: ['registry', 'user', 'key', 'value']
description: 'Documentation for the Get-UserRegistryValue command to obtain specific registry values for all users.'
tags: ['configuration', 'windows', 'security']
draft: false
unlisted: false
---
## Description
Obtain specific registry values for all users

## Requirements
Just the parameters required by the script

## Usage
1. Find all user profiles' username, SID, and location of ntuser.dat files
2. Query against the hive for SIDs 
3. Loop through the hive loading the hive and reading the registry value at the path specified for they key specified
4. Add the key information to a system object
5. If not excluded load the default user hive and add that to the system object
6. Return the system object
7. Write the system object to the log




```powershell
.\Get-UserRegistryValue.ps1 -Path "Somepath\somemorepath\etc" -KeyName "SomeKey" -ExcludeDefault
```

## Parameters
| Parameter         | Alias | Required  | Default   | Type      | Description                               |
| ----------------- | ----- | --------- | --------- | --------- | ----------------------------------------- |
| `Path`            |       | True      |           | String    |     Holds the path following the SID and to the specified KEY  |
| `KeyName`         |       | True      |           | String    |     Holds the Name of the specific key                         |
| `ExcludeDefault`  |       | False     |           | Switch    |     Excludes the default account when querying values          |


## Output
Location of output for log, result, and error files.

    .\Get-UserRegistryValue-log.txt