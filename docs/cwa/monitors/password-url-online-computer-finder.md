---
id: '87d846e1-3f32-4e3d-b4f9-4c17d2d2830f'
slug: /87d846e1-3f32-4e3d-b4f9-4c17d2d2830f
title: 'Password URL Online Computer Finder'
title_meta: 'Password URL Online Computer Finder'
keywords: ['monitor', 'online', 'computer', 'location', 'password', 'unifi', 'health', 'check']
description: 'This document outlines a method to monitor for online computers that match specific location passwords, allowing for targeted operations such as running health checks on Unifi systems. It includes SQL queries for data retrieval and dependencies on ITGlue documents.'
tags: ['networking', 'sql', 'unifi']
draft: false
unlisted: false
---

## Summary

This monitor will find a computer that is online at a location that matches the first three octets of a location password URL with a matching password title in the monitor line 21.

An example usage is to find an online computer at a location to run a Unifi Health Check script against.

## Dependencies

This section should list the ITGlue documents mentioned in the Related Items sidebar on which this monitor depends.

- Autofix Script, if applicable

## Target

The suggested target for the monitor. This will be partially generalized as group names can vary between Automate systems. Examples:

- Global

## Translated SQL

```sql
SELECT 
    MAX(computers.computerid) AS 'testvalue',
    computers.name AS 'identityfield',
    computers.computerid,
    clients.name AS `clientname`,
    locations.name AS `locationname`,
    acd.uptimestart,
    acd.uptimeend,
    acd.noalerts
FROM computers
LEFT JOIN agentcomputerdata acd ON acd.computerid = computers.computerid
LEFT JOIN locations ON locations.locationid = computers.locationid
LEFT JOIN clients ON clients.clientid = computers.clientid
LEFT JOIN passwords ON computers.locationid = passwords.locationid AND computers.localaddress LIKE (
    SELECT CONCAT (
        (SELECT 
            CONCAT(SUBSTRING_INDEX(passwords.url, '.', 1), '.', 
            SUBSTRING_INDEX(SUBSTRING_INDEX(passwords.url, '.', 2), '.', -1), '.', 
            SUBSTRING_INDEX(SUBSTRING_INDEX(passwords.url, '.', -2), '.', 1))
        ), '.%')
    )
WHERE passwords.title = 'Unifi NVR'
AND computers.LastContact > DATE_ADD(NOW(), INTERVAL -15 MINUTE)
AND computers.os LIKE '%Windows%'
GROUP BY computers.locationid
```


