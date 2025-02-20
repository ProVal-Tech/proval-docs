---
id: 'f4687be0-4269-4cec-8e7b-685f56178f27'
title: 'Disable Update Orchestrator Service Change'
title_meta: 'Disable Update Orchestrator Service Change'
keywords: ['monitor', 'service', 'disable', 'windows', 'update', 'orchestrator']
description: 'This document provides details on a remote monitor that checks the status of the Update Orchestrator Service on Windows machines. If the service is running, it will be stopped and disabled, ensuring that it does not interfere with system updates. Caution is advised as this action will change the state of the service across all systems the monitor is deployed to.'
tags: ['update', 'windows']
draft: false
unlisted: false
---

## Summary

This remote monitor checks the status of the Update Orchestrator Service, and if it is found running, it will stop and disable the service.

---

This monitor will make a change to all systems it is deployed to.  
![Police Car Light](https://c.tenor.com/8vSJsVW-1pQAAAAj/police-car-light-joypixels.gif)

---

### What Will Change?
This monitor will check if the Update Orchestrator service is enabled and will disable it.  
The service will be stopped and marked as 'Disabled'.

---

*This action will occur regardless of what alert template is set against the monitor.*  
*Monitors that make changes to the environment can be difficult to audit. Use with caution.*

## Details

| Check Action | Server Address | Check Type | Check Value | Comparator | Interval | Result |
|--------------|----------------|-------------|-------------|-------------|----------|--------|
| System       | 127.0.0.1      | Run File    | C:/Windows/System32/WindowsPowerShell/v1.0/powershell.exe -ExecutionPolicy Bypass -Command "$ErrorActionPreference = 'SilentlyContinue';$ServiceName = 'UsoSvc';$service = Get-Service -Name $ServiceName;if ($service.Status -eq 'Running') \{Stop-Service -Name $ServiceName -Force;$service = Get-Service -Name $ServiceName;if ($service.Status -eq 'Running') \{return 'Running'}else \{Set-Service -Name $ServiceName -StartupType Disabled -Confirm:$false;$service = Get-Service -Name $ServiceName;if ($service.StartType -eq 'Disabled') \{ return 'Disabled and Stopped'}else \{return 'Stopped'}}}" | Does Not Contain | 300 | Running |

## Target

Windows Machine

## Ticketing

**Subject**  
Update Orchestrator Service Failed to Disable at %computername%

---

**Failure**  

---

**Body**  
Update Orchestrator Service Failed to Disable on %CLIENTNAME%/%COMPUTERNAME% at %LOCATIONNAME% with result service is: %RESULT%.  

---

**Success:**  

**Body**  
Update Orchestrator Service successfully %Result% on %CLIENTNAME%/%COMPUTERNAME% at %LOCATIONNAME%.  

## Implementation

### Step 1
Obtain the group ID(s) of the group(s) that the remote monitor should be applied to.

### Step 2
Copy the following query and replace **YOUR COMMA SEPARATED LIST OF GROUPID(S)** with the group ID(s) of the relevant groups:  
(The string to replace can be found at the very bottom of the query, right after **WHERE**)

```sql
INSERT INTO groupagents 
SELECT '' as `AgentID`,
`groupid` as `GroupID`,
'0' as `SearchID`,
'ProVal - Production - Disable Update Orchestrator Service [Change]' as `Name`,
'6' as `CheckAction`,
'1' as `AlertAction`,
'Update Orchestrator Service Failed to Disable at %computername%~~~Update Orchestrator Service successfully %Result% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME%.!!!Update Orchestrator Service Failed to Disable at %computername%~~~Update Orchestrator Service Failed to Disable on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% with result service is: %RESULT%.' as `AlertMessage`,
'0' as `ContactID`,
'300' as `interval`,
'127.0.0.1' as `Where`,
'7' as `What`,
'C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\powershell.exe -ExecutionPolicy Bypass -Command \"$ErrorActionPreference = \'SilentlyContinue\';$ServiceName = \'UsoSvc\';$service = Get-Service -Name $ServiceName;if ($service.Status -eq \'Running\') {Stop-Service -Name $ServiceName -Force;$service = Get-Service -Name $ServiceName;if ($service.Status -eq \'Running\') {return \'Running\'}else {Set-Service -Name $ServiceName -StartupType Disabled -Confirm:$false;$service = Get-Service -Name $ServiceName;if ($service.StartType -eq \'Disabled\') { return \'Disabled and Stopped\'}else {return \'Stopped\'}}}"' as `DataOut`,
'9' as `Comparor`,
'Running' as `DataIn`,
'' as `IDField`,
'1' as `AlertStyle`,
'0' as `ScriptID`,
'' as `datacollector`,
'5' as `Category`,
'0' as `TicketCategory`,
'0' as `ScriptTarget`,
UUID() as `GUID`,
'root' as `UpdatedBy`,
(NOW()) as `UpdateDate`
FROM mastergroups m
WHERE m.groupid IN (YOUR COMMA SEPARATED LIST OF GROUPID(S))
AND m.groupid NOT IN (SELECT DISTINCT groupid FROM groupagents WHERE `Name` = 'ProVal - Production - Disable Update Orchestrator Service [Change]')
```

### Step 3
An example of a query with a group ID:

```sql
INSERT INTO groupagents 
SELECT '' as `AgentID`,
`groupid` as `GroupID`,
'0' as `SearchID`,
'ProVal - Production - Disable Update Orchestrator Service [Change]' as `Name`,
'6' as `CheckAction`,
'1' as `AlertAction`,
'Update Orchestrator Service Failed to Disable at %computername%~~~Update Orchestrator Service successfully %Result% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME%.!!!Update Orchestrator Service Failed to Disable at %computername%~~~Update Orchestrator Service Failed to Disable on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% with result service is: %RESULT%.' as `AlertMessage`,
'0' as `ContactID`,
'300' as `interval`,
'127.0.0.1' as `Where`,
'7' as `What`,
'C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\powershell.exe -ExecutionPolicy Bypass -Command \"$ErrorActionPreference = \'SilentlyContinue\';$ServiceName = \'UsoSvc\';$service = Get-Service -Name $ServiceName;if ($service.Status -eq \'Running\') {Stop-Service -Name $ServiceName -Force;$service = Get-Service -Name $ServiceName;if ($service.Status -eq \'Running\') {return \'Running\'}else {Set-Service -Name $ServiceName -StartupType Disabled -Confirm:$false;$service = Get-Service -Name $ServiceName;if ($service.StartType -eq \'Disabled\') { return \'Disabled and Stopped\'}else {return \'Stopped\'}}}"' as `DataOut`,
'9' as `Comparor`,
'Running' as `DataIn`,
'' as `IDField`,
'1' as `AlertStyle`,
'0' as `ScriptID`,
'' as `datacollector`,
'5' as `Category`,
'0' as `TicketCategory`,
'0' as `ScriptTarget`,
UUID() as `GUID`,
'root' as `UpdatedBy`,
(NOW()) as `UpdateDate`
FROM mastergroups m
WHERE m.groupid IN (1766)
AND m.groupid NOT IN (SELECT DISTINCT groupid FROM groupagents WHERE `Name` = 'ProVal - Production - Disable Update Orchestrator Service [Change]')
```

### Step 4
Locate your remote monitor by opening the group(s) remote monitors tab, then apply the appropriate alert template.

## FAQ

**Q. If I stop the Update Orchestrator service, will the system still get updates installed if someone manually checks for updates or controls the update from a third-party tool?**  
**A.** Yes, the **Windows Update service (wuauserv)** is essential for Windows Update functionality. If this service is running, updates can be installed even if the Update Orchestrator service is stopped. The **Update Orchestrator Service (UsoSvc)** manages update installation and rebooting. While stopping it may disrupt the update schedule, manually checking for updates through **Settings > Update & Security > Windows Update** will still allow updates to download and install. However, it's important to note that disabling these services can affect system security and functionality. It's generally recommended to keep them enabled unless there's a specific reason not to.

---

**Q. Will stopping the Update Orchestrator service impact Automate patch management?**  
**A.** No, Automate's patch management relies solely on the Windows Update service and UI mode (Check for Updates), so stopping the Update Orchestrator won't affect it.
