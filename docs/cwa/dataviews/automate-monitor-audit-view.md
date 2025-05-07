---
id: '414e2b20-92a2-40bf-b003-6b92af4cbd18'
slug: /414e2b20-92a2-40bf-b003-6b92af4cbd18
title: 'Automate - Monitor Audit View'
title_meta: 'Automate - Monitor Audit View'
keywords: ['dataview', 'audit', 'monitors', 'environment', 'alert', 'script', 'mysql']
description: 'This document provides an overview of the Dataview audit process for monitors in an environment, detailing the dependencies, column descriptions, and key attributes associated with each monitor.'
tags: ['mysql']
draft: false
unlisted: false
---

## Summary

The Dataview audits the monitors in an environment.

## Dependencies

- [plugin_proval_v_monitoraudit](/docs/b15d4142-5fc8-4352-8a5c-b039cde54b86)
- [CWM - Automate - Script - MySQL - View - Create - plugin_proval_v_monitoraudit](/docs/e4221ae7-3cd9-4019-9d65-1f8ae2e58d33)

## Columns

| Column                   | Description                                                   |
|-------------------------|---------------------------------------------------------------|
| AgentID                 | Displays the Monitor ID.                                     |
| Monitor                 | Displays the name of the Monitor.                            |
| Group Path              | The path of the groups that the monitor is assigned to.      |
| Monitor Type            | The type of monitor (Remote, Internal, or Global).           |
| Next Scan               | The next time the monitor will scan.                         |
| Disabled                | Yes / No / N/A indicating whether the monitor is disabled.   |
| Alert Message           | The associated alert message.                                |
| Alert Template          | The associated alert template.                               |
| Alert ID                | The associated alert ID.                                     |
| Alert Ticket Creation    | True or false indicating if the alert will generate a ticket.|
| Script Assigned         | The assigned script to the alert.                            |
| Category Name           | The category assigned to the alert.                          |
| Service Board           | The service board that the alert will post to.              |
| Monitor Run Frequency    | The running interval of the monitor.                         |
