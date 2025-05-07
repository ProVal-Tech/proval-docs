---
id: 'a8ce29e2-502c-4bb8-a959-c7eb59e38808'
slug: /a8ce29e2-502c-4bb8-a959-c7eb59e38808
title: 'Winget Update All (Task Delete)'
title_meta: 'Winget Update All (Task Delete)'
keywords: ['winget', 'task', 'windows', 'deletion', 'group']
description: 'This document outlines the process for identifying Windows 10 and 11 computers with scheduled Winget Update All tasks and removing them. It includes detailed steps for creating a dynamic group in ConnectWise RMM to manage these tasks effectively.'
tags: ['windows']
draft: false
unlisted: false
---

## Summary

This document identifies Windows 10 and 11 computers with the presence of Winget Update All [System] and Winget Update All [Logged on User] tasks and explains how to remove these scheduled tasks.

## Dependencies

- [CW RMM - Custom Field - Company - WingetUpdateAll_Task_Create](/docs/40e64c1d-ca29-4c85-9a72-a48b1082b8e1)
- [CW RMM - Custom Field - Company - WingetUpdateAll_Task_Delete](/docs/a398be5b-5709-4ab5-ac33-7feca8fbc00a)
- [CW RMM - Custom Field - EndPoint - WingetUpdateAll_Task_Exclude](/docs/91965ea0-f912-4f5d-8e42-c9ee546293a9)
- [CW RMM - Custom Field - Site - WingetUpdateAll_Task_Exclude](/docs/0c299d28-5fcb-4a1e-a341-1c5e78f74cfb)
- [CW RMM - Custom Field - EndPoint - WingetUpdateAll_Task_Result](/docs/a6ff85ad-b8e9-4e0f-9e2f-db964d483e5f)

## Group Creation

1. Navigate to `Devices` > `Device Groups`.
   ![Step 1](../../../static/img/docs/a8ce29e2-502c-4bb8-a959-c7eb59e38808/image_1.png)

2. Create a new dynamic group by clicking the `Dynamic Group` button.
   ![Step 2](../../../static/img/docs/a8ce29e2-502c-4bb8-a959-c7eb59e38808/image_2.png)  
   This page will appear after clicking on the `Dynamic Group` button:  
   ![Step 2.1](../../../static/img/docs/a8ce29e2-502c-4bb8-a959-c7eb59e38808/image_3.png)

3. Set the group name to `Winget Update All (Task Delete)`.
   ![Step 3](../../../static/img/docs/a8ce29e2-502c-4bb8-a959-c7eb59e38808/image_4.png)

4. Click the `+ Add Criteria` in the `Criteria` section of the group.
   ![Step 4](../../../static/img/docs/a8ce29e2-502c-4bb8-a959-c7eb59e38808/image_5.png)  
   This search box will appear.  
   ![Step 4.1](../../../static/img/docs/a8ce29e2-502c-4bb8-a959-c7eb59e38808/image_6.png)

5. Search and select the `WingetUpdateAll_Task_Delete` custom field from the search box.
   ![Step 5](../../../static/img/docs/a8ce29e2-502c-4bb8-a959-c7eb59e38808/image_7.png)  
   Set `True` in the comparison condition.  
   ![Step 5.1](../../../static/img/docs/a8ce29e2-502c-4bb8-a959-c7eb59e38808/image_8.png)  
   **Condition:** `WingetUpdateAll_Task_Delete` `Equals` `True`

6. Click the `+ Add Criteria` button.
   ![Step 6](../../../static/img/docs/a8ce29e2-502c-4bb8-a959-c7eb59e38808/image_9.png)  
   Change the Conditional Operator to `OR` from `AND`.  
   ![Step 6.1](../../../static/img/docs/a8ce29e2-502c-4bb8-a959-c7eb59e38808/image_10.png)  
   Search and select the `WingetUpdateAll_Task_Exclude` custom field from the search box.  
   ![Step 6.2](../../../static/img/docs/a8ce29e2-502c-4bb8-a959-c7eb59e38808/image_11.png)  
   Set `True` in the comparison condition.  
   ![Step 6.3](../../../static/img/docs/a8ce29e2-502c-4bb8-a959-c7eb59e38808/image_12.png)  
   **Condition:** `WingetUpdateAll_Task_Exclude` `Equals` `True`

