---
id: '2212752f-e9e3-4a12-af3f-f12972cf9fb4'
slug: /2212752f-e9e3-4a12-af3f-f12972cf9fb4
title: 'DUO Auth Proxy Deployment Failed'
title_meta: 'DUO Auth Proxy Deployment Failed'
keywords: ['duo', 'deployment', 'failed', 'audit', 'devices']
description: 'This document outlines the devices where the DUO Security Authentication Proxy application deployment failed, providing details for auditing purposes and instructions for creating a dynamic group in ConnectWise RMM to track these failures.'
tags: ['security']
draft: false
unlisted: false
---

## Summary

This document contains the devices where the "DUO Security Authentication Proxy" application deployment failed due to the script "DUO Auth Proxy - Install/Update Latest Version." It is built for auditing purposes.

## Dependencies

[CW RMM Custom Fields - DUO Auth Proxy Deployment](/docs/94f21e35-d184-4fb5-9215-898bb367a0e9)

## Details

| Field Name                          | Type of Field (Machine or Organization) | Description                                                                                                                                             |
|-------------------------------------|-----------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------|
| DUO Auth Proxy Deployment Failed     | Dynamic                                 | This contains the devices where the "DUO Security Authentication Proxy" application deployment failed due to the script "DUO Auth Proxy - Install/Update Latest Version." It is built for auditing purposes. |

## Group Creation

1. Navigate to `Devices` > `Device Groups`.  
   ![Devices and Device Groups](../../../static/img/docs/2212752f-e9e3-4a12-af3f-f12972cf9fb4/image_1.png)

2. Create a new dynamic group by clicking the `Dynamic Group` button.  
   ![Dynamic Group Button](../../../static/img/docs/2212752f-e9e3-4a12-af3f-f12972cf9fb4/image_2.png)  
   This page will appear after clicking on the `Dynamic Group` button:  
   ![Dynamic Group Page](../../../static/img/docs/2212752f-e9e3-4a12-af3f-f12972cf9fb4/image_3.png)

3. Set the group name to `DUO Auth Proxy Deployment Failed`.  
   Description: `This contains the devices where the "DUO Security Authentication Proxy" application deployment failed due to the script "DUO Auth Proxy - Install/Update Latest Version."`  
   ![Group Name and Description](../../../static/img/docs/2212752f-e9e3-4a12-af3f-f12972cf9fb4/image_4.png)

4. Click the `+ Add Criteria` in the `Criteria` section of the group.  
   ![Add Criteria](../../../static/img/docs/2212752f-e9e3-4a12-af3f-f12972cf9fb4/image_5.png)  
   This search box will appear.  
   ![Search Box](../../../static/img/docs/2212752f-e9e3-4a12-af3f-f12972cf9fb4/image_6.png)

5. - Search and select the `Duo Auth Proxy Result` custom field from the search box.
   - Set `Failed` in the comparison condition.  
   ![Search and Select Custom Field](../../../static/img/docs/2212752f-e9e3-4a12-af3f-f12972cf9fb4/image_7.png)  
   **Condition:** `Duo Auth Proxy Result` `Does Not Contain any of` `Failed`


