---
id: '41b393a9-cb59-4418-8536-9fe911cb4c9d'
title: 'Monitor for Machines with Queued Scripts'
title_meta: 'Monitor for Machines with Queued Scripts'
keywords: ['monitor', 'queued', 'scripts', 'computers', 'alert']
description: 'This document outlines the configuration and functionality of a monitor created by the CWM - Automate - Script - Queue Script. It details how the monitor checks the online status of computers and sends alerts based on their last contact time, along with dependencies and SQL translation for the monitor.'
tags: ['database', 'performance']
draft: false
unlisted: false
---
## Summary

This Monitor is created by the [CWM - Automate - Script - Queue Script](<../scripts/Queue Script.md>) automate script. It returns failed if the computer is offline, and success when online.

Internal Monitor settings:
- Interval - 5 minute
- Mode - Send fail after success
- Table - Computers
- Field - LastContact
- Condition - Lessthan
- Result - (NOW() - Interval 5 Minute)
- Identity - Computers.Name
- Target Groups - Machines with Queued Scripts

Group level configuration:
- Alert template - ~Autofix - Run Queued Scripts
- State - Enabled

## Dependencies

- [CWM - Automate - Script - Run Queued Scripts](<../scripts/Run Queued Scripts.md>)
- [CWM - Automate - Script - Queue Script](<../scripts/Queue Script.md>)
- [CWM - Automate - Solution - Queue Script Next Checkin](<../../solutions/Queue Script Next Checkin.md>)
- [CWM - Automate - Custom Table - plugin_proval_queued_scripts](<../tables/plugin_proval_queued_scripts.md>)

## Target

The suggested target for the monitor. This will be partially generalized as group names can vary between Automate systems. Examples:

'Machines With Queued Scripts' Group only

## Translated SQL

```
Select 
  DISTINCT 'C', 
  computers.computerid, 
  computers.Name as ComputerName, 
  Convert(
    CONCAT(
      clients.name, ' ', locations.name
    ) Using utf8
  ) As Location, 
  computers.`LastContact` as TestValue, 
  Computers.Name 
FROM 
  ( 
    computers 
    LEFT JOIN Locations ON Locations.LocationID = computers.Locationid
  ) 
  LEFT JOIN Clients ON Clients.ClientID = Computers.clientid 
  JOIN AgentComputerData on Computers.ComputerID = AgentComputerData.ComputerID 
WHERE 
  computers.`LastContact` \< (NOW() - Interval 5 Minute) 
  AND Computers.ComputerID IN (
    Select 
      Distinct ComputerID 
    From 
      Tcomp
  )
```












