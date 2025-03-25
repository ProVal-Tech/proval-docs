---
id: '2e06791d-4084-4dc3-a524-7b54695c6fc9'
slug: /2e06791d-4084-4dc3-a524-7b54695c6fc9
title: 'Generic Registry Editor'
title_meta: 'Generic Registry Editor'
keywords: ['registry', 'keys', 'modify', 'create', 'windows']
description: 'This document provides a detailed overview of a script that enables users to create or modify multiple registry keys, including their names, values, and types. It includes sample runs, user parameters, output details, and frequently asked questions regarding registry properties.'
tags: ['security', 'setup', 'update', 'windows']
draft: false
unlisted: false
---

## Summary

This script will create or modify the registry for multiple keys, names, values, and types.

## Sample Run

![Sample Run](../../../static/img/Generic-Registry-Editor/image_1.png)

## Variables

| Name  | Description                                           |
|-------|-------------------------------------------------------|
| psout | Contains the status of whether the registry was set or not |

#### User Parameters

| Name                | Example                                                   | Required | Description                                                                                                                                                 |
|---------------------|-----------------------------------------------------------|----------|-------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Keys                | 'HKLM://SYSTEM//CurrentControlSet//Control', 'HKLM://SOFTWARE//Policies//Microsoft' | True     | The list of registry keys that need to be created or modified. It is required to put registry keys inside single quotes and separate them by commas.          |
| Names               | 'LsaCfgFlags', 'LsaCfgFlags'                              | True     | The list of names that need to be created or modified. It is required to put names inside single quotes and separate them by commas.                          |
| Values              | '0', '0'                                                 | True     | The list of values that need to be created or modified. It is required to put values inside single quotes and separate them by commas.                        |
| Types               | 'DWORD', 'STRING'                                       | True     | The list of types that need to be created or modified. It is required to put types inside single quotes and separate them by commas. The various types are: String, ExpandString, Binary, DWord, MultiString, QWord |

## Output

- Script log

## FAQ

1. What are the various property types and what do they stand for?  
   The various property types are: String, ExpandString, Binary, DWord, MultiString, QWord.  
   They stand for:  
   - String: Equivalent to REG_SZ in the Windows Registry.  
   - ExpandString: Equivalent to REG_EXPAND_SZ in the Windows Registry.  
   - Binary: Equivalent to REG_BINARY in the Windows Registry.  
   - DWord: Equivalent to REG_DWORD in the Windows Registry.  
   - MultiString: Equivalent to REG_MULTI_SZ in the Windows Registry.  
   - QWord: Equivalent to REG_QWORD in the Windows Registry.  

2. Does the length of the parameters need to be the same for the script to work?  
   Yes, the parameters must be of the same length.  
   For example: If you provide two keys for modification, you must also provide two names, two values, and two types, regardless of whether any of the parameters have the same value or not.


