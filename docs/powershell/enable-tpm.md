---
id: 'cc838fb3-1ff7-4bbd-90b3-48e7fd4afd61'
slug: /cc838fb3-1ff7-4bbd-90b3-48e7fd4afd61
title: 'Enable-TPM'
title_meta: 'Enable-TPM'
keywords: ['enable', 'tpm', 'provisioning', 'security']
description: 'Documentation for the Enable-TPM command to initialize and provision a Trusted Platform Module (TPM).'
tags: ['security', 'windows']
draft: false
unlisted: false
---

## Description
Initializes TPM as a part of the provisioning process for a Trusted Platform Module (TPM). Provisioning is the process of preparing a TPM for use.

## Requirements
- PowerShell v5
- TPM Version 1.2 or higher

## Usage
If a TPM chip exists, the script will validate that the chip is initialized. The chip will be initialized with the switches passed in the parameters if it is not already. If `-AllowRestart` is passed, the computer will be shut down or rebooted based on the requirements of the TPM initialization. If a TPM chip is not found, the script will exit with an error.

### Examples
Initializes TPM and restarts/shuts down the machine if necessary.
```powershell
.\Enable-TPM.ps1 -AllowClear -AllowPhysicalPresence -AllowRestart
```

Initializes TPM and writes a warning log to restart the machine if necessary.
```powershell
.\Enable-TPM.ps1 -AllowClear -AllowPhysicalPresence
```

Initializes TPM without requiring a physical user at the next restart.
```powershell
.\Enable-TPM.ps1 -AllowClear
```

Initializes TPM but does not allow the provisioning process to clear the TPM, even if necessary.
```powershell
.\Enable-TPM.ps1
```

## Parameters
| Parameter                     | Alias | Required | Default | Type   | Description                                                                                             |
| ----------------------------- | ----- | -------- | ------- | ------ | ------------------------------------------------------------------------------------------------------- |
| `AllowClear`                  | `a`   | False    |         | Switch | Indicates that the provisioning process clears the TPM, if necessary, to move the TPM closer to complying with the latest Windows standards. |
| `AllowPhysicalPresence`       | `b`   | False    |         | Switch | Indicates that the provisioning process may send physical presence commands that require a user to be present in order to continue. |
| `AllowRestart`                | `c`   | False    |         | Switch | Allows the script to automatically restart or shut down the machine. This can happen during the initialization of TPM. |

## Output
- `.\Enable-TPM-log.txt`
- `.\Enable-TPM-data.txt`
- `.\Enable-TPM-error.txt`
