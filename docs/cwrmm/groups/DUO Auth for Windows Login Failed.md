---
id: 'beaa71b6-62a3-4800-9c24-da92d4566965'
title: 'DUO Auth for Windows Login Failed'
title_meta: 'DUO Auth for Windows Login Failed'
keywords: ['duo', 'deployment', 'failed', 'windows', 'login', 'group', 'audit']
description: 'This document outlines the process for creating a dynamic group that records agents where the DUO Install & Upgrade - Latest Version failed to deploy the DUO Auth for Windows Login application, serving auditing purposes.'
tags: ['windows']
draft: false
unlisted: false
---

## Summary

This group records the agents where the "DUO Install & Upgrade - Latest Version" failed to deploy the "DUO Auth for Windows Login" application. It is built for auditing purposes.

## Dependencies

[CW RMM Custom Fields - Duo Authentication for Windows Logon Deployment](<../custom-fields/Duo Authentication for Windows Logon Deployment.md>)

## Details

| Field Name                             | Type of Field (Machine or Organization) | Description                                                                                                                                         |
|----------------------------------------|-----------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------|
| DUO Auth for Windows Login Failed      | Dynamic                                 | This group records the agents where the "DUO Install & Upgrade - Latest Version" failed to deploy the "DUO Auth for Windows Login" application. It is built for auditing purposes. |

## Group Creation

1. Navigate to `Devices` > `Device Groups`.  
   ![Image](../../../static/img/DUO-Auth-for-Windows-Login-Failed/image_1.png)

2. Create a new dynamic group by clicking the `Dynamic Group` button.  
   ![Image](../../../static/img/DUO-Auth-for-Windows-Login-Failed/image_2.png)  
   This page will appear after clicking on the `Dynamic Group` button:  
   ![Image](../../../static/img/DUO-Auth-for-Windows-Login-Failed/image_3.png)

3. Set the group name to `DUO Auth for Windows Login Failed`.  
   Description: `This group records the agents where the "DUO Install & Upgrade - Latest Version" failed to deploy the "DUO Auth for Windows Login" application.`  
   ![Image](../../../static/img/DUO-Auth-for-Windows-Login-Failed/image_4.png)

4. Click the `+ Add Criteria` in the `Criteria` section of the group.  
   ![Image](../../../static/img/DUO-Auth-for-Windows-Login-Failed/image_5.png)  
   This search box will appear.  
   ![Image](../../../static/img/DUO-Auth-for-Windows-Login-Failed/image_6.png)

5. - Search and select the `Duo Deployment Result` custom field from the search box.  
   - Set `Failed` in the comparison condition.  
   ![Image](../../../static/img/DUO-Auth-for-Windows-Login-Failed/image_7.png)  
   **Condition:** `Duo Deployment Result` `Contain any of` `Failed`



