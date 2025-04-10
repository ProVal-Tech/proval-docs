---
id: '36dec374-8bc6-4fda-a273-4e4a1af2f6f7'
slug: /36dec374-8bc6-4fda-a273-4e4a1af2f6f7
title: 'Agent online status check CWC to CWA'
title_meta: 'Agent online status check CWC to CWA'
keywords: ['dataview', 'connectwise', 'agents', 'status', 'online', 'control', 'repair', 'reinstall']
description: 'This document provides a comprehensive overview of a Dataview designed to display comparative results of the online status of agents in ConnectWise Automate and Control. It includes details on dependencies, column descriptions, and SQL representation to facilitate the monitoring and management of agent statuses.'
tags: ['connectwise', 'database', 'report']
draft: false
unlisted: false
---

## Summary

This Dataview is designed to display comparative results of the online status of agents in Automate as they relate to the online status of the same machines in Control. As a result, this Dataview can be used to determine if Control agents need to be repaired or reinstalled, as well as Automate agents in that same regard.

## Dependencies

- [EPM - Data Collection - Solution - Get - CW-ControlAPI-Online Status](/docs/55a527b6-7b59-4f67-9b1d-1ed421199363)
- [EPM - Data Collection - Script - Get - CW-ControlAPI - Online Status](/docs/71ac312f-e490-4126-bc2d-f9c07f5582cf)
- [EPM - Data Collection - Custom Table - plugin_proval_control_session_status](/docs/d468b194-6df4-46b0-8dbc-657b623209ff)

## Columns

| Column             | Description                                                                                  |
|--------------------|----------------------------------------------------------------------------------------------|
| Client             | The client the agent belongs to in ConnectWise Automate.                                    |
| Location           | The location the agent belongs to in ConnectWise Automate.                                  |
| CWAName            | The name given to the agent in the ConnectWise Automate Platform.                           |
| CWCName            | The name given to the agent in the ConnectWise Control Platform.                            |
| CWCOnlineStatus    | The connection status of the agent in ConnectWise Control (Online or Offline).             |
| CWAOnlineStatus     | The connection status of the agent in ConnectWise Automate (Online or Offline).            |
| LastConnected      | The last time the agent connected within the ConnectWise Control Platform.                   |
| CWCGUID            | The GUID assigned to the agent for its ConnectWise Control session.                          |

## SQL Representation

```sql
SELECT 
  clients.Name AS 'Client', 
  locations.Name AS 'Location', 
  computers.Name AS 'CWAName', 
  plugin_proval_control_session_status.SCName AS 'CWCName', 
  CASE WHEN plugin_proval_control_session_status.Online = 0 THEN 'Offline' 
       WHEN plugin_proval_control_session_status.Online = 1 THEN 'Online' END AS 'CWCOnlineStatus', 
  CASE WHEN computers.UpTime <= 0 THEN 'Offline' 
       WHEN computers.UpTime > 0 THEN 'Online' END AS 'CWAOnlineStatus', 
  plugin_proval_control_session_status.LastConnectedDate AS 'LastConnected', 
  plugin_proval_control_session_status.GUID AS 'CWCGUID' 
FROM 
  computers 
  LEFT JOIN clients ON clients.ClientID = computers.ClientID 
  LEFT JOIN locations ON locations.LocationID = computers.LocationID 
  LEFT JOIN plugin_screenconnect_scinstalled ON plugin_screenconnect_scinstalled.ComputerId = computers.ComputerID 
  LEFT JOIN plugin_proval_control_session_status ON plugin_proval_control_session_status.GUID = plugin_screenconnect_scinstalled.SessionGUID
```


