---
id: '2f8424d7-00aa-4cee-a4fb-56cbc412108b'
slug: /2f8424d7-00aa-4cee-a4fb-56cbc412108b
title: 'ESXi Bad Sensor'
title_meta: 'ESXi Bad Sensor'
keywords: ['esxi', 'monitor', 'alert', 'sensor', 'vmware', 'virtualization']
description: 'This document outlines a monitor designed to report any ESXi hosts that have reported a Bad Sensor within the VMware monitoring system. It is intended for use with a script for ticket creation related to VMware ESXi monitoring, providing a streamlined approach to alerting and issue resolution.'
tags: ['virtualization', 'vmware']
draft: false
unlisted: false
---

## Summary

This monitor is intended to report any ESXi hosts in the system that have reported a Bad Sensor within the VMware monitoring system. This is designed to be used with the [Script - Ticket Creation - VMware ESXi Monitoring](/docs/7fbdffc1-7472-4276-914d-1e5b845dcd3c) as the auto-fix.

**Alert Template:** △ Custom - Ticket Creation - ESXi Monitoring

## Dependencies

This section should list the ITGlue documents found in the Related Items sidebar on which this monitor depends.

- [Script - Ticket Creation - VMware ESXi Monitoring](/docs/7fbdffc1-7472-4276-914d-1e5b845dcd3c)
- This solution requires that the Virtualization Manager is set up and configured.

## Target

This monitor is a Global RAWSQL monitor and does not need to be assigned to a group; however, it will only alert for ESXi hosts that exist in the Virtualization Manager.
