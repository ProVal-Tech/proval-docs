---
id: '3c0d8537-9331-4623-90a0-8d2f724d19af'
title: 'Rebuild WMI Repository Script'
title_meta: 'Rebuild WMI Repository Script for Windows'
keywords: ['wmi', 'repository', 'windows', 'repair', 'service']
description: 'This document provides an overview of a PowerShell script designed to rebuild the WMI repository, including its requirements, process, usage, and parameters. The script ensures proper handling of user permissions and service states while attempting repairs on the WMI service.'
tags: ['windows', 'service', 'repair', 'configuration', 'security']
draft: false
unlisted: false
---
## Overview

This script will attempt to rebuild the WMI repository.

This script will stop at any success state unless a ForceAsUser accepts responsibility to proceed upon success by providing a `$ForceAsUser` name.  
UnAllowed `$ForceAsUsers`: `System, admin, administrator, TrustedInstaller`

## Requirements

PowerShell V.5

## Process

1. If the `-ResolveUserForcedCorruption` switch is applied, fix the issue and exit.
2. If the Running User is UnAllowed, error and exit.
3. If the Winmgmt service doesn't exist
   - No RunningUser - Error and Exit.
   - RunningUser - Error and Exit (I don't know what to do here)
4. Get the Winmgmt service state
   - Running
     - No RunningUser - Error and Exit
     - RunningUser - Restart Winmgmt and IP Helper services
   - Not Running
     - Start the winmgmt service
       - won't start
         - Change the service config type to own
         - Start the service.
     - Start the IP Helper Service.
5. Get the output of a simple WMI query
   - Fails
     - Log error and exit
   - Success
     - Log Success and exit
6. RepairType Switch
   - Basic
     - Check Consistency
       - Consistent
         - No RunningUser
           - ERROR and exit.
         - Running User Continue.
       - Not Consistent Continue
     - Restart winmgmt service.
   - Intermediate
     - Disable and stop winmgmt service
     - register `scecli.dll`
     - register `userenv.dll`
     - register all `.dll` files in `"$env:windir\system32\wbem"`
     - check for 32 bit OS
       - 32 bit
         - Action WMI Provider Host: Regserver option
         - Enable and start winmgmt service.
         - Start winmgmt service.
         - Re-compile MOF and MFL files from `"$env:windir\system32\wbem"`
       - 64 bit
         - Re-compile MOF and MFL files from `"$env:windir\system32\wbem"`
         - Register all `.dll` files in `"$env:windir\SysWOW64\wbem"`
         - Action WMI Provider Host: Regserver option
         - Enable and start winmgmt service.
         - Start winmgmt service.
         - Re-compile MOF and MFL files from `"$env:windir\SysWOW64\wbem"`
   - Advanced
     - Salvage Repository
     - Check Repository consistency
       - Consistent
         - Check for running user
           - Not present - exit
           - present - continue
       - Not Consistent
         - Reset Repository
         - Check Repository Consistency
           - Consistent
           - Check for running user
             - Not present - Exit
             - Present - Continue
     - Disable and stop the winmgmt Service
     - Reset the repository
     - Resync the repository
     - Backup the repository
     - Run the intermediate steps
     - Restart and enable all services
     - Run `WmiPrvSE.exe /regserver`
7. Test for consistency
   - Consistent - Exit with log
   - Not Consistent - Exit with error.

## Payload Usage

```powershell
.\Redo-WMIRepository.ps1
```
Runs a basic repair that includes Checking WMI Consistency and restarting the wmi service if not.

```powershell
.\Redo-WMIRepository.ps1 -ResolveUserForcedCorruption
```
Fixes an issue where this script was run on a target machine where the wmi repository was not corrupted and this script was passed the `-RepairLevel` of Advanced and the `-ForceAsUser` was set.

```powershell
.\Redo-WMIRepository.ps1 -ForceAsUser 'CCalverley'
```
Runs a basic repair bypassing the Checking WMI Consistency step and restarting the wmi service.

```powershell
.\Redo-WMIRepository.ps1 -RepairType Intermediate
```
Verification action will take place and if the service is running, or the DATA file is smaller than 1 GB etc., the script will stop because the `$ForceAsUser` parameter is not set. Runs an intermediate repair, disables and stops the winmgmt service, re-registers all dll's, and re-compiles the MOF, and MFL files, and enables and starts the service.

```powershell
.\Redo-WMIRepository.ps1 -RepairType Intermediate -ForceAsUser 'CCalverley'
```
This bypasses all initial checks and forces the intermediate repair regardless of service state or DATA file size. Runs an intermediate repair, disables and stops the winmgmt service, re-registers all dll's, and re-compiles the MOF, and MFL files, and enables and starts the service.

```powershell
.\Redo-WMIRepository.ps1 -RepairType Advanced -ForceAsUser 'CCalverley'
```
This bypasses all initial checks and forces the intermediate repair regardless of service state or DATA file size. Salvages, and resets the repository, if necessary re-registers DLLs, re-compiles MOF and MLF files, restarts the service.

### Parameters

| Parameter                          | Alias | Required | Default | Type   | Description                                                                                     |
|------------------------------------|-------|----------|---------|--------|-------------------------------------------------------------------------------------------------|
| `-ForceAsUser`                     |       | False    |         | String | To bypass all safety stops in this script use the ForceAsUser parameter followed by your name |
| `-RepairLevel`                     |       | False    | Basic   | String | Validate Set of Basic, Intermediate, and Advanced.                                            |
| `-ResolveUserForcedCorruption`     |       | False    |         | Switch | ONLY TO BE USED IF THE WARNING IN THE NOTES SECTION OF THIS HELP DOCUMENT WAS DONE. Executes the steps to resolve the issue if you ran the Advanced level rebuild with the ForceAsUser parameter set. |

## Output

```
.\Redo-WMIRepository-log.txt
.\Redo-WMIRepository-error.txt
```

## Locations

| Payload                          | /repo/script/Redo-WMIRepository.ps1 |
|----------------------------------|--------------------------------------|
| Automate                         |                                      |
| ConnectWise RMM                  |                                      |
| Kaseya                           |                                      |
| Datto RMM                        |                                      |





