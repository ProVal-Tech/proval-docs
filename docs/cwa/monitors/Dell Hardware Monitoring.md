---
id: '77a9ff77-6e7a-474e-8796-d44f2066ff16'
title: 'Dell Hardware Monitoring'
title_meta: 'Dell Hardware Monitoring'
keywords: ['dell', 'event', 'monitor', 'logs', 'server']
description: 'This document provides a detailed overview of an internal monitor designed to detect critical and error event logs from Dell servers using the Server Administrator event source. It includes instructions on setting up the monitor and utilizing the appropriate alert template for ticket creation.'
tags: ['networking']
draft: false
unlisted: false
---

## Summary

This internal monitor detects critical and error Dell event logs via the "Server Administrator" event source, filtering out noisy event log types.

The "~Custom - Ticket Creation - Computer" alert template should be used.

Replace `<Your AgentID Goes Here>` with the ID of the monitor set before enabling it.

![Image](../../../static/img/EPM---Vendor-Specific---Monitor---Dell-Hardware-Monitoring/image_1.png)

## Target

Dell Servers