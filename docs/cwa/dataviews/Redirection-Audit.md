---
id: '85f4745d-0f15-425d-a6a0-d11bc27ce0f7'
title: 'Redirection Registry Settings Overview'
title_meta: 'Redirection Registry Settings Overview'
keywords: ['redirection', 'registry', 'settings', 'audit', 'gpo']
description: 'This document provides a comprehensive overview of all possible redirection registry settings, detailing their global application and specific user impacts. It includes dependencies, a column breakdown, and SQL representation for data collection and analysis.'
tags: ['gpo', 'registry', 'sql']
draft: false
unlisted: false
---
## Summary

This dataview displays all possible redirection registry settings globally and for all users.

## Dependencies

- [EPM - Data Collection - Script - Audit - GPO Redirection Settings](https://proval.itglue.com/DOC-5078775-11735434)
- [EPM - Data Collection - Custom Table - plugin_proval_gpo_redirection_audit](https://proval.itglue.com/DOC-5078775-11736631)

## Columns

| Column         | Description                                                                                                                                                 |
|----------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------|
| ClientID       | The Client ID of the target Computer.                                                                                                                    |
| LocationID     | The location ID of the target Computer.                                                                                                                  |
| ClientName     | The Client Name.                                                                                                                                         |
| LocationName   | The locationName.                                                                                                                                       |
| ComputerID     | The target computer ID.                                                                                                                                  |
| ComputerName   | The name of the target computer.                                                                                                                          |
| EffectedUsers  | The scope of the effected parameter, if the parameter applies to all users, it will say All, if the parameter applies to a specific user it will list the effected user. |
| PropertyName   | The name of the property that is set in the registry.                                                                                                     |
| Rawvalue       | The value assigned to the registry property.                                                                                                              |
| Description    | The description of what the property effects, if known.                                                                                                   |
| TargetType     | Global Setting if the property is setting a global computer setting, Folder if the property is targeting a folder.                                        |
| RoamingState   | Local if the property does not prove redirection, Roaming if the property proves redirection.                                                             |

## SQL Representation

```
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












