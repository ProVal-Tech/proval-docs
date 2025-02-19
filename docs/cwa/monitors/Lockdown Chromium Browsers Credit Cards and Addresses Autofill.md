---
id: 'b78c363d-7a4b-4d10-b4ab-38b348dd81f5'
title: 'Lockdown Chromium Browsers Credit Cards and Addresses Autofill'
title_meta: 'Lockdown Chromium Browsers Credit Cards and Addresses Autofill'
keywords: ['lockdown', 'browsers', 'password', 'manager', 'implementation']
description: 'This document provides a detailed guide on implementing the Lockdown Browsers Password Manager using SQL queries and creating necessary groups and monitors in the ConnectWise Automate environment. Follow the steps to ensure proper setup and configuration.'
tags: ['database', 'security', 'setup']
draft: false
unlisted: false
---

## Step 1
Execute the provided SQL query from a RAWSQL monitor set to import the following contents:

- **Client Level EDF:** Lockdown Browsers Password Manager
- **Location Level EDF:** Exclude Browser Lockdown
- **Computer Level EDF:** Exclude Browser Lockdown
- **Search:** Lockdown Browsers Password Manager
- **Group:** △ Lockdown Browsers Password Manager
- **Remote Monitor:** ProVal - Production - Lockdown Chromium Browsers Credit Cards and Addresses Autofill

