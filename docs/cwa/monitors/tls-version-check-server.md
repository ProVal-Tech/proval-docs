---
id: '0a19eb90-ba18-4097-ab12-a76efa8e4b83'
slug: /0a19eb90-ba18-4097-ab12-a76efa8e4b83
title: 'TLS Version Check - Server'
title_meta: 'TLS Version Check - Server'
keywords: ['tls', 'monitor', 'windows', 'iis', 'exchange', 'file', 'servers', 'audit']
description: 'This document outlines the setup and usage of a remote monitor designed to check and return the enabled TLS server version on a computer. It details the requirements, cautionary notes against alerting, and suggestions for implementation in managed Windows environments.'
tags: ['exchange', 'iis', 'security', 'windows']
draft: false
unlisted: false
---

## Summary

The purpose of the remote monitor is to check and return the enabled TLS server version on a computer.

**Requirements:** PowerShell v2.0+

**CAUTION:** DO NOT APPLY ANY ALERT TEMPLATE TO THIS MONITOR SET. Its only purpose is to fetch the data to be displayed in the [Security - TLS Status](/docs/aa31f8b3-9d5e-4ad1-98cc-a6e1d329cb1f) dataview. This monitor set should not be used for alerting or ticketing purposes.

## Details

**Suggested "Limit to":** Windows IIS, Exchange, File Servers  
**Suggested Alert Style:** Continuous  
**Suggested Alert Template:** Default Do Nothing  

Insert the details of the monitor in the table below.

| Check Action | Server Address | Check Type | Execute Info | Comparator | Interval | Result |
|--------------|----------------|------------|---------------|------------|----------|--------|
| System       | 127.0.0.1     | Run File   | **REDACTED**  | Missing     | 86400    | _      |

## Target

Managed Windows IIS, Exchange, and File Servers.  
**OR**  
Wherever you would like to audit the TLS server version.

## How to Import

[Import - Remote Monitor - TLS Version Check - Server](/docs/b08343d9-9d4b-4edd-92e2-5941c23d8e43)