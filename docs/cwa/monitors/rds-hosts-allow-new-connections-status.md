---
id: 'ffcdc2ca-7c63-4226-b7b5-090f241f0bba'
slug: /ffcdc2ca-7c63-4226-b7b5-090f241f0bba
title: 'RDS Hosts - Allow New Connections Status'
title_meta: 'RDS Hosts - Allow New Connections Status'
keywords: ['rds', 'remote', 'desktop', 'session', 'host', 'allow', 'new', 'connections']
description: 'This document provides a detailed overview of a remote monitor that checks the Allow New Connections status of Remote Desktop Host servers. It includes the check action, server address, check type, and other relevant details.'
tags: []
draft: false
unlisted: false
---

# Summary
This remote monitor checks for the Allow New Connections status of the Remote Desktop Host servers.
If the status is False, then it is supposed to create the ticket.

# Details
**Suggested "Limit to"**: Group bound with a search of servers having role [Windows RDS Session Host](/docs/2383fd5a-aee3-4644-8bea-c05af3f3d320) 
**Suggested Alert Style**: Once
**Suggested Alert Template**: Default - Create Automate Ticket

Insert the details of the monitor in the below table.

| Check Action | Server Address | Check Type | Check Value | Compator | Interval | Result                                    |
| ------------ | -------------- | ---------- | ----------- | -------- | -------- | ----------------------------------------- |
| System       | 127.0.0.1      | Run File   | See Below   | Contains | 600      | Allow new connections is NOT set to FALSE |

## Check Value
```
C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -ExecutionPolicy Bypass -Command "$rdshSettings = Get-CimInstance -Namespace 'root\CIMv2\TerminalServices' -Class Win32_TerminalServiceSetting -ComputerName \"$env:computername\";$allowNewConnections = $rdshSettings.AllowTSConnections;$allowNewConnections;if ($allowNewConnections -eq $false) {Write-Output \"Allow new connections is set to FALSE on $env:computername\"} else {Write-Output \"Allow new connections is NOT set to FALSE on $env:computername\"}"
```

# Dependencies
[Windows RDS Gateway](/docs/06dec980-1779-4612-a0cf-83587c6f2157)

# Target
Servers - Should be run on Windows Server which has the [Windows RDS Session Host](/docs/2383fd5a-aee3-4644-8bea-c05af3f3d320) role.

# Ticketing

## Subject

Allow New Connections is set to FALSE on RDS Server "%computername%" of Client: %clientname%

## Body

%NAME% %STATUS% on %CLIENTNAME%\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.

# Implementation

[Implementation Document](/docs/18fd9d3f-f0cd-4040-b89f-ec059c405609)