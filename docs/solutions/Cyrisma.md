---
id: 'rmm-cyrisma-sensor-deployment'
title: 'Cyrisma Sensor Deployment and Monitoring'
title_meta: 'Cyrisma Sensor Deployment and Monitoring'
keywords: ['cyrisma', 'sensor', 'deployment', 'monitoring', 'audit']
description: 'This document provides a comprehensive guide on deploying, monitoring, and auditing the Cyrisma sensor application, including associated tasks, custom fields, and monitoring strategies.'
tags: ['deployment', 'monitoring', 'audit', 'custom-fields', 'dynamic-groups', 'ticketing']
draft: false
unlisted: false
---
## Purpose

This solution helps to deploy, monitor and audit the Cyrisma sensor application.

## Associated Content

| Content                                                                 | Type          | Function                                                                                      |
|-------------------------------------------------------------------------|---------------|-----------------------------------------------------------------------------------------------|
| [CW RMM - CRI Agent Deployment](https://proval.itglue.com/DOC-5078775-15298955) | Task          | This task is designed to deploy the Cyrisma Censor Application.                              |
| [CW RMM - Cyrisma Custom Fields](https://proval.itglue.com/DOC-5078775-15298953) | Custom Fields | The below custom fields are used in the Cyrisma deployment and audit.                        |
| [CW RMM - Monitor - CRI Agent Deployment Status Check](https://proval.itglue.com/DOC-5078775-15298956) | Monitor       | This monitor is designed to create a ticket for the CRI Agent deployment failure.            |
| [CW RMM - Dynamic Groups - Cyrisma Sensor](https://proval.itglue.com/DOC-5078775-15298951) | Dynamic Groups | The groups mentioned in the doc are created to deploy and audit the Cyrisma Sensor.          |

## Implementation

Follow the below steps for the implementation:

- Create Custom Fields [CW RMM - Cyrisma Custom Fields](https://proval.itglue.com/DOC-5078775-15298953)
- Create Groups [CW RMM - Dynamic Groups - Cyrisma Sensor](https://proval.itglue.com/DOC-5078775-15298951)
- Create Task [CW RMM - CRI Agent Deployment](https://proval.itglue.com/DOC-5078775-15298955)
- Create Monitor [CW RMM - Monitor - CRI Agent Deployment Status Check](https://proval.itglue.com/DOC-5078775-15298956)  
  Follow the Monitor and Task implementation to implement the solution.



