---
id: ps-disable-powershellversion2
title: 'Disable-PowerShellVersion2'
title_meta: 'Disable-PowerShellVersion2 Command'
keywords: ['disable', 'powershell', 'version', 'update']
description: 'Documentation for the Disable-PowerShellVersion2 command to disable Windows PowerShell v2 feature if a newer version is installed.'
tags: ['windows', 'configuration', 'update', 'security']
draft: false
unlisted: false
---
## Description
This Script will disable Windows PowerShell v2 feature.
If no new version of PowerShell exists the script will not disable Powershell V2.

## Requirements
A version of PowerShell greater than v2 must be installed to disable PowerShell v2, this script will attempt to satisfy that requirement before disabling anything.
The removal of the .Net 3.0 feature requires a reboot.

## Usage
1. If there is a powershell version installed greater than v2, then we will disable Powershell V2
2. If there is no powershell versions installed greater than v2
    1. Install the latest approved chocolatey version of PowerShell.
    2. Verify that the installation was successful, error if not.
    3. Disable PowerShell version 2.



```powershell
.\Disable-PowershellVersion2.ps1
```
 Checks for a version of PowerShell greater than v2, if there is one present disables the PowerShell V2. feature, if it's not present it attempts to install a newer PowerShell version so v2 can be disabled.


## Output

    .\Disable-PowershellVersion2-log.txt
    .\Disable-PowershellVersion2-error.txt




