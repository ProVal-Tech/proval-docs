---
id: 'df5b7a85-683f-4fd6-9a24-4fc836ccfd8a'
slug: /df5b7a85-683f-4fd6-9a24-4fc836ccfd8a
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

- [CW RMM - Custom Field - Company - Disable_FastBoot](/docs/9c1d0f0a-7ae4-46bd-a9a7-ae15df2ca633)
- [CW RMM - Custom Field - Endpoint - FastBoot_Disabled](/docs/3c87c303-e892-4f6b-889f-acde66928978)
- [CW RMM - Custom Field - Endpoint - Disable_Fastboot_Exclusion](/docs/b17237cc-d3cf-42a9-84fe-eda8d00bdd19)
- [CW RMM - Custom Field - Site - Disable_Fastboot_Exclusion](/docs/693eeb66-9fb2-4653-8cf3-e23fb53c0f56)

## Group Creation

1. Navigate to `Devices` > `Device Groups`.  
   ![Step 1](../../../static/img/docs/df5b7a85-683f-4fd6-9a24-4fc836ccfd8a/image_1.webp)

2. Create a new dynamic group by clicking the `Dynamic Group` button.  
   ![Step 2](../../../static/img/docs/df5b7a85-683f-4fd6-9a24-4fc836ccfd8a/image_2.webp)  
   This page will appear after clicking on the `Dynamic Group` button:  
   ![Step 2 Continued](../../../static/img/docs/df5b7a85-683f-4fd6-9a24-4fc836ccfd8a/image_3.webp)

3. Set the group name to `Disable FastBoot`.  
   ![Step 3](../../../static/img/docs/df5b7a85-683f-4fd6-9a24-4fc836ccfd8a/image_4.webp)

4. Click the `+ Add Criteria` in the `Criteria` section of the group.  
   ![Step 4](../../../static/img/docs/df5b7a85-683f-4fd6-9a24-4fc836ccfd8a/image_5.webp)  
   This search box will appear.  
   ![Step 4 Continued](../../../static/img/docs/df5b7a85-683f-4fd6-9a24-4fc836ccfd8a/image_6.webp)

5. 
   - Search and select the `Disable_FastBoot` custom field from the search box.
   - Set `True` in the comparison condition.  
   ![Step 5](../../../static/img/docs/df5b7a85-683f-4fd6-9a24-4fc836ccfd8a/image_7.webp)  
   **Condition:** `Disable_FastBoot` `Equal` `True`

6. 
   - Search and select the Site-Level `Disable_FastBoot_Exclusion` custom field from the search box.
   - Set `False` in the comparison condition.  
   ![Step 6](../../../static/img/docs/df5b7a85-683f-4fd6-9a24-4fc836ccfd8a/image_8.webp)  
   **Condition:** `Disable_FastBoot_Exclusion` `Equal` `False`

7. 
   - Search and select the Endpoint-Level `Disable_FastBoot_Exclusion` custom field from the search box.
   - Set `False` in the comparison condition.  
   ![Step 7](../../../static/img/docs/df5b7a85-683f-4fd6-9a24-4fc836ccfd8a/image_8.webp)  
   **Condition:** `Disable_FastBoot_Exclusion` `Equal` `False`

8. 
   - Search and select the Endpoint-Level `FastBoot_Disabled` custom field from the search box.
   - Set `False` in the comparison condition.  
   ![Step 8](../../../static/img/docs/df5b7a85-683f-4fd6-9a24-4fc836ccfd8a/image_9.webp)  
   **Condition:** `FastBoot_Disabled` `Equal` `False`

9. 
   - Search and select the `OS` from the search box.
   - Mark and select `Microsoft Windows 10` and `Microsoft Windows 11` in the comparison field.  
   ![Step 9](../../../static/img/docs/df5b7a85-683f-4fd6-9a24-4fc836ccfd8a/image_10.webp)  
   **Condition:** `OS` `Contains any of` `Microsoft Windows 10, Microsoft Windows 11`

10. Click the `Save` button to save/create the group.  
    ![Step 10](../../../static/img/docs/df5b7a85-683f-4fd6-9a24-4fc836ccfd8a/image_11.webp)

## Completed Group

![Completed Group 1](../../../static/img/docs/df5b7a85-683f-4fd6-9a24-4fc836ccfd8a/image_12.webp)  
![Completed Group 2](../../../static/img/docs/df5b7a85-683f-4fd6-9a24-4fc836ccfd8a/image_13.webp)