---
id: 'b0639ecd-38cd-4afd-a764-bcce13fd8ac7'
slug: /b0639ecd-38cd-4afd-a764-bcce13fd8ac7
title: 'TLS Version Check - Client'
title_meta: 'TLS Version Check - Client'
keywords: ['tls', 'monitor', 'windows', 'security', 'version']
description: 'This document outlines the purpose and details of a remote monitor designed to check and return the Enabled TLS Client version on Windows computers. It includes guidelines for usage, target systems, and import instructions.'
tags: ['security', 'windows']
draft: false
unlisted: false
---

## Summary

The purpose of the remote monitor is to check and return the Enabled TLS Client version on a computer.

**Requirements**: PowerShell v2.0+

**CAUTION:** DO NOT APPLY ANY ALERT TEMPLATE TO THIS MONITOR SET. Its only purpose is to fetch the data to be displayed in the [Security - TLS Status](/docs/aa31f8b3-9d5e-4ad1-98cc-a6e1d329cb1f) dataview. This monitor set should not be used for alerting or ticketing purposes.

## Details

**Suggested "Limit to"**: Windows Computers  
**Suggested Alert Style**: Continuous  
**Suggested Alert Template**: Default Do Nothing  

Insert the details of the monitor in the table below.

| Check Action | Server Address | Check Type | Execute Info | Comparator | Interval | Result |
|--------------|----------------|-------------|---------------|------------|----------|--------|
| System       | 127.0.0.1     | Run File    | **REDACTED**  | Missing     | 86400    | _      |

## Target

Managed Windows Servers and Workstations

## How to Import

[Import - Remote Monitor - TLS Version Check - Client](/docs/a2436d9b-83e4-4405-a3e1-dc4019438d3a)


