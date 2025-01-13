---
id: 'ps-install-new-teams-client'
title: 'Install New Teams Client Using TeamsBootStrapper'
title_meta: 'Install New Teams Client Using TeamsBootStrapper'
keywords: ['teams', 'client', 'upgrade', 'installation', 'powershell']
description: 'This document provides a detailed guide on how to install the new Microsoft Teams client using the TeamsBootStrapper executable. It includes the necessary PowerShell command, dependencies, output locations, and configuration options for updating the application without user intervention.'
tags: ['installation', 'update', 'software', 'windows']
draft: true
unlisted: true
---
## Summary

Microsoft provides an executable (.exe) file for the new Teams client so you can upgrade the application directly. This executable (TeamsBootStrapper) is a direct or "bulk" upgrade; users don't need to manually download and install the Teams client.

To Install New Teams using the TeamsBootStrapper use the following PowerShell:

```
Start-BitsTransfer -Source "https://go.microsoft.com/fwlink/?linkid=2243204&clcid=0x409" -Destination "$env:TEMP/teamsbootstrapper.exe" (& "$env:TEMP/teamsbootstrapper.exe" -u -p | ConvertFrom-Json).success
```

## Dependencies

PowerShell 5.0+

## Output

Agent Procedure Log  
%ProgramData%/_automation/AgentProcedure

## Parameters

Shared file line 6 is where the .PS1 is deployed  

![Image](../../static/img/SWM---Software-Install---New-Teams-Bulk-Client-Deploy/image_1.png)  

The red box is where the update options are configured.  
![Image](../../static/img/SWM---Software-Install---New-Teams-Bulk-Client-Deploy/image_2.png)  

The script is set to a default of **Installer.Unattended** which will only install updates that can be completed without a user prompt.

Setting this to the option below will install all updates but review the warning above.

```
$updates = Get-LSUpdate -All
```

Github: [https://jantari.github.io/LSUClient-docs/](https://jantari.github.io/LSUClient-docs/)  
[https://github.com/jantari/LSUClient](https://github.com/jantari/LSUClient)




