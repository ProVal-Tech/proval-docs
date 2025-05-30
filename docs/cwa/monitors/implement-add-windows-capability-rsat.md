---
id: 'b927b474-abad-4e84-8f39-8995d5ace913'
slug: /b927b474-abad-4e84-8f39-8995d5ace913
title: 'Implement- Add Windows Capability - RSAT'
title_meta: 'Implement- Add Windows Capability - RSAT'
keywords: ['rsat', 'groupid', 'query', 'monitor', 'alert', 'automation']
description: 'This document outlines the steps required to implement a remote monitor for Remote Server Administration Tools (RSAT) using SQL queries. It details how to obtain group IDs, modify the SQL query, execute it, and apply the appropriate alert template in ConnectWise Automate.'
tags: ['database', 'setup']
draft: false
unlisted: false
---

## Implementation Steps

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
'ProVal - NonStack - Add Windows Capability - RSAT' as `Name`,
'6' as `CheckAction`,
'1' as `AlertAction`,
'Failed to add RSAT Features on %computername%~~~RSAT Features successfully added!!!Failed to add RSAT Features on %computername%~~~Remote Server Administration Tools Features are not enabled on the %ComputerName%. Automate attempted to enable it but failed. Please review manually. \r\n\r\nCommand Executed: Get-WindowsCapability -Name RSAT* -Online | Where-Object{$_.State -eq \'NotPresent\'} | Add-WindowsCapability -Online\r\n\r\nOutput: %RESULT%\r\n\r\nHow to enable it manually: https://learn.microsoft.com/en-us/troubleshoot/windows-server/system-management-components/remote-server-administration-tools' as `AlertMessage`,
'0' as `ContactID`,
'604800' as `interval`,
'127.0.0.1' as `Where`,
'7' as `What`,
'C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\powershell.exe -ExecutionPolicy Bypass -Command "if((Get-CimInstance -ClassName Cim_computersystem).partofdomain -and (Get-WindowsCapability -Name RSAT* -Online | Where-Object{$_.State -eq \'NotPresent\'})) {try {Get-WindowsCapability -Name RSAT* -Online | Where-Object{$_.State -eq \'NotPresent\'} | Add-WindowsCapability -Online -Erroraction Stop} catch { return \\"Failed to Add RSAT capability. Reason: $($Error[0].Exception.Message)\\"}}"' as `DataOut`,
'16' as `Comparor`,
'11|(PowerShell)%7C(Failed to Add RSAT capability. Reason:)|10|PowerShell|10|Failed to Add RSAT capability. Reason:' as `DataIn`,
'' as `IDField`,
'1' as `AlertStyle`,
'0' as `ScriptID`,
'' as `datacollector`,
'21' as `Category`,
'0' as `TicketCategory`,
'1' as `ScriptTarget`,
UUID() as `GUID`,
'root' as `UpdatedBy`,
(NOW()) as `UpdateDate`
FROM mastergroups m
WHERE m.groupid IN (YOUR COMMA SEPARATED LIST OF GROUPID(S))
AND m.groupid NOT IN  (SELECT DISTINCT groupid FROM groupagents WHERE `Name` = 'ProVal - NonStack - Add Windows Capability - RSAT')
```

### Step 3
An example of a query with a group ID:

```sql
INSERT INTO groupagents 
SELECT '' as `AgentID`,
`groupid` as `GroupID`,
'0' as `SearchID`,
'ProVal - NonStack - Add Windows Capability - RSAT' as `Name`,
'6' as `CheckAction`,
'1' as `AlertAction`,
'Failed to add RSAT Features on %computername%~~~RSAT Features successfully added!!!Failed to add RSAT Features on %computername%~~~Remote Server Administration Tools Features are not enabled on the %ComputerName%. Automate attempted to enable it but failed. Please review manually. \r\n\r\nCommand Executed: Get-WindowsCapability -Name RSAT* -Online | Where-Object{$_.State -eq \'NotPresent\'} | Add-WindowsCapability -Online\r\n\r\nOutput: %RESULT%\r\n\r\nHow to enable it manually: https://learn.microsoft.com/en-us/troubleshoot/windows-server/system-management-components/remote-server-administration-tools' as `AlertMessage`,
'0' as `ContactID`,
'604800' as `interval`,
'127.0.0.1' as `Where`,
'7' as `What`,
'C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\powershell.exe -ExecutionPolicy Bypass -Command "if((Get-CimInstance -ClassName Cim_computersystem).partofdomain -and (Get-WindowsCapability -Name RSAT* -Online | Where-Object{$_.State -eq \'NotPresent\'})) {try {Get-WindowsCapability -Name RSAT* -Online | Where-Object{$_.State -eq \'NotPresent\'} | Add-WindowsCapability -Online -Erroraction Stop} catch { return \\"Failed to Add RSAT capability. Reason: $($Error[0].Exception.Message)\\"}}"' as `DataOut`,
'16' as `Comparor`,
'11|(PowerShell)%7C(Failed to Add RSAT capability. Reason:)|10|PowerShell|10|Failed to Add RSAT capability. Reason:' as `DataIn`,
'' as `IDField`,
'1' as `AlertStyle`,
'0' as `ScriptID`,
'' as `datacollector`,
'21' as `Category`,
'0' as `TicketCategory`,
'1' as `ScriptTarget`,
UUID() as `GUID`,
'root' as `UpdatedBy`,
(NOW()) as `UpdateDate`
FROM mastergroups m
WHERE m.groupid IN (1764)
AND m.groupid NOT IN  (SELECT DISTINCT groupid FROM groupagents WHERE `Name` = 'ProVal - NonStack - Add Windows Capability - RSAT')
```

### Step 4
Now execute your query from a RAWSQL monitor set.

### Step 5
Locate your remote monitor by opening the group(s) remote monitors tab, then apply the appropriate alert template.  
While assigning the alert template, ensure that it is not performing any actions for WARNINGS unless you want to be notified for the PowerShell errors as well.