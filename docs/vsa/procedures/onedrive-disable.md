---
id: '55e5e8ed-f8a3-40d3-bc9c-8ca5f0059306'
slug: /55e5e8ed-f8a3-40d3-bc9c-8ca5f0059306
title: 'OneDrive Disable'
title_meta: 'OneDrive Disable'
keywords: ['onedrive', 'security', 'policy', 'disable', 'windows']
description: 'This document outlines the procedure to disallow OneDrive from being used on endpoints through Local Security Policy. It includes a sample run log, the process used to achieve this, and the expected output from the agent procedure.'
tags: ['security', 'setup', 'software', 'windows']
draft: false
unlisted: false
---

## Summary

Disallows OneDrive from use in Local Security Policy.

## Sample Run

| Time                   | Action                                              | Status                                                                                          | User                          |
|------------------------|-----------------------------------------------------|-------------------------------------------------------------------------------------------------|-------------------------------|
| 4:59:20 pm 8-Jul-22    | OneDrive Disable                                    | Success THEN                                                                                   | provaltech.com/dan.hicks     |
| 4:59:20 pm 8-Jul-22    | OneDrive Disable                                    | OneDrive can no longer be used on this endpoint.                                              | provaltech.com/dan.hicks     |
| 4:59:20 pm 8-Jul-22    | Execute Powershell Command (64-bit, Run As System) | Success THEN                                                                                   | provaltech.com/dan.hicks     |
| 4:59:20 pm 8-Jul-22    | Execute Powershell Command (64-bit, Run As System)-0016 | Powershell command complete. Results returned to global variable #global:psresult# and saved in Agent's Documents tab of server. | provaltech.com/dan.hicks     |
| 4:59:20 pm 8-Jul-22    | Execute Powershell Command (64-bit, Run As System)-0016 | Informational: GetFile command overwrote the server file C:/Kaseya/UserProfiles/233148175125752/GetFiles/../docs/psoutput.txt with the new contents from c:/provaltech/psoutput.txt in THEN step 3. | provaltech.com/dan.hicks     |
| 4:59:14 pm 8-Jul-22    | Execute Powershell Command (64-bit, Run As System)-0011 | Executing 64-bit Powershell command as System: /"/" -command /"%ProgramData%/_automation/AgentProcedure/Disable-OneDrive.ps1/" >/"c:/provaltech/psoutputtmp.txt/" | provaltech.com/dan.hicks     |
| 4:59:14 pm 8-Jul-22    | Execute Powershell Command (64-bit, Run As System)-0013 | Sending output to global variable.                                                             | provaltech.com/dan.hicks     |
| 4:59:14 pm 8-Jul-22    | Execute Powershell Command (64-bit, Run As System)-0008 | Custom commands detected as %ProgramData%/_automation/AgentProcedure/Disable-OneDrive.ps1    | provaltech.com/dan.hicks     |
| 4:59:14 pm 8-Jul-22    | Execute Powershell Command (64-bit, Run As System)-0003 | No powershell file variable detected.                                                          | provaltech.com/dan.hicks     |
| 4:59:13 pm 8-Jul-22    | Execute Powershell Command (64-bit, Run As System)-0002 | Powershell is present.                                                                         | provaltech.com/dan.hicks     |
| 4:59:10 pm 8-Jul-22    | Execute Powershell Command                           | Success THEN                                                                                   | provaltech.com/dan.hicks     |
| 4:59:10 pm 8-Jul-22    | Execute Powershell Command-0011                     | Powershell command completed!                                                                  | provaltech.com/dan.hicks     |
| 4:59:07 pm 8-Jul-22    | Execute Powershell Command-0011                     | Executing powershell /"/" -Command /"New-Item -Type Directory -Path %ProgramData%/_automation/AgentProcedure/ -name OneDriveDisable -ErrorAction SilentlyContinue/" /"/" | provaltech.com/dan.hicks     |
| 4:59:07 pm 8-Jul-22    | Execute Powershell Command-0010                     | Not sending output to variable.                                                                | provaltech.com/dan.hicks     |
| 4:59:07 pm 8-Jul-22    | Execute Powershell Command-0008                     | New command variable is: -Command /"New-Item -Type Directory -Path %ProgramData%/_automation/AgentProcedure/ -name OneDriveDisable -ErrorAction SilentlyContinue/" | provaltech.com/dan.hicks     |
| 4:59:07 pm 8-Jul-22    | Execute Powershell Command-0008                     | Custom commands detected as New-Item -Type Directory -Path %ProgramData%/_automation/AgentProcedure/ -name OneDriveDisable -ErrorAction SilentlyContinue | provaltech.com/dan.hicks     |
| 4:59:02 pm 8-Jul-22    | Execute Powershell Command-0002                     | Powershell is present.                                                                         | provaltech.com/dan.hicks     |
| 4:58:54 pm 8-Jul-22    | Run Now - OneDrive Disable                           | Admin provaltech.com/dan.hicks scheduled procedure Run Now - OneDrive Disable to run at Jul 8 2022 4:58 PM |                               |

## Process

```
if(!($oneDriveKey)){
    New-Item -Path Registry::HKEY_LOCAL_MACHINE/Software/Policies/Microsoft/Windows -Name OneDrive
    New-ItemProperty -Path "HKLM:/Software/Policies/Microsoft/Windows/OneDrive" -Name "DisableFileSync" -Value 1
    New-ItemProperty -Path "HKLM:/Software/Policies/Microsoft/Windows/OneDrive" -Name "DisableFileSyncNGSC" -Value 1
}
else{
    Set-ItemProperty -Path "HKLM:/Software/Policies/Microsoft/Windows/OneDrive" -Name "DisableFileSync" -Value 1
    Set-ItemProperty -Path "HKLM:/Software/Policies/Microsoft/Windows/OneDrive" -Name "DisableFileSyncNGSC" -Value 1
}
```

## Output

- Agent Procedure Log

Attach the content XML VSA Export to this document.
## Attachments
[Procedure_OneDrive_Disable.xml](<../../../static/attachments/itg/10318510/Procedure_OneDrive_Disable.xml>)