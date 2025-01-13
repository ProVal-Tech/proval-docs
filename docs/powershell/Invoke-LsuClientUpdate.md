---
id: ps-invoke-lsuclientupdate
title: 'Invoke-LSUClientUpdate'
title_meta: 'Invoke-LSUClientUpdate Command'
keywords: ['lenovo', 'update', 'firmware', 'driver']
description: 'Documentation for the Invoke-LSUClientUpdate command to install applicable and silently installable updates on Lenovo machines.'
tags: ['update', 'software', 'windows']
draft: false
unlisted: false
---
## Description
This Script will utilize the LSU Client powershell module to install any updates that are both applicable and silently installable on any lenovo machine whose battery is currently not discharging.

## Requirements
PowerShell V5.

## Usage
1. If the manufacturer of the computer is not Lenovo specifically we exit the script.
2. If the battery is discharging we exit the script logging an error.
3. Using the LSU Client module we get all available and silently installable updates and save them.
4. We install all found updates with the LSU Client module.
5. We check the results of the attempted install, if the results are success log the success, if failure log the failure.
6. Return the results as an object.



```powershell
.\Invoke-LSUClientUpdate.ps1
```
Will attempt to install all available and silently installable package updates on the target.

## Output

    .\Invoke-LSUClientUpdate-log.txt
    .\Invoke-LSUClientUpdate-error.txt

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
        Title          : Synaptics UltraNav Driver - 10 (1809 or Later)/11(21H2 or Later)
        Type           : Driver
        Success        : True
        FailureReason  :
        PendingAction  : REBOOT_SUGGESTED
        ExitCode       : 3010
        StandardOutput :
        StandardError  :
        LogOutput      :
        Runtime        : 00:00:21.3074228       


