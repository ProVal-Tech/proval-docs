---
id: '85f4745d-0f15-425d-a6a0-d11bc27ce0f7'
title: 'Redirection-Audit'
title_meta: 'Redirection-Audit'
keywords: ['redirection', 'registry', 'settings', 'audit', 'gpo']
description: 'This document provides a comprehensive overview of all possible redirection registry settings, detailing their global application and specific user impacts. It includes dependencies, a column breakdown, and SQL representation for data collection and analysis.'
tags: ['gpo', 'registry', 'sql']
draft: false
unlisted: false
---

## Summary

This document displays all possible redirection registry settings globally and for all users.

## Dependencies

- [EPM - Data Collection - Script - Audit - GPO Redirection Settings](<../scripts/Audit - GPO Redirection Settings.md>)
- [EPM - Data Collection - Custom Table - plugin_proval_gpo_redirection_audit](<../tables/plugin_proval_gpo_redirection_audit.md>)

## Columns

| Column         | Description                                                                                                                                                 |
|----------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------|
| ClientID       | The Client ID of the target computer.                                                                                                                    |
| LocationID     | The location ID of the target computer.                                                                                                                  |
| ClientName     | The client name.                                                                                                                                         |
| LocationName   | The location name.                                                                                                                                       |
| ComputerID     | The target computer ID.                                                                                                                                  |
| ComputerName   | The name of the target computer.                                                                                                                          |
| EffectedUsers  | The scope of the affected parameter; if the parameter applies to all users, it will say "All." If the parameter applies to a specific user, it will list the affected user. |
| PropertyName   | The name of the property that is set in the registry.                                                                                                     |
| Rawvalue       | The value assigned to the registry property.                                                                                                              |
| Description    | The description of what the property affects, if known.                                                                                                   |
| TargetType     | "Global Setting" if the property is setting a global computer setting; "Folder" if the property is targeting a folder.                                    |
| RoamingState   | "Local" if the property does not provide redirection; "Roaming" if the property provides redirection.                                                     |

## SQL Representation

```sql
SELECT     c.ClientID AS ClientID
           ,c.LocationID AS LocationID
           ,cl.NAME AS ClientName
           ,l.NAME AS LocationName
           ,GRA.ComputerID AS ComputerID
           ,c.NAME AS ComputerName
           ,`User` AS EffectedUsers
           ,PropertyName
           ,SettingType AS TargetType
           ,Description
           ,`Value` AS Rawvalue
           ,CASE 
               WHEN (
                   SettingType NOT LIKE '%Global%'
                   AND `value` NOT LIKE '%Users%'
                   AND PropertyName NOT LIKE 'PS%'
                   AND PropertyName NOT LIKE '!Do%'
                   AND PropertyName != 'Fonts'
               )
               THEN 'Roaming'
               ELSE 'Local'
           END AS RoamingState 
FROM     plugin_proval_gpo_redirection_audit GRA
LEFT JOIN computers c ON (c.ComputerID = GRA.ComputerID)  
LEFT JOIN clients cl ON (cl.ClientID = c.ClientID)  
LEFT JOIN locations l ON (l.LocationID = c.LocationID)
```



