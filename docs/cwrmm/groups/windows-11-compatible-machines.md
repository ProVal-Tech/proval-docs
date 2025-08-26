---
id: '9bfa70b2-a410-45d7-a8cc-a75c8e90c6f5'
slug: /9bfa70b2-a410-45d7-a8cc-a75c8e90c6f5
title: 'Windows 11 Compatible Machines'
title_meta: 'Windows 11 Compatible Machines'
keywords: ['windows', 'group', 'dynamic', 'compatibility', 'upgrade']
description: 'This document outlines the steps to create a dynamic group in ConnectWise RMM for identifying Windows 10/11 computers that are compatible with the Windows 11 upgrade. It includes detailed instructions and screenshots for each step of the process.'
tags: ['windows']
draft: false
unlisted: false
---

## Summary

This document describes how to identify Windows 10/11 computers that are compatible with the Windows 11 upgrade.

## Dependencies

[CW RMM - Custom Field - Endpoint - Windows 11 Compatible](/docs/99719e54-ce8f-4b76-93f4-cc832a3b88cf)

## Group Creation 

1. Navigate to `Devices` > `Device Groups`.
   
   ![Image](../../../static/img/docs/9bfa70b2-a410-45d7-a8cc-a75c8e90c6f5/image_1.webp)

2. Create a new dynamic group by clicking the `Dynamic Group` button.  
   ![Image](../../../static/img/docs/9bfa70b2-a410-45d7-a8cc-a75c8e90c6f5/image_2.webp)  
   This page will appear after clicking the `Dynamic Group` button:  
   ![Image](../../../static/img/docs/9bfa70b2-a410-45d7-a8cc-a75c8e90c6f5/image_3.webp)

3. Set Group Name and Description
   - Group name: `Windows 11 Compatible Machines`.  
   - Description:  `Windows 10/11 computers that are compatible with the Windows 11 upgrade.`  
   ![Image](../../../static/img/docs/9bfa70b2-a410-45d7-a8cc-a75c8e90c6f5/image27.webp)

4. Click the `+ Add Criteria` in the `Criteria` section of the group.  
   ![Image](../../../static/img/docs/9bfa70b2-a410-45d7-a8cc-a75c8e90c6f5/image_5.webp)  
   This search box will appear.  
   ![Image](../../../static/img/docs/9bfa70b2-a410-45d7-a8cc-a75c8e90c6f5/image_6.webp)

5. Search and select the `Windows 11 compatible` custom field from the search box.  
   ![Image](../../../static/img/docs/9bfa70b2-a410-45d7-a8cc-a75c8e90c6f5/image_7.webp)  
   Set `Yes` in the comparison condition.  
   ![Image](../../../static/img/docs/9bfa70b2-a410-45d7-a8cc-a75c8e90c6f5/image_8.webp)  
   - **Condition:** `Enable Windows 11 Compatible` `Contains any of` `Yes`

6. Click the `+ Add Criteria` button.  
   ![Image](../../../static/img/docs/9bfa70b2-a410-45d7-a8cc-a75c8e90c6f5/image_9.webp)  

   A new search box will appear.  

   ![Image](../../../static/img/docs/9bfa70b2-a410-45d7-a8cc-a75c8e90c6f5/image_10.webp)  

   Search and select the `OS` criteria.  

   ![Image](../../../static/img/docs/9bfa70b2-a410-45d7-a8cc-a75c8e90c6f5/image_11.webp) 

   Select `Microsoft Windows 10` and `Microsoft Windows 11` in the comparison condition. 

   ![Image](../../../static/img/docs/9bfa70b2-a410-45d7-a8cc-a75c8e90c6f5/image16.webp) 
  
   - **Condition:** `OS` `Contains any of` `Microsoft Windows 10` and `Microsoft Windows 11`

7. Click the `Save` button to save/create the group.  
   ![Image](../../../static/img/docs/9bfa70b2-a410-45d7-a8cc-a75c8e90c6f5/image28.webp)

## Completed Group 
 
![Image](../../../static/img/docs/9bfa70b2-a410-45d7-a8cc-a75c8e90c6f5/image29.webp)