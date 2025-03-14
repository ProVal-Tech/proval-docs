---
id: '9bfa70b2-a410-45d7-a8cc-a75c8e90c6f5'
title: 'Windows 11 Compatible Machines'
title_meta: 'Windows 11 Compatible Machines'
keywords: ['windows', 'group', 'dynamic', 'compatibility', 'upgrade']
description: 'This document outlines the steps to create a dynamic group in ConnectWise RMM for identifying Windows 10 computers that are compatible with the Windows 11 upgrade. It includes detailed instructions and screenshots for each step of the process.'
tags: ['windows']
draft: false
unlisted: false
---

## Summary

This document describes how to identify Windows 10 computers that are compatible with the Windows 11 upgrade.

## Dependencies

[CW RMM - Custom Field - Endpoint - Windows 11 Compatible](<../custom-fields/Endpoint - Windows 11 Compatible.md>)

## Group Creation 

1. Navigate to `Devices` > `Device Groups`.
   ![Image](../../../static/img/Windows-11-Compatible-Machines/image_1.png)

2. Create a new dynamic group by clicking the `Dynamic Group` button.  
   ![Image](../../../static/img/Windows-11-Compatible-Machines/image_2.png)  
   This page will appear after clicking the `Dynamic Group` button:  
   ![Image](../../../static/img/Windows-11-Compatible-Machines/image_3.png)

3. Set the group name to `Windows 11 Compatible Machines`.  
   Description: `Windows 10 computers that are compatible with the Windows 11 upgrade.`  
   ![Image](../../../static/img/Windows-11-Compatible-Machines/image_4.png)

4. Click the `+ Add Criteria` in the `Criteria` section of the group.  
   ![Image](../../../static/img/Windows-11-Compatible-Machines/image_5.png)  
   This search box will appear.  
   ![Image](../../../static/img/Windows-11-Compatible-Machines/image_6.png)

5. Search and select the `Windows 11 compatible` custom field from the search box.  
   ![Image](../../../static/img/Windows-11-Compatible-Machines/image_7.png)  
   Set `Yes` in the comparison condition.  
   ![Image](../../../static/img/Windows-11-Compatible-Machines/image_8.png)  
   **Condition:** `Enable Windows 11 Compatible` `Contains any of` `Yes`

6. Click the `+ Add Criteria` button.  
   ![Image](../../../static/img/Windows-11-Compatible-Machines/image_9.png)  
   A new search box will appear.  
   ![Image](../../../static/img/Windows-11-Compatible-Machines/image_10.png)  
   Search and select the `OS` criteria.  
   ![Image](../../../static/img/Windows-11-Compatible-Machines/image_11.png)  
   Select `Microsoft Windows 10` in the comparison condition.  
   ![Image](../../../static/img/Windows-11-Compatible-Machines/image_12.png)  
   **Condition:** `OS` `Contains any of` `Microsoft Windows 10`

7. Click the `Save` button to save/create the group.  
   ![Image](../../../static/img/Windows-11-Compatible-Machines/image_13.png)

## Completed Group 

![Image](../../../static/img/Windows-11-Compatible-Machines/image_14.png)  
![Image](../../../static/img/Windows-11-Compatible-Machines/image_15.png)



