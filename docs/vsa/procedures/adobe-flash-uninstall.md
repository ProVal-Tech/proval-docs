---
id: 'eb1db969-6aef-4e3d-b0fd-b72aaba89084'
slug: /eb1db969-6aef-4e3d-b0fd-b72aaba89084
title: 'Adobe Flash Uninstall'
title_meta: 'Adobe Flash Uninstall'
keywords: ['uninstall', 'flash', 'adobe', 'utility', 'endpoint']
description: 'This document details the procedure for uninstalling Adobe Flash from an endpoint, including logging examples, detection processes, and utility dependencies. It outlines the steps taken during the uninstallation process and confirms the successful removal of the software.'
tags: ['recovery', 'software', 'uninstallation', 'windows']
draft: false
unlisted: false
---

## Summary

Uninstalls Adobe Flash from the endpoint if installed.

## Example Agent Procedure Log

**No Detection:**

| Time                     | Procedure                                     | Status                          | User                          |
|--------------------------|-----------------------------------------------|---------------------------------|-------------------------------|
| 12:19:24 pm 7-Oct-22    | Adobe Flash Uninstall                         | Success THEN                   | provaltech.com/dan.hicks     |
| 12:19:24 pm 7-Oct-22    | Adobe Flash Uninstall-0001                   | Flash Player was not detected on this system. | provaltech.com/dan.hicks     |
| 12:19:24 pm 7-Oct-22    | Execute Powershell Command (64-bit, Run As System) | Success THEN                   | provaltech.com/dan.hicks     |
| 12:19:24 pm 7-Oct-22    | Execute Powershell Command (64-bit, Run As System)-0016 | Powershell command complete. Results returned to global variable #global:psresult# and saved in Agent's Documents tab of server. | provaltech.com/dan.hicks     |
| 12:19:24 pm 7-Oct-22    | Execute Powershell Command (64-bit, Run As System)-0016 | Informational: GetFile command overwrote the server file C:/Kaseya/UserProfiles/217666619114884/GetFiles/../docs/psoutput.txt with the new contents from c:/provaltech/psoutput.txt in THEN step 3. | provaltech.com/dan.hicks     |
| 12:19:22 pm 7-Oct-22    | Execute Powershell Command (64-bit, Run As System)-0011 | Executing 64-bit Powershell command as System: \"\" -command \"Get-ChildItem -Path '%WINDIR%/system32/Macromed/Flash/*', '%WINDIR%/SysWOW64/Macromed/Flash', '%appdata%/Adobe/Flash Player', '%appdata%/Macromedia/Flash Player' -ErrorAction SilentlyContinue | Select-Object -Property Name\" >\"c:/provaltech/psoutputtmp.txt\" | provaltech.com/dan.hicks     |
| 12:19:22 pm 7-Oct-22    | Execute Powershell Command (64-bit, Run As System)-0013 | Sending output to global variable. | provaltech.com/dan.hicks     |
| 12:19:21 pm 7-Oct-22    | Execute Powershell Command (64-bit, Run As System)-0008 | Custom commands detected as Get-ChildItem -Path '%WINDIR%/system32/Macromed/Flash/*', '%WINDIR%/SysWOW64/Macromed/Flash', '%appdata%/Adobe/Flash Player', '%appdata%/Macromedia/Flash Player' -ErrorAction SilentlyContinue | Select-Object -Property Name | provaltech.com/dan.hicks     |
| 12:19:21 pm 7-Oct-22    | Execute Powershell Command (64-bit, Run As System)-0003 | No Powershell file variable detected. | provaltech.com/dan.hicks     |
| 12:19:21 pm 7-Oct-22    | Execute Powershell Command (64-bit, Run As System)-0002 | Powershell is present. | provaltech.com/dan.hicks     |
| 12:19:13 pm 7-Oct-22    | Run Now - Adobe Flash Uninstall               | Admin provaltech.com/dan.hicks scheduled procedure Run Now - Adobe Flash Uninstall to run at Oct 7 2022 12:19 PM |                               |

**Detection:**

