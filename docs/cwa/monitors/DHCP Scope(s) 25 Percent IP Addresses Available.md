---
id: '2cfde48c-aa83-4990-83bd-cb768c882081'
title: 'Steps to Apply Remote Monitor'
title_meta: 'Steps to Apply Remote Monitor'
keywords: ['remote', 'monitor', 'dhcp', 'groupid', 'alert', 'configuration']
description: 'This document provides detailed steps on how to apply a remote monitor for DHCP scopes with insufficient IP addresses. It includes SQL query examples and instructions for executing the queries within a RAWSQL monitor set, ensuring effective monitoring and alerting for network connectivity issues.'
tags: ['dhcp', 'networking']
draft: false
unlisted: false
---

## Steps to Apply Remote Monitor

### 1. Obtain the Group ID(s)
Obtain the group ID(s) of the group(s) that the remote monitor should be applied to.

---

### 2. Copy and Modify the SQL Query
Copy the following query and replace **YOUR COMMA SEPARATED LIST OF GROUPID(S)** with the Group ID(s) of the relevant groups. The string to replace can be found at the very bottom of the query, right after **WHERE**.

```sql
INSERT INTO groupagents 
SELECT '' as `AgentID`,
`groupid` as `GroupID`,
'0' as `SearchID`,
'ProVal - Production - DHCP Scope(s) < 25% IP Addresses Available' as `Name`,
'6' as `CheckAction`,
'1' as `AlertAction`,
'DHCP Scope(s) with Insufficient IP Addresses Detected on %computername%~~~The problem is fixed.!!!DHCP Scope(s) with Insufficient IP Addresses Detected on %computername%~~~Active DHCP scope(s) with less than 25% available IP addresses detected on %ClientName%/%ComputerName% at %LocationName%. \r\n\r\nThis could potentially lead to IP address allocation problems and network connectivity issues for users. Immediate action should be taken to ensure sufficient IP addresses are available within the DHCP scopes to prevent any network disruptions. Please investigate the DHCP server configuration and take the necessary steps to address this issue. Potential solutions could include expanding IP address ranges, optimizing IP address allocation, or adding additional DHCP servers.\r\n\r\nAffected Scope(s) details: \r\n%RESULT%' as `AlertMessage`,
'0' as `ContactID`,
'3600' as `interval`,
'127.0.0.1' as `Where`,
'7' as `What`,
'C://Windows//System32//WindowsPowerShell//v1.0//powershell.exe -ExecutionPolicy Bypass -Command \"$ErroractionPreference= 'SilentlyContinue'; $t = 25; $ss =  try {Get-DhcpServerv4Failover -erroraction stop | Where-Object {$_.ServerRole -eq 'Active' -and $_.ScopeId -match './'}} catch {$null}; if ($ss.ServerRole -eq 'Standby') {return}; $scopes = Get-DhcpServerv4Scope | Where-Object {$_.State -eq 'Active'}; $DhcpScopes = foreach($scope in $scopes) {$scopeStats = $scope | Get-DhcpServerv4ScopeStatistics; [pscustomobject]@{scopeid = $scope.scopeid; startrange = $scope.startrange; endrange = $scope.endrange; free = $(if ($ss.ReservePercent -gt 0) {[Math]::Max(0, $($scopestats.free - [Math]::Round((($scopestats.free + $scopestats.InUse ) * $ss.ReservePercent)/100)))} else {$scopestats.free}); inuse = $scopestats.inuse; Reserved = $scopestats.Reserved; Percentagefree = $(if ($ss.ReservePercent -gt 0) {[Math]::Max(0, $([Math]::Round((100 - $scopestats.PercentageInUse - $ss.ReservePercent),2)))} else {[Math]::Round((100 - $scopestats.PercentageInUse),2)})}}; $DhcpScopes | Where-Object {$_.Percentagefree -le $t}\"' as `DataOut`,
'16' as `Comparor`,
'10|(^(//r//n%7COK%7C[//s//S])$)%7C(^$)|11|(^(//r//n%7COK%7C[//s//S])$)%7C(^$)%7C(scopeid.*?:.*?[//r//n]{0,}.*?startrange)|10|(scopeid.*?:.*?[//r//n]{0,}.*?startrange)' as `DataIn`,
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
WHERE m.groupid IN (YOUR COMMA SEPARATED LIST OF GROUPID(S))
AND m.groupid NOT IN (SELECT DISTINCT groupid FROM groupagents WHERE `Name` = 'ProVal - Production - DHCP Scope(s) < 25% IP Addresses Available')
```

