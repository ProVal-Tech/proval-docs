---
id: '7d1dbc08-c217-455d-b00b-d5d9d40d63b0'
slug: /7d1dbc08-c217-455d-b00b-d5d9d40d63b0
title: 'DUO Authentication Proxy Update'
title_meta: 'DUO Authentication Proxy Update'
keywords: ['duo', 'authentication', 'proxy', 'update', 'software']
description: 'This document provides a comprehensive guide on updating the Duo Authentication Proxy application to the latest version, including implementation steps and associated content for effective monitoring and execution.'
tags: ['installation', 'software', 'update']
draft: false
unlisted: false
---

## Purpose

This solution will update the Duo Authentication Proxy application to the latest version.

## Associated Content

| Content                                                                                                                                           | Type           | Function                                                                                          |
|---------------------------------------------------------------------------------------------------------------------------------------------------|----------------|---------------------------------------------------------------------------------------------------|
| [CWM - Automate - Remote Monitor - ProVal - Development - Software - Update - DUO Auth Proxy](/docs/588520f3-c262-4b80-8c56-0b9411ab0bdc) | Remote Monitor  | Detects the machines with older versions of the DUO Auth Proxy application.                       |
| [CWM - Automate - Script - DUO Auth Proxy - Install/Update Latest Version [Global, Autofix]](/docs/775e0b37-b55c-47fb-bec6-a01314ac123f)   | Autofix Script | Updates the application for the machines detected by the monitor set.                            |
| △ Custom - Update - DUO Auth Proxy                                                                                                               | Alert Template  | Executes the Autofix Script on the machines detected by the monitor set.                          |

## Implementation

- Create a search for the Windows computers having the 'DUO Security Authentication Proxy' application installed.
- Create a group and limit it to the search created in the first step.
- Import the [CWM - Automate - Script - DUO Auth Proxy - Install/Update Latest Version [Global, Autofix]](/docs/775e0b37-b55c-47fb-bec6-a01314ac123f) script.
- Create/Import the `△ Custom - Update - DUO Auth Proxy` alert template.  

  ```sql
  INSERT INTO `alerttemplate` (
   `Name`, `Comment`, `Last_User`, `Last_Date`, 
   `GUID`
  ) 
  SELECT 
   '△ Custom - Update - DUO Auth Proxy' AS `Name`, 
   '△ Custom - Update - DUO Auth Proxy' AS `Comment`, 
   'PRONOC' AS `Last_User`, 
   (NOW()) AS `Last_Date`, 
   'fd4b5f87-9677-4b4f-82c4-aad647b6e201' AS `GUID` 
  WHERE 
   (
     SELECT 
      COUNT(*) 
     FROM 
      alerttemplate 
     WHERE 
      GUID = 'fd4b5f87-9677-4b4f-82c4-aad647b6e201'
   ) = '0';

  INSERT INTO `alerttemplates` (
   `AlertActionID`, `DayOfWeek`, `TimeStart`, 
   `TimeEnd`, `AlertAction`, `ContactID`, 
   `UserID`, `ScriptID`, `Trump`, `GUID`, 
   `WarningAction`
  ) 
  SELECT 
   (
     SELECT 
      alertactionid 
     FROM 
      alerttemplate 
     WHERE 
      `GUID` = 'fd4b5f87-9677-4b4f-82c4-aad647b6e201'
   ) AS `AlertActionid`, 
   '127' AS `DayOfWeek`, 
   '00:00:00' AS `TimeStart`, 
   '23:59:00' AS `TimeEnd`, 
   '512' AS `AlertAction`, 
   '-2' AS `ContactID`, 
   '0' AS `UserID`, 
   (
     SELECT 
      Scriptid 
     FROM 
      lt_scripts 
     WHERE 
      scriptGUID = '4f1db3c7-cf3f-11ed-bf6a-000c295e5f21'
   ) AS `Scriptid`, 
   '0' AS `Trump`, 
   'f94370da-7432-4acb-b102-022473d59d52' AS `GUID`, 
   '512' AS `WarningAction` 
  WHERE 
   (
     SELECT 
      COUNT(*) 
     FROM 
      alerttemplates 
     WHERE 
      GUID = 'f94370da-7432-4acb-b102-022473d59d52'
   ) = '0';
  ```

- Create the [CWM - Automate - Internal Monitor - ProVal - Development - Software - Update - DUO Auth Proxy](/docs/588520f3-c262-4b80-8c56-0b9411ab0bdc) remote monitor on the group created in the second step.
- Assign the alert template to the monitor.