---
id: '0fd5ce6e-ad48-4198-a69f-55dc16865b05'
slug: /0fd5ce6e-ad48-4198-a69f-55dc16865b05
title: 'Lockdown Browsers Autofill'
title_meta: 'Lockdown Browsers Autofill'
keywords: ['lockdown', 'browsers', 'configuration', 'edfs', 'remote', 'monitors']
description: 'This document provides a comprehensive guide to configuring lockdown settings for browsers within a ConnectWise Automate environment. It includes steps for importing client, location, and computer level Extra Data Fields (EDFs), creating searches and groups, and setting up remote monitors to ensure effective management of browser lockdown features.'
tags: ['security', 'setup', 'software']
draft: false
unlisted: false
---

## Step 1
Execute the provided SQL query from a RAWSQL monitor set in the provided order to import the following contents:

- **Client Level EDFs:**
  - Lockdown Browsers Password Manager
  - Lockdown Browsers Credit Card Autofill
  - Lockdown Browsers Address Autofill

- **Location Level EDFs:**
  - Exclude Browser Lockdown
  - Exclude Browser Credit Card Lockdown
  - Lockdown Browsers Address Autofill

- **Computer Level EDFs:**
  - Exclude Browser Lockdown
  - Exclude Browser Credit Card Lockdown
  - Lockdown Browsers Address Autofill

- **Searches:**
  - Lockdown Browsers Autofill
  - Lockdown Browsers Password Manager
  - Lockdown Browsers Credit Card Autofill
  - Lockdown Browsers Address Autofill

- **Groups:**
  - △ System Monitoring
    - △ Lockdown Browsers Autofill

- **Remote Monitors:**
  - ProVal - Production - Lockdown Browsers Password Manager
  - ProVal - Production - Lockdown Chromium Browsers Credit Card Autofill
  - ProVal - Production - Lockdown Chromium Browsers Address Autofill

## Step 2
### Remove Existing Content

```sql
DELETE FROM groupagents WHERE groupid = (SELECT DISTINCT groupid FROM mastergroups WHERE `GUID` = 'eea5f14b-c12a-11ee-a53f-960002890dfa');
DELETE FROM mastergroups WHERE `GUID` = 'eea5f14b-c12a-11ee-a53f-960002890dfa';
DELETE FROM sensorchecks WHERE `GUID` = '80d153cb-440b-4312-9191-a9f5dd20744a';
```

## Step 3
### Create EDFs

```sql
INSERT IGNORE INTO `extrafield`
  (`Form`, `Name`, `Sort`, `NoBreak`, `FType`, `Section`, `UnEditable`, `Collapsed`, `Fill`, `LtGuid`, `IsPassword`, `IsEncrypted`, `IsHidden`, `IsRestricted`, `ViewPermissions`, `EditPermissions`)
VALUES
  (1, 'Exclude Browser Password Lockdown', 0, 0, 1, 'Exclusions', 0, 0, '', '427b21d2-e43a-4638-b692-3a15f56f7092', 0, 0, 0, 0, '', ''),
  (2, 'Exclude Browser Password Lockdown', 0, 0, 1, 'Exclusions', 0, 0, '', '5dd1e888-f7f8-4e2d-af53-b6cac8c00efb', 0, 0, 0, 0, '', ''),
  (1, 'Exclude Browser Address Autofill Lockdown', 0, 0, 1, 'Exclusions', 0, 0, '', '2de882af-81ea-4300-b410-d6c155239a83', 0, 0, 0, 0, '', ''),
  (2, 'Exclude Browser Credit Card Lockdown', 0, 0, 1, 'Exclusions', 0, 0, '', '5126b37d-1d63-456c-b44b-180871bd5d97', 0, 0, 0, 0, '', ''),
  (1, 'Exclude Browser Credit Card Lockdown', 0, 0, 1, 'Exclusions', 0, 0, '', '3eb6042d-68f3-4c87-b2cf-72d69bb57e45', 0, 0, 0, 0, '', ''),
  (2, 'Exclude Browser Address Autofill Lockdown', 0, 0, 1, 'Exclusions', 0, 0, '', 'ffd807a0-62a6-4cfa-86e6-d90cfc9f0f3c', 0, 0, 0, 0, '', ''),
  (3, 'Lockdown Browsers Password Manager', 0, 0, 1, 'Security', 0, 0, '', '611dcf5a-b316-4986-a624-a176efe4b5c6', 0, 0, 0, 0, '', ''),
  (3, 'Lockdown Browsers Credit Card Autofill', 0, 0, 1, 'Security', 0, 0, '', 'e74a03bc-b190-4ccb-9c29-95d7f3b23c1f', 0, 0, 0, 0, '', ''),
  (3, 'Lockdown Browsers Address Autofill', 0, 0, 1, 'Security', 0, 0, '', '3c002fdd-a25a-4bc2-bb1e-1a6f7af67432', 0, 0, 0, 0, '', '');
CALL v_extradata(1,'computers');
CALL v_ExtraDataRefresh(1,'computers');
CALL v_extradata(2,'locations');
CALL v_ExtraDataRefresh(2,'locations');
CALL v_extradata(3,'clients');
CALL v_ExtraDataRefresh(3,'clients');
```

