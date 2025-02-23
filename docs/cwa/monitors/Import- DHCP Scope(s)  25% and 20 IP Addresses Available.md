---
id: 'd18b57a8-8b6a-41aa-939b-f0dff26bd5cf'
title: 'Import- DHCP Scope(s)  25% and 20 IP Addresses Available'
title_meta: 'Import- DHCP Scope(s)  25% and 20 IP Addresses Available'
keywords: ['dhcp', 'monitoring', 'groupid', 'alert', 'network']
description: 'This document outlines the steps for setting up a DHCP Scope Monitoring system using SQL queries to insert monitoring parameters into the group agents database. It provides a detailed guide on how to obtain group IDs, modify SQL queries, and apply alert templates for effective monitoring of DHCP scopes.'
tags: ['database', 'networking', 'setup']
draft: false
unlisted: false
---

## Step 1
Obtain the group ID(s) of the group(s) that the remote monitor should be applied to.

## Step 2
Copy the following query and replace **YOUR COMMA SEPARATED LIST OF GROUPID(S)** with the group ID(s) of the relevant groups:  
(The string to replace can be found at the very bottom of the query, right after **WHERE**)

```
INSERT INTO groupagents 
SELECT '' as `AgentID`,
`groupid` as `GroupID`,
'0' as `SearchID`,
'ProVal - Production - DHCP Scope(s) < 25% and 20 IP Addresses Available' as `Name`,
'6' as `CheckAction`,
'1' as `AlertAction`,
'DHCP Scope(s) with Insufficient IP Addresses Detected on %computername%~~~The problem is fixed.!!!DHCP Scope(s) with Insufficient IP Addresses Detected on %computername%~~~Active DHCP scope(s) with less than 25% and 20 available IP addresses detected on %ClientName%/%ComputerName% at %LocationName%. \r\n\r\nThis could potentially lead to IP address allocation problems and network connectivity issues for users. Immediate action should be taken to ensure sufficient IP addresses are available within the DHCP scopes to prevent any network disruptions. Please investigate the DHCP server configuration and take the necessary steps to address this issue. Potential solutions could include expanding IP address ranges, optimizing IP address allocation, or adding additional DHCP servers.\r\n\r\nAffected Scope(s) details: \r\n%RESULT%' as `AlertMessage`,
'0' as `ContactID`,
'3600' as `interval`,
'127.0.0.1' as `Where`,
'7' as `What`,
'C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\powershell.exe -ExecutionPolicy Bypass -Command "$ErroractionPreference= \'SilentlyContinue\'; $t1 = 20; $t2 = 25; $ss = try {Get-DhcpServerv4Failover -erroraction stop | Where-Object {$_.ServerRole -eq \'Active\' -and $_.ScopeId -match \'.\'}} catch {$null}; if ($ss.ServerRole -eq \'Standby\') {return}; $scopes = Get-DhcpServerv4Scope | Where-Object {$_.State -eq \'Active\'}; $DhcpScopes = foreach($scope in $scopes) {$scopeStats = $scope | Get-DhcpServerv4ScopeStatistics; [pscustomobject]@{scopeid = $scope.scopeid; startrange = $scope.startrange; endrange = $scope.endrange; free = $(if ($ss.ReservePercent -gt 0) {[Math]::Max(0, $($scopestats.free - [Math]::Round((($scopestats.free + $scopestats.InUse ) * $ss.ReservePercent)/100)))} else {$scopestats.free}); inuse = $scopestats.inuse; Reserved = $scopestats.Reserved; Percentagefree = $(if ($ss.ReservePercent -gt 0) {[Math]::Max(0, $([Math]::Round((100 - $scopestats.PercentageInUse - $ss.ReservePercent),2)))} else {[Math]::Round((100 - $scopestats.PercentageInUse),2)})}}; $DhcpScopes | Where-Object {($_.free -le $t1) -and ($_.Percentagefree -le $t2)}"' as `DataOut`,
'16' as `Comparor`,
'10|(^(\\r\\n%7COK%7C[\\s\\S])$)%7C(^$)|11|(^(\\r\\n%7COK%7C[\\s\\S])$)%7C(^$)%7C(scopeid.*?:.*?[\\r\\n]{0,}.*?startrange)|10|(scopeid.*?:.*?[\\r\\n]{0,}.*?startrange)' as `DataIn`,
'' as `IDField`,
'1' as `AlertStyle`,
'0' as `ScriptID`,
'' as `datacollector`,
'21' as `Category`,
'0' as `TicketCategory`,
'0' as `ScriptTarget`,
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
WHERE m.groupid IN (YOUR COMMA SEPARATED LIST OF GROUPID(S))
AND m.groupid NOT IN (SELECT DISTINCT groupid FROM groupagents WHERE `Name` = 'ProVal - Production - DHCP Scope(s) < 25% and 20 IP Addresses Available')
```

