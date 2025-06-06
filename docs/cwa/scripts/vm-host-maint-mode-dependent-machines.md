---
id: 'a05e9615-3a00-4b03-96d8-775acd8c2ac1'
slug: /a05e9615-3a00-4b03-96d8-775acd8c2ac1
title: 'VM Host - Maint Mode Dependent Machines'
title_meta: 'VM Host - Maint Mode Dependent Machines'
keywords: ['hyper-v', 'maintenance', 'virtualization', 'alerts', 'script']
description: 'This document outlines a script designed to place virtual machines hosted on a Hyper-V Host into Maintenance mode for a duration of 60 minutes. During this period, alerts will be suppressed, and script execution will be limited on the affected virtual machines, ensuring a smooth maintenance process.'
tags: ['hyper-v', 'security', 'virtualization']
draft: false
unlisted: false
---

## Summary

The script will place the virtual machines hosted on a Hyper-V Host into Maintenance mode for 60 minutes. During this maintenance period, alerts will not be generated, and script execution will be restricted on these virtual machines.

## Sample Run

![Image](../../../static/img/docs/a05e9615-3a00-4b03-96d8-775acd8c2ac1/image_1.webp)

What will be set on all VMs running with an Automate Agent on the host:

![Image](../../../static/img/docs/a05e9615-3a00-4b03-96d8-775acd8c2ac1/image_2.webp)