## Step 4
### Create Searches

```sql
INSERT INTO `sensorchecks`
  (`Name`, `SQL`, `QueryType`, `ListDATA`, `FolderID`, `GUID`, `SearchXML`)
SELECT
  'Lockdown Browsers Autofill' AS `Name`,
  'SELECT 
    computers.computerid AS `Computer Id`,
    computers.name AS `Computer Name`,
    clients.name AS `Client Name`,
    computers.domain AS `Computer Domain`,
    computers.username AS `Computer User`,
    IF(INSTR(IFNULL(inv_operatingsystem.Name, Computers.OS), \'windows\') > 0, 1, IF(INSTR(IFNULL(inv_operatingsystem.Name, Computers.OS), \'darwin\') > 0, 2, 3)) AS `Computer.OS.Type`,
    IFNULL(IFNULL(edfAssigned1.Value, edfDefault1.value), '0') AS `Computer - Client - Extra Data Field - Security - Lockdown Browsers Password Manager`,
    IFNULL(IFNULL(edfAssigned2.Value, edfDefault2.value), '0') AS `Computer - Client - Extra Data Field - Security - Lockdown Browsers Credit Card Autofill`,
    IFNULL(IFNULL(edfAssigned3.Value, edfDefault3.value), '0') AS `Computer - Client - Extra Data Field - Security - Lockdown Browsers Address Autofill`
FROM Computers 
LEFT JOIN inv_operatingsystem ON (Computers.ComputerId = inv_operatingsystem.ComputerId)
LEFT JOIN Clients ON (Computers.ClientId = Clients.ClientId)
LEFT JOIN Locations ON (Computers.LocationId = Locations.LocationID)
LEFT JOIN ExtraFieldData edfAssigned1 ON (edfAssigned1.id = Clients.ClientId AND edfAssigned1.ExtraFieldId = (SELECT ExtraField.id FROM ExtraField WHERE LTGuid = '611dcf5a-b316-4986-a624-a176efe4b5c6'))
LEFT JOIN ExtraFieldData edfDefault1 ON (edfDefault1.id = 0 AND edfDefault1.ExtraFieldId = (SELECT ExtraField.id FROM ExtraField WHERE LTGuid = '611dcf5a-b316-4986-a624-a176efe4b5c6'))
LEFT JOIN ExtraFieldData edfAssigned2 ON (edfAssigned2.id = Clients.ClientId AND edfAssigned2.ExtraFieldId = (SELECT ExtraField.id FROM ExtraField WHERE LTGuid = 'e74a03bc-b190-4ccb-9c29-95d7f3b23c1f'))
LEFT JOIN ExtraFieldData edfDefault2 ON (edfDefault2.id = 0 AND edfDefault2.ExtraFieldId = (SELECT ExtraField.id FROM ExtraField WHERE LTGuid = 'e74a03bc-b190-4ccb-9c29-95d7f3b23c1f'))
LEFT JOIN ExtraFieldData edfAssigned3 ON (edfAssigned3.id = Clients.ClientId AND edfAssigned3.ExtraFieldId = (SELECT ExtraField.id FROM ExtraField WHERE LTGuid = '3c002fdd-a25a-4bc2-bb1e-1a6f7af67432'))
LEFT JOIN ExtraFieldData edfDefault3 ON (edfDefault3.id = 0 AND edfDefault3.ExtraFieldId = (SELECT ExtraField.id FROM ExtraField WHERE LTGuid = '3c002fdd-a25a-4bc2-bb1e-1a6f7af67432'))
WHERE 
((((IF(INSTR(IFNULL(inv_operatingsystem.Name, Computers.OS), 'windows') > 0, 1, IF(INSTR(IFNULL(inv_operatingsystem.Name, Computers.OS), 'darwin') > 0, 2, 3)) = '1') AND (((IFNULL(IFNULL(edfAssigned1.Value, edfDefault1.value), '0') <> 0) OR (IFNULL(IFNULL(edfAssigned2.Value, edfDefault2.value), '0') <> 0) OR (IFNULL(IFNULL(edfAssigned3.Value, edfDefault3.value), '0') <> 0))))))' AS `SQL`,
  '4' AS `QueryType`,
  'Select||=||=||=|^Select|||||||^' AS `ListData`,
  '0' AS `FolderID`,
  '80d153cb-440b-4312-9191-a9f5dd20744a' AS `GUID`,
  '<LabTechAbstractSearch><asn><st>AndNode</st><cn><asn><st>AndNode</st><cn><asn><st>ComparisonNode</st><lon>Computer.OS.Type</lon><lok>Computer.OS.Type</lok><lmo>Equals</lmo><dv>Windows</dv><dk>1</dk></asn><asn><st>OrNode</st><cn><asn><st>ComparisonNode</st><lon>Computer.Client.Extra Data Field.Security.Lockdown Browsers Password Manager</lon><lok>Computer.Client.Edf.611dcf5a-b316-4986-a624-a176efe4b5c6</lok><lmo>IsTrue</lmo><dv>NULL</dv><dk>NULL</dk></asn><asn><st>ComparisonNode</st><lon>Computer.Client.Extra Data Field.Security.Lockdown Browsers Credit Card Autofill</lon><lok>Computer.Client.Edf.e74a03bc-b190-4ccb-9c29-95d7f3b23c1f</lok><lmo>IsTrue</lmo><dv>NULL</dv><dk>NULL</dk></asn><asn><st>ComparisonNode</st><lon>Computer.Client.Extra Data Field.Security.Lockdown Browsers Address Autofill</lon><lok>Computer.Client.Edf.3c002fdd-a25a-4bc2-bb1e-1a6f7af67432</lok><lmo>IsTrue</lmo><dv>NULL</dv><dk>NULL</dk></asn></cn></asn></cn></asn></cn></LabTechAbstractSearch>' AS `SearchXML`
FROM  
  (SELECT MIN(computerid) FROM computers) a
WHERE  
  (SELECT COUNT(*) FROM SensorChecks WHERE `GUID` = '80d153cb-440b-4312-9191-a9f5dd20744a') = 0;
```

