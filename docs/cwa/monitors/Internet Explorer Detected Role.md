---
id: 'cwa-disable-internet-explorer-monitor'
title: 'Disable Internet Explorer Monitor'
title_meta: 'Disable Internet Explorer Monitor for Online Machines'
keywords: ['monitor', 'internet', 'explorer', 'disable', 'alert']
description: 'This document outlines a monitoring solution that detects online machines with Internet Explorer installed by checking if the "Internet Explorer Installed" role is enabled. It includes an alert template for autofixing the issue and provides SQL query details for limiting the target to relevant computers.'
tags: ['alert', 'client', 'computer', 'configuration', 'database', 'report', 'security', 'setup']
draft: false
unlisted: false
---
## Summary

This monitor will detect online machines where internet explorer is installed by detecting the machines where the "Internet Explorer Installed" Role is Enabled.

Alert Template: ~Autofix - Disable Internet Explorer

## Dependencies

- [CWM - Automate - Script - Internet Explorer - Disable [Global, DV, Autofix]](https://proval.itglue.com/DOC-5078775-10220659)
- [CWM - Automate - Role - Internet Explorer Installed](https://proval.itglue.com/DOC-5078775-10731232)

## Target

SQL query is limiting it to the Computers where "Internet Explorer Installed" role is installed.

## Translated SQL

```
SELECT 
  rd.RoleName AS `TestValue`, 
  rd.comparisonresult AS `IdentityField`, 
  c.computerid, 
  [Cl.Name](http://cl.Name) AS `Client Name`, 
  [L.Name](http://l.Name) AS `Location Name`, 
  [C.Name](http://c.Name) AS `Computer Name`, 
  C.OS AS `Operating System`, 
  '00:00:00' as uptimestart, 
  '23:59:59' as uptimeend, 
  0 as noalerts 
FROM 
  computers C 
  JOIN clients Cl ON C.Clientid = Cl.CLientid 
  JOIN locations L ON C.Locationid = L.Locationid 
  JOIN computerroledefinitions crd ON c.computerid = crd.Computerid 
  JOIN roledefinitions rd ON crd.roledefinitionid = rd.RoleDefinitionId 
WHERE 
  rd.RoleDetectionGuid = '57d918d5-8361-11ec-a044-000c295e5f17' 
  AND crd.CurrentlyDetected = 1
  AND c.lastcontact > NOW() - Interval 15 Minute
  Group By C.Computerid
```


