---
id: '246e46a3-3de6-40c4-b5f2-21fea200ab9b'
title: 'Office 365 Update Channel Report'
title_meta: 'Office 365 Update Channel Report'
keywords: ['office365', 'update', 'channel', 'report', 'windows']
description: 'This document provides a comprehensive report on the Office 365 Update Channels set on various machines, detailing whether they are Current, Monthly, Semi-Annual, or not set at all. It includes SQL representation for data retrieval and dependencies for accurate reporting.'
tags: ['office365', 'report', 'update', 'windows']
draft: false
unlisted: false
---

## Summary

This dataview collects information about machines where the Office 365 Update Channel is set and identifies the type, such as Current, Monthly, Semi-Annual, or another type. It also indicates if the Office 365 update channel is not set on the machine.

## Dependencies

- @Office 365 Update Channel Set
- @Office 365 Current Update Channel
- @Office 365 Monthly Update Channel
- @Office 365 Semi-Annual Update Channel

## Columns

| Column                     | Description                                                      |
|---------------------------|------------------------------------------------------------------|
| Client                    | Displays the name of the client                                   |
| ClientID                  | Displays the client ID                                            |
| Location                  | Displays the location name                                        |
| LocationID                | Displays the Location ID                                          |
| Computer                  | Displays the computer name                                        |
| ComputerID                | Displays the computer ID                                          |
| OS                        | Displays the name of the operating system of the machine         |
| Office 365 Update Channel  | Displays the name of the Office 365 Update Channel set on the machine |

## SQL Representation

```sql
SELECT 
  COUNT(*) 
FROM 
  (
    SELECT 
      cl.Name AS 'Client', 
      cl.ClientID AS 'ClientID', 
      l.Name AS 'Location', 
      l.LocationID AS 'LocationID', 
      c.Name AS 'Computer', 
      c.OS AS 'OS', 
      c.ComputerID AS 'ComputerID', 
      CASE 
        WHEN c.ComputerID NOT IN (
          SELECT 
            ComputerID 
          FROM 
            `computerroledefinitions` 
          WHERE 
            RoleDefinitionID IN (
              SELECT 
                RoleDefinitionID 
              FROM 
                RoleDefinitions 
              WHERE 
                RoleName = 'Office 365 Update Channel SET'
            ) 
            AND CurrentlyDetected = '1'
        ) THEN 'Update Not Set' 
        WHEN c.ComputerID IN (
          SELECT 
            ComputerID 
          FROM 
            `computerroledefinitions` 
          WHERE 
            RoleDefinitionID IN (
              SELECT 
                RoleDefinitionID 
              FROM 
                RoleDefinitions 
              WHERE 
                RoleName = 'Office 365 Semi-Annual Channel Update'
            ) 
            AND CurrentlyDetected = '1'
        ) THEN 'Semi-Annual Channel' 
        WHEN c.ComputerID IN (
          SELECT 
            ComputerID 
          FROM 
            `computerroledefinitions` 
          WHERE 
            RoleDefinitionID IN (
              SELECT 
                RoleDefinitionID 
              FROM 
                RoleDefinitions 
              WHERE 
                RoleName = 'Office 365 Current Channel Update'
            ) 
            AND CurrentlyDetected = '1'
        ) THEN 'Current Channel' 
        WHEN c.ComputerID IN (
          SELECT 
            ComputerID 
          FROM 
            `computerroledefinitions` 
          WHERE 
            RoleDefinitionID IN (
              SELECT 
                RoleDefinitionID 
              FROM 
                RoleDefinitions 
              WHERE 
                RoleName = 'Office 365 Monthly Channel Update'
            ) 
            AND CurrentlyDetected = '1'
        ) THEN 'Monthly Channel' 
        ELSE 'Non-Standard Channel' 
      END AS `Office 365 Update Channel` 
    FROM 
      Computers c 
      LEFT JOIN Clients cl ON c.ClientID = cl.ClientID 
      JOIN Locations l ON c.LocationID = l.LocationID 
    WHERE 
      c.OS LIKE '%Windows%' 
    GROUP BY 
      c.ComputerID
  ) AS dt
```
