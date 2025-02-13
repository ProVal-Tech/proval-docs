---
id: 'f98d734c-7614-4a47-a358-0f6cb1c66b2e'
title: 'MS Teams Uninstall & Install'
title_meta: 'MS Teams Uninstall & Install'
keywords: ['teams', 'uninstall', 'install', 'msi', 'procedure']
description: 'This document outlines the procedure for silently uninstalling the "Teams Machine-Wide Installer" and installing the latest version on a machine. It includes example logs and a step-by-step process for executing the procedure successfully.'
tags: ['installation', 'software', 'update', 'windows']
draft: false
unlisted: false
---

## Summary

This Agent procedure is used to silently uninstall the "Teams Machine-Wide Installer" and install the latest version of the "Teams Machine-Wide Installer" on the machine.

## Example Agent Procedure Log

| Time                     | Action                                               | Status                                                                 | User          |
|--------------------------|------------------------------------------------------|------------------------------------------------------------------------|---------------|
| 1:02:39 pm 12-Dec-24     | Teams Uninstall & Install                            | Success THEN                                                          | kunal.kumar   |
| 1:02:39 pm 12-Dec-24     | Teams Uninstall & Install-0003                       | Teams is installed successfully and the name is: DisplayName ----------- Teams Machine-Wide Installer | kunal.kumar   |
| 1:02:39 pm 12-Dec-24     | Teams Uninstall & Install-0002                       | DisplayName ----------- Teams Machine-Wide Installer                  | kunal.kumar   |
| 1:02:39 pm 12-Dec-24     | Execute Powershell Command (64-bit, Run As System)  | Success THEN                                                          | kunal.kumar   |
| 1:02:39 pm 12-Dec-24     | Execute Powershell Command (64-bit, Run As System)-0016 | Powershell command complete. Results returned to global variable #global:psresult# and saved in Agent's Documents tab of server. | kunal.kumar   |
| 1:02:39 pm 12-Dec-24     | Execute Powershell Command (64-bit, Run As System)-0016 | Informational: GetFile command overwrote the server file C:/Kaseya/UserProfiles/155830305870654/GetFiles/../docs/psoutput.txt with the new contents from c:/kworking/psoutput.txt in THEN step 3. | kunal.kumar   |
| 1:02:36 pm 12-Dec-24     | Execute Powershell Command (64-bit, Run As System)-0011 | Executing 64-bit Powershell command as System: "" -command "Get-ItemProperty -Path "HKLM:/SOFTWARE/WOW6432Node/Microsoft/Windows/CurrentVersion/Uninstall/*" | Where-Object \{ $_.DisplayName -ilike '*Teams Machine-Wide Installer*' } | Select-Object DisplayName" >"c:/kworking/psoutputtmp.txt" | kunal.kumar   |
| 1:02:36 pm 12-Dec-24     | Execute Powershell Command (64-bit, Run As System)-0013 | Sending output to global variable.                                     | kunal.kumar   |
| 1:02:36 pm 12-Dec-24     | Execute Powershell Command (64-bit, Run As System)-0008 | Custom commands detected as Get-ItemProperty -Path "HKLM:/SOFTWARE/WOW6432Node/Microsoft/Windows/CurrentVersion/Uninstall/*" | Where-Object \{ $_.DisplayName -ilike '*Teams Machine-Wide Installer*' } | Select-Object DisplayName | kunal.kumar   |
| 1:02:36 pm 12-Dec-24     | Execute Powershell Command (64-bit, Run As System)-0003 | No Powershell file variable detected.                                   | kunal.kumar   |
| 1:02:31 pm 12-Dec-24     | Execute Powershell Command (64-bit, Run As System)-0002 | Powershell is present.                                                | kunal.kumar   |
| 1:02:28 pm 12-Dec-24     | Execute Shell command - Get Results to Variable      | Success THEN                                                          | kunal.kumar   |
| 1:02:25 pm 12-Dec-24     | Execute Shell command - Get Results to Variable-0007 | Executing command in standard shell as system: C:/Windows/System32/WindowsPowerShell/v1.0/powershell.exe -ExecutionPolicy Bypass -Command %ProgramData%/_automation/AgentProcedure/Teams/Teams_Windows_x64.msi >"c:/kworking/commandresults-20229988.txt" 2>&1 | kunal.kumar   |
| 1:02:15 pm 12-Dec-24     | Teams Uninstall & Install-0002                       | Teams is successfully uninstalled from the machine and now proceeding with the installation of the latest version of Teams | kunal.kumar   |
| 1:02:15 pm 12-Dec-24     | Teams Uninstall & Install-0001                       |                                                                      | kunal.kumar   |
| 1:02:15 pm 12-Dec-24     | Execute Powershell Command (64-bit, Run As System)  | Success THEN                                                          | kunal.kumar   |
| 1:02:14 pm 12-Dec-24     | Execute Powershell Command (64-bit, Run As System)-0016 | Powershell command complete. Results returned to global variable #global:psresult# and saved in Agent's Documents tab of server. | kunal.kumar   |
| 1:02:14 pm 12-Dec-24     | Execute Powershell Command (64-bit, Run As System)-0016 | Informational: GetFile command overwrote the server file C:/Kaseya/UserProfiles/155830305870654/GetFiles/../docs/psoutput.txt with the new contents from c:/kworking/psoutput.txt in THEN step 3. | kunal.kumar   |
| 1:02:11 pm 12-Dec-24     | Execute Powershell Command (64-bit, Run As System)-0011 | Executing 64-bit Powershell command as System: "" -command "Get-ItemProperty -Path "HKLM:/SOFTWARE/WOW6432Node/Microsoft/Windows/CurrentVersion/Uninstall/*" | Where-Object \{ $_.DisplayName -ilike '*Teams Machine-Wide Installer*' } | Select-Object DisplayName" >"c:/kworking/psoutputtmp.txt" | kunal.kumar   |
| 1:02:11 pm 12-Dec-24     | Execute Powershell Command (64-bit, Run As System)-0013 | Sending output to global variable.                                     | kunal.kumar   |
| 1:02:11 pm 12-Dec-24     | Execute Powershell Command (64-bit, Run As System)-0008 | Custom commands detected as Get-ItemProperty -Path "HKLM:/SOFTWARE/WOW6432Node/Microsoft/Windows/CurrentVersion/Uninstall/*" | Where-Object \{ $_.DisplayName -ilike '*Teams Machine-Wide Installer*' } | Select-Object DisplayName | kunal.kumar   |
| 1:02:11 pm 12-Dec-24     | Execute Powershell Command (64-bit, Run As System)-0003 | No Powershell file variable detected.                                   | kunal.kumar   |
| 1:02:09 pm 12-Dec-24     | Execute Powershell Command (64-bit, Run As System)-0002 | Powershell is present.                                                | kunal.kumar   |
| 1:02:08 pm 12-Dec-24     | Teams Uninstall & Install-0001                       | Teams Machine-Wide Installer has been uninstalled from the machine and now proceeding with the validation | kunal.kumar   |
| 1:01:59 pm 12-Dec-24     | Teams Uninstall & Install-0001                       | Teams Machine-Wide Installer is installed and now proceeding with the uninstallation | kunal.kumar   |
| 1:01:59 pm 12-Dec-24     | Teams Uninstall & Install                            | DisplayName ----------- Teams Machine-Wide Installer                  | kunal.kumar   |
| 1:01:59 pm 12-Dec-24     | Execute Powershell Command (64-bit, Run As System)  | Success THEN                                                          | kunal.kumar   |
| 1:01:58 pm 12-Dec-24     | Execute Powershell Command (64-bit, Run As System)-0016 | Powershell command complete. Results returned to global variable #global:psresult# and saved in Agent's Documents tab of server. | kunal.kumar   |
| 1:01:56 pm 12-Dec-24     | Execute Powershell Command (64-bit, Run As System)-0011 | Executing 64-bit Powershell command as System: "" -command "Get-ItemProperty -Path "HKLM:/SOFTWARE/WOW6432Node/Microsoft/Windows/CurrentVersion/Uninstall/*" | Where-Object \{ $_.DisplayName -ilike '*Teams Machine-Wide Installer*' } | Select-Object DisplayName" >"c:/kworking/psoutputtmp.txt" | kunal.kumar   |
| 1:01:56 pm 12-Dec-24     | Execute Powershell Command (64-bit, Run As System)-0013 | Sending output to global variable.                                     | kunal.kumar   |
| 1:01:56 pm 12-Dec-24     | Execute Powershell Command (64-bit, Run As System)-0008 | Custom commands detected as Get-ItemProperty -Path "HKLM:/SOFTWARE/WOW6432Node/Microsoft/Windows/CurrentVersion/Uninstall/*" | Where-Object \{ $_.DisplayName -ilike '*Teams Machine-Wide Installer*' } | Select-Object DisplayName | kunal.kumar   |
| 1:01:56 pm 12-Dec-24     | Execute Powershell Command (64-bit, Run As System)-0003 | No Powershell file variable detected.                                   | kunal.kumar   |
| 1:01:55 pm 12-Dec-24     | Execute Powershell Command (64-bit, Run As System)-0002 | Powershell is present.                                                | kunal.kumar   |
| 1:01:54 pm 12-Dec-24     | Execute Powershell Command                             | Success THEN                                                          | kunal.kumar   |
| 1:01:53 pm 12-Dec-24     | Execute Powershell Command-0011                       | Powershell command completed!                                         | kunal.kumar   |
| 1:01:51 pm 12-Dec-24     | Execute Powershell Command-0011                       | Executing Powershell "" -Command "New-Item -Type Directory -Path %ProgramData%/_automation/AgentProcedure -Name Teams -ErrorAction SilentlyContinue" "" | kunal.kumar   |
| 1:01:51 pm 12-Dec-24     | Execute Powershell Command-0010                       | Not sending output to variable.                                       | kunal.kumar   |
| 1:01:51 pm 12-Dec-24     | Execute Powershell Command-0008                       | New command variable is: -Command "New-Item -Type Directory -Path %ProgramData%/_automation/AgentProcedure -Name Teams -ErrorAction SilentlyContinue" | kunal.kumar   |
| 1:01:51 pm 12-Dec-24     | Execute Powershell Command-0008                       | Custom commands detected as New-Item -Type Directory -Path %ProgramData%/_automation/AgentProcedure -Name Teams -ErrorAction SilentlyContinue | kunal.kumar   |
| 1:01:46 pm 12-Dec-24     | Execute Powershell Command-0002                       | Powershell is present.                                               | kunal.kumar   |
| 1:01:38 pm 12-Dec-24     | Run Now - Teams Uninstall & Install                   | Admin kunal.kumar scheduled procedure Run Now - Teams Uninstall & Install to run at Dec 12 2024 1:01 PM |               |

## Process

1. Use the command to check whether the "Teams Machine-Wide Installer" is installed on the machine.
2. Uninstall the "Teams Machine-Wide Installer" if it is available on the machine.
3. Download the latest MSI agent for the installation of the "Teams Machine-Wide Installer."
4. Install the latest version of Teams.
5. Validate the installation status.

## Output

Agent Procedure Log

## Export Attachment

Attach the XML VSA export content to this document.
## Attachments
[Procedure_MS_Teams_Uninstall___Install.xml](<..\..\..\static\attachments\itg\18036630\Procedure_MS_Teams_Uninstall___Install.xml>)
