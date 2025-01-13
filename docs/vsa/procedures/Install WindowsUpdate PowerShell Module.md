---
id: 'ps-windows-update-powershell-module-install'
title: 'Windows Update PowerShell Module Installation'
title_meta: 'Windows Update PowerShell Module Installation'
keywords: ['windows', 'update', 'powershell', 'module', 'install']
description: 'This document provides a detailed procedure for installing the Windows Update PowerShell module, including example logs of the agent procedure execution and dependencies required for successful installation.'
tags: ['installation', 'windows', 'powershell', 'update', 'software']
draft: false
unlisted: false
---
## Summary

This procedure installs the Windows Update PowerShell module.

## Example Agent Procedure Log

| Time                     | Action                                                         | Status                                     | User          |
|--------------------------|----------------------------------------------------------------|--------------------------------------------|---------------|
| 4:48:27 pm 14-Jun-23    | Windows Update PowerShell Module - Install                    | Success THEN                               | derek.joniak  |
| 4:48:26 pm 14-Jun-23    | Windows Update PowerShell Module - Install-0001               | After installation attempt software was: Installed | derek.joniak  |
| 4:48:26 pm 14-Jun-23    | Execute Powershell Command                                     | Success THEN                               | derek.joniak  |
| 4:48:26 pm 14-Jun-23    | Execute Powershell Command-0012                                | Results returned to global variable #global:psresult# and saved in Documents tab of server. | derek.joniak  |
| 4:48:26 pm 14-Jun-23    | Execute Powershell Command-0012                                | Informational: GetFile command overwrote the server file C:\Kaseya\UserProfiles\910544681671025\GetFiles\..\docs\psoutput.txt with the new contents from c:\kworking\psoutput.txt in THEN step 2. | derek.joniak  |
| 4:48:26 pm 14-Jun-23    | Execute Powershell Command-0011                                | Powershell command completed!              | derek.joniak  |
| 4:48:22 pm 14-Jun-23    | Execute Powershell Command-0011                                | Executing powershell "" -Command "if (!(Get-Module -Name PSWindowsUpdate -ListAvailable -ErrorAction SilentlyContinue)) { Write-Output 'Not Installed' } else { Write-Output 'Installed' }" >"c:\kworking\psoutput.txt" | derek.joniak  |
| 4:48:22 pm 14-Jun-23    | Execute Powershell Command-0010                                | Sending output to global variable.         | derek.joniak  |
| 4:48:22 pm 14-Jun-23    | Execute Powershell Command-0008                                | New command variable is: -Command "if (!(Get-Module -Name PSWindowsUpdate -ListAvailable -ErrorAction SilentlyContinue)) { Write-Output 'Not Installed' } else { Write-Output 'Installed' }" | derek.joniak  |
| 4:48:22 pm 14-Jun-23    | Execute Powershell Command-0008                                | Custom commands detected as if (!(Get-Module -Name PSWindowsUpdate -ListAvailable -ErrorAction SilentlyContinue)) { Write-Output 'Not Installed' } else { Write-Output 'Installed' } | derek.joniak  |
| 4:48:20 pm 14-Jun-23    | Execute Powershell Command-0002                                | Powershell is present.                     | derek.joniak  |
| 4:48:19 pm 14-Jun-23    | Windows Update PowerShell Module - Install-0001               | Module imported into PowerShell            | derek.joniak  |
| 4:48:19 pm 14-Jun-23    | Execute Powershell Command (64-bit, Run As System)            | Success THEN                               | derek.joniak  |
| 4:48:18 pm 14-Jun-23    | Execute Powershell Command (64-bit, Run As System)-0014       | Powershell command completed!              | derek.joniak  |
| 4:48:17 pm 14-Jun-23    | Execute Powershell Command (64-bit, Run As System)-0011       | Executing 64-bit Powershell command as System: "" -command "Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Force; Import-Module PSWindowsUpdate" "" | derek.joniak  |
| 4:48:17 pm 14-Jun-23    | Execute Powershell Command (64-bit, Run As System)-0013       | Not sending output to variable.            | derek.joniak  |
| 4:48:17 pm 14-Jun-23    | Execute Powershell Command (64-bit, Run As System)-0008       | Custom commands detected as Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Force; Import-Module PSWindowsUpdate | derek.joniak  |
| 4:48:17 pm 14-Jun-23    | Execute Powershell Command (64-bit, Run As System)-0003       | No powershell file variable detected.      | derek.joniak  |
| 4:48:16 pm 14-Jun-23    | Execute Powershell Command (64-bit, Run As System)-0002       | Powershell is present.                     | derek.joniak  |
| 4:48:14 pm 14-Jun-23    | Windows Update PowerShell Module - Install-0001               | Folder copied to modules folder            | derek.joniak  |
| 4:48:14 pm 14-Jun-23    | Execute Powershell Command (64-bit, Run As System)            | Success THEN                               | derek.joniak  |
| 4:48:14 pm 14-Jun-23    | Execute Powershell Command (64-bit, Run As System)-0014       | Powershell command completed!              | derek.joniak  |
| 4:48:13 pm 14-Jun-23    | Execute Powershell Command (64-bit, Run As System)-0011       | Executing 64-bit Powershell command as System: "" -command "Copy-Item -Path "c:\kworking\PSWindowsUpdate" -Destination "$env:WINDIR\System32\WindowsPowerShell\v1.0\Modules" -Recurse" "" | derek.joniak  |
| 4:48:13 pm 14-Jun-23    | Execute Powershell Command (64-bit, Run As System)-0013       | Not sending output to variable.            | derek.joniak  |
| 4:48:13 pm 14-Jun-23    | Execute Powershell Command (64-bit, Run As System)-0008       | Custom commands detected as Copy-Item -Path "c:\kworking\PSWindowsUpdate" -Destination "$env:WINDIR\System32\WindowsPowerShell\v1.0\Modules" -Recurse | derek.joniak  |
| 4:48:13 pm 14-Jun-23    | Execute Powershell Command (64-bit, Run As System)-0003       | No powershell file variable detected.      | derek.joniak  |
| 4:48:12 pm 14-Jun-23    | Execute Powershell Command (64-bit, Run As System)-0002       | Powershell is present.                     | derek.joniak  |
| 4:48:11 pm 14-Jun-23    | Execute Powershell Command                                       | Success THEN                               | derek.joniak  |
| 4:48:11 pm 14-Jun-23    | Execute Powershell Command-0011                                | Powershell command completed!              | derek.joniak  |
| 4:48:09 pm 14-Jun-23    | Execute Powershell Command-0011                                | Executing powershell "" -Command "Copy-Item -Path "c:\kworking\PSWindowsUpdate" -Destination "$env:WINDIR\System32\WindowsPowerShell\v1.0\Modules" -Recurse" "" | derek.joniak  |
| 4:48:09 pm 14-Jun-23    | Execute Powershell Command-0010                                | Not sending output to variable.            | derek.joniak  |
| 4:48:09 pm 14-Jun-23    | Execute Powershell Command-0008                                | New command variable is: -Command "Copy-Item -Path "c:\kworking\PSWindowsUpdate" -Destination "$env:WINDIR\System32\WindowsPowerShell\v1.0\Modules" -Recurse" | derek.joniak  |
| 4:48:09 pm 14-Jun-23    | Execute Powershell Command-0008                                | Custom commands detected as Copy-Item -Path "c:\kworking\PSWindowsUpdate" -Destination "$env:WINDIR\System32\WindowsPowerShell\v1.0\Modules" -Recurse | derek.joniak  |
| 4:48:06 pm 14-Jun-23    | Execute Powershell Command-0002                                | Powershell is present.                     | derek.joniak  |
| 4:48:05 pm 14-Jun-23    | Windows Update PowerShell Module - Install-0001               | Folder unzipped successfully                | derek.joniak  |
| 4:48:05 pm 14-Jun-23    | Unzip File                                                    | Success THEN                               | derek.joniak  |
| 4:48:05 pm 14-Jun-23    | Unzip File-0005                                               | Zip commands run - c:\kworking/PSWindowsUpdate.zip extracted to c:\kworking | derek.joniak  |
| 4:48:01 pm 14-Jun-23    | Unzip File-0002                                               | Overwrite is not set                       | derek.joniak  |
| 4:48:01 pm 14-Jun-23    | Windows Update PowerShell Module - Install-0001               | ZIP file downloaded. Proceeding to unzip.  | derek.joniak  |
| 4:48:00 pm 14-Jun-23    | Windows Update PowerShell Module - Install-0001               | Windows Update Module is not installed, proceeding to install. | derek.joniak  |
| 4:48:00 pm 14-Jun-23    | Windows Update PowerShell Module - Install                     | Windows Update module is: Not Installed     | derek.joniak  |
| 4:48:00 pm 14-Jun-23    | Execute Powershell Command                                      | Success THEN                               | derek.joniak  |
| 4:48:00 pm 14-Jun-23    | Execute Powershell Command-0012                                 | Results returned to global variable #global:psresult# and saved in Documents tab of server. | derek.joniak  |
| 4:48:00 pm 14-Jun-23    | Execute Powershell Command-0012                                 | Informational: GetFile command overwrote the server file C:\Kaseya\UserProfiles\910544681671025\GetFiles\..\docs\psoutput.txt with the new contents from c:\kworking\psoutput.txt in THEN step 2. | derek.joniak  |
| 4:47:59 pm 14-Jun-23    | Execute Powershell Command-0011                                 | Powershell command completed!              | derek.joniak  |
| 4:47:57 pm 14-Jun-23    | Execute Powershell Command-0011                                 | Executing powershell "" -Command "if (!(Get-Module -Name PSWindowsUpdate -ListAvailable -ErrorAction SilentlyContinue)) { Write-Output 'Not Installed' } else { Write-Output 'Installed' }" >"c:\kworking\psoutput.txt" | derek.joniak  |
| 4:47:57 pm 14-Jun-23    | Execute Powershell Command-0010                                 | Sending output to global variable.         | derek.joniak  |
| 4:47:57 pm 14-Jun-23    | Execute Powershell Command-0008                                 | New command variable is: -Command "if (!(Get-Module -Name PSWindowsUpdate -ListAvailable -ErrorAction SilentlyContinue)) { Write-Output 'Not Installed' } else { Write-Output 'Installed' }" | derek.joniak  |
| 4:47:57 pm 14-Jun-23    | Execute Powershell Command-0008                                 | Custom commands detected as if (!(Get-Module -Name PSWindowsUpdate -ListAvailable -ErrorAction SilentlyContinue)) { Write-Output 'Not Installed' } else { Write-Output 'Installed' } | derek.joniak  |
| 4:47:53 pm 14-Jun-23    | Execute Powershell Command-0002                                 | Powershell is present.                     | derek.joniak  |
| 4:47:45 pm 14-Jun-23    | Run Now - Windows Update PowerShell Module - Install           | Admin derek.joniak scheduled procedure Run Now - Windows Update PowerShell Module - Install to run at Jun 14 2023 5:47PM | derek.joniak  |

## Dependencies

PowerShell: 5.1.0

## Output

Agent Procedure Logs


