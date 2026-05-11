---  
id: '59d4d082-1d52-4d3f-a070-e327be384177'
slug: /59d4d082-1d52-4d3f-a070-e327be384177
title: 'Disable Smart App Control'
title_meta: 'Disable Smart App Control'
keywords: ['windows','Disable','Smart','Control']
description: 'This monitor disables the `Smart App Control` on Windows 11 22H2 and later machines.'
tags: ['setup', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-05-06
---

## Summary

This monitor disables the `Smart App Control` on Windows 11 22H2 and later machines.

**CAUTION :** `Disabling SAC is permanent without a Windows reset, which can cause data loss if files aren’t backed up.`

## Details

**Suggested "Limit to"**: `Windows 11 22H2 and later`  
**Suggested Alert Style**: `Once`  
**Suggested Alert Template**: `-`

| Check Action | Server Address | Check Type | Execute Info | Comparator | Interval | Result            |
|--------------|----------------|------------|---------------|------------|----------|-------------------|
| System       | 127.0.0.1     | Run File   | **REDACTED**  | State Based | 3600      | \<Screenshot Below> |

![Screenshot](../../../static/img/docs/59d4d082-1d52-4d3f-a070-e327be384177/image1.webp)


## Target

- Windows Workstations
- The monitor set should be limited to the `Machines eligible to disable Smart App Control` search. 

![Screenshot](../../../static/img/docs/59d4d082-1d52-4d3f-a070-e327be384177/image2.webp)

## How To Import

## Steps to Set Up Remote Monitor

### 1. Execute SQL Query to create Search
Run the following SQL query from a RAWSQL monitor set to import the required search:

```sql
INSERT INTO `sensorchecks`
SELECT
'' AS `SensID`,
'Machines eligible to disable Smart App Control' AS `Name`,
'Select DISTINCT Computers.ComputerID, Clients.Name as `Client Name`, Computers.Name as `Computer Name`, Computers.Domain, Computers.UserName as `Username`, Computers.Version, Computers.OS\r\nFrom Computers, Clients\r\nWhere Computers.ClientID = Clients.ClientID\r\n and ((LT_CompareVersions(Computers.Version , \'10.0.22621\') >= 0) AND (Computers.OS like \'%windows 11%\'))' AS `SQL`,
'4' AS `QueryType`,
'OS Version||>=|10.0.22621|=||=|^OS||Like|%windows 11%|=||=|^Select|||||||^' AS `ListData`,
'0' AS `FolderID`,
'734f83ad-cebc-4781-867b-22f01ab40fef' AS `GUID`,
'' AS `SearchXML`,
NULL AS `UpdatedBy`,
NULL AS `UpdateDate`
FROM (SELECT MIN(computerid) FROM computers) a
WHERE (SELECT COUNT(*) FROM SensorChecks WHERE `GUID` = '734f83ad-cebc-4781-867b-22f01ab40fef') = 0;
```

### 2. Execute SQL Query to create Remote Monitor

Copy the following query and replace '**YOUR COMMA SEPARATED LIST OF GROUPID(S)**' with the Group ID(s) of the relevant groups:  
(The string to replace can be found at the very bottom of the query, right after **WHERE**)

This will limit the monitor to `Machines eligible to disable Smart App Control` search on the groups.

```sql
SET @Groupid = (SELECT GroupID FROM mastergroups WHERE guid = '3ac1c025-f1fb-11e1-b4ec-1231391d2d19');
SET @Searchid = (SELECT sensid from sensorchecks where GUID = '734f83ad-cebc-4781-867b-22f01ab40fef');
INSERT INTO groupagents 
 SELECT '' as `AgentID`,
`groupid` as `GroupID`,
@Searchid as `SearchID`,
'ProVal - Production - Disable Smart App Control' as `Name`,
'6' as `CheckAction`,
'1' as `AlertAction`,
'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.' as `AlertMessage`,
'0' as `ContactID`,
'3600' as `interval`,
'127.0.0.1' as `Where`,
'7' as `What`,
'C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\powershell.exe -ExecutionPolicy Bypass -Command "$ErrorActionPreference=\'Stop\'; $path = \'HKLM:\\SYSTEM\\CurrentControlSet\\Control\\CI\\Policy\'; $name = \'VerifiedAndReputablePolicyState\';Set-ItemProperty -Path $path -Name  $name -Value 0 -Type DWord;if ((Get-ItemProperty -Path $path  -Name  $name).VerifiedAndReputablePolicyState -ne 0){ throw \'Failed to disable Smart App Control\' }"' as `DataOut`,
'16' as `Comparor`,
'10|(^(()%7C %7C(OK)%7C(\\r\\n))$)|11|(^(()%7C %7C(OK)%7C(\\r\\n))$)%7CFailed to disable|10|Failed to disable' as `DataIn`,
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
AND m.groupid NOT IN  (SELECT DISTINCT groupid FROM groupagents WHERE `Name` = 'ProVal - Production - Disable Smart App Control')
```

### 3. Locate Your Remote Monitor
Locate your remote monitor by opening the group(s) remote monitors tab

## Changelog

### 2026-05-06

- Initial version of the document