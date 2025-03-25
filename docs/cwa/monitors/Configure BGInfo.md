---
id: '91b463bf-7bb2-4c79-98ca-ef556ea093b0'
slug: /91b463bf-7bb2-4c79-98ca-ef556ea093b0
title: 'Configure BGInfo'
title_meta: 'Configure BGInfo'
keywords: ['bginfo', 'install', 'tool', 'monitor']
description: 'The purpose of the remote monitor is to find the computer where BGInfo is not deployed in other words where the BGInfo application is not configured to run at startup.'
tags: ['setup', 'windows']
draft: false
unlisted: false
---

## Summary

The purpose of the remote monitor is to find the computer where BGInfo is not deployed in other words where the BGInfo application is not configured to run at startup.

## Details

**Suggested "Limit to":** `Windows Workstations`  
**Suggested Alert Style:** `Once`  
**Suggested Alert Template:** `△ Custom - Execute Script - Configure BGInfo`  

| Check Action | Server Address | Check Type | Execute Info | Comparator | Interval | Result          |
|--------------|----------------|------------|--------------|------------|----------|-----------------|
| System       | 127.0.0.1      | Run File   | REDACTED     | Does Not Contain | 86400    | Not Configured  |

## Dependencies

[Configure BGInfo](..//scripts/Configure%20BGInfo.md)

## Target

Managed Windows Computer (Suggested is workstations but the script can be used for Windows Server as well).

## Implementation Steps

- Obtain the group ID(s) of the group(s) to which the remote monitor should be applied.
- Copy the following query and replace **`YOUR COMMA SEPARATED LIST OF GROUPID(S)`** with the group ID(s) of the relevant groups. The string to replace can be found at the very bottom of the query, right after `WHERE`:  
```sql
    SET @AlertAction = (SELECT Alertactionid FROM alerttemplate WHERE `GUID` = 'fd9097fb-1bbf-4c5a-a654-664867f7d605');
    INSERT INTO groupagents 
    SELECT '' as `AgentID`,
    `groupid` as `GroupID`,
    '0' as `SearchID`,
    'ProVal - Production - Configure BGInfo' as `Name`,
    '6' as `CheckAction`,
    @AlertAction as `AlertAction`,
    '%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.' as `AlertMessage`,
    '0' as `ContactID`,
    '86400' as `interval`,
    '127.0.0.1' as `Where`,
    '7' as `What`,
    'C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\powershell.exe -ExecutionPolicy Bypass -Command "if ((Get-ItemProperty \'HKLM:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Run\').BGInfo) {\'Configured\'} Else {\'Not Configured\'}"' as `DataOut`,
    '9' as `Comparor`,
    'Not Configured' as `DataIn`,
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
    AND m.groupid NOT IN (SELECT DISTINCT groupid FROM groupagents WHERE `Name` = 'ProVal - Production - Configure BGInfo')
```

- Here is an example of a query with a group ID:
```sql
    SET @AlertAction = (SELECT Alertactionid FROM alerttemplate WHERE `GUID` = 'fd9097fb-1bbf-4c5a-a654-664867f7d605') ;
    INSERT INTO groupagents 
    SELECT '' as `AgentID`,
    `groupid` as `GroupID`,
    '0' as `SearchID`,
    'ProVal - Production - Configure BGInfo' as `Name`,
    '6' as `CheckAction`,
    @AlertAction as `AlertAction`,
    '%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.' as `AlertMessage`,
    '0' as `ContactID`,
    '86400' as `interval`,
    '127.0.0.1' as `Where`,
    '7' as `What`,
    'C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\powershell.exe -ExecutionPolicy Bypass -Command "if ((Get-ItemProperty \'HKLM:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Run\').BGInfo) {\'Configured\'} Else {\'Not Configured\'}"' as `DataOut`,
    '9' as `Comparor`,
    'Not Configured' as `DataIn`,
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
    WHERE m.groupid IN (2,3)
    AND m.groupid NOT IN  (SELECT DISTINCT groupid FROM groupagents WHERE `Name` = 'ProVal - Production - Configure BGInfo')
```
- Execute your query from a RAWSQL monitor set.
- Locate the remote monitor on the group(s) and ensure that it is functioning as required.
 