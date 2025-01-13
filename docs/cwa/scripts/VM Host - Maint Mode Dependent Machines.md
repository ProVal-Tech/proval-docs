---
id: 'cwa-hyperv-maintenance-mode'
title: 'Hyper-V Maintenance Mode Script'
title_meta: 'Hyper-V Maintenance Mode Script for Virtual Machines'
keywords: ['hyper-v', 'maintenance', 'virtualization', 'alerts', 'script']
description: 'This document outlines a script designed to place virtual machines hosted on a Hyper-V Host into Maintenance mode for a duration of 60 minutes. During this period, alerts will be suppressed, and script execution will be limited on the affected virtual machines, ensuring a smooth maintenance process.'
tags: ['hyper-v', 'maintenance', 'virtualization', 'security']
draft: false
unlisted: false
---
## Summary

The script will place the virtual machines hosted on a Hyper-V Host into Maintenance mode for 60 minutes. During this maintenance period, alerts will not be generated, and script execution will be restricted on these virtual machines.

## Sample Run

![Image](../../../static/img/VM-Host---Maint-Mode-Dependent-Machines/image_1.png)

What will get set on all VMs running with an Automate Agent on the host:

![Image](../../../static/img/VM-Host---Maint-Mode-Dependent-Machines/image_2.png)




