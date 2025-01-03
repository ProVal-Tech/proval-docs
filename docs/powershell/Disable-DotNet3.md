---
id: ps-disable-dotnet3
title: 'Disable-DotNet3'
title_meta: 'Disable-DotNet3 Command'
keywords: ['disable', 'dotnet', 'update', 'windows']
description: 'Documentation for the Disable-DotNet3 command to disable the .Net 3.5 Windows feature after ensuring a newer version is installed.'
tags: ['windows', 'update', 'configuration']
draft: false
unlisted: false
---
## Description
This Script will disable the .Net 3.5 windows feature..
It will attempt to install a new version of .Net prior to the disabling of .net 3.5
If no new version exists and the script is unable to install a new version the script will not disable .net 3.5

## Requirements
Powershell V5
The removal of the .net 3.0 feature requires a reboot.

## Usage
1. Determine if a new version of .net exists (Greater or equal to .net 4.0) if not install it, and verify the installation.
2. Disable .Net 3.5 feature if a new version is present only.



```powershell
.\Disable-DotNet3.ps1
```
Will ensure that a new version of .Net is installed and disable the old versions if a newer is available.

## Output

    .\Disable-DotNet3-log.txt
    .\Disable-DotNet3-error.txt
