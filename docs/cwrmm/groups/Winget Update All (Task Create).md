---
id: '22ee8d54-e19d-4b47-9ccd-c45c259f8fb7'
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

- [CW RMM - Custom Field - Company - WingetUpdateAll_Task_Create](<../custom-fields/Company - WingetUpdateAll_Task_Create.md>)
- [CW RMM - Custom Field - Company - WingetUpdateAll_Task_Delete](<../custom-fields/Company - WingetUpdateAll_Task_Delete.md>)
- [CW RMM - Custom Field - EndPoint - WingetUpdateAll_Task_Exclude](<../custom-fields/EndPoint - WingetUpdateAll_Task_Exclude.md>)
- [CW RMM - Custom Field - Site - WingetUpdateAll_Task_Exclude](<../custom-fields/Site - WingetUpdateAll_Task_Exclude.md>)
- [CW RMM - Custom Field - EndPoint - WingetUpdateAll_Task_Result](<../custom-fields/EndPoint - WingetUpdateAll_Task_Result.md>)

## Group Creation

1. Navigate to `Devices` > `Device Groups`.
   ![Step 1](../../../static/img/Winget-Update-All-(Task-Create)/image_1.png)

2. Create a new dynamic group by clicking the `Dynamic Group` button.  
   ![Step 2](../../../static/img/Winget-Update-All-(Task-Create)/image_2.png)  
   This page will appear after clicking on the `Dynamic Group` button:  
   ![Step 2 Continued](../../../static/img/Winget-Update-All-(Task-Create)/image_3.png)

3. Set the group name to `Winget Update All (Task Create)`  
   ![Step 3](../../../static/img/Winget-Update-All-(Task-Create)/image_4.png)

4. Click the `+ Add Criteria` in the `Criteria` section of the group.  
   ![Step 4](../../../static/img/Winget-Update-All-(Task-Create)/image_5.png)  
   This search box will appear.  
   ![Step 4 Continued](../../../static/img/Winget-Update-All-(Task-Create)/image_6.png)

5. Search and select the `WingetUpdateAll_Task_Delete` custom field from the search box.  
   ![Step 5](../../../static/img/Winget-Update-All-(Task-Create)/image_7.png)  
   Set `False` in the comparison condition.  
   ![Step 5 Continued](../../../static/img/Winget-Update-All-(Task-Create)/image_8.png)  
   **Condition:** `WingetUpdateAll_Task_Delete` `Equals` `False`

6. Click the `+ Add Criteria` button.  
   ![Step 6](../../../static/img/Winget-Update-All-(Task-Create)/image_9.png)  
   A new search box will appear.  
   ![Step 6 Continued](../../../static/img/Winget-Update-All-(Task-Create)/image_10.png)  
   Search and select the `WingetUpdateAll_Task_Exclude` custom field from the search box.  
   ![Step 6 Continued](../../../static/img/Winget-Update-All-(Task-Create)/image_11.png)  
   Set `False` in the comparison condition.  
   ![Step 6 Continued](../../../static/img/Winget-Update-All-(Task-Create)/image_12.png)  
   **Condition:** `WingetUpdateAll_Task_Exclude` `Equals` `False`

7. Click the `+ Add Criteria` button.  
   ![Step 7](../../../static/img/Winget-Update-All-(Task-Create)/image_13.png)  
   A new search box will appear.  
   ![Step 7 Continued](../../../static/img/Winget-Update-All-(Task-Create)/image_14.png)  
   Search and select the `WingetUpdateAll_Task_Exclude` custom field from the search box. Both Site and computer-level custom fields have the same name, so ensure you select both fields. You have selected one in the previous step; select the other one in this step.  
   ![Step 7 Continued](../../../static/img/Winget-Update-All-(Task-Create)/image_15.png)  
   Set `False` in the comparison condition.  
   ![Step 7 Continued](../../../static/img/Winget-Update-All-(Task-Create)/image_12.png)  
   **Condition:** `WingetUpdateAll_Task_Exclude` `Equals` `False`

8. Click the `+ Add Criteria` button.  
   ![Step 8](../../../static/img/Winget-Update-All-(Task-Create)/image_13.png)  
   A new search box will appear.  
   ![Step 8 Continued](../../../static/img/Winget-Update-All-(Task-Create)/image_14.png)  
   Search and select the `WingetUpdateAll_Task_Create` custom field from the search box.  
   ![Step 8 Continued](../../../static/img/Winget-Update-All-(Task-Create)/image_16.png)  
   Set `True` in the comparison condition.  
   ![Step 8 Continued](../../../static/img/Winget-Update-All-(Task-Create)/image_17.png)  
   **Condition:** `WingetUpdateAll_Task_Create` `Equals` `True`

9. Click the `+ Add Criteria` button.  
   ![Step 9](../../../static/img/Winget-Update-All-(Task-Create)/image_18.png)  
   A new search box will appear.  
   ![Step 9 Continued](../../../static/img/Winget-Update-All-(Task-Create)/image_19.png)  
   Search and select the `WingetUpdateAll_Task_Result` custom field from the search box.  
   ![Step 9 Continued](../../../static/img/Winget-Update-All-(Task-Create)/image_20.png)  
   Select `Does Not Contain any of` for the comparator and set `Task Created` in the comparison condition.  
   ![Step 9 Continued](../../../static/img/Winget-Update-All-(Task-Create)/image_21.png)  
   **Condition:** `WingetUpdateAll_Task_Result` `Does Not Contain any of` `Task Created`

10. Click the `+ Add Criteria` button.  
    ![Step 10](../../../static/img/Winget-Update-All-(Task-Create)/image_22.png)  
    A new search box will appear.  
    ![Step 10 Continued](../../../static/img/Winget-Update-All-(Task-Create)/image_23.png)  
    Search and select the `OS` criteria from the search box.  
    ![Step 10 Continued](../../../static/img/Winget-Update-All-(Task-Create)/image_24.png)  
    Select `Contains any of` for the comparator and select `Microsoft Windows 10 and 11` for the comparison field.  
    ![Step 10 Continued](../../../static/img/Winget-Update-All-(Task-Create)/image_25.png)  
    **Condition:** `OS` `Contains any of` `Microsoft Windows` `10` `11`

11. Click the `Save` button to save/create the group.  
    ![Step 11](../../../static/img/Winget-Update-All-(Task-Create)/image_26.png)

## Completed Group

![Completed Group](../../../static/img/Winget-Update-All-(Task-Create)/image_27.png)  
![Completed Group](../../../static/img/Winget-Update-All-(Task-Create)/image_28.png)



