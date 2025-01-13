---
id: 'cwa-remote-monitor-tls-version-check'
title: 'Remote Monitor for TLS Client Version Check'
title_meta: 'Remote Monitor for TLS Client Version Check'
keywords: ['tls', 'monitor', 'windows', 'security', 'version']
description: 'This document outlines the purpose and details of a remote monitor designed to check and return the Enabled TLS Client version on Windows computers. It includes guidelines for usage, target systems, and import instructions.'
tags: ['windows', 'security', 'monitor', 'configuration']
draft: false
unlisted: false
---
## Summary

The purpose of the remote monitor is to check and return the Enabled TLS Client version on a computer.

Requirements: PowerShell v2.0+

**CAUTION:** DO NOT APPLY ANY ALERT TEMPLATE TO THIS MONITOR SET. Its only purpose is to fetch the data to be displayed in the [EPM - Windows Configuration - Dataview - Security - TLS Status](https://proval.itglue.com/DOC-5078775-7974498) dataview. This monitor set should not be used for alerting/ticketing purposes.

## Details

**Suggested "Limit to"**: Windows Computers  
**Suggested Alert Style**: Continuous  
**Suggested Alert Template**: Default Do Nothing  

Insert the details of the monitor in the below table.

| Check Action | Server Address | Check Type | Execute Info | Comparator | Interval | Result |
|--------------|----------------|-------------|---------------|------------|----------|--------|
| System       | 127.0.0.1     | Run File    | **REDACTED**  | Missing     | 86400    | _      |

## Target

Managed windows Servers and Workstations

## How to Import

[Import - Remote Monitor - TLS Version Check - Client](https://proval.itglue.com/DOC-5078775-13218119)