## Step 3
An example of a query with a group ID:

```
INSERT INTO groupagents 
SELECT '' as `AgentID`,
`groupid` as `GroupID`,
'0' as `SearchID`,
'ProVal - Production - DHCP Scope(s) < 25% and 20 IP Addresses Available' as `Name`,
'6' as `CheckAction`,
'1' as `AlertAction`,
'DHCP Scope(s) with Insufficient IP Addresses Detected on %computername%~~~The problem is fixed.!!!DHCP Scope(s) with Insufficient IP Addresses Detected on %computername%~~~Active DHCP scope(s) with less than 25% and 20 available IP addresses detected on %ClientName%/%ComputerName% at %LocationName%. \r\n\r\nThis could potentially lead to IP address allocation problems and network connectivity issues for users. Immediate action should be taken to ensure sufficient IP addresses are available within the DHCP scopes to prevent any network disruptions. Please investigate the DHCP server configuration and take the necessary steps to address this issue. Potential solutions could include expanding IP address ranges, optimizing IP address allocation, or adding additional DHCP servers.\r\n\r\nAffected Scope(s) details: \r\n%RESULT%' as `AlertMessage`,
'0' as `ContactID`,
'3600' as `interval`,
'127.0.0.1' as `Where`,
'7' as `What`,
'C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\powershell.exe -ExecutionPolicy Bypass -Command "$ErroractionPreference= \'SilentlyContinue\'; $t1 = 20; $t2 = 25; $ss = try {Get-DhcpServerv4Failover -erroraction stop | Where-Object {$_.ServerRole -eq \'Active\' -and $_.ScopeId -match \'.\'}} catch {$null}; if ($ss.ServerRole -eq \'Standby\') {return}; $scopes = Get-DhcpServerv4Scope | Where-Object {$_.State -eq \'Active\'}; $DhcpScopes = foreach($scope in $scopes) {$scopeStats = $scope | Get-DhcpServerv4ScopeStatistics; [pscustomobject]@{scopeid = $scope.scopeid; startrange = $scope.startrange; endrange = $scope.endrange; free = $(if ($ss.ReservePercent -gt 0) {[Math]::Max(0, $($scopestats.free - [Math]::Round((($scopestats.free + $scopestats.InUse ) * $ss.ReservePercent)/100)))} else {$scopestats.free}); inuse = $scopestats.inuse; Reserved = $scopestats.Reserved; Percentagefree = $(if ($ss.ReservePercent -gt 0) {[Math]::Max(0, $([Math]::Round((100 - $scopestats.PercentageInUse - $ss.ReservePercent),2)))} else {[Math]::Round((100 - $scopestats.PercentageInUse),2)})}}; $DhcpScopes | Where-Object {($_.free -le $t1) -and ($_.Percentagefree -le $t2)}"' as `DataOut`,
'16' as `Comparor`,
'10|(^(\\r\\n%7COK%7C[\\s\\S])$)%7C(^$)|11|(^(\\r\\n%7COK%7C[\\s\\S])$)%7C(^$)%7C(scopeid.*?:.*?[\\r\\n]{0,}.*?startrange)|10|(scopeid.*?:.*?[\\r\\n]{0,}.*?startrange)' as `DataIn`,
'' as `IDField`,
'1' as `AlertStyle`,
'0' as `ScriptID`,
'' as `datacollector`,
'21' as `Category`,
'0' as `TicketCategory`,
'0' as `ScriptTarget`,
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
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1)
) as `GUID`,
'root' as `UpdatedBy`,
(NOW()) as `UpdateDate`
FROM mastergroups m
WHERE m.groupid IN (1674)
AND m.groupid NOT IN (SELECT DISTINCT groupid FROM groupagents WHERE `Name` = 'ProVal - Production - DHCP Scope(s) < 25% and 20 IP Addresses Available')
```

## Step 4
Now execute your query from a RAWSQL monitor set.

## Step 5
Locate your remote monitor by opening the group(s) remote monitors tab, then apply the appropriate alert template.


