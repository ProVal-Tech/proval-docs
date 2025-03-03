---
id: '63815cdf-e2a3-4ef9-9dc7-0001ba86ca0b'
title: 'Remove-UserRegistryValue'
title_meta: 'Remove-UserRegistryValue'
keywords: ['remove', 'registry', 'user', 'key']
description: 'Documentation for the Remove-UserRegistryValue command to remove specific registry values for all users.'
tags: ['security', 'windows']
draft: false
unlisted: false
---

## Description
Remove specific registry values for all users.

## Requirements
Only the parameters required by the script.

## Usage
1. Find all user profiles' usernames, SIDs, and locations of `ntuser.dat` files.
2. Query against the hive for SIDs.
3. Loop through the hive, loading it and removing the registry value at the specified path for the specified key if it exists.
4. If it does not exist, write to the log.
5. If not excluded, load the default user hive and remove the registry value at the specified path for the specified key if it exists.
6. If it does not exist, write to the log.

### Example
Explanation of the usage of the below example:

```powershell
.\Remove-UserRegistryValue.ps1 -Path "path" -Keyname "keyname" -ExcludeDefault
```

## Parameters
| Parameter        | Alias | Required | Default | Type   | Description                                           |
|------------------|-------|----------|---------|--------|-------------------------------------------------------|
| `Path`           |       | True     |         | String | Path following the SID to the specified key.         |
| `KeyName`        |       | True     |         | String | Name of the specific key.                             |
| `ExcludeDefault` |       | False    |         | Switch | Excludes the default account when querying accounts.  |

## Output
Location of output for log, result, and error files.

```
.\Remove-UserRegistryValue-log.txt
```



