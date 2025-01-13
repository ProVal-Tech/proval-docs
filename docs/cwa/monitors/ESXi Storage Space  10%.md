---
id: 'cwa-esxi-storage-monitor'
title: 'ESXi Storage Monitor'
title_meta: 'ESXi Storage Monitor for VMWare Monitoring'
keywords: ['esxi', 'monitor', 'storage', 'vmware', 'alert']
description: 'This document describes the ESXi Storage Monitor, which reports any ESXi hosts with less than 10% remaining storage space. It is designed to work alongside the Ticket Creation script for VMWare ESXi Monitoring, providing automated alerts and facilitating proactive management of storage issues in virtual environments.'
tags: ['monitor', 'storage', 'virtualization', 'alert', 'vmware']
draft: false
unlisted: false
---
## Summary

This monitor is intended to report any ESXi hosts in the system that have reported a remaining storage space for any disk is less than 10% within the VMWare monitoring. This is intended to be used with the [Script - Ticket Creation - VMWare ESXi Monitoring](https://proval.itglue.com/DOC-5078775-10689215) as the auto-fix.

Alert Template: △ Custom - Ticket Creation - ESXi Monitoring

## Dependencies

This should be a list of ITGlue documents listed in the Related Items sidebar on which this monitor depends.

- [CWM - Automate - Script - Ticket Creation - VMWare ESXi Monitoring](https://proval.itglue.com/DOC-5078775-10689215)
- This solution requires that the Virtualization Manager is setup and configured.

## Target

This monitor is a Global RAWSQL monitor and does not need to be assigned to a group; however, it will only alert for ESXi hosts that exist in the Virtualization Manager.



