---
id: 'a940aac1-4586-4e35-90f6-749ec3b2e1d7'
slug: /a940aac1-4586-4e35-90f6-749ec3b2e1d7
title: 'DUO Auth Proxy Deployed Devices'
title_meta: 'DUO Auth Proxy Deployed Devices'
keywords: ['duo', 'security', 'authentication', 'proxy', 'deployment', 'audit']
description: 'This document provides an overview of devices where the DUO Security Authentication Proxy application is deployed using the DUO Auth Proxy - Install/Update Latest Version script. It serves as an auditing tool to track deployment status.'
tags: ['report']
draft: false
unlisted: false
---

## Summary

This document shows the devices where the "DUO Security Authentication Proxy" application is deployed by the script "DUO Auth Proxy - Install/Update Latest Version." It is built for auditing purposes.

## Dependencies

[CW RMM Custom Fields - DUO Auth Proxy Deployment](/docs/94f21e35-d184-4fb5-9215-898bb367a0e9)

## Details

| Field Name                           | Type of Field (Machine or Organization) | Description                                                                                                                                                                |
|--------------------------------------|-----------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| DUO Auth Proxy Deployed Devices      | Dynamic                                 | This shows the devices where the "DUO Security Authentication Proxy" application is deployed by the script "DUO Auth Proxy - Install/Update Latest Version." It is built for auditing purposes. |

---

## Group Creation

1. Navigate to `Devices` > `Device Groups`.  
   ![Image](../../../static/img/docs/a940aac1-4586-4e35-90f6-749ec3b2e1d7/image_1.webp)

2. Create a new dynamic group by clicking the `Dynamic Group` button.  
   ![Image](../../../static/img/docs/a940aac1-4586-4e35-90f6-749ec3b2e1d7/image_2.webp)  
   This page will appear after clicking on the `Dynamic Group` button:  
   ![Image](../../../static/img/docs/a940aac1-4586-4e35-90f6-749ec3b2e1d7/image_3.webp)

3. Set the group name to `DUO Auth Proxy Deployed Devices`.  
   Description: `This shows the devices where the "DUO Security Authentication Proxy" application is deployed by the script "DUO Auth Proxy - Install/Update Latest Version."`  
   ![Image](../../../static/img/docs/a940aac1-4586-4e35-90f6-749ec3b2e1d7/image_4.webp)

4. Search and select the `Duo Auth Proxy Result` custom field from the search box.  
   Set `Success` in the comparison condition.  
   ![Image](../../../static/img/docs/a940aac1-4586-4e35-90f6-749ec3b2e1d7/image_5.webp)  
   **Condition:** `Duo Auth Proxy Result` `Contain any of` `Success`