---

### 3. Example Query with a Group ID
An example of a query with a group ID:

```sql
INSERT INTO groupagents 
SELECT '' as `AgentID`,
`groupid` as `GroupID`,
'0' as `SearchID`,
'ProVal - Production - DHCP Scope(s) < 25% IP Addresses Available' as `Name`,
'6' as `CheckAction`,
'1' as `AlertAction`,
'DHCP Scope(s) with Insufficient IP Addresses Detected on %computername%~~~The problem is fixed.!!!DHCP Scope(s) with Insufficient IP Addresses Detected on %computername%~~~Active DHCP scope(s) with less than 25% available IP addresses detected on %ClientName%/%ComputerName% at %LocationName%. \r\n\r\nThis could potentially lead to IP address allocation problems and network connectivity issues for users. Immediate action should be taken to ensure sufficient IP addresses are available within the DHCP scopes to prevent any network disruptions. Please investigate the DHCP server configuration and take the necessary steps to address this issue. Potential solutions could include expanding IP address ranges, optimizing IP address allocation, or adding additional DHCP servers.\r\n\r\nAffected Scope(s) details: \r\n%RESULT%' as `AlertMessage`,
'0' as `ContactID`,
'3600' as `interval`,
'127.0.0.1' as `Where`,
'7' as `What`,
'C://Windows//System32//WindowsPowerShell//v1.0//powershell.exe -ExecutionPolicy Bypass -Command \"$ErroractionPreference= 'SilentlyContinue'; $t = 25; $ss =  try {Get-DhcpServerv4Failover -erroraction stop | Where-Object {$_.ServerRole -eq 'Active' -and $_.ScopeId -match './'}} catch {$null}; if ($ss.ServerRole -eq 'Standby') {return}; $scopes = Get-DhcpServerv4Scope | Where-Object {$_.State -eq 'Active'}; $DhcpScopes = foreach($scope in $scopes) {$scopeStats = $scope | Get-DhcpServerv4ScopeStatistics; [pscustomobject]@{scopeid = $scope.scopeid; startrange = $scope.startrange; endrange = $scope.endrange; free = $(if ($ss.ReservePercent -gt 0) {[Math]::Max(0, $($scopestats.free - [Math]::Round((($scopestats.free + $scopestats.InUse ) * $ss.ReservePercent)/100)))} else {$scopestats.free}); inuse = $scopestats.inuse; Reserved = $scopestats.Reserved; Percentagefree = $(if ($ss.ReservePercent -gt 0) {[Math]::Max(0, $([Math]::Round((100 - $scopestats.PercentageInUse - $ss.ReservePercent),2)))} else {[Math]::Round((100 - $scopestats.PercentageInUse),2)})}}; $DhcpScopes | Where-Object {$_.Percentagefree -le $t}\"' as `DataOut`,
'16' as `Comparor`,
'10|(^(//r//n%7COK%7C[//s//S])$)%7C(^$)|11|(^(//r//n%7COK%7C[//s//S])$)%7C(^$)%7C(scopeid.*?:.*?[//r//n]{0,}.*?startrange)|10|(scopeid.*?:.*?[//r//n]{0,}.*?startrange)' as `DataIn`,
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
WHERE m.groupid IN (1674)
AND m.groupid NOT IN (SELECT DISTINCT groupid FROM groupagents WHERE `Name` = 'ProVal - Production - DHCP Scope(s) < 25% IP Addresses Available')
```

---

### 4. Execute Your Query
Now execute your query from a RAWSQL monitor set.

---

### 5. Locate and Apply the Alert Template
Locate your remote monitor by opening the group(s) remote monitors tab, then apply the appropriate alert template.

