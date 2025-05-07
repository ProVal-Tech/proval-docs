---
id: '22ee8d54-e19d-4b47-9ccd-c45c259f8fb7'
slug: /22ee8d54-e19d-4b47-9ccd-c45c259f8fb7
title: 'Winget Update All (Task Create)'
title_meta: 'Winget Update All (Task Create)'
keywords: ['winget', 'update', 'task', 'windows', 'group']
description: 'This document provides a detailed guide on creating a dynamic group in ConnectWise RMM to detect Windows 10 and 11 computers where the Winget Update All tasks are missing. It outlines the necessary dependencies and step-by-step instructions for setting up the group criteria.'
tags: ['connectwise', 'setup', 'windows']
draft: false
unlisted: false
---

## Summary

This group detects Windows 10 and 11 computers where Winget Update All [System] and Winget Update All [Logged on User] tasks are missing and are opted into the Winget Update All Scheduled task creation solution.

## Dependencies

- [CW RMM - Custom Field - Company - WingetUpdateAll_Task_Create](/docs/40e64c1d-ca29-4c85-9a72-a48b1082b8e1)
- [CW RMM - Custom Field - Company - WingetUpdateAll_Task_Delete](/docs/a398be5b-5709-4ab5-ac33-7feca8fbc00a)
- [CW RMM - Custom Field - EndPoint - WingetUpdateAll_Task_Exclude](/docs/91965ea0-f912-4f5d-8e42-c9ee546293a9)
- [CW RMM - Custom Field - Site - WingetUpdateAll_Task_Exclude](/docs/0c299d28-5fcb-4a1e-a341-1c5e78f74cfb)
- [CW RMM - Custom Field - EndPoint - WingetUpdateAll_Task_Result](/docs/a6ff85ad-b8e9-4e0f-9e2f-db964d483e5f)

## Group Creation

1. Navigate to `Devices` > `Device Groups`.
   ![Step 1](../../../static/img/docs/22ee8d54-e19d-4b47-9ccd-c45c259f8fb7/image_1.webp)

2. Create a new dynamic group by clicking the `Dynamic Group` button.  
   ![Step 2](../../../static/img/docs/22ee8d54-e19d-4b47-9ccd-c45c259f8fb7/image_2.webp)  
   This page will appear after clicking on the `Dynamic Group` button:  
   ![Step 2 Continued](../../../static/img/docs/22ee8d54-e19d-4b47-9ccd-c45c259f8fb7/image_3.webp)

3. Set the group name to `Winget Update All (Task Create)`  
   ![Step 3](../../../static/img/docs/22ee8d54-e19d-4b47-9ccd-c45c259f8fb7/image_4.webp)

4. Click the `+ Add Criteria` in the `Criteria` section of the group.  
   ![Step 4](../../../static/img/docs/22ee8d54-e19d-4b47-9ccd-c45c259f8fb7/image_5.webp)  
   This search box will appear.  
   ![Step 4 Continued](../../../static/img/docs/22ee8d54-e19d-4b47-9ccd-c45c259f8fb7/image_6.webp)

5. Search and select the `WingetUpdateAll_Task_Delete` custom field from the search box.  
   ![Step 5](../../../static/img/docs/22ee8d54-e19d-4b47-9ccd-c45c259f8fb7/image_7.webp)  
   Set `False` in the comparison condition.  
   ![Step 5 Continued](../../../static/img/docs/22ee8d54-e19d-4b47-9ccd-c45c259f8fb7/image_8.webp)  
   **Condition:** `WingetUpdateAll_Task_Delete` `Equals` `False`

6. Click the `+ Add Criteria` button.  
   ![Step 6](../../../static/img/docs/22ee8d54-e19d-4b47-9ccd-c45c259f8fb7/image_9.webp)  
   A new search box will appear.  
   ![Step 6 Continued](../../../static/img/docs/22ee8d54-e19d-4b47-9ccd-c45c259f8fb7/image_10.webp)  
   Search and select the `WingetUpdateAll_Task_Exclude` custom field from the search box.  
   ![Step 6 Continued](../../../static/img/docs/22ee8d54-e19d-4b47-9ccd-c45c259f8fb7/image_11.webp)  
   Set `False` in the comparison condition.  
   ![Step 6 Continued](../../../static/img/docs/22ee8d54-e19d-4b47-9ccd-c45c259f8fb7/image_12.webp)  
   **Condition:** `WingetUpdateAll_Task_Exclude` `Equals` `False`

