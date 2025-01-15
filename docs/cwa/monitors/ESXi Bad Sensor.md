---
id: '2f8424d7-00aa-4cee-a4fb-56cbc412108b'
title: 'ESXi Host Bad Sensor Monitor'
title_meta: 'ESXi Host Bad Sensor Monitor'
keywords: ['esxi', 'monitor', 'alert', 'sensor', 'vmware', 'virtualization']
description: 'This document outlines a monitor designed to report any ESXi hosts that have reported a Bad Sensor within the VMware monitoring system. It is intended for use with a script for ticket creation related to VMware ESXi monitoring, providing a streamlined approach to alerting and issue resolution.'
tags: ['monitor', 'alert', 'virtualization', 'vmware', 'sensor']
draft: false
unlisted: false
---
## Summary

This monitor is intended to report any ESXi hosts in the system that have reported a Bad Sensor within the VMWare monitoring. This is intended to be used with the [Script - Ticket Creation - VMWare ESXi Monitoring](https://proval.itglue.com/DOC-5078775-10689215) as the auto-fix.

Alert Template: △ Custom - Ticket Creation - ESXi Monitoring

## Dependencies

This should be a list of ITGlue documents listed in the Related Items sidebar on which this monitor depends.

- [Script - Ticket Creation - VMWare ESXi Monitoring](https://proval.itglue.com/DOC-5078775-10689215)
- This solution requires that the Virtualization Manager is setup and configured

## Target

This monitor is a Global RAWSQL monitor and does not need to be assigned to a group, however, it will only alert for ESXi hosts that exist in the Virtualization Manager.







