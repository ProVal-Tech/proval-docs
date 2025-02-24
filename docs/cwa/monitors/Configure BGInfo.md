---
id: '91b463bf-7bb2-4c79-98ca-ef556ea093b0'
title: 'Configure BGInfo'
title_meta: 'Configure BGInfo'
keywords: ['winget', 'teams', 'install', 'update', 'monitor']
description: 'This document outlines the steps to implement a remote monitor for installing or updating Microsoft Teams using Winget. It includes SQL queries for creating alert templates and configuring group agents to ensure proper monitoring and notification of the installation status.'
tags: ['setup', 'software', 'sql', 'windows']
draft: false
unlisted: false
---

## Implementation Steps

- Import [Configure BGInfo script](..//scripts/Configure%20BGInfo.md).

- Run this SQL query from a RAWSQL monitor set to create the alert template. 
```sql
#Create Alert Template
INSERT INTO `alerttemplate` (`Name`, `Comment`, `Last_User`, `Last_Date`, `GUID`) 
SELECT 
'△ Custom - Execute Script - Configure BGInfo' AS `Name`, 
'△ Custom - Execute Script - Configure BGInfo' AS `Comment`,
'PRONOC' AS `Last_User`,
(NOW()) AS `Last_Date`,
'fd9097fb-1bbf-4c5a-a654-664867f7d605' AS `GUID` 
From (SELECT MIN(computerid) FROM computers) a
WHERE (SELECT COUNT(*) FROM alerttemplate WHERE GUID = 'fd9097fb-1bbf-4c5a-a654-664867f7d605') = '0';

INSERT INTO `alerttemplates` (`AlertActionID`, `DayOfWeek`, `TimeStart`, `TimeEnd`, `AlertAction`, `ContactID`, `UserID`, `ScriptID`, `Trump`, `GUID`, `WarningAction`)
SELECT 
(SELECT alertactionid FROM alerttemplate WHERE `GUID` = 'fd9097fb-1bbf-4c5a-a654-664867f7d605') AS `AlertActionid`,
'127' AS `DayOfWeek`,
'00:00:00' AS `TimeStart`,
'23:59:00' AS `TimeEnd`,
'512' AS `AlertAction`,
'-2' AS `ContactID`,
'0' AS `UserID`,
(SELECT Scriptid FROM lt_scripts WHERE scriptGUID = 'f070c915-2fce-11ee-9dfe-000c295e5f21') AS `Scriptid`,
'0' AS `Trump`,
'05c0b164-d150-4236-a02c-5cf7be143c41' AS `GUID`,
'0' AS `WarningAction` 
From (SELECT MIN(computerid) FROM computers) a
WHERE (SELECT COUNT(*) FROM alerttemplates WHERE GUID = '05c0b164-d150-4236-a02c-5cf7be143c41') = '0' ;
```

- Obtain the groupid(s) of the group(s) that the remote monitor should be applied to.
- Copy the following query and replace 'YOUR COMMA SEPARATED LIST OF GROUPID(S)' with the Groupid(s) of the relevant groups: (The string to replace can be found at the very bottom of the query, right after `WHERE`)
```sql
SET @AlertAction = (SELECT Alertactionid FROM alerttemplate WHERE `GUID` = 'fd9097fb-1bbf-4c5a-a654-664867f7d605') ;
INSERT INTO groupagents 
 SELECT '' as `AgentID`,
`groupid` as `GroupID`,
'0' as `SearchID`,
'ProVal - Dev - Configure BGInfo' as `Name`,
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
AND m.groupid NOT IN  (SELECT DISTINCT groupid FROM groupagents WHERE `Name` = 'ProVal - Dev - Configure BGInfo')
```

- An example of a query with a groupid:
```sql
SET @AlertAction = (SELECT Alertactionid FROM alerttemplate WHERE `GUID` = 'fd9097fb-1bbf-4c5a-a654-664867f7d605') ;
INSERT INTO groupagents 
 SELECT '' as `AgentID`,
`groupid` as `GroupID`,
'0' as `SearchID`,
'ProVal - Dev - Configure BGInfo' as `Name`,
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
AND m.groupid NOT IN  (SELECT DISTINCT groupid FROM groupagents WHERE `Name` = 'ProVal - Dev - Configure BGInfo')
```
- Now execute your query from a RAWSQL monitor set.
- Now Locate the Remote monitor on the group(s) and ensure that it's functioning as required. 
 