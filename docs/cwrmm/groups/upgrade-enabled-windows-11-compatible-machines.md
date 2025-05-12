---
id: '9c422249-e949-4bcd-83ea-2c91b8365a96'
slug: /9c422249-e949-4bcd-83ea-2c91b8365a96
title: 'Upgrade Enabled Windows 11 Compatible Machines'
title_meta: 'Upgrade Enabled Windows 11 Compatible Machines'
keywords: ['windows', 'upgrade', 'group', 'installation', 'compatible']
description: 'This document outlines the process for creating a dynamic group in ConnectWise RMM that includes Windows 10 machines compatible with the Windows 11 installation. It details the necessary criteria and custom fields required to ensure proper group configuration and management.'
tags: ['installation', 'windows']
draft: false
unlisted: false
---

## Summary

This document houses the computers where the Windows 11 Installer (Beta) task has been executed but have not rebooted since then.

## Dependencies

- [CW RMM - Custom Field - Company - Enable Windows 11 Installation](/docs/2567ed9c-49da-40f2-b566-9d6e8d2f87b8)
- [CW RMM - Custom Field - Site - Exclude Windows 11 Installation](/docs/bb84e821-38c5-4b39-ad4c-894eef47bf79)
- [CW RMM - Custom Field - Endpoint - Exclude Windows 11 Installation](/docs/c3f83443-09cb-43ef-9c21-501d7f13314e)
- [CW RMM - Custom Field - Endpoint - Windows 11 Compatible](/docs/99719e54-ce8f-4b76-93f4-cc832a3b88cf)
- [CW RMM - Task - Windows 11 Compatibility Validation](/docs/676de0c3-b6a2-4a82-bf87-6d00395a7dff)

## Group Creation

1. Navigate to `Devices` > `Device Groups`.  
   ![Step 1](../../../static/img/docs/9c422249-e949-4bcd-83ea-2c91b8365a96/image_1.webp)

2. Create a new dynamic group by clicking the `Dynamic Group` button.  
   ![Step 2](../../../static/img/docs/9c422249-e949-4bcd-83ea-2c91b8365a96/image_2.webp)  

   This page will appear after clicking on the `Dynamic Group` button:  
   ![Step 2 Continued](../../../static/img/docs/9c422249-e949-4bcd-83ea-2c91b8365a96/image_3.webp)

3. Set the group name to `Upgrade Enabled Windows 11 Compatible Machines`.  
   Description: `A group of Windows 10 machines that are compatible with Windows 11 installation and upgrade has been enabled through the custom fields.`  
   ![Step 3](../../../static/img/docs/9c422249-e949-4bcd-83ea-2c91b8365a96/image_4.webp)

4. Click the `+ Add Criteria` in the `Criteria` section of the group.  
   ![Step 4](../../../static/img/docs/9c422249-e949-4bcd-83ea-2c91b8365a96/image_5.webp)  
   This search box will appear.  
   ![Step 4 Continued](../../../static/img/docs/9c422249-e949-4bcd-83ea-2c91b8365a96/image_6.webp)

5. Search and select the `Enable Windows 11 Installation` custom field from the search box.  
   ![Step 5](../../../static/img/docs/9c422249-e949-4bcd-83ea-2c91b8365a96/image_7.webp)  
   Set `True` in the comparison condition.  
   ![Step 5 Continued](../../../static/img/docs/9c422249-e949-4bcd-83ea-2c91b8365a96/image_8.webp)  
   **Condition:** `Enable Windows 11 Installation` `Equal` `True`

6. Click the `+ Add Criteria` button.  
   ![Step 6](../../../static/img/docs/9c422249-e949-4bcd-83ea-2c91b8365a96/image_9.webp)  
   A new search box will appear.  
   ![Step 6 Continued](../../../static/img/docs/9c422249-e949-4bcd-83ea-2c91b8365a96/image_10.webp)  

   Search and select the `Exclude Windows 11 Installation` custom field from the search box. There are two custom fields with the same name. Select the site-level custom field in this step.  
   ![Step 6 Continued](../../../static/img/docs/9c422249-e949-4bcd-83ea-2c91b8365a96/image_11.webp)  
   Set `False` in the comparison condition.  
   ![Step 6 Continued](../../../static/img/docs/9c422249-e949-4bcd-83ea-2c91b8365a96/image_12.webp)  
   **Condition:** `Exclude Windows 11 Installation` `Equal` `False`

7. Click the `+ Add Criteria` button.  
   ![Step 7](../../../static/img/docs/9c422249-e949-4bcd-83ea-2c91b8365a96/image_13.webp)  
   A new search box will appear.  
   ![Step 7 Continued](../../../static/img/docs/9c422249-e949-4bcd-83ea-2c91b8365a96/image_14.webp)  

   Search and select the `Exclude Windows 11 Installation` custom field from the search box. There are two custom fields with the same name. Select the computer-level custom field in this step.  
   ![Step 7 Continued](../../../static/img/docs/9c422249-e949-4bcd-83ea-2c91b8365a96/image_15.webp)  
   Set `False` in the comparison condition.  
   ![Step 7 Continued](../../../static/img/docs/9c422249-e949-4bcd-83ea-2c91b8365a96/image_12.webp)  
   **Condition:** `Exclude Windows 11 Installation` `Equal` `False`

8. Click the `+ Add Criteria` button.  
   ![Step 8](../../../static/img/docs/9c422249-e949-4bcd-83ea-2c91b8365a96/image_13.webp)  
   A new search box will appear.  
   ![Step 8 Continued](../../../static/img/docs/9c422249-e949-4bcd-83ea-2c91b8365a96/image_14.webp)  

   Search and select the `OS` criteria.  
   ![Step 8 Continued](../../../static/img/docs/9c422249-e949-4bcd-83ea-2c91b8365a96/image_16.webp)  
   Select `Microsoft Windows 10` in the comparison condition.  
   ![Step 8 Continued](../../../static/img/docs/9c422249-e949-4bcd-83ea-2c91b8365a96/image_17.webp)  
   **Condition:** `OS` `Contains any of` `Microsoft Windows 10`

9. Click the `+ Add Criteria` button.  
   ![Step 9](../../../static/img/docs/9c422249-e949-4bcd-83ea-2c91b8365a96/image_18.webp)  
   A new search box will appear.  
   ![Step 9 Continued](../../../static/img/docs/9c422249-e949-4bcd-83ea-2c91b8365a96/image_19.webp)  

   Search and select the `Windows 11 compatible` custom field from the search box.  
   ![Step 9 Continued](../../../static/img/docs/9c422249-e949-4bcd-83ea-2c91b8365a96/image_20.webp)  
   Set `Yes` in the comparison condition.  
   ![Step 9 Continued](../../../static/img/docs/9c422249-e949-4bcd-83ea-2c91b8365a96/image_21.webp)  
   **Condition:** `Windows 11 Compatible` `Contains any of` `Yes`

10. Click the `Save` button to save/create the group.  
    ![Step 10](../../../static/img/docs/9c422249-e949-4bcd-83ea-2c91b8365a96/image_22.webp)

## Completed Group

![Completed Group 1](../../../static/img/docs/9c422249-e949-4bcd-83ea-2c91b8365a96/image_23.webp)  
![Completed Group 2](../../../static/img/docs/9c422249-e949-4bcd-83ea-2c91b8365a96/image_24.webp)