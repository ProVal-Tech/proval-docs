---
id: '7f795515-a2b5-4041-85c8-64b6c6e59470'
title: 'ESXi Old Snapshots Detected  3 Days'
title_meta: 'ESXi Old Snapshots Detected  3 Days'
keywords: ['esxi', 'monitoring', 'snapshots', 'alerting', 'ticket']
description: 'This document describes a monitor that identifies ESXi host servers with snapshots older than three days, generating alerts and tickets for proactive management. It is intended to be used alongside a script for automatic ticket creation, ensuring timely resolution of issues related to virtual machine snapshots.'
tags: ['networking', 'virtualization']
draft: false
unlisted: false
---

## Summary

This monitor identifies the ESXi host servers that contain one or more snapshots older than three days.

Default alerting includes information about all the virtual machines and the older snapshots grouped by ESXi host. It will generate a ticket against the network probe of the concerned ESXi host with information about all the snapshots older than three days.

This is intended to be used with the [Script - Ticket Creation - VMWare ESXi Monitoring](<../scripts/Ticket Creation - VMWare ESXi Monitoring.md>) as the auto-fix.

**Alert Template:** △ Custom - Ticket Creation - ESXi Monitoring

## Target

Limited by the SQL to the network probes detecting any ESXi host.

## Dependencies

[Script - Ticket Creation - VMWare ESXi Monitoring](<../scripts/Ticket Creation - VMWare ESXi Monitoring.md>)