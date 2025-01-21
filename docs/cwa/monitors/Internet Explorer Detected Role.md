---
id: '1c9a68c5-62c9-4454-a6da-0a7c5fb8089d'
title: 'Disable Internet Explorer Monitor'
title_meta: 'Disable Internet Explorer Monitor for Online Machines'
keywords: ['monitor', 'internet', 'explorer', 'disable', 'alert']
description: 'This document outlines a monitoring solution that detects online machines with Internet Explorer installed by checking if the "Internet Explorer Installed" role is enabled. It includes an alert template for autofixing the issue and provides SQL query details for limiting the target to relevant computers.'
tags: ['database', 'report', 'security', 'setup']
draft: false
unlisted: false
---

## Summary

This monitor will detect online machines where Internet Explorer is installed by identifying the machines where the "Internet Explorer Installed" role is enabled.

**Alert Template:** Autofix - Disable Internet Explorer

## Dependencies

- [CWM - Automate - Script - Internet Explorer - Disable [Global, DV, Autofix]](<../scripts/Internet Explorer - Disable Global, DV, Autofix.md>)
- [CWM - Automate - Role - Internet Explorer Installed](<../roles/Internet Explorer Installed.md>)

## Target

The SQL query limits the results to computers where the "Internet Explorer Installed" role is present.

## Translated SQL

```sql
SELECT 
  rd.RoleName AS `TestValue`, 
  rd.comparisonresult AS `IdentityField`, 
  c.computerid, 
  Cl.Name AS `Client Name`, 
  L.Name AS `Location Name`, 
  C.Name AS `Computer Name`, 
  C.OS AS `Operating System`, 
  '00:00:00' as uptimestart, 
  '23:59:59' as uptimeend, 
  0 as noalerts 
FROM 
  computers C 
  JOIN clients Cl ON C.Clientid = Cl.Clientid 
  JOIN locations L ON C.Locationid = L.Locationid 
  JOIN computerroledefinitions crd ON C.computerid = crd.Computerid 
  JOIN roledefinitions rd ON crd.roledefinitionid = rd.RoleDefinitionId 
WHERE 
  rd.RoleDetectionGuid = '57d918d5-8361-11ec-a044-000c295e5f17' 
  AND crd.CurrentlyDetected = 1
  AND C.lastcontact > NOW() - INTERVAL 15 MINUTE
GROUP BY C.Computerid
```

