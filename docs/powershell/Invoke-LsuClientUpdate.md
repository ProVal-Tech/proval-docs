---
id: 'da759e59-6f62-476d-a776-39b09e07ffbe'
title: 'Invoke-LsuClientUpdate'
title_meta: 'Invoke-LsuClientUpdate'
keywords: ['lenovo', 'update', 'firmware', 'driver']
description: 'Documentation for the Invoke-LSUClientUpdate command to install applicable and silently installable updates on Lenovo machines.'
tags: ['software', 'update', 'windows']
draft: false
unlisted: false
---

## Description
This script utilizes the LSU Client PowerShell module to install any updates that are both applicable and silently installable on any Lenovo machine whose battery is currently not discharging.

## Requirements
PowerShell V5.

## Usage
1. If the manufacturer of the computer is not specifically Lenovo, exit the script.
2. If the battery is discharging, exit the script and log an error.
3. Using the LSU Client module, retrieve all available and silently installable updates and save them.
4. Install all found updates with the LSU Client module.
5. Check the results of the attempted install. If the results are successful, log the success; if there is a failure, log the failure.
6. Return the results as an object.

```powershell
.\Invoke-LSUClientUpdate.ps1
```
This command will attempt to install all available and silently installable package updates on the target.

## Output

- `.\Invoke-LSUClientUpdate-log.txt`
- `.\Invoke-LSUClientUpdate-error.txt`

### Example Output

```plaintext
[System.Object]:
    ID             : n2tbr05w
    Title          : Lenovo Battery Firmware Update Utility - 10 (1709 or Later)/11 (21H2 or Later)
    Type           : Firmware
    Success        : False
    FailureReason  : INSTALLER_EXITCODE
    PendingAction  : NONE
    ExitCode       : -3
    StandardOutput :
    StandardError  :
    LogOutput      :
    Runtime        : 00:00:00.5681666

    ID             : r1mst13w
    Title          : Synaptics UltraNav Driver - 10 (1809 or Later)/11 (21H2 or Later)
    Type           : Driver
    Success        : True
    FailureReason  :
    PendingAction  : REBOOT_SUGGESTED
    ExitCode       : 3010
    StandardOutput :
    StandardError  :
    LogOutput      :
    Runtime        : 00:00:21.3074228
```



