---
id: 'cfe1d90a-11be-4ea8-80b3-4d3116358b7d'
slug: /cfe1d90a-11be-4ea8-80b3-4d3116358b7d
title: 'ProVal Development - WSL Detection'
title_meta: 'ProVal Development - WSL Detection'
keywords: ['Vulnerability', 'CVE', 'WSL']
description: 'This monitor detects the Windows agent where the WSL command works.'
tags: ['vulnerability', 'cve']
draft: false
unlisted: false
---

## Summary

This remote monitor detects the Windows agent where the WSL command works.

## Details

**Suggested "Limit to"**: `All`
**Suggested Alert Style**: `Once`
**Suggested Alert Template**: `△ Custom - Execute Script - Uninstall WSL`


| Check Action | Server Address | Check Type | Comparator | Interval | Result |
| ------------ | -------------- | ---------- | ---------- | -------- | ------ |
| System            |   127.0.0.1             | Run File           |  Equals          |  14400        |  Not Available      |

## Dependencies

`Alert Template - △ Custom - Execute Script - Uninstall WSL`

## Target

Windows Machine

## Implementation

- Import the `Alert Template - △ Custom - Execute Script - Uninstall WSL`
- Create the remote monitor to the required groups using the query below:

```sql

INSERT INTO groupagents 
SELECT '' as `AgentID`,
`groupid` as `GroupID`,
'0' as `SearchID`,
'ProVal Development - WSL Detection' as `Name`,
'6' as `CheckAction`,
'1' as `AlertAction`,
'[No Alerting]~~~%STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!![No Alerting]~~~%STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.' as `AlertMessage`,
'0' as `ContactID`,
'14400' as `interval`,
'127.0.0.1' as `Where`,
'7' as `What`,
'C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\powershell.exe -ExecutionPolicy Bypass -Command "if (-not (Get-Command wsl -ErrorAction SilentlyContinue)) { return \'Not Available\' }; $wslVersion = wsl --version 2>$null;if ($LASTEXITCODE -eq 0) { return \'Installed\' } else { return \'Not Available\' }"' as `DataOut`,
'1' as `Comparor`,
'Not Available' as `DataIn`,
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
WHERE m.groupid IN (128,129,200)  ##Replace with your GROUP IDs WITH COMMA SEPARATED
AND m.groupid NOT IN  (SELECT DISTINCT groupid FROM groupagents WHERE `Name` = 'ProVal Development - WSL Detection') ;
```
- Apply the `Alert Template - △ Custom - Execute Script - Uninstall WSL` to the remote monitor `ProVal Development - WSL Detection`