## Step 5
### Create Groups

```sql
INSERT IGNORE INTO `mastergroups` (
  `ParentID`, `Parents`, `Children`,
  `depth`, `Name`, `FullName`, `Permissions`,
  `Template`, `AutoJoinScript`, `Master`,
  `LimitToParent`, `Control`, `ControlID`,
  `Notes`, `MaintenanceID`, `MaintWindowApplied`,
  `GroupType`, `Priority`, `GUID`,
  `assetID`, `NetworkPermissions`,
  `NetworkJoin`, `NetworkJoinOptions`,
  `ContactPermissions`, `ContactJoin`,
  `ContactJoinOptions`
) 
VALUES 
(
  0,
  ',',
  ',',
  0,
  '△ System Monitoring',
  '△ System Monitoring',
  0,
  0,
  0,
  2,
  0,
  0,
  0,
  '',
  0,
  (NOW()),
  5,
  5,
  '1749280f-9114-11ed-9c83-000c295e5f17',
  NULL,
  NULL,
  0,
  0,
  NULL,
  0,
  0
);
SET 
  @searchid = (
    SELECT 
      DISTINCT sensid 
    FROM 
      sensorchecks 
    WHERE 
      `GUID` = '80d153cb-440b-4312-9191-a9f5dd20744a'
  );
SET 
  @parentid = (
    SELECT 
      groupid 
    FROM 
      mastergroups 
    WHERE 
      GUID = '1749280f-9114-11ed-9c83-000c295e5f17'
  );
SET 
  @parents = CONCAT(',', @parentid, ',');
INSERT IGNORE INTO `mastergroups` (
  `ParentID`, `Parents`, `Children`,
  `depth`, `Name`, `FullName`, `Permissions`,
  `Template`, `AutoJoinScript`, `Master`,
  `LimitToParent`, `Control`, `ControlID`,
  `Notes`, `MaintenanceID`, `MaintWindowApplied`,
  `GroupType`, `Priority`, `GUID`,
  `NetworkJoin`, `NetworkJoinOptions`,
  `ContactJoin`, `ContactJoinOptions`
) 
VALUES 
(
  @parentid, @parents, ',', 1, '△ Lockdown Browsers Autofill',
  '△ System Monitoring.△ Lockdown Browsers Autofill',
  0, 0, @searchid, 2, 1, 0, 0, '', 0, NOW(),
  5, 5, 'eea5f14b-c12a-11ee-a53f-960002890dfa',
  0, 0, 0, 0
);
```

