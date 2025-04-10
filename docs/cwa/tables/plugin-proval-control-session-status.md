---
id: 'd468b194-6df4-46b0-8dbc-657b623209ff'
slug: /d468b194-6df4-46b0-8dbc-657b623209ff
title: 'plugin_proval_control_session_status'
title_meta: 'plugin_proval_control_session_status'
keywords: ['connectwise', 'agent', 'status', 'online', 'portal']
description: 'This document outlines the current online status of ConnectWise Control agents within the Control Portal, detailing dependencies and the structure of the relevant database table.'
tags: ['connectwise', 'database']
draft: false
unlisted: false
---

## Purpose

This document holds the current ConnectWise Control agent online status for each agent in the Control Portal.

## Dependencies

- [EPM - Data Collection - Script - Get - CW-ControlAPI - Online Status](/docs/71ac312f-e490-4126-bc2d-f9c07f5582cf)
- [EPM - Data Collection - Dataview - Agent online status check CWC to CWA](/docs/36dec374-8bc6-4fda-a273-4e4a1af2f6f7)
- [EPM - Data Collection - Solution - Get - CW-ControlAPI - Online Status](/docs/71ac312f-e490-4126-bc2d-f9c07f5582cf)

## Tables

#### plugin_proval_control_session_status

| Column              | Type         | Explanation                                                                                     |
|---------------------|--------------|-------------------------------------------------------------------------------------------------|
| GUID                 | VARCHAR(255) | Holds the ConnectWise Control GUID for the computer. (Primary Key)                            |
| Online              | TINYINT(1)   | Holds the online status of the computer in ConnectWise Control agent.                         |
| LastConnectedDate   | DATETIME     | Holds the last connected date of the ConnectWise Control agent.                               |
| SCName              | VARCHAR(50)  | Holds the computer name as displayed in the ConnectWise Control portal for that agent.       |


