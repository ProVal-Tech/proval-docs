---
id: '81c88531-4918-4d74-ac84-efbc2c3cfe51'
title: 'Steps to Apply Remote Monitor'
title_meta: 'Steps to Apply Remote Monitor'
keywords: ['remote', 'monitor', 'dhcp', 'groupid', 'alert', 'configuration']
description: 'This document provides a detailed guide on how to apply a remote monitor to specific groups in ConnectWise Automate. It outlines the steps for obtaining group IDs, constructing SQL queries for inserting group agents, and executing those queries to ensure proper monitoring of DHCP scopes with insufficient IP addresses.'
tags: ['database', 'networking']
draft: false
unlisted: false
---

## Steps to Apply Remote Monitor

### 1. Obtain Group IDs
Obtain the group ID(s) of the group(s) to which the remote monitor should be applied.

### 2. Construct the SQL Query
Copy the following query and replace **YOUR COMMA SEPARATED LIST OF GROUPID(S)** with the group ID(s) of the relevant groups:
*(The string to replace can be found at the very bottom of the query, right after `WHERE`)*

```sql
INSERT INTO groupagents 
SELECT '' as `AgentID`,
`groupid` as `GroupID`,
'0' as `SearchID`,
'ProVal - Production - DHCP Scope(s) < 5 IP Addresses Available' as `Name`,
'6' as `CheckAction`,
'1' as `AlertAction`,
'DHCP Scope(s) with Insufficient IP Addresses Detected on %computername%~~~The problem is fixed.!!!DHCP Scope(s) with Insufficient IP Addresses Detected on %computername%~~~Active DHCP scope(s) with less than 5 available IP addresses detected on %ClientName%/%ComputerName% at %LocationName%. 
This could potentially lead to IP address allocation problems and network connectivity issues for users. Immediate action should be taken to ensure sufficient IP addresses are available within the DHCP scopes to prevent any network disruptions. Please investigate the DHCP server configuration and take the necessary steps to address this issue. Potential solutions could include expanding IP address ranges, optimizing IP address allocation, or adding additional DHCP servers.
Affected Scope(s) details: 
%RESULT%' as `AlertMessage`,
'0' as `ContactID`,
'3600' as `interval`,
'127.0.0.1' as `Where`,
'7' as `What`,
'C://Windows//System32//WindowsPowerShell//v1.0//powershell.exe -ExecutionPolicy Bypass -Command \"$ErroractionPreference= /'SilentlyContinue/'; $t = 5; $ss = try {Get-DhcpServerv4Failover -erroraction stop | Where-Object {$_.ServerRole -eq /'Active/' -and $_.ScopeId -match /'./'}} catch {$null}; if ($ss.ServerRole -eq /'Standby/') {return}; $scopes = Get-DhcpServerv4Scope | Where-Object {$_.State -eq /'Active/'}; $DhcpScopes = foreach($scope in $scopes) {$scopeStats = $scope | Get-DhcpServerv4ScopeStatistics; [pscustomobject]@{scopeid = $scope.scopeid; startrange = $scope.startrange; endrange = $scope.endrange; free = $(if ($ss.ReservePercent -gt 0) {[Math]::Max(0, $($scopestats.free - [Math]::Round((($scopestats.free + $scopestats.InUse) * $ss.ReservePercent)/100)))} else {$scopestats.free}); inuse = $scopestats.inuse; Reserved = $scopestats.Reserved}}; $DhcpScopes | Where-Object {$_.free -le $t}\"' as `DataOut`,
'16' as `Comparor`,
'10|(^(//r//n%7COK%7C[//s//S])$)%7C(^$)|11|(^(//r//n%7COK%7C[//s//S])$)%7C(^$)%7C(scopeid.*?:.*?[//r//n]{0,}.*?startrange)|10|(scopeid.*?:.*?[//r//n]{0,}.*?startrange)' as `DataIn`,
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
AND m.groupid NOT IN  (SELECT DISTINCT groupid FROM groupagents WHERE `Name` = 'ProVal - Production - DHCP Scope(s) < 5 IP Addresses Available')
```

### 3. Example of a Query with a Group ID
Here is an example of a query with a group ID:

```sql
INSERT INTO groupagents 
SELECT '' as `AgentID`,
`groupid` as `GroupID`,
'0' as `SearchID`,
'ProVal - Production - DHCP Scope(s) < 5 IP Addresses Available' as `Name`,
'6' as `CheckAction`,
'1' as `AlertAction`,
'DHCP Scope(s) with Insufficient IP Addresses Detected on %computername%~~~The problem is fixed.!!!DHCP Scope(s) with Insufficient IP Addresses Detected on %computername%~~~Active DHCP scope(s) with less than 5 available IP addresses detected on %ClientName%/%ComputerName% at %LocationName%. 
This could potentially lead to IP address allocation problems and network connectivity issues for users. Immediate action should be taken to ensure sufficient IP addresses are available within the DHCP scopes to prevent any network disruptions. Please investigate the DHCP server configuration and take the necessary steps to address this issue. Potential solutions could include expanding IP address ranges, optimizing IP address allocation, or adding additional DHCP servers.
Affected Scope(s) details: 
%RESULT%' as `AlertMessage`,
'0' as `ContactID`,
'3600' as `interval`,
'127.0.0.1' as `Where`,
'7' as `What`,
'C://Windows//System32//WindowsPowerShell//v1.0//powershell.exe -ExecutionPolicy Bypass -Command \"$ErroractionPreference= /'SilentlyContinue/'; $t = 5; $ss = try {Get-DhcpServerv4Failover -erroraction stop | Where-Object {$_.ServerRole -eq /'Active/' -and $_.ScopeId -match /'./'}} catch {$null}; if ($ss.ServerRole -eq /'Standby/') {return}; $scopes = Get-DhcpServerv4Scope | Where-Object {$_.State -eq /'Active/'}; $DhcpScopes = foreach($scope in $scopes) {$scopeStats = $scope | Get-DhcpServerv4ScopeStatistics; [pscustomobject]@{scopeid = $scope.scopeid; startrange = $scope.startrange; endrange = $scope.endrange; free = $(if ($ss.ReservePercent -gt 0) {[Math]::Max(0, $($scopestats.free - [Math]::Round((($scopestats.free + $scopestats.InUse) * $ss.ReservePercent)/100)))} else {$scopestats.free}); inuse = $scopestats.inuse; Reserved = $scopestats.Reserved}}; $DhcpScopes | Where-Object {$_.free -le $t}\"' as `DataOut`,
'16' as `Comparor`,
'10|(^(//r//n%7COK%7C[//s//S])$)%7C(^$)|11|(^(//r//n%7COK%7C[//s//S])$)%7C(^$)%7C(scopeid.*?:.*?[//r//n]{0,}.*?startrange)|10|(scopeid.*?:.*?[//r//n]{0,}.*?startrange)' as `DataIn`,
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
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1)
) as `GUID`,
'root' as `UpdatedBy`,
(NOW()) as `UpdateDate`
FROM mastergroups m
WHERE m.groupid IN (1624)
AND m.groupid NOT IN  (SELECT DISTINCT groupid FROM groupagents WHERE `Name` = 'ProVal - Production - DHCP Scope(s) < 5 IP Addresses Available')
```

### 4. Execute the Query
Now execute your query from a RAWSQL monitor set.

### 5. Locate and Apply the Remote Monitor
Locate your remote monitor by opening the group(s) remote monitors tab, then apply the appropriate alert template.
