---
id: 'cbdea50e-32ca-413e-863d-bbf15836cb1b'
slug: /cbdea50e-32ca-413e-863d-bbf15836cb1b
title: 'Dell Command Update Handler - Run Scan Command'
title_meta: 'Dell Command Update Handler - Run Scan Command'
keywords: ['dell', 'monitor', 'update', 'workstation', 'windows']
description: 'This document outlines the setup of a monitor set designed to execute the Dell Command Update script weekly on Dell Workstations running Windows 10 and 11. The script is run with the /scan command to gather data for auditing purposes.'
tags: ['dell', 'update', 'windows']
draft: false
unlisted: false
---

## Summary

The purpose of the monitor set is to execute the [Script - Dell Command Update - Install/Upgrade + Command Handler](/docs/91cc7f02-1c0d-4303-81f2-91fd0d275747) once per week against every Dell Workstation (Windows 10 and 11 only). The script is executed with the /scan command to populate the data in the [Dataview - Dell Command Update Handler - Audit [Script]](/docs/1a188004-4007-40dc-8c44-d64d3c0d2bb8).

**Alert Template:** Dell Command Update - Run Scan Command

## Dependencies

[Script - Dell Command Update - Install/Upgrade + Command Handler](/docs/91cc7f02-1c0d-4303-81f2-91fd0d275747)

## Target

The SQL query limits the execution to Dell Workstations running Windows 10 or Windows 11.