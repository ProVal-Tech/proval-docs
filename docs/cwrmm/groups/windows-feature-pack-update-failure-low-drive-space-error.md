---
id: 'f7cf60a6-9107-4188-9993-41ed9ed243d1'
slug: /f7cf60a6-9107-4188-9993-41ed9ed243d1
title: 'Windows Feature Pack Update Failure Low Drive Space Error'
title_meta: 'Windows Feature Pack Update Failure Low Drive Space Error'
keywords: ['windows', 'feature', 'update', 'drive', 'space', 'error']
description: 'This document provides a detailed guide on categorizing Windows 10 and 11 computers where the Feature Update Install with Tracking script failed due to a Low Drive Space Error. It outlines the necessary criteria and steps for creating a dynamic group to manage these failures effectively.'
tags: ['update', 'windows']
draft: false
unlisted: false
---

## Summary

This document categorizes Windows 10 and 11 computers where the `Feature Update Install with Tracking` script failed due to a Low Drive Space Error.

## Dependencies

- [CW RMM - Task - Feature Update Install With Tracking](/docs/5244ac77-6926-4902-a183-b4b2aac18e2b)  
- [CW RMM - Custom Field - Feature Update Install Failure](/docs/1c9abaeb-17f0-4a3b-86ee-953b5b713dc3)

## Summary

![Image](../../../static/img/docs/f7cf60a6-9107-4188-9993-41ed9ed243d1/image_1.png)  
**Group Type:** Dynamic Group  
**Group Name:** Windows Feature Pack Update Failure: Low Drive Space Error  

**Description:**  
Categorize Windows 10 and 11 computers where the `Feature Update Install with Tracking` script failed due to a Low Drive Space Error.

## Criteria

1. Select `OS Build Number` for the criteria, choose `Does Not Contain any` for the comparator, and type `19045` and `22631` in the condition box.  
   ![Image](../../../static/img/docs/f7cf60a6-9107-4188-9993-41ed9ed243d1/image_2.png)  
   ![Image](../../../static/img/docs/f7cf60a6-9107-4188-9993-41ed9ed243d1/image_3.png)  
   ![Image](../../../static/img/docs/f7cf60a6-9107-4188-9993-41ed9ed243d1/image_4.png)  
   ![Image](../../../static/img/docs/f7cf60a6-9107-4188-9993-41ed9ed243d1/image_5.png)  

2. Click the `Add Criteria` button to add another criterion.  
   ![Image](../../../static/img/docs/f7cf60a6-9107-4188-9993-41ed9ed243d1/image_6.png)  

3. Select the `Feature Update Install Failure` custom field for criteria, choose `Equal` for the comparator, and type `Low Drive Space Error` in the condition box.  
   ![Image](../../../static/img/docs/f7cf60a6-9107-4188-9993-41ed9ed243d1/image_7.png)  
   ![Image](../../../static/img/docs/f7cf60a6-9107-4188-9993-41ed9ed243d1/image_8.png)  

## Group

Click the `Save` button to save the group.  
![Image](../../../static/img/docs/f7cf60a6-9107-4188-9993-41ed9ed243d1/image_9.png)  
![Image](../../../static/img/docs/f7cf60a6-9107-4188-9993-41ed9ed243d1/image_10.png)  