## Step 6
### Create Remote Monitors

```sql
SET @groupid = (SELECT groupid FROM mastergroups WHERE `GUID` = 'eea5f14b-c12a-11ee-a53f-960002890dfa');
SET @searchid = (SELECT SensID FROM sensorchecks WHERE `GUID` = '40d97d6b-8726-48f3-ac28-eeaed20f75d7');
INSERT INTO groupagents 
  SELECT '' AS `AgentID`,
  `groupid` AS `GroupID`,
  @Searchid AS `SearchID`,
  'ProVal - Production - Lockdown Browsers Password Manager' AS `Name`,
  '6' AS `CheckAction`,
  '1' AS `AlertAction`,
  'Browsers Password Manager Lockdown - Failed on %CLIENTNAME%\\\\%COMPUTERNAME%~~~Successfully Disabled the Password Manager for the Installed Browsers. !!!Browsers Password Manager Lockdown - Failed on %CLIENTNAME%\\\\%COMPUTERNAME%~~~Password Manager Lockdown failed on %CLIENTNAME%\\\\%COMPUTERNAME%. The script was unable to disable the Password Manager on the following browsers:%RESULT%Manual investigation is required.' AS `AlertMessage`,
  '0' AS `ContactID`,
  '604800' AS `interval`,
  '127.0.0.1' AS `Where`,
  '7' AS `What`,
  'C:\\\\Windows\\\\System32\\\\WindowsPowerShell\\\\v1.0\\\\powershell.exe -ExecutionPolicy Bypass -Command /\"$erroractionpreference = \\'silentlycontinue\\'; $browsers = @{\\'Google Chrome\\' = \\'HKLM:\\\\Software\\\\Policies\\\\Google\\\\Chrome\\'; \\'Microsoft Edge\\' = \\'HKLM:\\\\SOFTWARE\\\\Policies\\\\Microsoft\\\\Edge\\'; Brave = \\'HKLM:\\\\SOFTWARE\\\\Policies\\\\BraveSoftware\\\\Brave\\'; \\'Mozilla Firefox\\' = \\'HKLM:\\\\Software\\\\Policies\\\\Mozilla\\\\Firefox\\'}; function find-application {Param([Parameter()][String]$Name); if (Get-ChildItem -Path HKLM:\\\\SOFTWARE\\\\Microsoft\\\\Windows\\\\CurrentVersion\\\\Uninstall, HKLM:\\\\SOFTWARE\\\\Wow6432Node\\\\Microsoft\\\\Windows\\\\CurrentVersion\\\\Uninstall | Get-ItemProperty | Where-Object { $_.DisplayName -match $name }) {return $true} else {return $false} }; function check-regvalue { Param([Parameter()][String]$path); (Get-ItemProperty -Path $path ).passwordmanagerenabled }; function set-regvalue { Param([Parameter()][String]$path) ;  if ( ( check-regvalue -path $path ) -ne \\'0\\' ) { if ( !( Test-Path $path ) ) { New-Item -Path $path -Force | Out-Null }; Set-ItemProperty -Path $path -Name PasswordManagerEnabled -Value 0 -Force } } ; $failed=@(); foreach ( $browser in $browsers.Keys ) { if ( find-application -Name $browser ) { set-regvalue -Path $browsers.($browser); if ( ( check-regvalue -path $browsers.($browser) ) -ne \\'0\\' ) { $failed += $browser } } }; if ( $failed ) { return \\\\/\"Failed: $($failed)\\\\/\" }/"' AS `DataOut`,
  '16' AS `Comparor`,
  '10|(^((OK){0,}(\\\\r\\\\n){0,}[\\\\r\\\\n]{0,}\\\\s{0,})$)|11|(^((OK){0,}(\\\\r\\\\n){0,}[\\\\r\\\\n]{0,}\\\\s{0,})$)%7C(Failed: ((Google Chrome)%7C(Brave)%7C(Microsoft Edge)))|10|(Failed: ((Google Chrome)%7C(Brave)%7C(Microsoft Edge)))' AS `DataIn`,
  '' AS `IDField`,
  '0' AS `AlertStyle`,
  '0' AS `ScriptID`,
  '' AS `datacollector`,
  '21' AS `Category`,
  '0' AS `TicketCategory`,
  '1' AS `ScriptTarget`,
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
    SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1)
  ) AS `GUID`,
  'root' AS `UpdatedBy`,
  (NOW()) AS `UpdateDate`
FROM mastergroups m
WHERE m.groupid = @groupid
AND m.groupid NOT IN (SELECT DISTINCT groupid FROM groupagents WHERE `Name` = 'ProVal - Production - Lockdown Browsers Password Manager');
SET @groupid = (SELECT groupid FROM mastergroups WHERE `GUID` = 'eea5f14b-c12a-11ee-a53f-960002890dfa');
SET @searchid = (SELECT SensID FROM sensorchecks WHERE `GUID` = 'bcfaf65a-4eb7-4cf9-9496-0c94ae86e59b');
INSERT INTO groupagents 
  SELECT '' AS `AgentID`,
  `groupid` AS `GroupID`,
  @searchid AS `SearchID`,
  'ProVal - Production - Lockdown Chromium Browsers Credit Card Autofill' AS `Name`,
  '6' AS `CheckAction`,
  '1' AS `AlertAction`,
  'Chromium Browsers Credit Cards Autofill Lockdown - Failed on %CLIENTNAME%\\\\%COMPUTERNAME%~~~Successfully Disabled the Credit Cards Autofill for the Installed Browsers. !!!Chromium Browsers Credit Cards Autofill Lockdown - Failed on %CLIENTNAME%\\\\%COMPUTERNAME%~~~Credit Cards Autofill Lockdown Failed on %CLIENTNAME%\\\\%COMPUTERNAME%. The script was unable to disable the Autofill of Credit Cards on the following browsers:%RESULT%Manual investigation is required.' AS `AlertMessage`,
  '0' AS `ContactID`,
  '604800' AS `interval`,
  '127.0.0.1' AS `Where`,
  '7' AS `What`,
  'C:\\\\Windows\\\\System32\\\\WindowsPowerShell\\\\v1.0\\\\powershell.exe -ExecutionPolicy Bypass -Command /\"$ErrorActionPreference = \\'SilentlyContinue\\';$browsers = @{\\'Google Chrome\\' = \\'HKLM:\\\\Software\\\\Policies\\\\Google\\\\Chrome\\';\\'Microsoft Edge\\' = \\'HKLM:\\\\SOFTWARE\\\\Policies\\\\Microsoft\\\\Edge\\';\\'Brave\\' = \\'HKLM:\\\\SOFTWARE\\\\Policies\\\\BraveSoftware\\\\Brave\\'}; Function Find-Application { Param([Parameter()][String]$Name); if ( Get-ChildItem -Path HKLM:\\\\SOFTWARE\\\\Microsoft\\\\Windows\\\\CurrentVersion\\\\Uninstall, HKLM:\\\\SOFTWARE\\\\Wow6432Node\\\\Microsoft\\\\Windows\\\\CurrentVersion\\\\Uninstall | Get-ItemProperty | Where-Object { $_.DisplayName -match /\"$Name/\" } ) { return $Name } else { return $false } }; Function Get-RegValue { Param([Parameter()][String]$path,$Reg); ( Get-ItemProperty -Path $path )./\"$Reg/\" }; Function Set-RegValue { Param([Parameter()][String]$path,$Reg); if ( ( Get-RegValue -path $path -Reg $Reg ) -ne \\'0\\' ) { if ( !( Test-Path $path ) ) { New-Item -Path $path -Force | Out-Null }; Set-ItemProperty -Path $path -Name $Reg -Value 0 -Force } }; $failed = @(); foreach ( $browser in $browsers.Keys ) { if ( Find-Application -Name $browser ) { foreach ( $Reg in (\\'AutofillCreditCardEnabled\\', \\'PaymentMethodQueryEnabled\\') ) { Set-RegValue -Path $browsers.($browser) -Reg $Reg; if ( ( Get-RegValue -path $browsers.($browser) -Reg $Reg ) -ne \\'0\\' ) { $failed += $browser } } } }; if ( $failed ) { return \\\\/\"Failed: $($failed)\\\\/\" }/"' AS `DataOut`,
  '16' AS `Comparor`,
  '10|(^((OK){0,}(\\\\r\\\\n){0,}[\\\\r\\\\n]{0,}\\\\s{0,})$)|11|(^((OK){0,}(\\\\r\\\\n){0,}[\\\\r\\\\n]{0,}\\\\s{0,})$)%7C(Failed: ((Google Chrome)%7C(Brave)%7C(Microsoft Edge)))|10|(Failed: ((Google Chrome)%7C(Brave)%7C(Microsoft Edge)))' AS `DataIn`,
  '' AS `IDField`,
  '0' AS `AlertStyle`,
  '0' AS `ScriptID`,
  '' AS `datacollector`,
  '21' AS `Category`,
  '0' AS `TicketCategory`,
  '1' AS `ScriptTarget`,
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
    SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1)
  ) AS `GUID`,
  'root' AS `UpdatedBy`,
  (NOW()) AS `UpdateDate`
FROM mastergroups m
WHERE m.groupid = @groupid
AND m.groupid NOT IN (SELECT DISTINCT groupid FROM groupagents WHERE `Name` = 'ProVal - Production - Lockdown Chromium Browsers Credit Card Autofill');
```

## Step 7
Reload System Cache

## Step 8
Refresh Searches and Groups.

## Step 9
Confirm the presence of the following remote monitors on the `△ Lockdown Browsers Autofill` group:

- ProVal - Production - Lockdown Browsers Password Manager
- ProVal - Production - Lockdown Chromium Browsers Credit Card Autofill
- ProVal - Production - Lockdown Chromium Browsers Address Autofill