```sql
# Create EDFs
INSERT IGNORE INTO `extrafield` 
    (`Form`, `Name`, `Sort`, `NoBreak`, `FType`, `Section`, `UnEditable`, `Collapsed`, `Fill`, `LtGuid`, `IsPassword`, `IsEncrypted`, `IsHidden`, `IsRestricted`, `ViewPermissions`, `EditPermissions`) 
    VALUES 
    (2, 'Exclude Browser Lockdown', 0, 0, 1, 'Exclusions', 0, 0, '', '5dd1e888-f7f8-4e2d-af53-b6cac8c00efb', 0, 0, 0, 0, '', ''),
    (1, 'Exclude Browser Lockdown', 0, 0, 1, 'Exclusions', 0, 0, '', '427b21d2-e43a-4638-b692-3a15f56f7092', 0, 0, 0, 0, '', ''),
    (3, 'Lockdown Browsers Password Manager', 0, 0, 1, 'Security', 0, 0, '', '611dcf5a-b316-4986-a624-a176efe4b5c6', 0, 0, 0, 0, '', '');
CALL v_extradata(1,'computers');
CALL v_ExtraDataRefresh(1,'computers');
CALL v_extradata(2,'locations');
CALL v_ExtraDataRefresh(2,'locations');
CALL v_extradata(3,'clients');
CALL v_ExtraDataRefresh(3,'clients');

# Create Search 
INSERT INTO `sensorchecks` 
    (`Name`, `SQL`, `QueryType`, `ListDATA`, `FolderID`, `GUID`, `SearchXML`)
SELECT 
    'Lockdown Browsers Password Manager' AS `Name`, 
    'SELECT 
       computers.computerid AS `Computer Id`,
       computers.name AS `Computer Name`,
       clients.name AS `Client Name`,
       computers.domain AS `Computer Domain`,
       computers.username AS `Computer User`,
       IFNULL(IFNULL(edfAssigned1.Value,edfDefault1.value),'0') AS `Computer - Client - Extra Data Field - Security - Lockdown Browsers Password Manager`,
       IFNULL(IFNULL(edfAssigned2.Value,edfDefault2.value),'0') AS `Computer - Location - Extra Data Field - Exclusions - Exclude Browser Lockdown`,
       IFNULL(IFNULL(edfAssigned3.Value,edfDefault3.value),'0') AS `Computer - Extra Data Field - Exclusions - Exclude Browser Lockdown`,
       IF(INSTR(IFNULL(inv_operatingsystem.Name, Computers.OS), 'windows') > 0, 1, IF(INSTR(IFNULL(inv_operatingsystem.Name, Computers.OS), 'darwin') > 0, 2, 3)) AS `Computer.OS.Type`
FROM Computers 
LEFT JOIN inv_operatingsystem ON (Computers.ComputerId=inv_operatingsystem.ComputerId)
LEFT JOIN Clients ON (Computers.ClientId=Clients.ClientId)
LEFT JOIN Locations ON (Computers.LocationId=Locations.LocationID)
LEFT JOIN ExtraFieldData edfAssigned1 ON (edfAssigned1.id=Clients.ClientId AND edfAssigned1.ExtraFieldId =(SELECT ExtraField.id FROM ExtraField WHERE LTGuid='611dcf5a-b316-4986-a624-a176efe4b5c6'))
LEFT JOIN ExtraFieldData edfDefault1 ON (edfDefault1.id=0 AND edfDefault1.ExtraFieldId =(SELECT ExtraField.id FROM ExtraField WHERE LTGuid='611dcf5a-b316-4986-a624-a176efe4b5c6'))
LEFT JOIN ExtraFieldData edfAssigned2 ON (edfAssigned2.id=Locations.LocationId AND edfAssigned2.ExtraFieldId =(SELECT ExtraField.id FROM ExtraField WHERE LTGuid='5dd1e888-f7f8-4e2d-af53-b6cac8c00efb'))
LEFT JOIN ExtraFieldData edfDefault2 ON (edfDefault2.id=0 AND edfDefault2.ExtraFieldId =(SELECT ExtraField.id FROM ExtraField WHERE LTGuid='5dd1e888-f7f8-4e2d-af53-b6cac8c00efb'))
LEFT JOIN ExtraFieldData edfAssigned3 ON (edfAssigned3.id=Computers.ComputerId AND edfAssigned3.ExtraFieldId =(SELECT ExtraField.id FROM ExtraField WHERE LTGuid='427b21d2-e43a-4638-b692-3a15f56f7092'))
LEFT JOIN ExtraFieldData edfDefault3 ON (edfDefault3.id=0 AND edfDefault3.ExtraFieldId =(SELECT ExtraField.id FROM ExtraField WHERE LTGuid='427b21d2-e43a-4638-b692-3a15f56f7092'))
WHERE 
((((IFNULL(IFNULL(edfAssigned1.Value,edfDefault1.value),'0') <> 0) AND (IFNULL(IFNULL(edfAssigned2.Value,edfDefault2.value),'0') = 0) AND (IFNULL(IFNULL(edfAssigned3.Value,edfDefault3.value),'0') = 0) AND (IF(INSTR(IFNULL(inv_operatingsystem.Name, Computers.OS), 'windows') > 0, 1, IF(INSTR(IFNULL(inv_operatingsystem.Name, Computers.OS), 'darwin') > 0, 2, 3)) = '1')))) 
' AS `SQL`,
    '4' AS `QueryType`,
    'Select||=||=||=|^Select|||||||^' AS `ListData`,
    '0' AS `FolderID`,
    '80d153cb-440b-4312-9191-a9f5dd20744a' AS `GUID`,
    '<LabTechAbstractSearch><asn><st>AndNode</st><cn><asn><st>AndNode</st><cn><asn><st>ComparisonNode</st><lon>Computer.Client.Extra Data Field.Security.Lockdown Browsers Password Manager</lon><lok>Computer.Client.Edf.611dcf5a-b316-4986-a624-a176efe4b5c6</lok><lmo>IsTrue</lmo><dv>NULL</dv><dk>NULL</dk></asn><asn><st>ComparisonNode</st><lon>Computer.Location.Extra Data Field.Exclusions.Exclude Browser Lockdown</lon><lok>Computer.Location.Edf.5dd1e888-f7f8-4e2d-af53-b6cac8c00efb</lok><lmo>IsFalse</lmo><dv>NULL</dv><dk>NULL</dk></asn><asn><st>ComparisonNode</st><lon>Computer.Extra Data Field.Exclusions.Exclude Browser Lockdown</lon><lok>Computer.Edf.427b21d2-e43a-4638-b692-3a15f56f7092</lok><lmo>IsFalse</lmo><dv>NULL</dv><dk>NULL</dk></asn><asn><st>ComparisonNode</st><lon>Computer.OS.Type</lon><lok>Computer.OS.Type</lok><lmo>Equals</lmo><dv>Windows</dv><dk>1</dk></asn></cn></asn></cn></asn></LabTechAbstractSearch>' AS `SearchXML`
FROM  
    (SELECT MIN(computerid) FROM computers) a
WHERE  
    (SELECT count(*) FROM SensorChecks WHERE `GUID` = '80d153cb-440b-4312-9191-a9f5dd20744a') = 0;

# Create Group
INSERT IGNORE INTO `mastergroups` 
    (`ParentID`, `Parents`, `Children`, `depth`, `Name`, `FullName`, `Permissions`, `Template`, `AutoJoinScript`, `Master`, `LimitToParent`, `Control`, `ControlID`, `Notes`, `MaintenanceID`, `MaintWindowApplied`, `GroupType`, `Priority`, `GUID`, `assetID`, `NetworkPermissions`, `NetworkJoin`, `NetworkJoinOptions`, `ContactPermissions`, `ContactJoin`, `ContactJoinOptions`) 
VALUES 
    (0, ',', ',', 0, '△ System Monitoring', '△ System Monitoring', 0, 0, 0, 2, 0, 0, 0, '', 0, (NOW()), 5, 5, '1749280f-9114-11ed-9c83-000c295e5f17', NULL, NULL, 0, 0, NULL, 0, 0);
SET @searchid = (SELECT DISTINCT sensid FROM sensorchecks WHERE `GUID` = '80d153cb-440b-4312-9191-a9f5dd20744a'); 
SET @parentid = (SELECT groupid FROM mastergroups WHERE GUID =  '1749280f-9114-11ed-9c83-000c295e5f17'); 
SET @parents = CONCAT(',',@parentid,','); 
INSERT IGNORE INTO `mastergroups` 
    (`ParentID`, `Parents`, `Children`, `depth`, `Name`, `FullName`, `Permissions`, `Template`, `AutoJoinScript`, `Master`, `LimitToParent`, `Control`, `ControlID`, `Notes`, `MaintenanceID`, `MaintWindowApplied`, `GroupType`, `Priority`, `GUID`, `NetworkJoin`, `NetworkJoinOptions`, `ContactPermissions`, `ContactJoin`, `ContactJoinOptions`) 
VALUES 
    (@parentid, @parents, ',', 1, '△ Lockdown Browsers Password Manager','△ System Monitoring.△ Lockdown Browsers Password Manager', 0, 0, @searchid, 2, 1, 0, 0, '', 0, NOW(), 5, 5, 'eea5f14b-c12a-11ee-a53f-960002890dfa', 0, 0, 0, 0); 

# Create Group Agent
SET @searchid = (SELECT DISTINCT sensid FROM sensorchecks WHERE `GUID` = '80d153cb-440b-4312-9191-a9f5dd20744a'); 
SET @groupid = (SELECT DISTINCT groupid FROM mastergroups WHERE `GUID` = 'eea5f14b-c12a-11ee-a53f-960002890dfa'); 
INSERT INTO groupagents 
SELECT '' AS `AgentID`,
`groupid` AS `GroupID`,
@Searchid AS `SearchID`,
'ProVal - Production - Lockdown Chromium Browsers Credit Cards and Addresses Autofill' AS `Name`,
'6' AS `CheckAction`,
'1' AS `AlertAction`,
'Chromium Browsers Credit Cards and Addresses Autofill Lockdown - Failed on %CLIENTNAME%\\%COMPUTERNAME%~~~Successfully Disabled the Credit Cards and Addresses Autofill for the Installed Browsers. !!!Chromium Browsers Credit Cards and Addresses Autofill Lockdown - Failed on %CLIENTNAME%\\%COMPUTERNAME%~~~Credit Cards and Addresses Autofill Lockdown Failed on %CLIENTNAME%\\%COMPUTERNAME%. The script was unable to disable the Autofill of Credit Cards and Addresses on the following browsers:
%RESULT%
Manual investigation is required.' AS `AlertMessage`,
'0' AS `ContactID`,
'604800' AS `interval`,
'127.0.0.1' AS `Where`,
'7' AS `What`,
'C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\powershell.exe -ExecutionPolicy Bypass -Command "$ErrorActionPreference = ''SilentlyContinue'';$browsers = {''Google Chrome'' = ''HKLM:\\Software\\Policies\\Google\\Chrome'';''Microsoft Edge'' = ''HKLM:\\SOFTWARE\\Policies\\Microsoft\\Edge'';''Brave'' = ''HKLM:\\SOFTWARE\\Policies\\BraveSoftware\\Brave''}; Function Find-Application { Param([Parameter()][String]$Name); if ( Get-ChildItem -Path HKLM:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Uninstall, HKLM:\\SOFTWARE\\Wow6432Node\\Microsoft\\Windows\\CurrentVersion\\Uninstall | Get-ItemProperty | Where-Object { $_.DisplayName -match /"$Name/" } ) { return $Name } else { return $false } }; Function Get-RegValue { Param([Parameter()][String]$path,$Reg); ( Get-ItemProperty -Path $path )./"$Reg/" }; Function Set-RegValue { Param([Parameter()][String]$path,$Reg); if ( ( Get-RegValue -path $path -Reg $Reg ) -ne ''0'' ) { if ( !( Test-Path $path ) ) { New-Item -Path $path -Force | Out-Null }; Set-ItemProperty -Path $path -Name $Reg -Value 0 -Force } }; $failed = @(); foreach ( $browser in $browsers.Keys ) { if ( Find-Application -Name $browser ) { foreach ( $Reg in (''AutofillAddressEnabled'', ''AutofillCreditCardEnabled'', ''PaymentMethodQueryEnabled'') ) { Set-RegValue -Path $browsers.($browser) -Reg $Reg; if ( ( Get-RegValue -path $browsers.($browser) -Reg $Reg ) -ne ''0'' ) { $failed += $browser } } } }; if ( $failed ) { return /"Failed: $($failed)/" }"' AS `DataOut`,
'16' AS `Comparor`,
'10|(^((OK){0,}(\\r\\n){0,}[\\r\\n]{0,}\\s{0,})$)|11|(^((OK){0,}(\\r\\n){0,}[\\r\\n]{0,}\\s{0,})$)%7C(Failed: ((Google Chrome)%7C(Brave)%7C(Microsoft Edge)))|10|(Failed: ((Google Chrome)%7C(Brave)%7C(Microsoft Edge)))' AS `DataIn`,
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
'SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1)
) AS `GUID`,
'root' AS `UpdatedBy`,
(NOW()) AS `UpdateDate`
FROM mastergroups m
WHERE m.groupid = @groupid
AND m.groupid NOT IN  (SELECT DISTINCT groupid FROM groupagents WHERE `Name` = 'ProVal - Production - Lockdown Chromium Browsers Credit Cards and Addresses Autofill')
```

## Step 2
Reload System Cache

## Step 3
Refresh Searches and Groups.

![Image 1](../../../static/img/Lockdown-Chromium-Browsers-Credit-Cards-and-Addresses-Autofill/image_1.png)
![Image 2](../../../static/img/Lockdown-Chromium-Browsers-Credit-Cards-and-Addresses-Autofill/image_2.png)

## Step 4
Confirm the presence of the `ProVal - Production - Lockdown Chromium Browsers Credit Cards and Addresses Autofill` remote monitor on the `△ Lockdown Browsers Password Manager` group.

![Image](../../../static/img/Lockdown-Chromium-Browsers-Credit-Cards-and-Addresses-Autofill/image_3.png)


