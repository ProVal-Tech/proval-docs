---
id: '5be9ccc8-0317-42e4-ba36-5fa203e9582e'
title: 'EPM - Vendor Specific - Monitor - Dell Hardware Monitoring'
title_meta: 'EPM - Vendor Specific - Monitor - Dell Hardware Monitoring'
keywords: ['dell', 'event', 'monitor', 'logs', 'server']
description: 'This document provides a detailed overview of an internal monitor designed to detect critical and error event logs from Dell servers using the Server Administrator event source. It includes instructions on setting up the monitor and utilizing the appropriate alert template for ticket creation.'
tags: []
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



