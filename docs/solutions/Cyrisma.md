---
id: 'f54508ce-319d-48dc-a178-7d3cd35cb021'
title: 'Cyrisma Sensor Deployment and Monitoring'
title_meta: 'Cyrisma Sensor Deployment and Monitoring'
keywords: ['cyrisma', 'sensor', 'deployment', 'monitoring', 'audit']
description: 'This document provides a comprehensive guide on deploying, monitoring, and auditing the Cyrisma sensor application, including associated tasks, custom fields, and monitoring strategies.'
tags: ['custom-fields', 'deployment', 'dynamic-groups', 'ticketing']
draft: false
unlisted: false
---

## Purpose

This solution helps to deploy, monitor, and audit the Cyrisma sensor application.

## Associated Content

| Content                                                                 | Type          | Function                                                                                      |
|-------------------------------------------------------------------------|---------------|-----------------------------------------------------------------------------------------------|
| [CW RMM - CRI Agent Deployment](<../cwrmm/tasks/CRI Agent Deployment.md>) | Task          | This task is designed to deploy the Cyrisma Sensor Application.                              |
| [CW RMM - Cyrisma Custom Fields](<../cwrmm/custom-fields/CW RMM - Cyrisma Custom Fields.md>) | Custom Fields | The custom fields listed below are used in the Cyrisma deployment and audit.                 |
| [CW RMM - Monitor - CRI Agent Deployment Status Check](<../cwrmm/monitors/CRI Agent Deployment Status Check.md>) | Monitor       | This monitor is designed to create a ticket for the CRI Agent deployment failure.            |
| [CW RMM - Dynamic Groups - Cyrisma Sensor](<../cwrmm/groups/Cyrisma Sensor.md>) | Dynamic Groups | The groups mentioned in this document are created to deploy and audit the Cyrisma Sensor.    |

## Implementation

Follow the steps below for the implementation:

- Create Custom Fields: [CW RMM - Cyrisma Custom Fields](<../cwrmm/custom-fields/CW RMM - Cyrisma Custom Fields.md>)
- Create Groups: [CW RMM - Dynamic Groups - Cyrisma Sensor](<../cwrmm/groups/Cyrisma Sensor.md>)
- Create Task: [CW RMM - CRI Agent Deployment](<../cwrmm/tasks/CRI Agent Deployment.md>)
- Create Monitor: [CW RMM - Monitor - CRI Agent Deployment Status Check](<../cwrmm/monitors/CRI Agent Deployment Status Check.md>)

Follow the Monitor and Task implementation to complete the solution.
