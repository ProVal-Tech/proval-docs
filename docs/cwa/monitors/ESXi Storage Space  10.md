---
id: '9b1477b3-6d88-4a1c-b313-50c638bb84ee'
title: 'ESXi Storage Space  10'
title_meta: 'ESXi Storage Space  10'
keywords: ['esxi', 'monitor', 'storage', 'vmware', 'alert']
description: 'This document describes the ESXi Storage Monitor, which reports any ESXi hosts with less than 10% remaining storage space. It is designed to work alongside the Ticket Creation script for VMWare ESXi Monitoring, providing automated alerts and facilitating proactive management of storage issues in virtual environments.'
tags: ['storage', 'virtualization', 'vmware']
draft: false
unlisted: false
---

## Summary

This monitor is intended to report any ESXi hosts in the system that have reported a remaining storage space of less than 10% for any disk within the VMWare monitoring. This is designed to be used with the [Script - Ticket Creation - VMWare ESXi Monitoring](<../scripts/Ticket Creation - VMWare ESXi Monitoring.md>) as the auto-fix.

**Alert Template:** △ Custom - Ticket Creation - ESXi Monitoring

## Dependencies

This section should list the ITGlue documents found in the Related Items sidebar on which this monitor depends.

- [CWM - Automate - Script - Ticket Creation - VMWare ESXi Monitoring](<../scripts/Ticket Creation - VMWare ESXi Monitoring.md>)
- This solution requires that the Virtualization Manager is set up and configured.

## Target

This monitor is a Global RAWSQL monitor and does not need to be assigned to a group; however, it will only alert for ESXi hosts that exist in the Virtualization Manager.



