---
id: 'cwa-steps-to-apply-remote-monitor'
title: 'Steps to Apply Remote Monitor'
title_meta: 'Steps to Apply Remote Monitor'
keywords: ['remote', 'monitor', 'groupid', 'query', 'alert']
description: 'This document outlines the steps required to apply a remote monitor to specific groups in ConnectWise Automate. It includes instructions for obtaining group IDs, modifying a SQL query, executing the query, and locating the remote monitor within the group settings.'
tags: ['configuration', 'database', 'alert', 'monitoring', 'connectwise']
draft: false
unlisted: false
---
## Steps to Apply Remote Monitor

### 1.
Obtain the groupid(s) of the group(s) that the remote monitor should be applied to.

### 2.
Copy the following query and replace **YOUR COMMA SEPARATED LIST OF GROUPID(S)** with the Groupid(s) of the relevant groups:  
*(The string to replace can be found at the very bottom of the query, right after **WHERE**)*

```
INSERT INTO groupagents 
SELECT '' AS `AgentID`,
`groupid` AS `GroupID`,
'0' AS `SearchID`,
'Proval - Production - NTLMv1.1 Detection' AS `Name`,
'6' AS `CheckAction`,
'1' AS `AlertAction`,
'NTLMv1.1 is enabled on %COMPUTERNAME% at %CLIENTNAME~~~NTLMv1.1 is disabled on %COMPUTERNAME% at %CLIENTNAME!!!NTLMv1.1 is enabled on %COMPUTERNAME% at %CLIENTNAME~~~NTLMv1.1 found to be enabled on %COMPUTERNAME% at %CLIENTNAME' AS `AlertMessage`,
'0' AS `ContactID`,
'900' AS `interval`,
'127.0.0.1' AS `Where`,
'7' AS `What`,
'C://Windows//System32//WindowsPowerShell//v1.0//powershell.exe -ExecutionPolicy Bypass -Command "$US = (Get-itemproperty -Path HKLM://SYSTEM//CurrentControlSet//control//Lsa,HKLM://SYSTEM//CurrentControlSet//services//Lsa -ErrorAction SilentlyContinue);if($US) { foreach ($U in $US){if ($u.LmCompatibilityLevel -ne 5){return /'Enabled/'}}} else {return /'Enabled/'}"' AS `DataOut`,
'16' AS `Comparor`,
'10|^(()%7C %7C(OK)%7C(//r//n))$|11|(^(()%7C %7C(OK)%7C(//r//n))$)%7C(Enabled)|10|(Enabled)' AS `DataIn`,
'' AS `IDField`,
'1' AS `AlertStyle`,
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
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1)
) AS `GUID`,
'root' AS `UpdatedBy`,
(NOW()) AS `UpdateDate`
FROM mastergroups m
WHERE m.groupid IN (YOUR COMMA SEPARATED LIST OF GROUPID(S))
AND m.groupid NOT IN  (SELECT DISTINCT groupid FROM groupagents WHERE `Name` = 'Proval - Production - NTLMv1.1 Detection')
```

### 3.
An example of a query with a groupid:

```
INSERT INTO groupagents 
SELECT '' AS `AgentID`,
`groupid` AS `GroupID`,
'0' AS `SearchID`,
'Proval - Production - NTLMv1.1 Detection' AS `Name`,
'6' AS `CheckAction`,
'1' AS `AlertAction`,
'NTLMv1.1 is enabled on %COMPUTERNAME% at %CLIENTNAME~~~NTLMv1.1 is disabled on %COMPUTERNAME% at %CLIENTNAME!!!NTLMv1.1 is enabled on %COMPUTERNAME% at %CLIENTNAME~~~NTLMv1.1 found to be enabled on %COMPUTERNAME% at %CLIENTNAME' AS `AlertMessage`,
'0' AS `ContactID`,
'900' AS `interval`,
'127.0.0.1' AS `Where`,
'7' AS `What`,
'C://Windows//System32//WindowsPowerShell//v1.0//powershell.exe -ExecutionPolicy Bypass -Command "$US = (Get-itemproperty -Path HKLM://SYSTEM//CurrentControlSet//control//Lsa,HKLM://SYSTEM//CurrentControlSet//services//Lsa -ErrorAction SilentlyContinue);if($US) { foreach ($U in $US){if ($u.LmCompatibilityLevel -ne 5){return /'Enabled/'}}} else {return /'Enabled/'}"' AS `DataOut`,
'16' AS `Comparor`,
'10|^(()%7C %7C(OK)%7C(//r//n))$|11|(^(()%7C %7C(OK)%7C(//r//n))$)%7C(Enabled)|10|(Enabled)' AS `DataIn`,
'' AS `IDField`,
'1' AS `AlertStyle`,
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
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1)
) AS `GUID`,
'root' AS `UpdatedBy`,
(NOW()) AS `UpdateDate`
FROM mastergroups m
WHERE m.groupid IN (2,3,855,856)
AND m.groupid NOT IN  (SELECT DISTINCT groupid FROM groupagents WHERE `Name` = 'Proval - Production - NTLMv1.1 Detection')
```

### 4.
Now execute your query from a RAWSQL monitor set.

### 5.
Locate your remote monitor by opening the group(s) remote monitors tab.  
**DO NOT** apply any alert template to this monitor set.