7. Click the `+ Add Criteria` button.  
   ![Step 7](../../../static/img/docs/22ee8d54-e19d-4b47-9ccd-c45c259f8fb7/image_13.webp)  
   A new search box will appear.  
   ![Step 7 Continued](../../../static/img/docs/22ee8d54-e19d-4b47-9ccd-c45c259f8fb7/image_14.webp)  
   Search and select the `WingetUpdateAll_Task_Exclude` custom field from the search box. Both Site and computer-level custom fields have the same name, so ensure you select both fields. You have selected one in the previous step; select the other one in this step.  
   ![Step 7 Continued](../../../static/img/docs/22ee8d54-e19d-4b47-9ccd-c45c259f8fb7/image_15.webp)  
   Set `False` in the comparison condition.  
   ![Step 7 Continued](../../../static/img/docs/22ee8d54-e19d-4b47-9ccd-c45c259f8fb7/image_12.webp)  
   **Condition:** `WingetUpdateAll_Task_Exclude` `Equals` `False`

8. Click the `+ Add Criteria` button.  
   ![Step 8](../../../static/img/docs/22ee8d54-e19d-4b47-9ccd-c45c259f8fb7/image_13.webp)  
   A new search box will appear.  
   ![Step 8 Continued](../../../static/img/docs/22ee8d54-e19d-4b47-9ccd-c45c259f8fb7/image_14.webp)  
   Search and select the `WingetUpdateAll_Task_Create` custom field from the search box.  
   ![Step 8 Continued](../../../static/img/docs/22ee8d54-e19d-4b47-9ccd-c45c259f8fb7/image_16.webp)  
   Set `True` in the comparison condition.  
   ![Step 8 Continued](../../../static/img/docs/22ee8d54-e19d-4b47-9ccd-c45c259f8fb7/image_17.webp)  
   **Condition:** `WingetUpdateAll_Task_Create` `Equals` `True`

9. Click the `+ Add Criteria` button.  
   ![Step 9](../../../static/img/docs/22ee8d54-e19d-4b47-9ccd-c45c259f8fb7/image_18.webp)  
   A new search box will appear.  
   ![Step 9 Continued](../../../static/img/docs/22ee8d54-e19d-4b47-9ccd-c45c259f8fb7/image_19.webp)  
   Search and select the `WingetUpdateAll_Task_Result` custom field from the search box.  
   ![Step 9 Continued](../../../static/img/docs/22ee8d54-e19d-4b47-9ccd-c45c259f8fb7/image_20.webp)  
   Select `Does Not Contain any of` for the comparator and set `Task Created` in the comparison condition.  
   ![Step 9 Continued](../../../static/img/docs/22ee8d54-e19d-4b47-9ccd-c45c259f8fb7/image_21.webp)  
   **Condition:** `WingetUpdateAll_Task_Result` `Does Not Contain any of` `Task Created`

10. Click the `+ Add Criteria` button.  
    ![Step 10](../../../static/img/docs/22ee8d54-e19d-4b47-9ccd-c45c259f8fb7/image_22.webp)  
    A new search box will appear.  
    ![Step 10 Continued](../../../static/img/docs/22ee8d54-e19d-4b47-9ccd-c45c259f8fb7/image_23.webp)  
    Search and select the `OS` criteria from the search box.  
    ![Step 10 Continued](../../../static/img/docs/22ee8d54-e19d-4b47-9ccd-c45c259f8fb7/image_24.webp)  
    Select `Contains any of` for the comparator and select `Microsoft Windows 10 and 11` for the comparison field.  
    ![Step 10 Continued](../../../static/img/docs/22ee8d54-e19d-4b47-9ccd-c45c259f8fb7/image_25.webp)  
    **Condition:** `OS` `Contains any of` `Microsoft Windows` `10` `11`

11. Click the `Save` button to save/create the group.  
    ![Step 11](../../../static/img/docs/22ee8d54-e19d-4b47-9ccd-c45c259f8fb7/image_26.webp)

## Completed Group

![Completed Group](../../../static/img/docs/22ee8d54-e19d-4b47-9ccd-c45c259f8fb7/image_27.webp)  
![Completed Group](../../../static/img/docs/22ee8d54-e19d-4b47-9ccd-c45c259f8fb7/image_28.webp)
