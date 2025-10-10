---
id: '25732e23f-eeb7-4017-ab8c-7b3b7bf25329'
slug: /5732e23f-eeb7-4017-ab8c-7b3b7bf25329
title: 'Cyber QP and Duo Auth Registry Config [Change]'
title_meta: 'Cyber QP and Duo Auth Registry Config [Change]'
keywords: ['cyber-qp', 'duo', 'duo-auth', 'duo-authentication-for-windows-logon', 'quickpass']
description: 'Applies registry configurations on systems where both ''Duo Authentication for Windows Logon x64'' and ''Quickpass'' are installed, enabling Duo Authentication in conjunction with CyberQP End User Elevation and activating the CyberQP Credential Provider for integrated authentication support.'
tags: ['windows', 'registry', 'security', 'application']
draft: false
unlisted: false
---

## Summary

Applies registry configurations on systems where both 'Duo Authentication for Windows Logon x64' and 'Quickpass' are installed, enabling Duo Authentication in conjunction with CyberQP End User Elevation and activating the CyberQP Credential Provider for integrated authentication support.

**References:**

- [Using Duo Authentication for Windows with CyberQP End User Elevation](https://support.getquickpass.com/hc/en-us/articles/28134967630743-Using-Duo-Authentication-for-Windows-with-CyberQP-End-User-Elevation)
- [Enabling the CyberQP Credential Provider while using Duo](https://support.getquickpass.com/hc/en-us/articles/22720858271895-Enabling-the-CyberQP-Credential-Provider-while-using-Duo#h_01HWB3Q6E45JJC9SYE5RG996XT)

## Details

**Suggested "Limit to"**: `Cyber QP and Duo Auth Registry Config`  
**Suggested Alert Style**: `Once`  
**Suggested Alert Template**: `Default - Do Nothing`  

| Check Action | Server Address | Check Type | Comparator  | Interval | Result |
| ------------ | -------------- | ---------- | ----------- | -------- | ------ |
| System       |  127.0.0.1     |  Run File  | Contains    | 86400    | 0      |

## Target

- Managed Windows Machines

## Implementation

### Step 1

Run the next query to create the `Msiexec Eventlog Monitoring` search.

```sql
INSERT INTO `sensorchecks` 
SELECT 
'' as `SensID`,
'Cyber QP and Duo Auth Registry Config'  as `Name`, 
'SELECT 
   computers.computerid as `Computer Id`,
   computers.name as `Computer Name`,
   clients.name as `Client Name`,
   computers.domain as `Computer Domain`,
   computers.username as `Computer User`,
   Software.Name as `Computer.Applications.Name`,
   Services.Name as `Computer.Services.Name`
FROM Computers 
LEFT JOIN inv_operatingsystem ON (Computers.ComputerId=inv_operatingsystem.ComputerId)
LEFT JOIN Clients ON (Computers.ClientId=Clients.ClientId)
LEFT JOIN Locations ON (Computers.LocationId=Locations.LocationID)
LEFT JOIN Software ON (Software.ComputerId = Computers.ComputerId)
LEFT JOIN Services ON (services.ComputerId = Computers.ComputerId)
 WHERE 
((((Software.Name = ''Duo Authentication for Windows Logon x64'') AND (Services.Name = ''QuickpassServerAgent''))))' as `SQL`,
'4' as `QueryType`,
'Select||=||=||=|^Select|||||||^' as `ListData`,
'0' as `FolderID`,
'bc5d8c6b-2df1-4f62-890b-c1b02564a2c5' as `GUID`,
'<LabTechAbstractSearch><asn><st>AndNode</st><cn><asn><st>AndNode</st><cn><asn><st>ComparisonNode</st><lon>Computer.Applications.Name</lon><lok>Computer.Applications.Name</lok><lmo>Equals</lmo><dv>Duo Authentication for Windows Logon x64</dv><dk>Duo Authentication for Windows Logon x64</dk></asn><asn><st>ComparisonNode</st><lon>Computer.Services.Name</lon><lok>Computer.Services.Name</lok><lmo>Equals</lmo><dv>QuickpassServerAgent</dv><dk>QuickpassServerAgent</dk></asn></cn></asn></cn></asn></LabTechAbstractSearch>' as `SearchXML`,
(NULL) as `UpdatedBy`,
(NULL) as `UpdateDate`
FROM  (SELECT MIN(computerid) FROM computers) a
Where (SELECT count(*) From SensorChecks where `GUID` = 'bc5d8c6b-2df1-4f62-890b-c1b02564a2c5') = 0 ;
```

### Step 2

Obtain the group ID(s) of the group(s) that the remote monitor should be applied to.

### Step 3

Copy the following query and replace **YOUR COMMA SEPARATED LIST OF GROUPID(S)** with the group ID(s) for your target groups. Set the desired values for the `@intervalMinutes` and `@threshold` variables as needed.  
(The section to replace is at the very end of the query, immediately after **WHERE**.)

```sql
SET @searchId = IFNULL((SELECT MIN(SensID) FROM sensorchecks Where `GUID` = 'bc5d8c6b-2df1-4f62-890b-c1b02564a2c5'),0);
INSERT INTO
    groupagents
SELECT
    '' as `AgentID`,
    `groupid` as `GroupID`,
    @SearchId as `SearchID`,
    'ProVal - Production - Cyber QP and Duo Auth Registry Config [Change]' as `Name`,
    '6' as `CheckAction`,
    '1' as `AlertAction`,
    '<NoAlerts>~~~<NoAlerts>!!!<NoAlerts>~~~<NoAlerts>' as `AlertMessage`,
    '0' as `ContactID`,
    '86400' as `interval`,
    '127.0.0.1' as `Where`,
    '7' as `What`,
    'C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\powershell.exe -ExecutionPolicy Bypass -Command "$dRP = \'HKLM:\\SOFTWARE\\Duo Security\\DuoCredProv\'; $feN = \'ElevationProtectionMode\'; $fev = \'0\'; $seN = \'ProvidersWhitelist\'; $sev = \'{67D6B25B-3419-4C60-A4B5-A7CE535AD300}\'; if (!(Test-Path -Path $dRP)) { New-Item -Path $dRP -Force | Out-Null }; if ((Get-ItemProperty -Path $dRP).$feN -ne $fev) { Set-ItemProperty -Path $dRP -Name $feN -Value $fev -Force }; $seVC = (Get-ItemProperty -Path $dRP).$seN; if ($seVC) { if ($seVC -notcontains $sev) { $seVC += $sev; Set-ItemProperty -Path $dRP -Name $seN -Value $seVC -Type MultiString -Force } } else { New-ItemProperty -Path $dRP -Name $seN -Value $sev -PropertyType MultiString -Force | Out-Null }; return 0"' as `DataOut`,
    '5' as `Comparor`,
    '0' as `DataIn`,
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
WHERE
    m.groupid IN (
        YOUR COMMA SEPARATED LIST OF GROUPID (S)
    )
    AND m.groupid NOT IN(
        SELECT DISTINCT
            groupid
        FROM groupagents
        WHERE
            `Name` = 'ProVal - Production - Cyber QP and Duo Auth Registry Config [Change]'
    )
```

### Step 4

Here is an example showing how to use a specific group ID and set the variables:

```sql
SET @searchId = IFNULL((SELECT MIN(SensID) FROM sensorchecks Where `GUID` = 'bc5d8c6b-2df1-4f62-890b-c1b02564a2c5'),0);
INSERT INTO
    groupagents
SELECT
    '' as `AgentID`,
    `groupid` as `GroupID`,
    @SearchId as `SearchID`,
    'ProVal - Production - Cyber QP and Duo Auth Registry Config [Change]' as `Name`,
    '6' as `CheckAction`,
    '1' as `AlertAction`,
    '<NoAlerts>~~~<NoAlerts>!!!<NoAlerts>~~~<NoAlerts>' as `AlertMessage`,
    '0' as `ContactID`,
    '86400' as `interval`,
    '127.0.0.1' as `Where`,
    '7' as `What`,
    'C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\powershell.exe -ExecutionPolicy Bypass -Command "$dRP = \'HKLM:\\SOFTWARE\\Duo Security\\DuoCredProv\'; $feN = \'ElevationProtectionMode\'; $fev = \'0\'; $seN = \'ProvidersWhitelist\'; $sev = \'{67D6B25B-3419-4C60-A4B5-A7CE535AD300}\'; if (!(Test-Path -Path $dRP)) { New-Item -Path $dRP -Force | Out-Null }; if ((Get-ItemProperty -Path $dRP).$feN -ne $fev) { Set-ItemProperty -Path $dRP -Name $feN -Value $fev -Force }; $seVC = (Get-ItemProperty -Path $dRP).$seN; if ($seVC) { if ($seVC -notcontains $sev) { $seVC += $sev; Set-ItemProperty -Path $dRP -Name $seN -Value $seVC -Type MultiString -Force } } else { New-ItemProperty -Path $dRP -Name $seN -Value $sev -PropertyType MultiString -Force | Out-Null }; return 0"' as `DataOut`,
    '5' as `Comparor`,
    '0' as `DataIn`,
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
WHERE
    m.groupid IN (
        2, 3, 855, 856
    )
    AND m.groupid NOT IN(
        SELECT DISTINCT
            groupid
        FROM groupagents
        WHERE
            `Name` = 'ProVal - Production - Cyber QP and Duo Auth Registry Config [Change]'
    )
```

### Step 5

Execute your query from a `RAWSQL` monitor set.

### Step 6

Reload the System Cache (Ctrl + R).

### Step 7

Find your remote monitor in the group's remote monitors tab. Make sure it is limited to the `Cyber QP and Duo Auth Registry Config` search.
