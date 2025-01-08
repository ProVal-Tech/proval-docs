---
id: 'cwa_monitor_audit_data'
title: 'Monitor Audit Data Storage'
title_meta: 'Monitor Audit Data Storage for Configuration Management'
keywords: ['monitor', 'audit', 'configuration', 'data', 'alert', 'ticket', 'service', 'frequency']
description: 'This document outlines the purpose and structure of storing data related to monitors and their configurations, including dependencies and the specific table schema for managing monitor audit data within the ConnectWise Automate platform.'
tags: ['monitoring', 'database', 'alert', 'configuration', 'service', 'data']
draft: false
unlisted: false
---
## Purpose

Stores data about monitors and their configuration.

## Dependencies

- [CWM - Automate - Script - MySQL - View - Create - plugin_proval_v_monitoraudit*](https://proval.itglue.com/DOC-5078775-11931049)  
- [CWM - Automate - Dataview - Automate - Monitor Audit [View]](https://proval.itglue.com/DOC-5078775-8212748)  

## Table

#### plugin_proval_v_monitoraudit

| Column                  | Type        | Explanation                                      |
|------------------------|-------------|--------------------------------------------------|
| AgentID                | INT         | The ID of the monitor.                           |
| Monitor                | VARCHAR     | The name of the monitor.                         |
| Group Path             | TEXT        | The path of the groups that the monitor is assigned to. |
| Next Scan              | VARCHAR     | The next time the monitor will scan.            |
| Disabled               | VARCHAR     | Yes / No / N/A for if the monitor is disabled.  |
| Monitor Type           | VARCHAR     | The type of monitor (Remote or Internal)        |
| AlertMessage           | MEDIUMTEXT  | The associated alert message.                    |
| Alert Template         | VARCHAR     | The associated alert template.                   |
| AlertID                | INT         | The associated alert ID.                         |
| Alert Ticket Creation   | VARCHAR     | True or false if the alert will generate a ticket. |
| Script Assigned         | VARCHAR     | The assigned script to the alert.                |
| Category Name           | VARCHAR     | The category assigned to the alert.              |
| Service Board           | VARCHAR     | The service board that the alert will post to.  |
| Frequency              | VARCHAR     | Running frequency of the monitor set.            |

