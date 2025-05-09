---
id: 'a556909a-ff2f-489f-ab3a-6e928722c09c'
slug: /a556909a-ff2f-489f-ab3a-6e928722c09c
title: 'Rename-Machine'
title_meta: 'Rename-Machine'
keywords: ['Rename', 'Windows']
description: 'The script will first check if the machine is domain joined or not. If it is, then it will attempt to create a PSCredential object to pass into the Rename-Computer cmdlet. This will use the Username and Password parameters. It then attempts the rename of the computer and stores the success status in $computerChangeInfo. Success and failure information is stored in the respective log files. This script does not currently automatically reboot the machine, however this will be required to complete the renaming process.'
tags: ['windows']
draft: false
unlisted: false
---

## Description
The script will first check if the machine is domain joined or not. If it is, then it will attempt to create a PSCredential object to pass into the Rename-Computer cmdlet. This will use the Username and Password parameters. It then attempts the rename of the computer and stores the success status in $computerChangeInfo. Success and failure information is stored in the respective log files. This script does not currently automatically reboot the machine, however this will be required to complete the renaming process.

## Requirements
- PowerShell v5 (will auto-update and require a reboot)

## Usage
The script needs the newname and the domain credential (only needed in case of domain machine rename).

```powershell
.\Rename-Machine.ps1 -Username 'DOMAIN\domainadmin' -Password 'P@ssword1234!' -NewName "MACHINE223"
```

## Parameters
| Parameter | Alias | Required | Default | Type   | Description                                                                                          |
| --------- | ----- | -------- | ------- | ------ | ---------------------------------------------------------------------------------------------------- |
| NewName   |       | True     |         | String | The new name to set for the machine.                                                                 |
| Username  |       | False    |         | String | The username for authenticating with a domain. Will be ignored if the computer is not domain joined. |
| Password  |       | False    |         | String | The password for authenticating with a domain. Will be ignored if the computer is not domain joined. |


## Output
- .\Rename-Machine-Log.txt
- .\Rename-Machine-error.txt
- .\Rename-Machine-data.txt