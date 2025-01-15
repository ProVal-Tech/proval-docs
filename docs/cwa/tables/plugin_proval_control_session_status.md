---
id: 'd468b194-6df4-46b0-8dbc-657b623209ff'
title: 'ConnectWise Control Agent Online Status'
title_meta: 'ConnectWise Control Agent Online Status'
keywords: ['connectwise', 'agent', 'status', 'online', 'portal']
description: 'This document outlines the current online status of ConnectWise Control agents within the Control Portal, detailing dependencies and the structure of the relevant database table.'
tags: ['connectwise', 'database', 'status', 'configuration']
draft: false
unlisted: false
---
## Purpose

This will hold the current ConnectWise Control agent online status for each agent in the Control Portal.

## Dependencies

- [EPM - Data Collection - Script - Get - CW-ControlAPI - Online Status](https://proval.itglue.com/DOC-5078775-9912233)
- [EPM - Data Collection - Dataview - Agent online status check CWC to CWA](https://proval.itglue.com/DOC-5078775-9915631)
- [EPM - Data Collection - Solution - Get - CW-ControlAPI-Online Status](https://proval.itglue.com/DOC-5078775-9004336)

## Tables

#### plugin_proval_control_session_status

| Column              | Type         | Explanation                                                                                     |
|---------------------|--------------|-------------------------------------------------------------------------------------------------|
| GUID                 | VARCHAR(255) | Holds the ConnectWise Control GUID for the Computer. (Primary Key)                            |
| Online              | TINYINT(1)   | Holds the online status of the computer in ConnectWise Control agent.                         |
| LastConnectedDate   | DATETIME     | Holds the last connected date of the ConnectWise Control agent.                               |
| SCName              | VARCHAR(50)  | Holds the computer name as displayed in the ConnectWise Control portal for that agent.       |






