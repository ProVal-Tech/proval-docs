---
id: '905bda70-64aa-4e66-a18f-c5d0eef2b7fd'
slug: /905bda70-64aa-4e66-a18f-c5d0eef2b7fd
title: 'ESXi Host Not Communicating  3 Days'
title_meta: 'ESXi Host Not Communicating  3 Days'
keywords: ['esxi', 'monitoring', 'report', 'alert', 'virtualization']
description: 'This document outlines a monitor designed to report any ESXi hosts that have not checked in with Automate for over 3 days. It is intended to be used alongside a script for ticket creation related to VMware ESXi monitoring, ensuring timely alerts and maintenance actions.'
tags: ['esxi', 'virtualization']
draft: false
unlisted: false
---

## Summary

This monitor is intended to report any ESXi hosts in the system that have not checked in with Automate for more than 3 days. It is designed to be used with the [Script - Ticket Creation - VMware ESXi Monitoring](/docs/7fbdffc1-7472-4276-914d-1e5b845dcd3c) as the auto-fix.

**Alert Template:** △ Custom - Ticket Creation - ESXi Monitoring

## Dependencies

This section should contain a list of ITGlue documents listed in the Related Items sidebar on which this monitor depends.

- [Script - Ticket Creation - VMware ESXi Monitoring](/docs/7fbdffc1-7472-4276-914d-1e5b845dcd3c)
- This solution requires that the Virtualization Manager is set up and configured.

## Target

This monitor is a Global RAWSQL monitor and does not need to be assigned to a group; however, it will only alert for ESXi hosts that exist in the Virtualization Manager.