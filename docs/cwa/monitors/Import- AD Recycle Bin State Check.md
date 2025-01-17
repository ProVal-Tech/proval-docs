---
id: '7f37dfc1-5f0a-4f7d-bf9f-631ea653a74d'
title: 'Enable AD Recycle Bin in ConnectWise Automate'
title_meta: 'Enable AD Recycle Bin in ConnectWise Automate'
keywords: ['ad', 'recycle', 'bin', 'connectwise', 'automate', 'sql', 'monitor']
description: 'This document provides a step-by-step guide on how to enable the Active Directory Recycle Bin feature in ConnectWise Automate. It includes importing the necessary alert template, running SQL queries to set up the feature, and configuring the remote monitor for Domain Controllers.'
tags: ['database', 'setup']
draft: false
unlisted: false
---
## Step 1
Import the Alert Template '△ Custom - Execute Script - AD - Enable AD Recycle Bin'

- Validate that the [AD - Enable AD Recycle Bin](https://proval.itglue.com/DOC-5078775-7937042) script was imported as well.

## Step 2
Run the SQL Query to import 'AD Domain Recycle Bin Feature' role if it's already not available in the environment

```
INSERT IGNORE INTO RoleDefinitions( `RoleName`, `RoleType`, `RoleSubType`, `DetectionString`, `ComparisonOperator`, `ComparisonResult`, `SerialKeyString`, `ProductKeyString`, `SearchId`,`IsSupport`,`ParentRoleDefinitionGuid`,`IsRemote`,`RoleDetectionGuid`, `OSType` ) VALUES('AD Domain Recycle Bin Feature','Domain Controller','Role','{%@powershell.exe /"Get-ADOptionalFeature -Identity /'Recycle Bin Feature/'|select -exp enabledscopes|format-list;if ($enabledScopes){Write-Output -InputObject /'Enabled/'}else{Write-Output -InputObject /'Disabled/'}/"@%}','eq','Enabled','','',0,0,'',1,'c6de5dcd-7ef6-11e8-b703-000c295e5f17',1);
```

## Step 3
Run this SQL query from a RAWSQL monitor set to import the required search

```
INSERT INTO `sensorchecks` (`Name`, `SQL`, `QueryType`, `ListDATA`, `FolderID`, `GUID) 
SELECT 
    'DC without Recycle Bin' AS `Name`, 
    'Select DISTINCT Computers.ComputerID, Clients.Name as `Client Name`, Computers.Name as `Computer Name`, Computers.Domain, Computers.UserName as `Username`, Computers.ComputerID
From Computers, Clients
Where Computers.ClientID = Clients.ClientID
 and ((Computers.ComputerID in (SELECT DISTINCT computerid FROM computers WHERE computerid IN (SELECT DISTINCT computerid FROM computerroledefinitions WHERE roledefinitionid = (SELECT Roledefinitionid FROM `roledefinitions` WHERE rolename=/'AD Infrastructure Master/') AND CurrentlyDetected =1) AND computerid NOT IN (SELECT DISTINCT computerid FROM computerroledefinitions WHERE roledefinitionid = (SELECT Roledefinitionid FROM `roledefinitions` WHERE roledetectionguid = 'c6de5dcd-7ef6-11e8-b703-000c295e5f17') AND CurrentlyDetected =1))))' AS `SQL`, 
    '4' AS `QueryType`, 
    'Computer ID||\\<=|*(SELECT DISTINCT computerid FROM computers WHERE computerid IN (SELECT DISTINCT computerid FROM computerroledefinitions WHERE roledefinitionid = (SELECT Roledefinitionid FROM `roledefinitions` WHERE rolename=/'AD Infrastructure Master/') AND CurrentlyDetected =1) AND computerid NOT IN (SELECT DISTINCT computerid FROM computerroledefinitions WHERE roledefinitionid = (SELECT Roledefinitionid FROM `roledefinitions` WHERE roledetectionguid = 'c6de5dcd-7ef6-11e8-b703-000c295e5f17') AND CurrentlyDetected =1))|=||=|^Select|||||||^' AS `ListDATA`, 
    '0' AS `FolderID`,
    'a903f855-1c5d-4ac2-9b56-35ff1b189f9c' AS `GUID`
FROM
    (SELECT MIN(computerid) FROM computers) a
WHERE 
    (SELECT COUNT(*) FROM SensorChecks WHERE `GUID` = 'a903f855-1c5d-4ac2-9b56-35ff1b189f9c') = 0
```

## Step 4
Run this SQL query from a RAWSQL monitor set to create and setup the remote monitor on the Domain Controllers group

```
SET @Groupid= (SELECT Groupid FROM mastergroups WHERE `GUID` = '3ac455da-f1fb-11e1-b4ec-1231391d2d19');
SET @searchid = (SELECT sensid FROM sensorchecks WHERE `GUID` = 'a903f855-1c5d-4ac2-9b56-35ff1b189f9c');
SET @Alertaction= (SELECT alertactionid FROM alerttemplate WHERE `GUID` = '0ffdefcc-885e-4b80-bf03-41c146029ec6');

INSERT INTO  
    groupagents
SELECT 
    '' as `AgentID`,
    `groupid` as `GroupID`,
    @Searchid as `SearchID`,
    'ProVal - Production - AD Recycle Bin State Check' as `Name`,
    '6' as `CheckAction`,
    @Alertaction as `AlertAction`,
    '[No Alerting]~~~%STATUS% on %CLIENTNAME%//%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!![No Alerting]~~~%STATUS% on %CLIENTNAME%//%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.' as `AlertMessage`,
    '0' as `ContactID`,
    '86400' as `interval`,
    '127.0.0.1' as `Where`,
    '7' as `What`,
    'C://Windows//System32//WindowsPowerShell//v1.0//powershell.exe -ExecutionPolicy Bypass -Command /"if ((Get-Service -Name /'ADWS/' -Erroraction SilentlyContinue).Status -eq /'Running/') {Import-module ActiveDirectory;$Result = Get-ADOptionalFeature -filter * | Select-Object -ExpandProperty EnabledScopes;if($Result){Write-Output /'Already AD Recycle Bin Enabled/'}else{Write-Output /'AD Recycle Bin Not Enabled/'}}/"' as `DataOut`,
    '16' as `Comparor`,
    '10|^(([//r//n]{1,})%7C(OK)%7C(//s{1,}))$%7C(^$)%7C(Already AD Recycle Bin Enabled)|11|(^(([//r//n]{1,})%7C(OK)%7C(//s{1,}))$%7C(^$)%7C(Already AD Recycle Bin Enabled))%7C(^([//r//n]{0,}AD Recycle Bin Not Enabled[//r//n]{0,})$)|10|^([//r//n]{0,}AD Recycle Bin Not Enabled[//r//n]{0,})$' as `DataIn`,
    '' as `IDField`,
    '1' as `AlertStyle`,
    '0' as `ScriptID`,
    '' as `datacollector`,
    '16' as `Category`,
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
        SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
        SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
        SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
        SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
        SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
        SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
        SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1)
    ) as `GUID`,
    'root' as `UpdatedBy`,
    (NOW()) as `UpdateDate`
FROM  
    mastergroups m
WHERE  
    m.groupid= @Groupid
    AND m.groupid NOT IN (SELECT DISTINCT groupid FROM groupagents WHERE `Name` = 'ProVal - Production - AD Recycle Bin State Check')
```












