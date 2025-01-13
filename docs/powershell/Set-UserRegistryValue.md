---
id: ps-set-userregistryvalue
title: 'Set-UserRegistryValue'
title_meta: 'Set-UserRegistryValue Command'
keywords: ['registry', 'user', 'configuration', 'windows']
description: 'Documentation for the Set-UserRegistryValue command to set specific registry values for all users.'
tags: ['configuration', 'windows']
draft: false
unlisted: false
---

## Description
Set specific registry values for all users

## Requirements
Just the parameters required by the script

## Usage
1. Find all user profiles' username, SID, and location of ntuser.dat files
2. Query against the hive for SIDs 
3. Loop through the hive loading the hive and setting the registry value at the path specified for they key specified if exists
4. If not exists create the registry value if force is specified
5. If not excluded load the default user hive and set the registry value at the path specified for the key specified if exists
6. If not exists create the registry value if force is specified
7. Write the Status' to the appropriate logs




```powershell
.\Set-UserRegistryValue.ps1 -Path "Somepath\somemorepath\etc" -KeyName "SomeKey" -Value "someValue" -PropertyType [selection] -ExcludeDefault -Force
```

## Parameters
| Parameter         | Alias | Required  | Default   | Type      | Description                               |
| ----------------- | ----- | --------- | --------- | --------- | ----------------------------------------- |
| `Path`            |       | True      |           | String    |     Holds the path following the SID and to the specified KEY  |
| `KeyName`         |       | True      |           | String    |     Holds the Name of the specific key                         |
| `ExcludeDefault`  |       | False     |           | Switch    |     Excludes the default account when querying values          |
| `Value`           |       | True      |           | String    |     This parameter holds the set value you want to set for the specific key.  |
| `PropertyType`    |       | True      |           | ValidateSet   |   This parameter holds the type of property you wish to set is a validate set.    |
| `Force`           |       | False     |           | Switch    |     Used to Force the creation of a registry entry if it doesn't exist    |


## Output
Location of output for log, result, and error files.

    .\Set-UserRegistryValue-log.txt
    .\Set-UserRegistryValue-ERROR.txt

