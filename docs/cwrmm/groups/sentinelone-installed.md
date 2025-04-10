---
id: '9bed886f-fa13-4389-932e-47c62482db0d'
slug: /9bed886f-fa13-4389-932e-47c62482db0d
title: 'SentinelOne Installed'
title_meta: 'SentinelOne Installed'
keywords: ['sentinelone', 'windows', 'group', 'dynamic', 'agent']
description: 'This document provides a step-by-step guide on how to create a dynamic group in Kaseya VSA for Windows machines that have the Sentinel Agent installed. It includes detailed instructions and images to assist in the setup process.'
tags: ['setup', 'software', 'windows']
draft: false
unlisted: false
---

## Summary

This document outlines the process for creating a dynamic group that includes Windows machines with the Sentinel Agent installed.

## Group Creation

1. Navigate to `Devices` > `Device Groups`.
   ![Image](../../../static/img/SentinelOne-Installed/image_1.png)

2. Create a new dynamic group by clicking the `Dynamic Group` button.  
   ![Image](../../../static/img/SentinelOne-Installed/image_2.png)  
   The following page will appear after clicking the `Dynamic Group` button:  
   ![Image](../../../static/img/SentinelOne-Installed/image_3.png)

3. Set the group name to `SentinelOne Installed`.  
   Description: `The group contains the Windows machines where the Sentinel Agent is installed.`  
   ![Image](../../../static/img/SentinelOne-Installed/image_4.png)

4. Click the `+ Add Criteria` in the `Criteria` section of the group.  
   ![Image](../../../static/img/SentinelOne-Installed/image_5.png)  
   This search box will appear.  
   ![Image](../../../static/img/SentinelOne-Installed/image_6.png)

5. Search and select the `Installed Software Name` condition from the search box.  
   ![Image](../../../static/img/SentinelOne-Installed/image_7.png)  
   Set `Sentinel Agent` in the comparison condition.  
   ![Image](../../../static/img/SentinelOne-Installed/image_8.png)  
   **Condition:** `Installed Software Name` `Contains any of` `Sentinel Agent`

6. Click the `Save` button to save/create the group.  
   ![Image](../../../static/img/SentinelOne-Installed/image_9.png)

## Completed Group

![Image](../../../static/img/SentinelOne-Installed/image_10.png)  
![Image](../../../static/img/SentinelOne-Installed/image_11.png)


