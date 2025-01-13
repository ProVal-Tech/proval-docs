---
id: 'rmm-windows-feature-update-reboot-pending'
title: 'Categorizing Windows 10 and 11 Computers with Reboot Pending'
title_meta: 'Categorizing Windows 10 and 11 Computers with Reboot Pending'
keywords: ['windows', 'reboot', 'feature', 'update', 'pending', 'dynamic', 'group']
description: 'This document outlines the process for categorizing Windows 10 and 11 computers where the Feature Update Install with Tracking script has been completed but a reboot is still pending. It includes dependencies, criteria for selection, and steps to create a dynamic group for better management.'
tags: ['windows', 'update', 'reboot', 'group', 'dynamic', 'feature']
draft: false
unlisted: false
---
## Summary

Categorize the Windows 10 and 11 Computers where the `Feature Update Install with Tracking` script is completed but a reboot is pending.

## Dependencies

[CW RMM - Task - Feature Update Install With Tracking](https://proval.itglue.com/DOC-5078775-12947845)  
[CW RMM - Custom Field - Feature Update Reboot Pending](https://proval.itglue.com/DOC-5078775-14592255)  
[CW RMM - Task - Feature Update Install (Reboot Pending Machines Validation)](https://proval.itglue.com/DOC-5078775-14591604)  

## Summary

![Image](../../../static/img/Windows-Feature-Pack-Update-Reboot-Pending/image_1.png)  
**Group Type:** Dynamic  
**Group Name:** Windows Feature Pack Update: Reboot Pending  
**Description:** Categorize the Windows 10 and 11 Computers where the `Feature Update Install with Tracking` script is completed but a reboot is pending.

## Criteria

- Select `OS Build Number` for the Criteria `Does Not Contain any` for comparator and type `19045` and `22631` in the condition box.  
![Image](../../../static/img/Windows-Feature-Pack-Update-Reboot-Pending/image_2.png)  
![Image](../../../static/img/Windows-Feature-Pack-Update-Reboot-Pending/image_3.png)  
![Image](../../../static/img/Windows-Feature-Pack-Update-Reboot-Pending/image_4.png)  
![Image](../../../static/img/Windows-Feature-Pack-Update-Reboot-Pending/image_5.png)  

- Click the `Add Criteria` button to add another Criteria.  
![Image](../../../static/img/Windows-Feature-Pack-Update-Reboot-Pending/image_6.png)  

- Select `Feature Update Reboot Pending` custom field for criteria, `Equal` for comparator and type `True` in the condition box.  
![Image](../../../static/img/Windows-Feature-Pack-Update-Reboot-Pending/image_7.png)  
![Image](../../../static/img/Windows-Feature-Pack-Update-Reboot-Pending/image_8.png)  

## Group

Click the Save button to Save the Group.  
![Image](../../../static/img/Windows-Feature-Pack-Update-Reboot-Pending/image_9.png)  
![Image](../../../static/img/Windows-Feature-Pack-Update-Reboot-Pending/image_10.png)  



