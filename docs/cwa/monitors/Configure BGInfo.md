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

- Import [EPM - Software Install - Script - Winget - Install/Update - Teams](<../scripts/Winget - InstallUpdate - Teams.md>) script.
- Run this SQL query from a RAWSQL monitor set to create the alert template.

```sql
# Create Alert Template
INSERT INTO `alerttemplate` (`Name`, `Comment`, `Last_User`, `Last_Date`, `GUID`) 
SELECT 
'△ Custom - Execute Script - Winget - Install/Update - Teams' AS `Name`, 
'△ Custom - Execute Script - Winget - Install/Update - Teams' AS `Comment`,
'PRONOC' AS `Last_User`,
(NOW()) AS `Last_Date`,
'e0bd7229-5390-462d-9e21-ec56567219c5' AS `GUID` 
FROM (SELECT MIN(computerid) FROM computers) a
WHERE (SELECT COUNT(*) FROM alerttemplate WHERE GUID = 'e0bd7229-5390-462d-9e21-ec56567219c5') = '0';
```

```sql
INSERT INTO `alerttemplates` (`AlertActionID`, `DayOfWeek`, `TimeStart`, `TimeEnd`, `AlertAction`, `ContactID`, `UserID`, `ScriptID`, `Trump`, `GUID`, `WarningAction`)
SELECT 
(SELECT alertactionid FROM alerttemplate WHERE `GUID` = 'e0bd7229-5390-462d-9e21-ec56567219c5') AS `AlertActionid`,
'127' AS `DayOfWeek`,
'00:00:00' AS `TimeStart`,
'23:59:00' AS `TimeEnd`,
'512' AS `AlertAction`,
'-2' AS `ContactID`,
'0' AS `UserID`,
(SELECT Scriptid FROM lt_scripts WHERE scriptGUID = '32ea4448-2fd8-11ee-9dfe-000c295e5f21') AS `Scriptid`,
'0' AS `Trump`,
'620d5c4d-e89e-455a-ab72-bf98992119e4' AS `GUID`,
'0' AS `WarningAction` 
FROM (SELECT MIN(computerid) FROM computers) a
WHERE (SELECT COUNT(*) FROM alerttemplates WHERE GUID = '620d5c4d-e89e-455a-ab72-bf98992119e4') = '0';
```

- Obtain the groupid(s) of the group(s) that the remote monitor should be applied to.

- Copy the following query and replace **YOUR COMMA SEPARATED LIST OF GROUPID(S)** with the groupid(s) of the relevant groups. (The string to replace can be found at the very bottom of the query, right after **WHERE**)

```sql
SET @AlertAction = (SELECT Alertactionid FROM alerttemplate WHERE `GUID` = 'e0bd7229-5390-462d-9e21-ec56567219c5');
INSERT INTO groupagents 
SELECT '' as `AgentID`,
`groupid` as `GroupID`,
'0' as `SearchID`,
'ProVal - Dev - Deploy Teams' as `Name`,
'6' as `CheckAction`,
@AlertAction as `AlertAction`,
'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.' as `AlertMessage`,
'0' as `ContactID`,
'86400' as `interval`,
'127.0.0.1' as `Where`,
'7' as `What`,
'C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\powershell.exe -ExecutionPolicy Bypass -Command \"if (((Get-ChildItem -Path HKLM:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Uninstall, HKLM:\\SOFTWARE\\Wow6432Node\\Microsoft\\Windows\\CurrentVersion\\Uninstall | Get-ItemProperty | Where-Object {$_.DisplayName -eq \'Teams Machine-Wide Installer\' }))) {return \'Deployed\'} else {return \'Not Installed\'}"' as `DataOut`,
'16' as `Comparor`,
'8|Deployed|11|(Deployed)%7C(Not Installed)|10|Not Installed' as `DataIn`,
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
SUBSTRING('abcdef0123456789',


