---
id: '8a84e955-77a3-47b7-bd37-9adffb0ee995'
slug: /8a84e955-77a3-47b7-bd37-9adffb0ee995
title: 'Chocolatey Application Install'
title_meta: 'Chocolatey Application Install'
keywords: ['chocolatey', 'foil', 'installation', 'application', 'package']
description: 'This document outlines the process of using the Foil wrapper for Chocolatey to install applications. It includes a detailed example of an agent procedure log and the steps involved in the installation process, ensuring that users can successfully deploy applications using Chocolatey and Foil.'
tags: ['application', 'chocolatey', 'installation', 'software']
draft: false
unlisted: false
---

## Summary

Utilizes the Foil wrapper for Chocolatey to install an application. [Foil GitHub Repository](https://github.com/ethanbergstrom/Foil)

## Example Agent Procedure Log

```
2:41:16 pm 17-Nov-22   Chocolatey Application Install   Success THEN   provaltech.com/dan.hicks  
2:41:16 pm 17-Nov-22   Chocolatey Application Install   Forcing web requests to allow TLS v1.2 (Required for requests to Chocolatey.org) Getting latest version of the Chocolatey package for download. Not using proxy. Getting Chocolatey from [https://community.chocolatey.org/api/v2/package/chocolatey/1.2.0](https://community.chocolatey.org/api/v2/package/chocolatey/1.2.0). Downloading [https://community.chocolatey.org/api/v2/package/chocolatey/1.2.0](https://community.chocolatey.org/api/v2/package/chocolatey/1.2.0) to C:/Windows/TEMP/chocolatey/chocoInstall/chocolatey.zip Not using proxy. Extracting C:/Windows/TEMP/chocolatey/chocoInstall/chocolatey.zip to C:/Windows/TEMP/chocolatey/chocoInstall Installing Chocolatey on the local machine Creating ChocolateyInstall as an environment variable (targeting 'Machine') Setting ChocolateyInstall to 'C:/ProgramData/chocolatey' WARNING: It's very likely you will need to close and reopen your shell before you can use choco. Restricting write permissions to Administrators We are setting up the Chocolatey package repository. The packages themselves go to 'C:/ProgramData/chocolatey/lib' (i.e. C:/ProgramData/chocolatey/lib/y...   provaltech.com/dan.hicks  
2:41:16 pm 17-Nov-22   Execute Powershell Command (32-bit, Run As System)   Success THEN   provaltech.com/dan.hicks  
2:41:16 pm 17-Nov-22   Execute Powershell Command (32-bit, Run As System)-0016   Powershell command complete. Results returned to global variable #global:psresult# and saved in Agent's Documents tab of server.   provaltech.com/dan.hicks  
2:41:16 pm 17-Nov-22   Execute Powershell Command (32-bit, Run As System)-0016   Informational: GetFile command overwrote the server file C:/Kaseya/UserProfiles/735959849026022/GetFiles/../docs/psoutput.txt with the new contents from c:/provaltech/psoutput.txt in THEN step 3.   provaltech.com/dan.hicks  
2:37:54 pm 17-Nov-22   Execute Powershell Command (32-bit, Run As System)-0011   Executing 32-bit Powershell command as System: \"\" -command "Set-ExecutionPolicy Bypass -Scope Process -Force;[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072;iex ((New-Object System.Net.WebClient).DownloadString('[https://community.chocolatey.org/install.ps1](https://community.chocolatey.org/install.ps1'));\"); Install-PackageProvider -Name NuGet -RequiredVersion 2.8.5.208 -Force -ErrorAction SilentlyContinue; New-Alias choco %ProgramData%/Chocolatey/bin/choco.exe -Force; Install-Module Foil -Force; Get-ChocoPackage -Name googlechrome -Exact | Install-ChocoPackage\" >\"c:/provaltech/psoutputtmp.txt\"   provaltech.com/dan.hicks  
2:37:54 pm 17-Nov-22   Execute Powershell Command (32-bit, Run As System)-0013   Sending output to global variable.   provaltech.com/dan.hicks  
2:37:54 pm 17-Nov-22   Execute Powershell Command (32-bit, Run As System)-0008   Custom commands detected as Set-ExecutionPolicy Bypass -Scope Process -Force;[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072;iex ((New-Object System.Net.WebClient).DownloadString('[https://community.chocolatey.org/install.ps1](https://community.chocolatey.org/install.ps1'));\"); Install-PackageProvider -Name NuGet -RequiredVersion 2.8.5.208 -Force -ErrorAction SilentlyContinue; New-Alias choco %ProgramData%/Chocolatey/bin/choco.exe -Force; Install-Module Foil -Force; Get-ChocoPackage -Name googlechrome -Exact | Install-ChocoPackage   provaltech.com/dan.hicks  
2:37:54 pm 17-Nov-22   Execute Powershell Command (32-bit, Run As System)-0003   No powershell file variable detected.   provaltech.com/dan.hicks  
2:37:54 pm 17-Nov-22   Execute Powershell Command (32-bit, Run As System)-0002   Powershell is present.   provaltech.com/dan.hicks  
2:37:39 pm 17-Nov-22   Run Now - Chocolatey Application Install   Admin provaltech.com/dan.hicks scheduled procedure Run Now - Chocolatey Application Install to run at Nov 17 2022 2:37PM  
```

## Dependencies

[SWM - Software Management - Solution - VSA Chocolatey Application Management](/docs/e91935f1-0952-4a1c-a1cb-807be572ed30)

## Process

1. Prompts the user for the package name.
2. Installs Chocolatey if it's not already installed.
3. Sets an alias for the choco binary in PowerShell (due to how VSA passes the commands to the endpoint, and the fact that we can't refresh the session after the first choco install).
4. Installs NuGet if not already installed.
5. Installs/Updates the Foil Module.
6. Installs the application using Foil.