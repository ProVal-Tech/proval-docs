---
id: ps-set-userregistryvalue
title: 'Set-UserRegistryValue'
title_meta: 'Set-UserRegistryValue Command'
keywords: ['registry', 'user', 'configuration', 'windows']
description: 'Documentation for the Set-UserRegistryValue command to set specific registry values for all users.'
tags: ['windows']
draft: false
unlisted: false
---

## Description
Set specific registry values for all users.

## Requirements
Just the parameters required by the script.

## Usage
1. Find all user profiles' usernames, SIDs, and locations of `ntuser.dat` files.
2. Query against the hive for SIDs.
3. Loop through the hive, loading the hive and setting the registry value at the path specified for the key specified if it exists.
4. If it does not exist, create the registry value if `-Force` is specified.
5. If not excluded, load the default user hive and set the registry value at the path specified for the key specified if it exists.
6. If it does not exist, create the registry value if `-Force` is specified.
7. Write the status to the appropriate logs.

```powershell
.\Set-UserRegistryValue.ps1 -Path "Somepath\somemorepath\etc" -KeyName "SomeKey" -Value "someValue" -PropertyType [selection] -ExcludeDefault -Force
```

## Parameters
| Parameter         | Alias | Required  | Default   | Type         | Description                               |
| ----------------- | ----- | --------- | --------- | ------------ | ----------------------------------------- |
| `Path`            |       | True      |           | String       | Holds the path following the SID and to the specified key.  |
| `KeyName`        |       | True      |           | String       | Holds the name of the specific key.      |
| `ExcludeDefault`  |       | False     |           | Switch       | Excludes the default account when querying values.          |
| `Value`           |       | True      |           | String       | This parameter holds the value you want to set for the specific key.  |
| `PropertyType`    |       | True      |           | ValidateSet  | This parameter holds the type of property you wish to set as a validate set.    |
| `Force`           |       | False     |           | Switch       | Used to force the creation of a registry entry if it doesn't exist.    |

## Output
Location of output for log, result, and error files.

```
.\Set-UserRegistryValue-log.txt
.\Set-UserRegistryValue-ERROR.txt
```
