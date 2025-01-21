---
id: '1bf99632-84ea-4fc1-8cb4-39bd98621a91'
title: 'Light Speed XML Configuration Implementation'
title_meta: 'Light Speed XML Configuration Implementation Steps'
keywords: ['configuration', 'alert', 'monitor', 'sql', 'group', 'agent']
description: 'This document outlines the implementation steps for configuring the Light Speed XML settings in ConnectWise Automate. It includes SQL queries for creating alert templates, setting up group agents, and ensuring the remote monitor functions correctly.'
tags: ['sql']
draft: false
unlisted: false
---

## Implementation Steps

- Import the [EPM - Security - Script - Light Speed XML Configuration](https://proval.itglue.com/DOC-5078775-13496676) script.
- Run the following SQL query from a RAWSQL monitor to create the alert template.

```sql
INSERT INTO `alerttemplate` (`Name`, `Comment`, `Last_User`, `Last_Date`, `GUID`) 
SELECT 
'△ Custom - Execute Script - Light Speed XML Configuration' AS `Name`, 
'△ Custom - Execute Script - Light Speed XML Configuration' AS `Comment`,
'PRONOC' AS `Last_User`,
(NOW()) AS `Last_Date`,
'11f7d227-bed1-44f9-b781-0aecca04d747' AS `GUID` 
FROM (SELECT MIN(computerid) FROM computers) a
WHERE (SELECT COUNT(*) FROM alerttemplate WHERE GUID = '11f7d227-bed1-44f9-b781-0aecca04d747') = '0';
```

```sql
INSERT INTO `alerttemplates` (`AlertActionID`, `DayOfWeek`, `TimeStart`, `TimeEnd`, `AlertAction`, `ContactID`, `UserID`, `ScriptID`, `Trump`, `GUID`, `WarningAction`)
SELECT 
(SELECT alertactionid FROM alerttemplate WHERE `GUID` = '11f7d227-bed1-44f9-b781-0aecca04d747') AS `AlertActionid`,
'127' AS `DayOfWeek`,
'00:00:00' AS `TimeStart`,
'23:59:00' AS `TimeEnd`,
'512' AS `AlertAction`,
'-2' AS `ContactID`,
'0' AS `UserID`,
(SELECT Scriptid FROM lt_scripts WHERE scriptGUID = '65eebf3b-2fdf-11ee-9dfe-000c295e5f21') AS `Scriptid`,
'0' AS `Trump`,
'dfcd3669-1833-4896-bad5-23970ed59f25' AS `GUID`,
'0' AS `WarningAction` 
FROM (SELECT MIN(computerid) FROM computers) a
WHERE (SELECT COUNT(*) FROM alerttemplates WHERE GUID = 'dfcd3669-1833-4896-bad5-23970ed59f25') = '0';
```

- Obtain the group ID(s) of the group(s) that the remote monitor should be applied to.

- Copy the following query and replace **YOUR COMMA SEPARATED LIST OF GROUPID(S)** with the group ID(s) of the relevant groups. (The string to replace can be found at the very bottom of the query, right after **WHERE**)

```sql
SET @AlertAction = (SELECT Alertactionid FROM alerttemplate WHERE `GUID` = '11f7d227-bed1-44f9-b781-0aecca04d747');
INSERT INTO groupagents 
SELECT '' as `AgentID`,
`groupid` as `GroupID`,
'0' as `SearchID`,
'ProVal - Client Specific - Light Speed Configuration' as `Name`,
'6' as `CheckAction`,
@AlertAction as `AlertAction`,
'%NAME% %STATUS% on %CLIENTNAME%////%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%////%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.' as `AlertMessage`,
'0' as `ContactID`,
'86400' as `interval`,
'127.0.0.1' as `Where`,
'7' as `What`,
'C:////Windows////System32////WindowsPowerShell////v1.0////powershell.exe -ExecutionPolicy Bypass -Command "if( !(Test-Path ////"$Env:ProgramData////LightSpeedHelper////LightSpeedEdgeSiteList.xml////") ) {return //'Absent//'} else {return //'Present//'}"' as `DataOut`,
'16' as `Comparor`,
'10|Present|11|(Pre%7CAb)sent|10|Absent' as `DataIn`,
'' as `IDField`,
'1' as `AlertStyle`,
'0' as `ScriptID`,
'' as `datacollector`,
'21' as `Category`,
'0' as `TicketCategory`,
'1' as `ScriptTarget`,
CONCAT(
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
'-',
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
'-',
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
'-',
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
'-',
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
'-',
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
'-',
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
'-',
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
'-',
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
'-',
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
'-',
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1)
) as `GUID`,
'root' as `UpdatedBy`,
(NOW()) as `UpdateDate`
FROM mastergroups m
WHERE m.groupid IN (YOUR COMMA SEPARATED LIST OF GROUPID(S))
AND m.groupid NOT IN (SELECT DISTINCT groupid FROM groupagents WHERE `Name` = 'ProVal - Client Specific - Light Speed Configuration')
```

- An example of a query with a group ID:

```sql
SET @AlertAction = (SELECT Alertactionid FROM alerttemplate WHERE `GUID` = '11f7d227-bed1-44f9-b781-0aecca04d747');
INSERT INTO groupagents 
SELECT '' as `AgentID`,
`groupid` as `GroupID`,
'0' as `SearchID`,
'ProVal - Client Specific - Light Speed Configuration' as `Name`,
'6' as `CheckAction`,
@AlertAction as `AlertAction`,
'%NAME% %STATUS% on %CLIENTNAME%////%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%////%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.' as `AlertMessage`,
'0' as `ContactID`,
'86400' as `interval`,
'127.0.0.1' as `Where`,
'7' as `What`,
'C:////Windows////System32////WindowsPowerShell////v1.0////powershell.exe -ExecutionPolicy Bypass -Command "if( !(Test-Path ////"$Env:ProgramData////LightSpeedHelper////LightSpeedEdgeSiteList.xml////") ) {return //'Absent//'} else {return //'Present//'}"' as `DataOut`,
'16' as `Comparor`,
'10|Present|11|(Pre%7CAb)sent|10|Absent' as `DataIn`,
'' as `IDField`,
'1' as `AlertStyle`,
'0' as `ScriptID`,
'' as `datacollector`,
'21' as `Category`,
'0' as `TicketCategory`,
'1' as `ScriptTarget`,
CONCAT(
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
'-',
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
'-',
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
'-',
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
'-',
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
'-',
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
'-',
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
'-',
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
'-',
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
'-',
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1)
) as `GUID`,
'root' as `UpdatedBy`,
(NOW()) as `UpdateDate`
FROM mastergroups m
WHERE m.groupid IN (2,3)
AND m.groupid NOT IN (SELECT DISTINCT groupid FROM groupagents WHERE `Name` = 'ProVal - Client Specific - Light Speed Configuration')
```

- Now execute your query from a RAWSQL monitor set.
- Locate the remote monitor on the group(s) and ensure that it is functioning as required.
