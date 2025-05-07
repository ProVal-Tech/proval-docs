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
   ![Image](../../../static/img/docs/9bed886f-fa13-4389-932e-47c62482db0d/image_1.webp)

2. Create a new dynamic group by clicking the `Dynamic Group` button.  
   ![Image](../../../static/img/docs/9bed886f-fa13-4389-932e-47c62482db0d/image_2.webp)  
   The following page will appear after clicking the `Dynamic Group` button:  
   ![Image](../../../static/img/docs/9bed886f-fa13-4389-932e-47c62482db0d/image_3.webp)

3. Set the group name to `SentinelOne Installed`.  
   Description: `The group contains the Windows machines where the Sentinel Agent is installed.`  
   ![Image](../../../static/img/docs/9bed886f-fa13-4389-932e-47c62482db0d/image_4.webp)

4. Click the `+ Add Criteria` in the `Criteria` section of the group.  
   ![Image](../../../static/img/docs/9bed886f-fa13-4389-932e-47c62482db0d/image_5.webp)  
   This search box will appear.  
   ![Image](../../../static/img/docs/9bed886f-fa13-4389-932e-47c62482db0d/image_6.webp)

5. Search and select the `Installed Software Name` condition from the search box.  
   ![Image](../../../static/img/docs/9bed886f-fa13-4389-932e-47c62482db0d/image_7.webp)  
   Set `Sentinel Agent` in the comparison condition.  
   ![Image](../../../static/img/docs/9bed886f-fa13-4389-932e-47c62482db0d/image_8.webp)  
   **Condition:** `Installed Software Name` `Contains any of` `Sentinel Agent`

6. Click the `Save` button to save/create the group.  
   ![Image](../../../static/img/docs/9bed886f-fa13-4389-932e-47c62482db0d/image_9.webp)

## Completed Group

![Image](../../../static/img/docs/9bed886f-fa13-4389-932e-47c62482db0d/image_10.webp)  
![Image](../../../static/img/docs/9bed886f-fa13-4389-932e-47c62482db0d/image_11.webp)
