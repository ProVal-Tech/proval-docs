---
id: 'cwa-dell-command-update-monitor-set'
title: 'Dell Command Update Monitor Set'
title_meta: 'Dell Command Update Monitor Set for Weekly Execution on Dell Workstations'
keywords: ['dell', 'monitor', 'update', 'workstation', 'windows']
description: 'This document outlines the setup of a monitor set designed to execute the Dell Command Update script weekly on Dell Workstations running Windows 10 and 11. The script is run with the /scan command to gather data for auditing purposes.'
tags: ['dell', 'monitoring', 'windows', 'update', 'audit']
draft: false
unlisted: false
---
## Summary

The purpose of the monitor set is to execute the [Script - Dell Command Update - Install/Upgrade + Command Handler](https://proval.itglue.com/DOC-5078775-11434138) once per week against every Dell Workstation (Windows 10 and 11 only). Script is executed with the /scan command to populate the data in the [Dataview - Dell Command Update Handler - Audit [Script]](https://proval.itglue.com/DOC-5078775-11434140).

Alert Template: Dell Command Update - Run Scan Command

## Dependencies

[Script - Dell Command Update - Install/Upgrade + Command Handler](https://proval.itglue.com/DOC-5078775-11434138)

## Target

The SQL query is limiting it to Dell Workstations running Windows 10 or Windows 11.



