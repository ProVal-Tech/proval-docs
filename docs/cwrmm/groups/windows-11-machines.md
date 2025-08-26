---
id: 'a3cdc948-d650-413e-8c02-3b549403f88f'
slug: /a3cdc948-d650-413e-8c02-3b549403f88f
title: 'Windows 11 Machines'
title_meta: 'Windows 11 Machines'
keywords: ['windows', 'group', 'dynamic', 'machines', 'criteria']
description: 'This document provides a step-by-step guide on how to create a dynamic group for Windows 11 machines within the CW RMM platform. It includes navigation instructions, setting group criteria, and saving the group'
tags: ['setup', 'windows']
draft: false
unlisted: false
---

## Summary

This document outlines the process for creating a dynamic group specifically for Windows 11 machines.

## Group Creation

1. Navigate to `Devices` > `Device Groups`.
   
   ![Image](../../../static/img/docs/8d5c2d6a-5bb8-4720-bd11-4fa7396fbf7a/image_1.webp)

2. Create a new dynamic group by clicking the `Dynamic Group` button.  
   ![Image](../../../static/img/docs/8d5c2d6a-5bb8-4720-bd11-4fa7396fbf7a/image_2.webp)  
   The following page will appear after clicking the `Dynamic Group` button:  
   ![Image](../../../static/img/docs/8d5c2d6a-5bb8-4720-bd11-4fa7396fbf7a/image_3.webp)

3. Set the group name to `Windows 11 Machines`.  
   Description: `Windows 11 Machines`  
  ![Image](../../../static/img/docs/9bfa70b2-a410-45d7-a8cc-a75c8e90c6f5/image24.webp)

4. Click the `+ Add Criteria` button in the `Criteria` section of the group.  
   ![Image](../../../static/img/docs/8d5c2d6a-5bb8-4720-bd11-4fa7396fbf7a/image_5.webp)  
   The following search box will appear.  
   ![Image](../../../static/img/docs/8d5c2d6a-5bb8-4720-bd11-4fa7396fbf7a/image_6.webp)

5. Search for and select the `OS` criteria.  
   ![Image](../../../static/img/docs/8d5c2d6a-5bb8-4720-bd11-4fa7396fbf7a/image_7.webp)  
   Select `Microsoft Windows 11` in the comparison condition.  
  ![Image](../../../static/img/docs/9bfa70b2-a410-45d7-a8cc-a75c8e90c6f5/image26.webp) 
  ![Image](../../../static/img/docs/9bfa70b2-a410-45d7-a8cc-a75c8e90c6f5/image23.webp) 
   **Condition:** `OS` `Contains any of` `Microsoft Windows 11`

   Click the `Save` button to save/create the group.  


## Completed Group

![Image](../../../static/img/docs/9bfa70b2-a410-45d7-a8cc-a75c8e90c6f5/image25.webp)