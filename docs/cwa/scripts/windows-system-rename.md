---
id: '124b3fc7-6ae4-4fd7-821b-58d6a02006d1'
slug: /124b3fc7-6ae4-4fd7-821b-58d6a02006d1
title: 'Windows - System - Rename'
title_meta: 'Windows - System - Rename'
keywords:  ['Rename', 'Windows']
description: 'This script can be used to rename a windows machine. '
tags: ['windows']
draft: False
unlisted: false
---

## Summary
This script can be used to rename a windows machine. It does not automatically reboots the machine, reboot will be required to complete the renaming process.

## Files Hash

**Potential File Name:** `C:\ProgramData\_Automation\Script\Rename-Machine\Rename-Machine-AI.ps1`  
**File Hash (Sha256):** `C69B89A5074434D326D84F46279110F44D018BA493BEF0486B45D7F9C6784B83`  
**File Hash (MD5):** `DDFAF9C7518B651C6A352AD63610DBCD`  

## Dependencies
- [Rename-Machine](/docs/a556909a-ff2f-489f-ab3a-6e928722c09c)

## Sample Run

`DomainPasswordTitle` to be used from:

![Sample Run](<../../../static/img/docs/124b3fc7-6ae4-4fd7-821b-58d6a02006d1/image1.webp>)

Fill in the `NewName` and `DomainPasswordTitle` while running the script:

![Sample Run](<../../../static/img/docs/124b3fc7-6ae4-4fd7-821b-58d6a02006d1/image2.webp>)


#### User Parameters

| Name        | Example   | Required | Description  |
|-------------|------------|----------|---------------|
| NewName   | COMPUTER2  | True     | The new name to set on the target machine.    |
| DomainPasswordTitle    | Domain Admin Account   | False | The title of the password entry to use for the username and password for domain authentication. The password entry must be under the same Client as the target machine.        |


## Output

- Script Logs