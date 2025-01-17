---
id: '184aa8f9-0119-4f8f-b05e-0f8f74c5bb80'
title: 'Chocolatey Application Uninstall'
title_meta: 'Chocolatey Application Uninstall'
keywords: ['chocolatey', 'uninstall', 'application', 'foil', 'package']
description: 'This document outlines the process for uninstalling an application using the Foil wrapper for Chocolatey. It includes a summary of the procedure, example logs, dependencies, and a detailed step-by-step process for successful execution.'
tags: ['chocolatey', 'setup', 'software', 'uninstallation', 'windows']
draft: false
unlisted: false
---
## Summary

Utilizes the Foil wrapper for chocolatey to uninstall an application. [https://github.com/ethanbergstrom/Foil](https://github.com/ethanbergstrom/Foil)

## Example Agent Procedure Log

2:49:01 pm 17-Nov-22   Chocolatey Application Uninstall   Success THEN   provaltech.com/dan.hicks  
2:49:01 pm 17-Nov-22   Chocolatey Application Uninstall   WARNING: Files from a previous installation of Chocolatey were found at 'C:/ProgramData/chocolatey'. WARNING: An existing Chocolatey installation was detected. Installation will not continue. For security reasons, this script will not overwrite existing installations. Please use choco upgrade chocolatey to handle upgrades of Chocolatey itself. If the existing installation is not functional or a prior installation did not complete, follow these steps: - Backup the files at the path listed above so you can restore your previous installation if needed - Remove the existing installation manually - Rerun this installation script - Reinstall any packages previously installed, if needed (refer to the lib folder in the backup) Once installation is completed, the backup folder is no longer needed and can be deleted. Name Version Source Summary ---- ...   provaltech.com/dan.hicks  
2:49:01 pm 17-Nov-22   Execute Powershell Command (32-bit, Run As System)   Success THEN   provaltech.com/dan.hicks  
2:49:00 pm 17-Nov-22   Execute Powershell Command (32-bit, Run As System)-0016   Powershell command complete. Results returned to global variable #global:psresult# and saved in Agent's Documents tab of server.   provaltech.com/dan.hicks  
2:49:00 pm 17-Nov-22   Execute Powershell Command (32-bit, Run As System)-0016   Informational: GetFile command overwrote the server file C:/Kaseya/UserProfiles/735959849026022/GetFiles/../docs/psoutput.txt with the new contents from c:/provaltech/psoutput.txt in THEN step 3.   provaltech.com/dan.hicks  
2:48:19 pm 17-Nov-22   Execute Powershell Command (32-bit, Run As System)-0011   Executing 32-bit Powershell command as System: "" -command "Set-ExecutionPolicy Bypass -Scope Process -Force;[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072;iex ((New-Object System.Net.WebClient).DownloadString('[https://community.chocolatey.org/install.ps1](https://community.chocolatey.org/install.ps1'))); Install-PackageProvider -Name NuGet -RequiredVersion 2.8.5.208 -Force -ErrorAction SilentlyContinue; New-Alias choco %ProgramData%/Chocolatey/bin/choco.exe -Force; Install-Module Foil -Force; Get-ChocoPackage googlechrome -LocalOnly | Uninstall-ChocoPackage -RemoveDependencies" >"c:/provaltech/psoutputtmp.txt"   provaltech.com/dan.hicks  
2:48:19 pm 17-Nov-22   Execute Powershell Command (32-bit, Run As System)-0013   Sending output to global variable.   provaltech.com/dan.hicks  
2:48:19 pm 17-Nov-22   Execute Powershell Command (32-bit, Run As System)-0008   Custom commands detected as Set-ExecutionPolicy Bypass -Scope Process -Force;[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072;iex ((New-Object System.Net.WebClient).DownloadString('[https://community.chocolatey.org/install.ps1](https://community.chocolatey.org/install.ps1'))); Install-PackageProvider -Name NuGet -RequiredVersion 2.8.5.208 -Force -ErrorAction SilentlyContinue; New-Alias choco %ProgramData%/Chocolatey/bin/choco.exe -Force; Install-Module Foil -Force; Get-ChocoPackage googlechrome -LocalOnly | Uninstall-ChocoPackage -RemoveDependencies   provaltech.com/dan.hicks  
2:48:19 pm 17-Nov-22   Execute Powershell Command (32-bit, Run As System)-0003   No powershell file variable detected.   provaltech.com/dan.hicks  
2:48:17 pm 17-Nov-22   Execute Powershell Command (32-bit, Run As System)-0002   Powershell is present.   provaltech.com/dan.hicks  
2:48:09 pm 17-Nov-22   Run Now - Chocolatey Application Uninstall   Admin provaltech.com/dan.hicks scheduled procedure Run Now - Chocolatey Application Uninstall to run at Nov 17 2022 2:48PM  

## Dependencies

[SWM - Software Management - Solution - VSA Chocolatey Application Management](https://proval.itglue.com/DOC-5078775-11453171)  

## Process

1. Prompts the user for the package name
2. Installs chocolatey if it's not already installed
3. Sets an alias for the choco binary in powershell (due to how VSA passes the commands to the endpoint, and the fact that we can't refresh the session after choco first install.)
4. Installs NuGet if not already installed.
5. Installs / Updates the Foil Module
6. Removes the application using Foil-Chocolatey, if the package is installed.
7. Checks to ensure the package was properly removed.
8. Writes the result to the Agent Procedure Log.

## Output

Agent Procedure Log












