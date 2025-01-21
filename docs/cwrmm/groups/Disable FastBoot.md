---
id: 'df5b7a85-683f-4fd6-9a24-4fc836ccfd8a'
title: 'Disable FastBoot'
title_meta: 'Disable FastBoot'
keywords: ['dynamic', 'group', 'fastboot', 'disable', 'custom', 'fields', 'windows']
description: 'This document provides a step-by-step guide on creating a dynamic group in ConnectWise RMM to disable FastBoot for specific devices, utilizing custom fields to ensure proper configuration and exclusions.'
tags: ['windows']
draft: false
unlisted: false
---

## Summary

The group contains the computers where the solution to disable FastBoot is enabled through the Custom Fields.

## Dependencies

- [CW RMM - Custom Field - Company - Disable_FastBoot](<../custom-fields/CW RMM - Custom Field - Company - Disable_FastBoot.md>)
- [CW RMM - Custom Field - Endpoint - FastBoot_Disabled](<../custom-fields/Endpoint - FastBoot_Disabled.md>)
- [CW RMM - Custom Field - Endpoint - Disable_Fastboot_Exclusion](<../custom-fields/Endpoint - Disable_Fastboot_Exclusion.md>)
- [CW RMM - Custom Field - Site - Disable_Fastboot_Exclusion](<../custom-fields/Site - Disable_Fastboot_Exclusion.md>)

## Group Creation

1. Navigate to `Devices` > `Device Groups`.  
   ![Step 1](../../../static/img/Disable-FastBoot/image_1.png)

2. Create a new dynamic group by clicking the `Dynamic Group` button.  
   ![Step 2](../../../static/img/Disable-FastBoot/image_2.png)  
   This page will appear after clicking on the `Dynamic Group` button:  
   ![Step 2 Continued](../../../static/img/Disable-FastBoot/image_3.png)

3. Set the group name to `Disable FastBoot`.  
   ![Step 3](../../../static/img/Disable-FastBoot/image_4.png)

4. Click the `+ Add Criteria` in the `Criteria` section of the group.  
   ![Step 4](../../../static/img/Disable-FastBoot/image_5.png)  
   This search box will appear.  
   ![Step 4 Continued](../../../static/img/Disable-FastBoot/image_6.png)

5. 
   - Search and select the `Disable_FastBoot` custom field from the search box.
   - Set `True` in the comparison condition.  
   ![Step 5](../../../static/img/Disable-FastBoot/image_7.png)  
   **Condition:** `Disable_FastBoot` `Equal` `True`

6. 
   - Search and select the Site-Level `Disable_FastBoot_Exclusion` custom field from the search box.
   - Set `False` in the comparison condition.  
   ![Step 6](../../../static/img/Disable-FastBoot/image_8.png)  
   **Condition:** `Disable_FastBoot_Exclusion` `Equal` `False`

7. 
   - Search and select the Endpoint-Level `Disable_FastBoot_Exclusion` custom field from the search box.
   - Set `False` in the comparison condition.  
   ![Step 7](../../../static/img/Disable-FastBoot/image_8.png)  
   **Condition:** `Disable_FastBoot_Exclusion` `Equal` `False`

8. 
   - Search and select the Endpoint-Level `FastBoot_Disabled` custom field from the search box.
   - Set `False` in the comparison condition.  
   ![Step 8](../../../static/img/Disable-FastBoot/image_9.png)  
   **Condition:** `FastBoot_Disabled` `Equal` `False`

9. 
   - Search and select the `OS` from the search box.
   - Mark and select `Microsoft Windows 10` and `Microsoft Windows 11` in the comparison field.  
   ![Step 9](../../../static/img/Disable-FastBoot/image_10.png)  
   **Condition:** `OS` `Contains any of` `Microsoft Windows 10, Microsoft Windows 11`

10. Click the `Save` button to save/create the group.  
    ![Step 10](../../../static/img/Disable-FastBoot/image_11.png)

## Completed Group

![Completed Group 1](../../../static/img/Disable-FastBoot/image_12.png)  
![Completed Group 2](../../../static/img/Disable-FastBoot/image_13.png)



