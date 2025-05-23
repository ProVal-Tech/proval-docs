---
id: '87d623c4-d8e2-4c25-b838-f9c0dee5043d'
slug: /87d623c4-d8e2-4c25-b838-f9c0dee5043d
title: 'Out of Date CU _ Reboot Pending'
title_meta: 'Out of Date CU _ Reboot Pending'
keywords: ['cumulative', 'update', 'reboot', 'pending', 'group', 'creation', 'criteria', 'windows']
description: 'This document details the steps to create a dynamic group in ConnectWise RMM that identifies computers where a Cumulative Update has been installed but requires a reboot. It includes dependencies, group creation steps, and criteria for filtering devices based on their update status.'
tags: ['reboot', 'update', 'windows']
draft: false
unlisted: false
---

## Summary

This document groups computers where a Cumulative Update was installed by the Out of Date Cumulative Update (Autofix) task, but a reboot is pending.

## Dependencies

- [CW RMM - Custom Field - EndPoint - Out_of_Date_CU_Autofix_Result](/docs/2d24daab-16cb-4b2d-b7e6-0e757b4f2523)  
- [CW RMM - Custom Field - EndPoint - Out_of_Date_CU_Autofix_Date](/docs/044210c4-14ae-4996-ab9f-009290bf05e4)  

## Group Creation

1. Navigate to `Devices` > `Device Groups`.
   ![Step 1](../../../static/img/docs/87d623c4-d8e2-4c25-b838-f9c0dee5043d/image_1.webp)

2. Create a new dynamic group by clicking the `Dynamic Group` button.  
   ![Step 2](../../../static/img/docs/87d623c4-d8e2-4c25-b838-f9c0dee5043d/image_2.webp)  
   This page will appear after clicking on the `Dynamic Group` button:  
   ![Step 2 Continued](../../../static/img/docs/87d623c4-d8e2-4c25-b838-f9c0dee5043d/image_3.webp)

3. Set the group name to `Out of Date CU - Reboot Pending`.  
   Description: `Groups computers where Cumulative Update was installed by the Out of Date Cumulative Update (Autofix) task but a reboot is pending.`  
   ![Step 3](../../../static/img/docs/87d623c4-d8e2-4c25-b838-f9c0dee5043d/image_4.webp)

4. Click the `+ Add Criteria` in the `Criteria` section of the group.  
   ![Step 4](../../../static/img/docs/87d623c4-d8e2-4c25-b838-f9c0dee5043d/image_5.webp)  
   This search box will appear.  
   ![Step 4 Continued](../../../static/img/docs/87d623c4-d8e2-4c25-b838-f9c0dee5043d/image_6.webp)

5. Search and select the `Out_of_Date_CU_Autofix_Result` custom field from the search box.  
   ![Step 5](../../../static/img/docs/87d623c4-d8e2-4c25-b838-f9c0dee5043d/image_7.webp)  
   Type `Reboot Pending` in the comparison condition and press `Enter`.  
   ![Step 5 Continued](../../../static/img/docs/87d623c4-d8e2-4c25-b838-f9c0dee5043d/image_8.webp)  
   **Condition:** `Out_of_Date_CU_Autofix_Result` `Contains any of` `Reboot Pending`

6. Click the `+ Add Criteria` button.  
   ![Step 6](../../../static/img/docs/87d623c4-d8e2-4c25-b838-f9c0dee5043d/image_9.webp)  
   A new search box will appear.  
   ![Step 6 Continued](../../../static/img/docs/87d623c4-d8e2-4c25-b838-f9c0dee5043d/image_10.webp)  
   Search and select the `OS` criteria.  
   ![Step 6 Continued](../../../static/img/docs/87d623c4-d8e2-4c25-b838-f9c0dee5043d/image_11.webp)  
   Select all available instances of `Microsoft Windows` `10`, `11`, `Server 2016`, `2019`, and `2022` in the comparison field.  
   ![Step 6 Continued](../../../static/img/docs/87d623c4-d8e2-4c25-b838-f9c0dee5043d/image_12.webp)  
   ![Step 6 Continued](../../../static/img/docs/87d623c4-d8e2-4c25-b838-f9c0dee5043d/image_13.webp)  
   **Condition:** `OS` `Contains any of` `Microsoft Windows 10`, `Microsoft Windows 11`, `Microsoft Windows Server 2016`, `Microsoft Windows Server 2019`, `Microsoft Windows Server 2022`

7. Click the `+ Add Criteria` button.  
   ![Step 7](../../../static/img/docs/87d623c4-d8e2-4c25-b838-f9c0dee5043d/image_14.webp)  
   A new search box will appear.  
   ![Step 7 Continued](../../../static/img/docs/87d623c4-d8e2-4c25-b838-f9c0dee5043d/image_15.webp)  
   Search and select the `Out_of_Date_CU_Autofix_Date` custom field from the search box.  
   ![Step 7 Continued](../../../static/img/docs/87d623c4-d8e2-4c25-b838-f9c0dee5043d/image_16.webp)  
   Change the comparator to `Does Not Contain any of`.  
   ![Step 7 Continued](../../../static/img/docs/87d623c4-d8e2-4c25-b838-f9c0dee5043d/image_17.webp)  
   Type `0001-01-01 00:00:00` in the comparison field and press `Enter`.  
   ![Step 7 Continued](../../../static/img/docs/87d623c4-d8e2-4c25-b838-f9c0dee5043d/image_18.webp)  
   **Condition:** `Out_of_Date_CU_Autofix_Date` `Does Not Contain any of` `0001-01-01 00:00:00`

8. Click the `Save` button to save/create the group.  
   ![Step 8](../../../static/img/docs/87d623c4-d8e2-4c25-b838-f9c0dee5043d/image_19.webp)

## Completed Group

![Completed Group 1](../../../static/img/docs/87d623c4-d8e2-4c25-b838-f9c0dee5043d/image_20.webp)  
![Completed Group 2](../../../static/img/docs/87d623c4-d8e2-4c25-b838-f9c0dee5043d/image_21.webp)