| Time                     | Procedure                                     | Status                          | User                          |
|--------------------------|-----------------------------------------------|---------------------------------|-------------------------------|
| 12:22:46 pm 7-Oct-22    | Adobe Flash Uninstall                         | Success THEN                   | provaltech.com/dan.hicks     |
| 12:22:46 pm 7-Oct-22    | Adobe Flash Uninstall-0011                   | Flash Player removed successfully. | provaltech.com/dan.hicks     |
| 12:22:46 pm 7-Oct-22    | Execute Powershell Command (64-bit, Run As System) | Success THEN                   | provaltech.com/dan.hicks     |
| 12:22:45 pm 7-Oct-22    | Execute Powershell Command (64-bit, Run As System)-0016 | Powershell command complete. Results returned to global variable #global:psresult# and saved in Agent's Documents tab of server. | provaltech.com/dan.hicks     |
| 12:22:45 pm 7-Oct-22    | Execute Powershell Command (64-bit, Run As System)-0016 | Informational: GetFile command overwrote the server file C:/Kaseya/UserProfiles/217666619114884/GetFiles/../docs/psoutput.txt with the new contents from c:/provaltech/psoutput.txt in THEN step 3. | provaltech.com/dan.hicks     |
| 12:22:43 pm 7-Oct-22    | Execute Powershell Command (64-bit, Run As System)-0011 | Executing 64-bit Powershell command as System: \"\" -command \"Get-ChildItem -Path '%WINDIR%/system32/Macromed/Flash/*', '%WINDIR%/SysWOW64/Macromed/Flash', '%appdata%/Adobe/Flash Player', '%appdata%/Macromedia/Flash Player' -ErrorAction SilentlyContinue | Select-Object -Property Name\" >\"c:/provaltech/psoutputtmp.txt\" | provaltech.com/dan.hicks     |
| 12:22:43 pm 7-Oct-22    | Execute Powershell Command (64-bit, Run As System)-0013 | Sending output to global variable. | provaltech.com/dan.hicks     |
| 12:22:43 pm 7-Oct-22    | Execute Powershell Command (64-bit, Run As System)-0008 | Custom commands detected as Get-ChildItem -Path '%WINDIR%/system32/Macromed/Flash/*', '%WINDIR%/SysWOW64/Macromed/Flash', '%appdata%/Adobe/Flash Player', '%appdata%/Macromedia/Flash Player' -ErrorAction SilentlyContinue | Select-Object -Property Name | provaltech.com/dan.hicks     |
| 12:22:43 pm 7-Oct-22    | Execute Powershell Command (64-bit, Run As System)-0003 | No Powershell file variable detected. | provaltech.com/dan.hicks     |
| 12:22:42 pm 7-Oct-22    | Execute Powershell Command (64-bit, Run As System)-0002 | Powershell is present. | provaltech.com/dan.hicks     |
| 12:22:42 pm 7-Oct-22    | Adobe Flash Uninstall-0002                    | Checking for successful removal. | provaltech.com/dan.hicks     |
| 12:22:42 pm 7-Oct-22    | Adobe Flash Uninstall-0009                    | No files detected in %appdata%/Macromedia/Flash Player/, or the directory was not found. | provaltech.com/dan.hicks     |
| 12:22:41 pm 7-Oct-22    | Adobe Flash Uninstall-0007                    | No files detected in %appdata%/Adobe/Flash Player/, or the directory was not found. | provaltech.com/dan.hicks     |
| 12:22:41 pm 7-Oct-22    | Adobe Flash Uninstall-0005                    | No files detected in %WINDIR%/SysWOW64/Macromed/Flash/, or the directory was not found. | provaltech.com/dan.hicks     |
| 12:22:41 pm 7-Oct-22    | Adobe Flash Uninstall-0003                    | No files detected in %WINDIR%/system32/Macromed/Flash/, or the directory was not found. | provaltech.com/dan.hicks     |
| 12:22:41 pm 7-Oct-22    | Adobe Flash Uninstall-0002                    | Flash Player uninstallation process complete. Checking for orphaned files. | provaltech.com/dan.hicks     |
| 12:22:39 pm 7-Oct-22    | Adobe Flash Uninstall-0002                    | Running Flash uninstaller. | provaltech.com/dan.hicks     |
| 12:22:37 pm 7-Oct-22    | Execute Powershell Command (64-bit, Run As System) | Success THEN                   | provaltech.com/dan.hicks     |
| 12:22:37 pm 7-Oct-22    | Execute Powershell Command (64-bit, Run As System)-0014 | Powershell command completed! | provaltech.com/dan.hicks     |
| 12:22:36 pm 7-Oct-22    | Execute Powershell Command (64-bit, Run As System)-0011 | Executing 64-bit Powershell command as System: \"\" -command \"New-Item -Type Directory -Path %ProgramData%/_automation/AgentProcedure -Name AdobeFlashUninstall -ErrorAction SilentlyContinue\" \"\" | provaltech.com/dan.hicks     |
| 12:22:36 pm 7-Oct-22    | Execute Powershell Command (64-bit, Run As System)-0013 | Not sending output to variable. | provaltech.com/dan.hicks     |
| 12:22:36 pm 7-Oct-22    | Execute Powershell Command (64-bit, Run As System)-0008 | Custom commands detected as New-Item -Type Directory -Path %ProgramData%/_automation/AgentProcedure -Name AdobeFlashUninstall -ErrorAction SilentlyContinue | provaltech.com/dan.hicks     |
| 12:22:36 pm 7-Oct-22    | Execute Powershell Command (64-bit, Run As System)-0003 | No Powershell file variable detected. | provaltech.com/dan.hicks     |
| 12:22:35 pm 7-Oct-22    | Execute Powershell Command (64-bit, Run As System)-0002 | Powershell is present. | provaltech.com/dan.hicks     |
| 12:22:34 pm 7-Oct-22    | Adobe Flash Uninstall-0001                    | Flash detected. Beginning removal process. | provaltech.com/dan.hicks     |
| 12:22:34 pm 7-Oct-22    | Adobe Flash Uninstall-0001                    | Name ---- FlashInstall64.log FlashUtil64_32_0_0_371_Plugin.dll FlashUtil64_32_0_0_371_Plugin.exe NPSWF64_32_0_0_371.dll plugin.vch FlashInstall32.log flashplayer.xpt FlashPlayerPlugin_32_0_0_371.exe FlashPlayerUpdateService.exe FlashUtil32_32_0_0_371_Plugin.dll FlashUtil32_32_0_0_371_Plugin.exe mms.cfg NPSWF32_32_0_0_371.dll plugin.vch NativeCache macromedia.com  | provaltech.com/dan.hicks     |
| 12:22:34 pm 7-Oct-22    | Execute Powershell Command (64-bit, Run As System) | Success THEN                   | provaltech.com/dan.hicks     |
| 12:22:34 pm 7-Oct-22    | Execute Powershell Command (64-bit, Run As System)-0016 | Powershell command complete. Results returned to global variable #global:psresult# and saved in Agent's Documents tab of server. | provaltech.com/dan.hicks     |
| 12:22:34 pm 7-Oct-22    | Execute Powershell Command (64-bit, Run As System)-0016 | Informational: GetFile command overwrote the server file C:/Kaseya/UserProfiles/217666619114884/GetFiles/../docs/psoutput.txt with the new contents from c:/provaltech/psoutput.txt in THEN step 3. | provaltech.com/dan.hicks     |
| 12:22:32 pm 7-Oct-22    | Execute Powershell Command (64-bit, Run As System)-0011 | Executing 64-bit Powershell command as System: \"\" -command \"Get-ChildItem -Path '%WINDIR%/system32/Macromed/Flash/*', '%WINDIR%/SysWOW64/Macromed/Flash', '%appdata%/Adobe/Flash Player', '%appdata%/Macromedia/Flash Player' -ErrorAction SilentlyContinue | Select-Object -Property Name\" >\"c:/provaltech/psoutputtmp.txt\" | provaltech.com/dan.hicks     |
| 12:22:32 pm 7-Oct-22    | Execute Powershell Command (64-bit, Run As System)-0013 | Sending output to global variable. | provaltech.com/dan.hicks     |
| 12:22:32 pm 7-Oct-22    | Execute Powershell Command (64-bit, Run As System)-0008 | Custom commands detected as Get-ChildItem -Path '%WINDIR%/system32/Macromed/Flash/*', '%WINDIR%/SysWOW64/Macromed/Flash', '%appdata%/Adobe/Flash Player', '%appdata%/Macromedia/Flash Player' -ErrorAction SilentlyContinue | Select-Object -Property Name | provaltech.com/dan.hicks     |
| 12:22:32 pm 7-Oct-22    | Execute Powershell Command (64-bit, Run As System)-0003 | No Powershell file variable detected. | provaltech.com/dan.hicks     |
| 12:22:31 pm 7-Oct-22    | Execute Powershell Command (64-bit, Run As System)-0002 | Powershell is present. | provaltech.com/dan.hicks     |
| 12:22:23 pm 7-Oct-22    | Run Now - Adobe Flash Uninstall               | Admin provaltech.com/dan.hicks scheduled procedure Run Now - Adobe Flash Uninstall to run at Oct 7 2022 12:22 PM |                               |

## Dependencies

Flash Uninstall Utility by Adobe: [https://fpdownload.macromedia.com/get/flashplayer/current/support/uninstall_flash_player.exe](https://fpdownload.macromedia.com/get/flashplayer/current/support/uninstall_flash_player.exe), which is downloaded at runtime.

## Process

Flash is detected by gci on all known Flash directories. If detected, the uninstall tool is run and the folders are individually checked and emptied if files remain. Another check is run afterwards to ensure successful removal.

## Output

Agent Procedure Log