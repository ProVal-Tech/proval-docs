---
id: '3c0d8537-9331-4623-90a0-8d2f724d19af'
slug: /3c0d8537-9331-4623-90a0-8d2f724d19af
title: 'Get-DCDiagReport.ps1'
title_meta: 'Get-DCDiagReport.ps1'
keywords: ['wmi', 'repository', 'windows', 'repair', 'service']
description: 'This document provides an overview of a PowerShell script designed to rebuild the WMI repository, including its requirements, process, usage, and parameters. The script ensures proper handling of user permissions and service states while attempting repairs on the WMI service.'
tags: ['security', 'windows']
draft: false
unlisted: false
---

## Overview

This script attempts to rebuild the WMI repository.

The script will stop at any success state unless a `ForceAsUser` accepts responsibility to proceed upon success by providing a `$ForceAsUser` name.  
Unallowed `$ForceAsUsers`: `System`, `admin`, `administrator`, `TrustedInstaller`

## Requirements

- PowerShell V.5

## Process

1. If the `-ResolveUserForcedCorruption` switch is applied, fix the issue and exit.
2. If the Running User is unallowed, error and exit.
3. If the Winmgmt service doesn't exist:
   - No Running User - Error and exit.
   - Running User - Error and exit (I don't know what to do here).
4. Get the Winmgmt service state:
   - Running:
     - No Running User - Error and exit.
     - Running User - Restart Winmgmt and IP Helper services.
   - Not Running:
     - Start the Winmgmt service:
       - If it won't start:
         - Change the service config type to own.
         - Start the service.
     - Start the IP Helper Service.
5. Get the output of a simple WMI query:
   - Fails:
     - Log error and exit.
   - Success:
     - Log success and exit.
6. RepairType Switch:
   - Basic:
     - Check consistency:
       - Consistent:
         - No Running User:
           - ERROR and exit.
         - Running User - Continue.
       - Not Consistent - Continue.
     - Restart Winmgmt service.
   - Intermediate:
     - Disable and stop Winmgmt service.
     - Register `scecli.dll`.
     - Register `userenv.dll`.
     - Register all `.dll` files in `"$env:windir\\system32\\wbem"`.
     - Check for 32-bit OS:
       - 32-bit:
         - Action WMI Provider Host: Regserver option.
         - Enable and start Winmgmt service.
         - Start Winmgmt service.
         - Recompile MOF and MFL files from `"$env:windir\\system32\\wbem"`.
       - 64-bit:
         - Recompile MOF and MFL files from `"$env:windir\\system32\\wbem"`.
         - Register all `.dll` files in `"$env:windir\\SysWOW64\\wbem"`.
         - Action WMI Provider Host: Regserver option.
         - Enable and start Winmgmt service.
         - Start Winmgmt service.
         - Recompile MOF and MFL files from `"$env:windir\\SysWOW64\\wbem"`.
   - Advanced:
     - Salvage repository.
     - Check repository consistency:
       - Consistent:
         - Check for running user:
           - Not present - exit.
           - Present - continue.
       - Not Consistent:
         - Reset repository.
         - Check repository consistency:
           - Consistent:
             - Check for running user:
               - Not present - exit.
               - Present - continue.
     - Disable and stop the Winmgmt service.
     - Reset the repository.
     - Resync the repository.
     - Backup the repository.
     - Run the intermediate steps.
     - Restart and enable all services.
     - Run `WmiPrvSE.exe /regserver`.
7. Test for consistency:
   - Consistent - Exit with log.
   - Not Consistent - Exit with error.

## Payload Usage

```powershell
.\\Redo-WMIRepository.ps1
```
Runs a basic repair that includes checking WMI consistency and restarting the WMI service if it's not running.

```powershell
.\\Redo-WMIRepository.ps1 -ResolveUserForcedCorruption
```
Fixes an issue where this script was run on a target machine where the WMI repository was not corrupted, and this script was passed the `-RepairLevel` of Advanced with the `-ForceAsUser` set.

```powershell
.\\Redo-WMIRepository.ps1 -ForceAsUser 'CCalverley'
```
Runs a basic repair, bypassing the checking WMI consistency step and restarting the WMI service.

```powershell
.\\Redo-WMIRepository.ps1 -RepairType Intermediate
```
Verification action will take place, and if the service is running, or the DATA file is smaller than 1 GB, etc., the script will stop because the `$ForceAsUser` parameter is not set. Runs an intermediate repair, disables and stops the Winmgmt service, re-registers all DLLs, recompiles the MOF and MFL files, and enables and starts the service.

```powershell
.\\Redo-WMIRepository.ps1 -RepairType Intermediate -ForceAsUser 'CCalverley'
```
This bypasses all initial checks and forces the intermediate repair regardless of service state or DATA file size. Runs an intermediate repair, disables and stops the Winmgmt service, re-registers all DLLs, recompiles the MOF and MFL files, and enables and starts the service.

```powershell
.\\Redo-WMIRepository.ps1 -RepairType Advanced -ForceAsUser 'CCalverley'
```
This bypasses all initial checks and forces the advanced repair regardless of service state or DATA file size. Salvages and resets the repository, if necessary re-registers DLLs, recompiles MOF and MFL files, and restarts the service.

### Parameters

| Parameter                          | Alias | Required | Default | Type   | Description                                                                                     |
|------------------------------------|-------|----------|---------|--------|-------------------------------------------------------------------------------------------------|
| `-ForceAsUser`                     |       | False    |         | String | To bypass all safety stops in this script, use the ForceAsUser parameter followed by your name. |
| `-RepairLevel`                     |       | False    | Basic   | String | Validate set of Basic, Intermediate, and Advanced.                                            |
| `-ResolveUserForcedCorruption`     |       | False    |         | Switch | ONLY TO BE USED IF THE WARNING IN THE NOTES SECTION OF THIS HELP DOCUMENT WAS DONE. Executes the steps to resolve the issue if you ran the Advanced level rebuild with the ForceAsUser parameter set. |

## Output

```
.\\Redo-WMIRepository-log.txt
.\\Redo-WMIRepository-error.txt
```

## Locations

| Payload                          | /repo/script/Redo-WMIRepository.ps1 |
|----------------------------------|--------------------------------------|
| Automate                         |                                      |
| ConnectWise RMM                  |                                      |
| Kaseya                           |                                      |
| Datto RMM                        |                                      |


