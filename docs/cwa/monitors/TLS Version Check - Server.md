---
id: 'cwa-remote-monitor-tls-version-check'
title: 'Remote Monitor for TLS Version Check'
title_meta: 'Remote Monitor for TLS Version Check'
keywords: ['tls', 'monitor', 'windows', 'iis', 'exchange', 'file', 'servers', 'audit']
description: 'This document outlines the setup and usage of a remote monitor designed to check and return the enabled TLS server version on a computer. It details the requirements, cautionary notes against alerting, and suggestions for implementation in managed Windows environments.'
tags: ['monitor', 'windows', 'iis', 'exchange', 'file', 'security']
draft: false
unlisted: false
---
## Summary

The purpose of the remote monitor is to check and return the Enabled TLS Server version on a computer.

Requirements: PowerShell v2.0+

**CAUTION:** DO NOT APPLY ANY ALERT TEMPLATE TO THIS MONITOR SET. Its only purpose is to fetch the data to be displayed in the [EPM - Windows Configuration - Dataview - Security - TLS Status](https://proval.itglue.com/DOC-5078775-7974498) dataview. This monitor set should not be used for alerting/ticketing purposes.

## Details

**Suggested "Limit to"**: Windows IIS, Exchange, File Servers  
**Suggested Alert Style**: Continuous  
**Suggested Alert Template**: Default Do Nothing  

Insert the details of the monitor in the below table.

| Check Action | Server Address | Check Type | Execute Info | Comparator | Interval | Result |
|--------------|----------------|------------|---------------|------------|----------|--------|
| System       | 127.0.0.1     | Run File   | **REDACTED**  | Missing     | 86400    | _      |

## Target

Managed Windows IIS, Exchange, and File Servers.  
**OR**  
Wherever you would like to audit TLS server Version

## How to Import

[Import - Remote Monitor - TLS Version Check - Server](https://proval.itglue.com/DOC-5078775-13218114)


