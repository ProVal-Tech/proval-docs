---
id: 'ce8d5706-137b-4a55-8a8b-5041e35421de'
slug: /ce8d5706-137b-4a55-8a8b-5041e35421de
title: 'DHCP Scope(s) < 25% and 20 IP Addresses Available'
title_meta: 'DHCP Scope(s) < 25% and 20 IP Addresses Available'
keywords: ['dhcp', 'monitor', 'ip', 'addresses', 'alert']
description: 'This document outlines a remote monitor designed to retrieve information about active DHCP server scopes and their IP address statistics. It identifies DHCP servers with insufficient available IP addresses, alerting when active scopes have less than 20 IP addresses or 25% availability. The monitor considers reserved percentages for DHCP failover scopes and ensures both conditions are met before triggering an alert.'
tags: ['networking', 'windows']
draft: false
unlisted: false
---

## Summary

The remote monitor retrieves information about DHCP server scopes and their corresponding IP address statistics. It filters out inactive scopes and focuses only on active ones. The monitor then checks the number or percentage of available IP addresses within each active scope and identifies those with less than or equal to 20 and 25% of available IP addresses.

In other words, it detects DHCP servers with any active DHCP scope that has less than 20 IP addresses and 25% of IP addresses available at the same time. It ensures both conditions are true before alerting.

**Requirement:** PowerShell v5+ (Server 2016+)

The remote monitor takes into account the reserved percentage for the DHCP failover scopes, and it will not trigger an alert for the standby DHCP server.

## Details

**Suggested "Limit to":** Windows DHCP Servers  
**Suggested Alert Style:** Once  
**Suggested Alert Template:** △ Custom - Ticket Creation - Computer  

Insert the details of the monitor in the table below.

| Check Action | Server Address | Check Type | Execute Info | Comparator | Interval | Result |
|--------------|----------------|------------|---------------|------------|----------|--------|
| System       | 127.0.0.1      | Run File   | REDACTED      | Regex Match | 3600     | \<Screenshot Below\> |

![Screenshot](../../../static/img/DHCP-Scope(s)--25-and-20-IP-Addresses-Available/image_1.png)

## Dependencies

[CWM - Automate - Script - Ticket Creation - Computer](<../scripts/Ticket Creation - Computer.md>)

## Target

Service Plans. Windows Servers. Server Roles. Windows Servers Core Services. Windows DHCP Servers  

![Target Image](../../../static/img/DHCP-Scope(s)--25-and-20-IP-Addresses-Available/image_2.png)

## Ticketing

**Subject:** `DHCP Scope(s) with Insufficient IP Addresses Detected on %computername%`

**Ticket Summary:**  
Active DHCP scope(s) with less than 25% and 20 available IP addresses detected on %ClientName%/%ComputerName% at %LocationName%.  
This could potentially lead to IP address allocation problems and network connectivity issues for users. Immediate action should be taken to ensure sufficient IP addresses are available within the DHCP scopes to prevent any network disruptions. Please investigate the DHCP server configuration and take the necessary steps to address this issue. Potential solutions could include expanding IP address ranges, optimizing IP address allocation, or adding additional DHCP servers.

**Affected Scope(s) details:**  
`%RESULT%`

**%RESULT%:**  
```
scopeid    : <scopeid>
startrange : <startrange>
endrange   : <endrange>
free       : <free ip addresses>
inuse      : <ip addresses in use>
Reserved   : <reserved ip addresses>
```

**Example:**  
```
scopeid    : 10.10.0.0
startrange : 10.10.0.100
endrange   : 10.10.0.200
free       : 51
inuse      : 50
Reserved   : 4
```

## Note