7. Click the `+ Add Criteria` button.
   ![Step 7](../../../static/img/docs/a8ce29e2-502c-4bb8-a959-c7eb59e38808/image_9.png)  
   Change the Logical Operator to `OR` from `AND`.  
   ![Step 7.1](../../../static/img/docs/a8ce29e2-502c-4bb8-a959-c7eb59e38808/image_10.png)  
   Search and select the `WingetUpdateAll_Task_Exclude` custom field from the search box. Both Site and computer-level custom fields have the same name, so ensure you select both fields. You have selected one in the previous step; select the other one in this step.  
   ![Step 7.2](../../../static/img/docs/a8ce29e2-502c-4bb8-a959-c7eb59e38808/image_13.png)  
   Set `True` in the comparison condition.  
   ![Step 7.3](../../../static/img/docs/a8ce29e2-502c-4bb8-a959-c7eb59e38808/image_12.png)  
   **Condition:** `WingetUpdateAll_Task_Exclude` `Equals` `True`

8. Click the `Add Outer Block` button.  
   ![Step 8](../../../static/img/docs/a8ce29e2-502c-4bb8-a959-c7eb59e38808/image_14.png)  
   Change the Logical Operator to `AND` from `OR` for the Outer Block.  
   ![Step 8.1](../../../static/img/docs/a8ce29e2-502c-4bb8-a959-c7eb59e38808/image_15.png)

9. Click the `+ Add Criteria` button in the Outer Block.  
   ![Step 9](../../../static/img/docs/a8ce29e2-502c-4bb8-a959-c7eb59e38808/image_16.png)  
   This search box will appear.  
   ![Step 9.1](../../../static/img/docs/a8ce29e2-502c-4bb8-a959-c7eb59e38808/image_17.png)  
   Search and select the `WingetUpdateAll_Task_Create` custom field from the search box.  
   ![Step 9.2](../../../static/img/docs/a8ce29e2-502c-4bb8-a959-c7eb59e38808/image_18.png)  
   Set `False` in the comparison condition.  
   ![Step 9.3](../../../static/img/docs/a8ce29e2-502c-4bb8-a959-c7eb59e38808/image_19.png)  
   **Condition:** `WingetUpdateAll_Task_Create` `Equals` `False`

10. Click the `+ Add Criteria` button in the Outer Block.  
    ![Step 10](../../../static/img/docs/a8ce29e2-502c-4bb8-a959-c7eb59e38808/image_20.png)  
    This search box will appear.  
    ![Step 10.1](../../../static/img/docs/a8ce29e2-502c-4bb8-a959-c7eb59e38808/image_17.png)  
    Search and select the `WingetUpdateAll_Task_Result` custom field from the search box.  
    ![Step 10.2](../../../static/img/docs/a8ce29e2-502c-4bb8-a959-c7eb59e38808/image_21.png)  
    Select `Does Not Contain any of` for the comparator and set `Task Deleted` in the comparison condition.  
    ![Step 10.3](../../../static/img/docs/a8ce29e2-502c-4bb8-a959-c7eb59e38808/image_22.png)  
    **Condition:** `WingetUpdateAll_Task_Result` `Does Not Contain any of` `Task Deleted`

11. Click the `+ Add Criteria` button.  
    ![Step 11](../../../static/img/docs/a8ce29e2-502c-4bb8-a959-c7eb59e38808/image_23.png)  
    A new search box will appear.  
    ![Step 11.1](../../../static/img/docs/a8ce29e2-502c-4bb8-a959-c7eb59e38808/image_24.png)  
    Search and select the `OS` criteria from the search box.  
    ![Step 11.2](../../../static/img/docs/a8ce29e2-502c-4bb8-a959-c7eb59e38808/image_25.png)  
    Select `Contains any of` for the comparator and select `Microsoft Windows 10 and 11` for the comparison field.  
    ![Step 11.3](../../../static/img/docs/a8ce29e2-502c-4bb8-a959-c7eb59e38808/image_26.png)  
    **Condition:** `OS` `Contains any of` `Microsoft Windows 10 and 11`

12. Click the `Save` button

