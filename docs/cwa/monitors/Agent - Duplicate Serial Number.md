---
id: 'faf8c4c7-0b45-4a4b-956d-8eafdaa758c5'
title: 'Agent - Duplicate Serial Number'
title_meta: 'Agent - Duplicate Serial Number'
keywords: ['monitor', 'duplicate', 'serial', 'agents', 'database']
description: 'This document describes a monitor designed to identify machines with duplicate serial numbers listed in the database, which may indicate duplicate agents. It specifically targets offline machines in Automate for more than one day, excluding virtual machines to minimize false positives. The document also includes details on alert templates and dependencies.'
tags: ['database']
draft: false
unlisted: false
---

## Summary

This monitor looks for machines that have the same serial number listed in the database. Machines with duplicate serial numbers are likely duplicate agents.

It will list all the duplicate instances of the machines that are offline in Automate for more than one day, and the monitor set excludes virtual machines to avoid false positives.

**Alert Template:** Custom - Ticket Creation - Computer

**Sample Ticket:**  
![Sample Ticket](../../../static/img/Agent---Duplicate-Serial-Number/image_1.png)

## Dependencies

[CWM - Automate - Script - Ticket Creation - Computer](<../scripts/Ticket Creation - Computer.md>)

## Target

Global - Should be run without explicitly defined targets.

**Note:** Not all machines have proper serial numbers. The SQL below attempts to filter out as many bad results as possible. For example, some SuperMicro PCs all use the same serial number "1234567890." This can lead to false positives. Please review the data for each device before taking action.



