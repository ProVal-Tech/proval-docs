---
id: '41b393a9-cb59-4418-8536-9fe911cb4c9d'
title: 'Monitor~~ Autofix - Run Queued Scripts'
title_meta: 'Monitor~~ Autofix - Run Queued Scripts'
keywords: ['monitor', 'queued', 'scripts', 'computers', 'alert']
description: 'This document outlines the configuration and functionality of a monitor created by the CWM - Automate - Script - Queue Script. It details how the monitor checks the online status of computers and sends alerts based on their last contact time, along with dependencies and SQL translation for the monitor.'
tags: ['database', 'performance']
draft: false
unlisted: false
---

## Summary

This monitor is created by the [CWM - Automate - Script - Queue Script](<../scripts/Queue Script.md>) automate script. It returns a failure if the computer is offline and success when online.

### Internal Monitor Settings

- **Interval:** 5 minutes
- **Mode:** Send fail after success
- **Table:** Computers
- **Field:** LastContact
- **Condition:** Less than
- **Result:** (NOW() - Interval 5 Minutes)
- **Identity:** Computers.Name
- **Target Groups:** Machines with Queued Scripts

### Group Level Configuration

- **Alert Template:** ~Autofix - Run Queued Scripts
- **State:** Enabled

## Dependencies

- [CWM - Automate - Script - Run Queued Scripts](<../scripts/Run Queued Scripts.md>)
- [CWM - Automate - Script - Queue Script](<../scripts/Queue Script.md>)
- [CWM - Automate - Solution - Queue Script Next Checkin](<../../solutions/Queue Script Next Checkin.md>)
- [CWM - Automate - Custom Table - plugin_proval_queued_scripts](<../tables/plugin_proval_queued_scripts.md>)

## Target

The suggested target for the monitor will be partially generalized, as group names can vary between Automate systems. Examples:

- 'Machines With Queued Scripts' Group only

## Translated SQL

```sql
SELECT 
  DISTINCT 'C', 
  computers.computerid, 
  computers.Name AS ComputerName, 
  CONVERT(
    CONCAT(
      clients.name, ' ', locations.name
    ) USING utf8
  ) AS Location, 
  computers.`LastContact` AS TestValue, 
  Computers.Name 
FROM 
  ( 
    computers 
    LEFT JOIN Locations ON Locations.LocationID = computers.Locationid
  ) 
  LEFT JOIN Clients ON Clients.ClientID = Computers.clientid 
  JOIN AgentComputerData ON Computers.ComputerID = AgentComputerData.ComputerID 
WHERE 
  computers.`LastContact` < (NOW() - INTERVAL 5 MINUTE) 
  AND Computers.ComputerID IN (
    SELECT 
      DISTINCT ComputerID 
    FROM 
      Tcomp
  )
```
