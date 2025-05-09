---
id: 'beaa71b6-62a3-4800-9c24-da92d4566965'
slug: /beaa71b6-62a3-4800-9c24-da92d4566965
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

[CW RMM Custom Fields - Duo Authentication for Windows Logon Deployment](/docs/a9578dd1-1f6b-4932-a614-5ed823656416)

## Details

| Field Name                             | Type of Field (Machine or Organization) | Description                                                                                                                                         |
|----------------------------------------|-----------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------|
| DUO Auth for Windows Login Failed      | Dynamic                                 | This group records the agents where the "DUO Install & Upgrade - Latest Version" failed to deploy the "DUO Auth for Windows Login" application. It is built for auditing purposes. |

## Group Creation

1. Navigate to `Devices` > `Device Groups`.  
   ![Image](../../../static/img/docs/beaa71b6-62a3-4800-9c24-da92d4566965/image_1.webp)

2. Create a new dynamic group by clicking the `Dynamic Group` button.  
   ![Image](../../../static/img/docs/beaa71b6-62a3-4800-9c24-da92d4566965/image_2.webp)  
   This page will appear after clicking on the `Dynamic Group` button:  
   ![Image](../../../static/img/docs/beaa71b6-62a3-4800-9c24-da92d4566965/image_3.webp)

3. Set the group name to `DUO Auth for Windows Login Failed`.  
   Description: `This group records the agents where the "DUO Install & Upgrade - Latest Version" failed to deploy the "DUO Auth for Windows Login" application.`  
   ![Image](../../../static/img/docs/beaa71b6-62a3-4800-9c24-da92d4566965/image_4.webp)

4. Click the `+ Add Criteria` in the `Criteria` section of the group.  
   ![Image](../../../static/img/docs/beaa71b6-62a3-4800-9c24-da92d4566965/image_5.webp)  
   This search box will appear.  
   ![Image](../../../static/img/docs/beaa71b6-62a3-4800-9c24-da92d4566965/image_6.webp)

5. - Search and select the `Duo Deployment Result` custom field from the search box.  
   - Set `Failed` in the comparison condition.  
   ![Image](../../../static/img/docs/beaa71b6-62a3-4800-9c24-da92d4566965/image_7.webp)  
   **Condition:** `Duo Deployment Result` `Contain any of` `Failed`