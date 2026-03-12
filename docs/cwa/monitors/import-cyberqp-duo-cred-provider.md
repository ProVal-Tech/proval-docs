---
id: '127fa07e-a322-41a7-a993-a820add9af53'
slug: /127fa07e-a322-41a7-a993-a820add9af53
title: 'Import- CyberQP DUO Cred Provider'
title_meta: 'Import- CyberQP DUO Cred Provider'
keywords: ['quickpass', 'agent', 'installation', 'windows', 'deployment', 'duo']
description: 'This document outlines the steps required for creating the remote monitor CyberQP DUO Cred Provider.'
tags: ['installation', 'security', 'software', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-03-12
---

## Steps for Ticket Creation

### 1.
Ensure the presence of the [Script - Enabling the CyberQP Credential Provider while using Duo](/docs/249507b6-c45d-4be0-b1e9-1204a4931c8d) and the `△ Custom - Execute Script - Enable CyberQP DUO` alert template.

---

### 2. Create Search


```sql
INSERT INTO `sensorchecks` 
SELECT 
'' as `SensID`,
'QuickPassServerAgent Running'  as `Name`, 
'SELECT \r\n   computers.computerid as `Computer Id`,\r\n   computers.name as `Computer Name`,\r\n   clients.name as `Client Name`,\r\n   computers.domain as `Computer Domain`,\r\n   computers.username as `Computer User`,\r\n   Services.Name as `Computer.Services.Name`,\r\n   Services.State as `Computer.Services.State`\r\nFROM Computers \r\nLEFT JOIN inv_operatingsystem ON (Computers.ComputerId=inv_operatingsystem.ComputerId)\r\nLEFT JOIN Clients ON (Computers.ClientId=Clients.ClientId)\r\nLEFT JOIN Locations ON (Computers.LocationId=Locations.LocationID)\r\nLEFT JOIN Services ON (services.ComputerId = Computers.ComputerId)\r\n WHERE \r\n((((Services.Name = \'QuickpassServerAgent\') AND (Services.State = \'Running\'))))\r\n' as `SQL`,
'4' as `QueryType`,
'Select||=||=||=|^Select|||||||^' as `ListData`,
'0' as `FolderID`,
'1a86f126-3424-4458-adfa-898e82c86b01' as `GUID`,
'<LabTechAbstractSearch><asn><st>AndNode</st><cn><asn><st>AndNode</st><cn><asn><st>ComparisonNode</st><lon>Computer.Services.Name</lon><lok>Computer.Services.Name</lok><lmo>Equals</lmo><dv>QuickpassServerAgent</dv><dk>QuickpassServerAgent</dk></asn><asn><st>ComparisonNode</st><lon>Computer.Services.State</lon><lok>Computer.Services.State</lok><lmo>Equals</lmo><dv>Running</dv><dk>Running</dk></asn></cn></asn></cn></asn></LabTechAbstractSearch>' as `SearchXML`,
(NULL) as `UpdatedBy`,
(NULL) as `UpdateDate`
FROM  (SELECT MIN(computerid) FROM computers) a
Where (SELECT count(*) From SensorChecks where `GUID` = '1a86f126-3424-4458-adfa-898e82c86b01') = 0 ;
```

### 3. Create Group bind to search

```sql
SET @Searchid = (SELECT sensid from sensorchecks where `GUID` = '1a86f126-3424-4458-adfa-898e82c86b01') ;
SET @Parentid = (SELECT MIN(groupid) FROM mastergroups WHERE `Name` = '_System Automation') ;
SET @Parents = (SELECT CONCAT(',',MIN(groupid),',') FROM mastergroups WHERE `Name` = '_System Automation') ;
INSERT INTO `mastergroups`  
SELECT
'' as `GroupID`,
@ParentID as `ParentID`,
@Parents as `Parents`,
',' as Children,
'1' as `Depth`,
'QuickPassServerAgent Running' as `Name`,
'_System Automation.QuickPassServerAgent Running' as `FullName`,
'0' as `Permissions`,
'0' as `Template`,
@SearchID as `AutoJoinScript`,
'2' as `Master`,
'1' as `LimitToParent`,
'0' as `Control`,
'0' as `ControlID`,
'' as `Notes`,
'0' as `MaintenanceID`,
(NOW()) as `MaintWindowApplied`,
'4' as `GroupType`,
'5' as `Priority`,
'681f17b8-1e55-11f1-9c73-92000234cfc2' as `GUID`,
(NULL) as `AssetID`,
(NULL) as `NetworkPermissions`, 
'0' as `NetworkJoin`,
'0' as `NetworkJoinOptions`,
(NULL) as  `ContactPermissions`, 
'0' as `ContactJoin`, 
'0' as `ContactJoinOptions`
FROM  (SELECT MIN(computerid) FROM computers) a
Where (SELECT count(*) From MasterGroups where `GUID` =  '681f17b8-1e55-11f1-9c73-92000234cfc2' ) = 0 ;
```

### 4. Create Remote monitor to the created group with "Default - Do Nothing"


```sql
SET @Groupid = (SELECT Groupid From MasterGroups where `GUID` =  '681f17b8-1e55-11f1-9c73-92000234cfc2' ) ;

INSERT INTO groupagents 
SELECT '' as `AgentID`,
`groupid` as `GroupID`,
'0' as `SearchID`,
'ProVal Production - CyberQP DUO Cred Provider' as `Name`,
'6' as `CheckAction`,
1 as `AlertAction`,
'[No Alerting]~~~%STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!![No Alerting]~~~%STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.' as `AlertMessage`,
'0' as `ContactID`,
'14400' as `interval`,
'127.0.0.1' as `Where`,
'7' as `What`,
'C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\powershell.exe -NoProfile -ExecutionPolicy Bypass -Command "$apps=@(\'Quickpass Agent (64-bit)\',\'Duo Authentication for Windows Logon x64\'); $inst=(Get-ChildItem \'HKLM:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Uninstall\',\'HKLM:\\SOFTWARE\\Wow6432Node\\Microsoft\\Windows\\CurrentVersion\\Uninstall\' | Get-ItemProperty | Where-Object { $_.DisplayName } | Select-Object -ExpandProperty DisplayName); $quick=$inst -contains \'Quickpass Agent (64-bit)\'; $duo=$inst -contains \'Duo Authentication for Windows Logon x64\'; $missing=$apps | Where-Object { $inst -notcontains $_ }; $p1=\'HKLM:\\SOFTWARE\\Duo Security\'; $p2=\\"$p1\\DuoCredProv\\"; $name=\'ProvidersWhitelist\'; $expected=\'{67D6B25B-3419-4C60-A4B5-A7CE535AD300}\'; if (-not (Test-Path $p1)) { $duoSetting=\'No action\' } elseif (-not (Test-Path $p2)) { $duoSetting=\'DUO Setting required\' } else { try { $val=(Get-ItemProperty -Path $p2 -Name $name -ErrorAction Stop).$name; if ($null -eq $val) { $duoSetting=\'DUO Setting required\' } elseif (($val -is [array] -and ($val -contains $expected)) -or ($val -is [string] -and $val -eq $expected)) { $duoSetting=\'No action\' } else { $duoSetting=\'DUO Setting required\' } } catch { $duoSetting=\'DUO Setting required\' } }; [pscustomobject]@{ QuickpassInstalled=$quick; DuoInstalled=$duo; MissingApps=($missing -join \', \'); DuoWhitelist=$duoSetting } | ConvertTo-Json -Compress"' as `DataOut`,
'9' as `Comparor`,
'DUO Setting required' as `DataIn`,
'0' as `IDField`,
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
FROM mastergroups m
WHERE m.groupid = @Groupid
AND m.groupid NOT IN  (SELECT DISTINCT groupid FROM groupagents WHERE `Name` = 'ProVal Production - CyberQP DUO Cred Provider') ;
```

---

### 5.
Now execute your query from a RAWSQL monitor set.

---

### 6.
Locate your remote monitor by opening the `QuickPassServerAgent Running` remote monitors tab, then apply the `△ Custom - Execute Script - Enable CyberQP DUO` alert template.

## Changelog

### 2026-03-12

- Added this new remote monitor to enable the CyberQP Credential Provider while using Duo automatically using the autofix [Script - Enabling the CyberQP Credential Provider while using Duo](/docs/249507b6-c45d-4be0-b1e9-1204a4931c8d) trigger on the detected agents where monitor failed.
