---
id: 'cwa-monitor-online-computer'
title: 'Monitor for Online Computer Matching Location Password'
title_meta: 'Monitor for Online Computer Matching Location Password'
keywords: ['monitor', 'online', 'computer', 'location', 'password', 'unifi', 'health', 'check']
description: 'This document outlines a method to monitor for online computers that match specific location passwords, allowing for targeted operations such as running health checks on Unifi systems. It includes SQL queries for data retrieval and dependencies on ITGlue documents.'
tags: ['monitoring', 'unifi', 'sql', 'networking', 'clients', 'locations', 'uptime']
draft: false
unlisted: false
---
## Summary

Monitor will find a computer that is online at a location that matches the first 3 octets of a location password.url with a matching password.title in the monitor line 21.

Example usage is to find an online computer at a location to run a Unifi Health Check script against.

## Dependencies

This should be a list of ITGlue documents listed in the Related Items sidebar on which this monitor depends.

- Autofix Script if applicable

## Target

The suggested target for the monitor. This will be partially generalized as group names can vary between Automate systems. Examples:

Global

## Translated SQL

```
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
LEFT JOIN agentcomputerdata acd ON acd.computerid=computers.computerid
LEFT JOIN locations on locations.locationid = computers.locationid
LEFT JOIN clients on clients.clientid = computers.clientid
LEFT JOIN passwords ON computers.locationid = passwords.locationid AND computers.localaddress LIKE (SELECT CONCAT (
(SELECT 
      CONCAT(SUBSTRING_INDEX( passwords.url , '.', 1 ),'.',
      SUBSTRING_INDEX(SUBSTRING_INDEX( passwords.url , '.', 2 ),'.',-1),'.',
      SUBSTRING_INDEX(SUBSTRING_INDEX( passwords.url , '.', -2 ),'.',1))
      ),'.%'))

WHERE passwords.title = 'Unifi NVR'
AND Computers.LastContact > DATE_ADD(NOW(),INTERVAL -15 MINUTE)
AND computers.os LIKE '%Windows%'
GROUP BY computers.locationid
```



