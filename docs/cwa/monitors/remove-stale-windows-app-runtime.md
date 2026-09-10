---
id: '88cbf156-e4d4-4b3b-8929-bd5383781756'
slug: /88cbf156-e4d4-4b3b-8929-bd5383781756
title: 'Remove Stale Windows App RunTime'
title_meta: 'Remove Stale Windows App RunTime'
keywords: ['windows-app-runtime', 'cleanup', 'msix', 'appx', 'framework', 'automate']
description: 'This remote monitor detects Windows endpoints that have accumulated superseded, removable Windows App Runtime framework packages.'
tags: ['software', 'cleanup', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-09-10
---
## Summary

This remote monitor detects Windows endpoints that have accumulated superseded, removable Windows App Runtime framework packages. It executes a PowerShell script in read-only reporting mode to identify outdated runtime builds that can be safely deregistered, triggering an alert when actionable packages are found so they can be cleaned up.

The Windows App Runtime is a shared framework component that often accumulates side-by-side builds on a device, as newer MSIX framework builds install alongside older ones rather than replacing them. Over time, this leads to a cluttered accumulation of outdated runtime packages.

This remote monitor serves as the detection half of a monitor-and-remediate workflow. It runs the [Remove Stale Windows App RunTime](/docs/4cfe6282-ad3a-11f1-842c-92000234cfc2) script with the `-List` parameter and filters the results for packages that are both superseded by a newer build in the same family/architecture and still registered to a user profile (`Removable`). If the output contains any actionable `Microsoft.WindowsAppRuntime` packages, the monitor triggers an alert. Administrators can then use the companion script as a remediation step to safely deregister the accumulated builds for all users, keeping only the newest build of each family and architecture without breaking applications bound to specific runtime versions.

## Dependencies

- [PowerShell: Remove-StaleWindowsAppRunTime](/docs/c9b1d4f8-2a5e-4f9a-8b7c-6d3e1f9a2b4c)
- [Script: Remove Stale Windows App RunTime](/docs/4cfe6282-ad3a-11f1-842c-92000234cfc2)

## Details

**Suggested "Limit to"**: `All`  
**Suggested Alert Style**: `Once`  
**Suggested Alert Template**: `△ Custom - Execute Script - Remove Stale Windows App RunTime`  

| Check Action | Server Address | Check Type | Execute Info | Condition | Interval | Result |
|--------------|----------------|------------|--------------|-----------|----------|--------|
| System | 127.0.0.1 | Run File | **REDACTED** | Does Not Contain | 3600 | Microsoft.WindowsAppRuntime |

## Target

- Managed Windows Workstations

## Implementation

### Step 1

Import the [Remove Stale Windows App RunTime](/docs/4cfe6282-ad3a-11f1-842c-92000234cfc2) script using the `ProSync` plugin.

### Step 2

Import the `△ Custom - Execute Script - Remove Stale Windows App RunTime` alert template using the `ProSync` plugin.

### Step 3

Reload the system cache (`Ctrl + R`).

### Step 4

Collect the group ID(s) for the group(s) where you want to apply this remote monitor.

### Step 5

Copy the following query, then replace **YOUR COMMA SEPARATED LIST OF GROUPID(S)** with the group ID(s) for the relevant groups:  

>You can find the placeholder at the end of the query, immediately after **WHERE**.

```Sql
SET @templateId = (SELECT alertactionid FROM alerttemplate WHERE `GUID` = '6bb4d442-2847-4584-89fb-65582c304aea');
INSERT INTO groupagents 
 SELECT '' as `AgentID`,
`groupid` as `GroupID`,
'0' as `SearchID`,
'ProVal - Production - Remove Stale Windows App RunTime' as `Name`,
'6' as `CheckAction`,
@templateId as `AlertAction`,
'<NoAlerts>~~~<NoAlerts>!!!<NoAlerts>~~~<NoAlerts>' as `AlertMessage`,
'0' as `ContactID`,
'3600' as `interval`,
'127.0.0.1' as `Where`,
'7' as `What`,
'C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\powershell.exe -ExecutionPolicy Bypass -Command "$list = & ([scriptblock]::Create((Invoke-RestMethod -Uri \'https://contentrepo.net/repo/script/Remove-StaleWindowsAppRunTime.ps1\'))) -List; $list | Where-Object -FilterScript { $_.Removable }"' as `DataOut`,
'9' as `Comparor`,
'Microsoft.WindowsAppRuntime' as `DataIn`,
'' as `IDField`,
'1' as `AlertStyle`,
'0' as `ScriptID`,
'' as `datacollector`,
'21' as `Category`,
'0' as `TicketCategory`,
'1' as `ScriptTarget`,
(UUID()) as `GUID`,
'root' as `UpdatedBy`,
(NOW()) as `UpdateDate`
FROM mastergroups m
WHERE m.groupid IN (YOUR COMMA SEPARATED LIST OF GROUPID(S))
AND m.groupid NOT IN  (SELECT DISTINCT groupid FROM groupagents WHERE `Name` = 'ProVal - Production - Remove Stale Windows App RunTime')
```

**An example of a query with a group ID:**

```sql
SET @templateId = (SELECT alertactionid FROM alerttemplate WHERE `GUID` = '6bb4d442-2847-4584-89fb-65582c304aea');
INSERT INTO groupagents 
 SELECT '' as `AgentID`,
`groupid` as `GroupID`,
'0' as `SearchID`,
'ProVal - Production - Remove Stale Windows App RunTime' as `Name`,
'6' as `CheckAction`,
@templateId as `AlertAction`,
'<NoAlerts>~~~<NoAlerts>!!!<NoAlerts>~~~<NoAlerts>' as `AlertMessage`,
'0' as `ContactID`,
'3600' as `interval`,
'127.0.0.1' as `Where`,
'7' as `What`,
'C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\powershell.exe -ExecutionPolicy Bypass -Command "$list = & ([scriptblock]::Create((Invoke-RestMethod -Uri \'https://contentrepo.net/repo/script/Remove-StaleWindowsAppRunTime.ps1\'))) -List; $list | Where-Object -FilterScript { $_.Removable }"' as `DataOut`,
'9' as `Comparor`,
'Microsoft.WindowsAppRuntime' as `DataIn`,
'' as `IDField`,
'1' as `AlertStyle`,
'0' as `ScriptID`,
'' as `datacollector`,
'21' as `Category`,
'0' as `TicketCategory`,
'1' as `ScriptTarget`,
(UUID()) as `GUID`,
'root' as `UpdatedBy`,
(NOW()) as `UpdateDate`
FROM mastergroups m
WHERE m.groupid IN (2, 3)
AND m.groupid NOT IN  (SELECT DISTINCT groupid FROM groupagents WHERE `Name` = 'ProVal - Production - Remove Stale Windows App RunTime')
```

### Step 6

Run your updated query in a `RAWSQL` monitor set.

### Step 7

Reload the system cache (`Ctrl + R`).

### Step 8

Open the `Remote Monitors` tab for the target group(s) and verify that the recommended alert template is applied to this monitor set.

## Changelog

### 2026-09-10

- Initial version of the document
