---
id: 'f7cf60a6-9107-4188-9993-41ed9ed243d1'
title: 'Windows Feature Pack Update Failure: Low Drive Space Error'
title_meta: 'Windows Feature Pack Update Failure: Low Drive Space Error'
keywords: ['windows', 'feature', 'update', 'drive', 'space', 'error']
description: 'This document provides a detailed guide on categorizing Windows 10 and 11 computers where the Feature Update Install with Tracking script failed due to a Low Drive Space Error. It outlines the necessary criteria and steps for creating a dynamic group to manage these failures effectively.'
tags: ['windows', 'group', 'error', 'update', 'criteria', 'management']
draft: false
unlisted: false
---
## Summary

Categorize the Windows 10 and 11 Computers where the `Feature Update Install with Tracking` script failed because of a Low Drive Space Error.

## Dependencies

[CW RMM - Task - Feature Update Install With Tracking](https://proval.itglue.com/DOC-5078775-12947845)  
[CW RMM - Custom Field - Feature Update Install Failure](https://proval.itglue.com/DOC-5078775-14592254)

## Summary

![Image](../../../static/img/Windows-Feature-Pack-Update-Failure-Low-Drive-Space-Error/image_1.png)  
**Group Type:** Dynamic Group  
**Group Name:** Windows Feature Pack Update Failure: Low Drive Space Error  

**Description:**  
Categorize the Windows 10 and 11 Computers where the `Feature Update Install with Tracking` script failed because of a Low Drive Space Error.

## Criteria

- Select `OS Build Number` for the Criteria `Does Not Contain any` for comparator and type `19045` and `22631` in the condition box.  
![Image](../../../static/img/Windows-Feature-Pack-Update-Failure-Low-Drive-Space-Error/image_2.png)  
![Image](../../../static/img/Windows-Feature-Pack-Update-Failure-Low-Drive-Space-Error/image_3.png)  
![Image](../../../static/img/Windows-Feature-Pack-Update-Failure-Low-Drive-Space-Error/image_4.png)  
![Image](../../../static/img/Windows-Feature-Pack-Update-Failure-Low-Drive-Space-Error/image_5.png)  

- Click the `Add Criteria` button to add another Criteria.  
![Image](../../../static/img/Windows-Feature-Pack-Update-Failure-Low-Drive-Space-Error/image_6.png)  

- Select `Feature Update Install Failure` custom field for criteria, `Equal` for comparator and type `Low Drive Space Error` in the condition box.  
![Image](../../../static/img/Windows-Feature-Pack-Update-Failure-Low-Drive-Space-Error/image_7.png)  
![Image](../../../static/img/Windows-Feature-Pack-Update-Failure-Low-Drive-Space-Error/image_8.png)  

## Group

Click the `Save` button to Save the Group.  
![Image](../../../static/img/Windows-Feature-Pack-Update-Failure-Low-Drive-Space-Error/image_9.png)  
![Image](../../../static/img/Windows-Feature-Pack-Update-Failure-Low-Drive-Space-Error/image_10.png)  






