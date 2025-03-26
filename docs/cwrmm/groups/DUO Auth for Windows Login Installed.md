---
id: '5202450b-3b85-46ff-9f35-6ea804223270'
slug: /5202450b-3b85-46ff-9f35-6ea804223270
title: 'DUO Auth for Windows Login Installed'
title_meta: 'DUO Auth for Windows Login Installed'
keywords: ['duo', 'windows', 'login', 'group', 'agents']
description: 'This document provides a comprehensive guide on creating a dynamic group for agents where DUO Auth for Windows Login is installed. It includes details about the group creation process, dependencies, and criteria for the group.'
tags: ['deployment', 'windows']
draft: false
unlisted: false
---

## Summary

This group contains the list of agents where the DUO Auth for Windows Login is already installed via the script "DUO Install & Upgrade - Latest Version." It is built for auditing purposes.

## Dependencies

[CW RMM Custom Fields - Duo Authentication for Windows Logon Deployment](/docs/a9578dd1-1f6b-4932-a614-5ed823656416)

## Details

| Field Name                           | Type of Field (Machine or Organization) | Description                                                                                                                |
|--------------------------------------|-----------------------------------------|----------------------------------------------------------------------------------------------------------------------------|
| DUO Auth for Windows Login Installed  | Dynamic                                 | This group contains the list of agents where the DUO Auth for Windows Login is already installed via the script "DUO Install & Upgrade - Latest Version." |

## Group Creation

1. Navigate to `Devices` > `Device Groups`.
   ![](../../../static/img/DUO-Auth-for-Windows-Login-Installed/image_1.png)

2. Create a new dynamic group by clicking the `Dynamic Group` button.  
   ![](../../../static/img/DUO-Auth-for-Windows-Login-Installed/image_2.png)  
   This page will appear after clicking on the `Dynamic Group` button:  
   ![](../../../static/img/DUO-Auth-for-Windows-Login-Installed/image_3.png)

3. Set the group name to `DUO Auth for Windows Login Installed`.  
   Description: `This group contains the list of agents where the DUO Auth for Windows Login is already installed via the script "DUO Install & Upgrade - Latest Version."`  
   ![](../../../static/img/DUO-Auth-for-Windows-Login-Installed/image_4.png)

4. Click the `+ Add Criteria` in the `Criteria` section of the group.  
   ![](../../../static/img/DUO-Auth-for-Windows-Login-Installed/image_5.png)  
   This search box will appear.  
   ![](../../../static/img/DUO-Auth-for-Windows-Login-Installed/image_6.png)

5. - Search and select the `Duo Deployment Result` custom field from the search box.
   - Set `Success` in the comparison condition.  
   ![](../../../static/img/DUO-Auth-for-Windows-Login-Installed/image_7.png)  
   **Condition:** `Duo Deployment Result` `Contain any of` `Success`


