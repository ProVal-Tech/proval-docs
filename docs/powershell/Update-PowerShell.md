---
id: '04754010-1cd6-426b-ba7d-55ae36e60f53'  
title: 'Update-PowerShell'  
title_meta: 'Update-PowerShell'  
keywords: ['update', 'powershell', 'installation', 'windows']  
description: 'Documentation for the Update-PowerShell command to update PowerShell Desktop to the latest version.'  
tags: ['installation', 'software', 'update', 'windows']  
draft: false  
unlisted: false  
---  

## Description  
Updates PowerShell Desktop to the latest version.  

## Requirements  

1. The target OS is not Windows XP, 2003, or Vista/2008, because PowerShell V5 is not available for these operating systems.  
2. The target OS is not Windows 10 or Server 2016, because PowerShell V5 is installed by default on these systems.  
3. The target OS is not Windows 7 or Server 2008R2 without SP2, because SP2 must be installed to install PowerShell V5.  
4. The target OS is not Windows 8, because PowerShell V5 is not applicable to this operating system.  
5. The target OS is not Windows 7 or Server 2008R2 SP2 if it is missing .NET Framework 4.5.2 or greater, because .NET 4.5.2 is required.  

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



