---
id: ps-enable-tpm
title: 'Enable-TPM'
title_meta: 'Enable-TPM Command'
keywords: ['enable', 'tpm', 'provisioning', 'security']
description: 'Documentation for the Enable-TPM command to initialize and provision a Trusted Platform Module (TPM).'
tags: ['security', 'configuration', 'windows']
draft: false
unlisted: false
---
## Description
Initializes Tpm as a part of the provisioning process for a Trusted Platform Module (TPM).
Provisioning is the process of preparing a TPM to be used.

## Requirements
PowerShell v5
TPM Version 1.2 +

## Usage
If a TPM chip exists, then the script will validate that the chip is initialized. The chip will be initialized with the switches passed in the parameter if it is not already. If `-AllowRestart` was passed, then the computer will be shut down or rebooted based on the requirements of the TPM initialization.
If a TPM chip is not found, then the script will exit with an error.



Initializes TPM and restart/shutdown the machine if necessary.
```powershell
.\Enable-TPM.ps1 -AllowClear -AllowPhysicalPresence -AllowRestart
```
Initializes TPM and writes a warning log to restart the machine if necessary.
```powershell
.\Enable-TPM.ps1 -AllowClear -AllowPhysicalPresence
```
Initializes TPM without including a physical user at the next restart.
```powershell
.\Enable-TPM.ps1 -AllowClear 
```
Initializes TPM but will not let the provisioning process clear the TPM, even if necessary.
```powershell
.\Enable-TPM.ps1
```

## Parameters
| Parameter         | Alias | Required  | Default   | Type      | Description                               |
| ----------------- | ----- | --------- | --------- | --------- | ----------------------------------------- |
| `AllowClear`      | `a`   | False      |           | Switch    |Indicates that the provisioning process clears the TPM, if necessary, to move the TPM closer to complying with latest Windows standards.|
| `AllowPhysicalPresence`      | `b`   | False      |           | Switch       |Indicates that the provisioning process may send physical presence commands that require a user to be present in order to continue.|
| `AllowRestart`      | `c`   | False     |    | Switch    |Allow the script to automatically restart or shutdown the machine. This can happen on initialization of TPM.|

## Output
    .\Enable-TPM-log.txt
    .\Enable-TPM-data.txt
    .\Enable-TPM-error.txt

