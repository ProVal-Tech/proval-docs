---
id: 'cwa-windows-update-monitor'
title: 'Windows Update Monitor for CWM Automate'
title_meta: 'Windows Update Monitor for CWM Automate'
keywords: ['monitor', 'windows', 'update', 'report', 'ticket']
description: 'This document outlines an optional monitor set designed to track machines where the Windows Update Report script has executed but failed to retrieve data. It includes SQL queries and dependencies necessary for effective monitoring and ticket creation if issues are detected.'
tags: ['monitoring', 'sql', 'report', 'ticket', 'windows']
draft: false
unlisted: false
---
## Summary

This is an optional monitor set to keep an eye on the machines where [CWM - Automate - Script - Windows Update Report [DV]](https://proval.itglue.com/DOC-5078775-10861682) script had executed at least twice in a month but failed to fetch any data.

By default it's a view-only monitor set but the `default - create automate ticket` alert template can be used to create tickets.

## Dependencies

- [CWM - Automate - Script - Windows Update Report [DV]](https://proval.itglue.com/DOC-5078775-10861682)
- [CWM - Automate - Internal Monitor - ProVal - Development - Fetch Windows Update Report [DV]](https://proval.itglue.com/DOC-5078775-10946276)
- [CWM - Automate - Solution - Windows Update Report](https://proval.itglue.com/DOC-5078775-10861707)
- [CWM - Automate - Custom Table - plugin_proval_windows_update_report](https://proval.itglue.com/DOC-5078775-10861700)
- [SEC - Windows Patching - Custom Table - plugin_proval_windows_os_support](https://proval.itglue.com/DOC-5078775-7780690)

## Target

SQL Query is limiting the monitor to the machines which are supported by Microsoft and have Managed Patch policy applied.

## Translated SQL

```
SELECT 
  c.os AS testvalue, 
  c.`version` AS IdentityField, 
  c.computerid, 
  Cl.`Name` As `Client Name`, 
  l.`Name` As `Location Name`, 
  c.`Name` AS `Computer Name`, 
  c.lastContact AS `Last Contact`, 
  acd.uptimestart, 
  acd.uptimeend, 
  acd.noalerts 
FROM 
  computers c 
  JOIN Clients Cl on c.clientid = C.clientid 
  JOIN Locations L on c.locationid = L.locationid 
  JOIN agentcomputerdata acd on acd.computerid = c.computerid 
  LEFT JOIN `plugin_proval_windows_os_support` pp ON CasE When pp.build IS NULL 
  or pp.build = '' THEN c.os REGEXP pp.BaseOS ELSE (
    pp.build = c.version 
    AND c.os REGEXP pp.BaseOS
  ) END 
WHERE 
  (
    SELECT 
      COUNT(Softwarepolicy) 
    FROM 
      computerpatchpolicies 
    WHERE 
      Installpolicy IN (
        SELECT 
          ID 
        FROM 
          installsoftwarepolicies 
        WHERE 
          UpdateMode IN (5,6)
      ) 
      AND computerid = c.computerid
  ) <> 0 
  AND c.os LIKE '%Windows%' 
  AND (
    SELECT 
      COUNT(scriptid) 
    FROM 
      h_scripts 
    WHERE 
      scriptid = (
        SELECT 
          DISTINCT scriptid 
        FROM 
          lt_scripts 
        WHERE 
          scriptguid = '24e0791d-1733-11ed-9676-000c295e5f17'
      ) 
      AND StartedDate > NOW() - INTERVAL 30 DAY 
      AND Computerid = c.computerid
  ) > 1 
  AND (
    SELECT 
      Count(computerid) 
    From 
      plugin_proval_windows_update_report 
    Where 
      STR_To_date(
        scriptruntime, '%m/%d/%Y %H:%i:%S'
      ) < NOW() - INTERVAL 1 Month 
      AND computerid = c.computerid
  ) = 0 
  AND IF(
    NOW() < (
      CasE WHEN c.os REGEXP 'LTS[CB]' THEN supportltsbend WHEN c.os REGEXP 'Enterprise|Server' THEN supportenterpriseend ELSE supportmainstreamend END
    ), 
    'No', 
    'Yes'
  ) <> 'Yes'
```



