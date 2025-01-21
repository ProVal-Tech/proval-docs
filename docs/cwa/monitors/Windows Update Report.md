---
id: '4a1b21f7-1b25-4640-9405-8c07277c54f0'
title: 'Windows Update Monitor for CWM Automate'
title_meta: 'Windows Update Monitor for CWM Automate'
keywords: ['monitor', 'windows', 'update', 'report', 'ticket']
description: 'This document outlines an optional monitor set designed to track machines where the Windows Update Report script has executed but failed to retrieve data. It includes SQL queries and dependencies necessary for effective monitoring and ticket creation if issues are detected.'
tags: ['report', 'sql', 'windows']
draft: false
unlisted: false
---

## Summary

This is an optional monitor set to keep an eye on the machines where [CWM - Automate - Script - Windows Update Report [DV]](<../scripts/Windows Update Report DV.md>) script has executed at least twice in a month but failed to fetch any data.

By default, it's a view-only monitor set, but the `default - create automate ticket` alert template can be used to create tickets.

## Dependencies

- [CWM - Automate - Script - Windows Update Report [DV]](<../scripts/Windows Update Report DV.md>)
- [CWM - Automate - Internal Monitor - ProVal - Development - Fetch Windows Update Report [DV]](<./Get Windows Update Report DV.md>)
- [CWM - Automate - Solution - Windows Update Report](https://proval.itglue.com/DOC-5078775-10861707)
- [CWM - Automate - Custom Table - plugin_proval_windows_update_report](<../tables/plugin_proval_windows_update_report.md>)
- [SEC - Windows Patching - Custom Table - plugin_proval_windows_os_support](<../tables/plugin_proval_windows_os_support.md>)

## Target

The SQL query is limiting the monitor to the machines that are supported by Microsoft and have a Managed Patch policy applied.

## Translated SQL

```sql
SELECT 
  c.os AS testvalue, 
  c.version AS IdentityField, 
  c.computerid, 
  Cl.Name AS ClientName, 
  l.Name AS LocationName, 
  c.Name AS ComputerName, 
  c.lastContact AS LastContact, 
  acd.uptimestart, 
  acd.uptimeend, 
  acd.noalerts 
FROM 
  computers c 
  JOIN Clients Cl ON c.clientid = Cl.clientid 
  JOIN Locations L ON c.locationid = L.locationid 
  JOIN agentcomputerdata acd ON acd.computerid = c.computerid 
  LEFT JOIN plugin_proval_windows_os_support pp ON CASE 
    WHEN pp.build IS NULL OR pp.build = '' THEN c.os REGEXP pp.BaseOS 
    ELSE (pp.build = c.version AND c.os REGEXP pp.BaseOS) 
  END 
WHERE 
  (SELECT 
    COUNT(Softwarepolicy) 
  FROM 
    computerpatchpolicies 
  WHERE 
    Installpolicy IN (SELECT 
      ID 
    FROM 
      installsoftwarepolicies 
    WHERE 
      UpdateMode IN (5, 6)) 
    AND computerid = c.computerid) <> 0 
  AND c.os LIKE '%Windows%' 
  AND (SELECT 
    COUNT(scriptid) 
  FROM 
    h_scripts 
  WHERE 
    scriptid = (SELECT 
      DISTINCT scriptid 
    FROM 
      lt_scripts 
    WHERE 
      scriptguid = '24e0791d-1733-11ed-9676-000c295e5f17') 
    AND StartedDate > NOW() - INTERVAL 30 DAY 
    AND Computerid = c.computerid) > 1 
  AND (SELECT 
    COUNT(computerid) 
  FROM 
    plugin_proval_windows_update_report 
  WHERE 
    STR_TO_DATE(scriptruntime, '%m/%d/%Y %H:%i:%S') < NOW() - INTERVAL 1 MONTH 
    AND computerid = c.computerid) = 0 
  AND IF(NOW() < (CASE 
    WHEN c.os REGEXP 'LTS[CB]' THEN supportltsbend 
    WHEN c.os REGEXP 'Enterprise|Server' THEN supportenterpriseend 
    ELSE supportmainstreamend 
  END), 
    'No', 
    'Yes') <> 'Yes'
```

