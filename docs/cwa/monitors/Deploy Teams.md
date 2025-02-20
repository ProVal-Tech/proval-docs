---
id: '5cc62311-8109-43b8-af64-e0aac4292d19'
title: 'Deploy Teams'
title_meta: 'Deploy Teams'
keywords: ['bginfo', 'script', 'connectwise', 'monitoring', 'alert']
description: 'This document provides a detailed guide on how to implement the BGInfo script within ConnectWise Automate. It includes steps for importing the script, creating alert templates, and applying the script to specific groups using SQL queries.'
tags: ['connectwise', 'database']
draft: false
unlisted: false
---

## Implementation Steps


- Import [Winget - Install/Update - Teams](..//scripts/Winget%20-%20InstallUpdate%20-%20Teams.md) script.

- Run this SQL query from a RAWSQL monitor set to create the alert template. 

```sql
#Create Alert Template
INSERT INTO `alerttemplate` (`Name`, `Comment`, `Last_User`, `Last_Date`, `GUID`) 
SELECT 
'△ Custom - Execute Script - Winget - Install/Update - Teams' AS `Name`, 
'△ Custom - Execute Script - Winget - Install/Update - Teams' AS `Comment`,
'PRONOC' AS `Last_User`,
(NOW()) AS `Last_Date`,
'e0bd7229-5390-462d-9e21-ec56567219c5' AS `GUID` 
From (SELECT MIN(computerid) FROM computers) a
WHERE (SELECT COUNT(*) FROM alerttemplate WHERE GUID = 'e0bd7229-5390-462d-9e21-ec56567219c5') = '0';
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
From (SELECT MIN(computerid) FROM computers) a
WHERE (SELECT COUNT(*) FROM alerttemplates WHERE GUID = '620d5c4d-e89e-455a-ab72-bf98992119e4') = '0' ;
```

- Obtain the groupid(s) of the group(s) that the remote monitor should be applied to.
- Copy the following query and replace 'YOUR COMMA SEPARATED LIST OF GROUPID(S)' with the Groupid(s) of the relevant groups: (The string to replace can be found at the very bottom of the query, right after `WHERE`)

```sql
SET @AlertAction = (SELECT Alertactionid FROM alerttemplate WHERE `GUID` = 'e0bd7229-5390-462d-9e21-ec56567219c5') ;
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
'C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\powershell.exe -ExecutionPolicy Bypass -Command "if (((Get-ChildItem -Path HKLM:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Uninstall, HKLM:\\SOFTWARE\\Wow6432Node\\Microsoft\\Windows\\CurrentVersion\\Uninstall | Get-ItemProperty | Where-Object {$_.DisplayName -eq \'Teams Machine-Wide Installer\' }))) {return \'Deployed\'} else {return \'Not Installed\'}"' as `DataOut`,
'16' as `Comparor`,
'8|Deployed|11|(Deployed)%7C(Not Installed)|10|Not Installed' as `DataIn`,
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
AND m.groupid NOT IN  (SELECT DISTINCT groupid FROM groupagents WHERE `Name` = 'ProVal - Dev - Deploy Teams')
```

- An example of a query with a groupid:
```sql
SET @AlertAction = (SELECT Alertactionid FROM alerttemplate WHERE `GUID` = 'e0bd7229-5390-462d-9e21-ec56567219c5') ;
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
'C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\powershell.exe -ExecutionPolicy Bypass -Command "if (((Get-ChildItem -Path HKLM:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Uninstall, HKLM:\\SOFTWARE\\Wow6432Node\\Microsoft\\Windows\\CurrentVersion\\Uninstall | Get-ItemProperty | Where-Object {$_.DisplayName -eq \'Teams Machine-Wide Installer\' }))) {return \'Deployed\'} else {return \'Not Installed\'}"' as `DataOut`,
'16' as `Comparor`,
'8|Deployed|11|(Deployed)%7C(Not Installed)|10|Not Installed' as `DataIn`,
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
WHERE m.groupid IN (2)
AND m.groupid NOT IN  (SELECT DISTINCT groupid FROM groupagents WHERE `Name` = 'ProVal - Dev - Deploy Teams')
```

- Now execute your query from a RAWSQL monitor set.

- Now Locate the Remote monitor on the group(s) and ensure that it's functioning as required. 