The monitor set is available for import in our (ProVal's) Development environment within the `ProVal Submitted - Remote Monitors` Group.  

![Note Image](../../../static/img/DHCP-Scope(s)--25-and-20-IP-Addresses-Available/image_3.png)

## Monitor's Screenshot

![Monitor Screenshot 1](../../../static/img/DHCP-Scope(s)--25-and-20-IP-Addresses-Available/image_4.png)  
![Monitor Screenshot 2](../../../static/img/DHCP-Scope(s)--25-and-20-IP-Addresses-Available/image_5.png)

## How to Import

### Step 1
Obtain the groupid(s) of the group(s) that the remote monitor should be applied to.

### Step 2
Copy the following query and replace 'YOUR COMMA SEPARATED LIST OF GROUPID(S)' with the Groupid(s) of the relevant groups:
(The string to replace can be found at the very bottom of the query, right after `WHERE`)

```sql
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
'C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\powershell.exe -ExecutionPolicy Bypass -Command "$ErroractionPreference= \'SilentlyContinue\'; $t1 = 20; $t2 = 25; $ss =  try {Get-DhcpServerv4Failover -erroraction stop | Where-Object {$_.ServerRole -eq \'Active\' -and $_.ScopeId -match \'.\'}} catch {$null}; if ($ss.ServerRole -eq \'Standby\') {return}; $scopes = Get-DhcpServerv4Scope | Where-Object {$_.State -eq \'Active\'}; $DhcpScopes = foreach($scope in $scopes) {$scopeStats = $scope | Get-DhcpServerv4ScopeStatistics; [pscustomobject]@{scopeid = $scope.scopeid; startrange = $scope.startrange; endrange = $scope.endrange; free = $(if ($ss.ReservePercent -gt 0) {[Math]::Max(0, $($scopestats.free - [Math]::Round((($scopestats.free + $scopestats.InUse ) * $ss.ReservePercent)/100)))} else {$scopestats.free}); inuse = $scopestats.inuse; Reserved = $scopestats.Reserved; Percentagefree = $(if ($ss.ReservePercent -gt 0) {[Math]::Max(0, $([Math]::Round((100 - $scopestats.PercentageInUse - $ss.ReservePercent),2)))} else {[Math]::Round((100 - $scopestats.PercentageInUse),2)})}}; $DhcpScopes | Where-Object {($_.free -le $t1) -and ($_.Percentagefree -le $t2)}"' as `DataOut`,
'16' as `Comparor`,
'10|(^(\\r\\n%7COK%7C[\\s\\S])$)%7C(^$)|11|(^(\\r\\n%7COK%7C[\\s\\S])$)%7C(^$)%7C(scopeid.*?:.*?[\\r\\n]{0,}.*?startrange)|10|(scopeid.*?:.*?[\\r\\n]{0,}.*?startrange)' as `DataIn`,
'' as `IDField`,
'1' as `AlertStyle`,
'0' as `ScriptID`,
'' as `datacollector`,
'21' as `Category`,
'0' as `TicketCategory`,
'0' as `ScriptTarget`,
UUID() as `GUID`,
'root' as `UpdatedBy`,
(NOW()) as `UpdateDate`
FROM mastergroups m
WHERE m.groupid IN (YOUR COMMA SEPARATED LIST OF GROUPID(S))
AND m.groupid NOT IN (SELECT DISTINCT groupid FROM groupagents WHERE `Name` = 'ProVal - Production - DHCP Scope(s) < 25% and 20 IP Addresses Available')
```

### Step 3
An example of a query with a groupid:
```sql
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
'C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\powershell.exe -ExecutionPolicy Bypass -Command "$ErroractionPreference= \'SilentlyContinue\'; $t1 = 20; $t2 = 25; $ss =  try {Get-DhcpServerv4Failover -erroraction stop | Where-Object {$_.ServerRole -eq \'Active\' -and $_.ScopeId -match \'.\'}} catch {$null}; if ($ss.ServerRole -eq \'Standby\') {return}; $scopes = Get-DhcpServerv4Scope | Where-Object {$_.State -eq \'Active\'}; $DhcpScopes = foreach($scope in $scopes) {$scopeStats = $scope | Get-DhcpServerv4ScopeStatistics; [pscustomobject]@{scopeid = $scope.scopeid; startrange = $scope.startrange; endrange = $scope.endrange; free = $(if ($ss.ReservePercent -gt 0) {[Math]::Max(0, $($scopestats.free - [Math]::Round((($scopestats.free + $scopestats.InUse ) * $ss.ReservePercent)/100)))} else {$scopestats.free}); inuse = $scopestats.inuse; Reserved = $scopestats.Reserved; Percentagefree = $(if ($ss.ReservePercent -gt 0) {[Math]::Max(0, $([Math]::Round((100 - $scopestats.PercentageInUse - $ss.ReservePercent),2)))} else {[Math]::Round((100 - $scopestats.PercentageInUse),2)})}}; $DhcpScopes | Where-Object {($_.free -le $t1) -and ($_.Percentagefree -le $t2)}"' as `DataOut`,
'16' as `Comparor`,
'10|(^(\\r\\n%7COK%7C[\\s\\S])$)%7C(^$)|11|(^(\\r\\n%7COK%7C[\\s\\S])$)%7C(^$)%7C(scopeid.*?:.*?[\\r\\n]{0,}.*?startrange)|10|(scopeid.*?:.*?[\\r\\n]{0,}.*?startrange)' as `DataIn`,
'' as `IDField`,
'1' as `AlertStyle`,
'0' as `ScriptID`,
'' as `datacollector`,
'21' as `Category`,
'0' as `TicketCategory`,
'0' as `ScriptTarget`,
UUID() as `GUID`,
'root' as `UpdatedBy`,
(NOW()) as `UpdateDate`
FROM mastergroups m
WHERE m.groupid IN (1674)
AND m.groupid NOT IN (SELECT DISTINCT groupid FROM groupagents WHERE `Name` = 'ProVal - Production - DHCP Scope(s) < 25% and 20 IP Addresses Available')
```

### Step 4
Now execute your query from a RAWSQL monitor set.

### Step 5
Locate your remote monitor by opening the group(s) remote monitors tab, then apply the appropriate alert template.