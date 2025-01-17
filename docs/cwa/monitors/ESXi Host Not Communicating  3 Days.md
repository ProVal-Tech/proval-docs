---
id: '905bda70-64aa-4e66-a18f-c5d0eef2b7fd'
title: 'ESXi Monitoring Report'
title_meta: 'ESXi Monitoring Report'
keywords: ['esxi', 'monitoring', 'report', 'alert', 'virtualization']
description: 'This document outlines a monitor designed to report any ESXi hosts that have not checked in with Automate for over 3 days. It is intended to be used alongside a script for ticket creation related to VMWare ESXi monitoring, ensuring timely alerts and maintenance actions.'
tags: ['esxi', 'virtualization']
draft: false
unlisted: false
---
## Summary

This monitor is intended to report any ESXi hosts in the system that have not checked in with Automate for more than 3 days. This is intended to be used with the [Script - Ticket Creation - VMWare ESXi Monitoring](https://proval.itglue.com/DOC-5078775-10689215) as the auto-fix.

Alert Template: △ Custom - Ticket Creation - ESXi Monitoring

## Dependencies

This should be a list of ITGlue documents listed in the Related Items sidebar on which this monitor depends.

- [Script - Ticket Creation - VMWare ESXi Monitoring](https://proval.itglue.com/DOC-5078775-10689215)
- This solution requires that the Virtualization Manager is setup and configured

## Target

This monitor is a Global RAWSQL monitor and does not need to be assigned to a group, however, it will only alert for ESXi hosts that exist in the Virtualization Manager.












