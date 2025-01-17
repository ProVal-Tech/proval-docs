---
id: ps-remove-bitdefenderendpointsecurity
title: 'Remove-BitDefenderEndpointSecurity'
title_meta: 'Remove-BitDefenderEndpointSecurity Command'
keywords: ['remove', 'bitdefender', 'security', 'cleanup']
description: 'Documentation for the Remove-BitDefenderEndpointSecurity command to remove all Bitdefender Endpoint Security products from an endpoint.'
tags: ['security', 'uninstallation']
draft: false
unlisted: false
---
## Description
Removes all BitdefenderEndpointSecurity products from an endpoint.

## Requirements
Availability of vendor removal tool: https://download.bitdefender.com/SMB/Hydra/release/bst_win/uninstallTool/BEST_uninstallTool.exe

## Usage
    1. The script first checks if Bitdefender Endpoint Security is present on the endpoint by looking for related services, directories, and registry keys.
    2. If the machine is booted into safe mode, the script attempts to clear the Bitdefender Key and UninstallLink from the registry and then restarts the endpoint back to normal.
    3. If a white-labeled Bitdefender installation (Managed Antivirus) is detected, the script attempts to uninstall it using the uninstaller in this folder. If successful, the script removes any leftover directories and exits.
    4. If the white-labeled uninstaller is not found or fails to remove Bitdefender, the script proceeds to download the BEST (Bitdefender Endpoint Security Tools) Uninstall Tool from the specified URL.
    5. The script checks for the presence of a Bitdefender uninstall key in the registry. If found, it logs relevant information and compares it with the provided key (if any). If the keys don't match, a warning is logged.
The script constructs the command-line arguments for the vendor removal tool based on the provided parameters (-Key and -Destructive) and executes the tool.
If Bitdefender is still detected after running the vendor removal tool, the script gathers relevant trace information from the tool's log file and logs it for further analysis.
Finally, the script logs the overall result of the removal process, indicating whether Bitdefender was successfully removed or if further action is required.


```powershell
.\Remove-BitdefenderEndpointSecurity.ps1
```
    Removes all Bitdefender Endpoint Security from an endpoint.
```powershell
.\Remove-BitdefenderEndpointSecurity.ps1 -Key 'VALUE'
```
    Removes all Bitdefender Endpoint Security from an endpoint using the provided key.
```powershell
.\Remove-BitdefenderEndpointSecurity.ps1 -Destructive
```
    Removes all Bitdefender Endpoint Security from an endpoint when BEST cannot be detected by the endpoint.

## Parameters

| Parameter         | Alias | Required  | Default   | Type      | Description                               |
| ----------------- | ----- | --------- | --------- | --------- | ----------------------------------------- |
| `Key`             |       | False     |           | String    | This parameter allows you to enter an uninstall password/key in plaintext or encoded in base64 UTF-8.  |
| `Destructive`     |       | False     |           | Switch    | Allows the /bruteforce parameter to completely remove BEST when BEST cannot be detected by the endpoint. |

## Output
Location of output for log, result, and error files.
    Remove-BitdefenderEndpointSecurity-log.txt
    Remove-BitdefenderEndpointSecurity-Error.txt









