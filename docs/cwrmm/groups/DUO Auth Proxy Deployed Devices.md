---
id: 'a940aac1-4586-4e35-90f6-749ec3b2e1d7'
title: 'DUO Auth Proxy Deployment Overview'
title_meta: 'DUO Auth Proxy Deployment Overview'
keywords: ['duo', 'security', 'authentication', 'proxy', 'deployment', 'audit']
description: 'This document provides an overview of devices where the DUO Security Authentication Proxy application is deployed using the DUO Auth Proxy - Install/Update Latest Version script. It serves as an auditing tool to track deployment status.'
tags: ['dynamic', 'group', 'devices', 'custom', 'fields', 'report']
draft: false
unlisted: false
---
## Summary

This shows the devices where the "DUO Security Authentication Proxy" application is deployed by the script "DUO Auth Proxy - Install/Update Latest Version".  
It is built for auditing purposes.

## Dependencies

[CW RMM Custom Fields - DUO Auth Proxy Deployment](https://proval.itglue.com/DOC-5078775-17914128)

## Details

| Field Name                           | Type of Field (Machine or Organization) | Description                                                                                                                                                                |
|--------------------------------------|-----------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| DUO Auth Proxy Deployed Devices      | Dynamic                                 | This shows the devices where the "DUO Security Authentication Proxy" application is deployed by the script "DUO Auth Proxy - Install/Update Latest Version". It is built for auditing purposes. |

---

## Group Creation

1. Navigate to `Devices` > `Device Groups`.  
   ![Image](../../../static/img/DUO-Auth-Proxy-Deployed-Devices/image_1.png)

2. Create a new dynamic group by clicking the `Dynamic Group` button.  
   ![Image](../../../static/img/DUO-Auth-Proxy-Deployed-Devices/image_2.png)  
   This page will appear after clicking on the `Dynamic Group` button:  
   ![Image](../../../static/img/DUO-Auth-Proxy-Deployed-Devices/image_3.png)

3. Set the group name to `DUO Auth Proxy Deployed Devices`.  
   Description: `This shows the devices where the "DUO Security Authentication Proxy" application is deployed by the script "DUO Auth Proxy - Install/Update Latest Version".`  
   ![Image](../../../static/img/DUO-Auth-Proxy-Deployed-Devices/image_4.png)

4. Search and select the `Duo Auth Proxy Result` custom field from the search box.  
   Set `Success` in the comparison condition.  
   ![Image](../../../static/img/DUO-Auth-Proxy-Deployed-Devices/image_5.png)  
   **Condition:** `Duo Auth Proxy Result` `Contain any of` `Success`






