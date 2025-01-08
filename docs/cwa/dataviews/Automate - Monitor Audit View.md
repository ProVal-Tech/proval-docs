---
id: 'cwa-dataview-audit-monitors'
title: 'Dataview Audit for Monitors'
title_meta: 'Dataview Audit for Monitors'
keywords: ['dataview', 'audit', 'monitors', 'environment', 'alert', 'script', 'mysql']
description: 'This document provides an overview of the Dataview audit process for monitors in an environment, detailing the dependencies, column descriptions, and key attributes associated with each monitor.'
tags: ['monitor', 'audit', 'alert', 'mysql', 'script', 'environment']
draft: false
unlisted: false
---
## Summary

The Dataview audits the Monitors in an environment.

## Dependencies

- [plugin_proval_v_monitoraudit](https://proval.itglue.com/DOC-5078775-8158184)
- [CWM - Automate - Script - MySQL - View - Create - plugin_proval_v_monitoraudit*](https://proval.itglue.com/DOC-5078775-11931049)

## Columns

| Column                   | Description                                                   |
|-------------------------|---------------------------------------------------------------|
| AgentID                 | Displays the Monitor ID.                                     |
| Monitor                 | Displays the name of the Monitor.                            |
| Group Path              | The path of the groups that the monitor is assigned to.      |
| Monitor Type            | The type of monitor (Remote or Internal or Global)           |
| Next Scan               | The next time the monitor will scan.                         |
| Disabled                | Yes / No / N/A for if the monitor is disabled.              |
| AlertMessage            | The associated alert message.                                |
| Alert Template          | The associated alert template.                               |
| AlertID                 | The associated alert ID.                                     |
| Alert Ticket Creation    | True or false if the alert will generate a ticket.          |
| Script Assigned         | The assigned script to the alert.                            |
| Category Name           | The category assigned to the alert.                          |
| Service Board           | The service board that the alert will post to.              |
| Monitor Run Frequency    | Running interval of the monitor set.                         |

