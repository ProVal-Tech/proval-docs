---
id: ps-update-powershell
title: 'Update-PowerShell'
title_meta: 'Update-PowerShell Command'
keywords: ['update', 'powershell', 'installation', 'windows']
description: 'Documentation for the Update-PowerShell command to update PowerShell Desktop to the latest version.'
tags: ['installation', 'software', 'update', 'windows']
draft: false
unlisted: false
---
## Description
Updates PowerShell Desktop to the latest version.

## Requirements

1. Target OS is not Windows XP, 2003, or Vista/2008, Because PowerShell V5 is not available for these operating systems.
2. Target OS is not Windows 10 or Server 2016, Because PowerShell V5 is installed by default on these systems.
3. Target OS is not Windows 7 or Server 2008R2 but not SP2, Because SP2 must be installed to install PowerShell V5.
4. Target OS is not Windows 8, Because PowerShell V5 is not applicable to this operating system.
5. Target OS is not Windows 7 or Server 2008R2 SP2 but missing .NET Framework 4.5.2 or greater, because .Net 4.5.2 is required.

## Usage
1. Checks for all the requirements and exits if not met.
2. Downloads the WMF5 installer based on OS and architecture.
   1. Extracts the .zip file downloaded, if necessary.
3. Executes the MSU installation with `wusa.exe`.
4. Exits after the installation is complete.



```powershell
.\Update-PowershellV2.ps1
```
Updates PowerShell on the target machine to PowerShell V5.









