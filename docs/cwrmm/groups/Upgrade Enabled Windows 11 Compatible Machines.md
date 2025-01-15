---
id: '9c422249-e949-4bcd-83ea-2c91b8365a96'
title: 'Upgrade Enabled Windows 11 Compatible Machines'
title_meta: 'Upgrade Enabled Windows 11 Compatible Machines'
keywords: ['windows', 'upgrade', 'group', 'installation', 'compatible']
description: 'This document outlines the process for creating a dynamic group in ConnectWise RMM that includes Windows 10 machines compatible with the Windows 11 installation. It details the necessary criteria and custom fields required to ensure proper group configuration and management.'
tags: ['windows', 'group', 'installation', 'upgrade', 'configuration']
draft: false
unlisted: false
---
## Summary

Houses the computers where the Windows 11 Installer (Beta) task has been executed but haven't rebooted since then.

## Dependencies

- [CW RMM - Custom Field - Company - Enable Windows 11 Installation](https://proval.itglue.com/DOC-5078775-15835788)
- [CW RMM - Custom Field - Site - Exclude Windows 11 Installation](https://proval.itglue.com/DOC-5078775-15835797)
- [CW RMM - Custom Field - Endpoint - Exclude Windows 11 Installation](https://proval.itglue.com/DOC-5078775-15835791)
- [CW RMM - Custom Field - Endpoint - Windows 11 Compatible](https://proval.itglue.com/DOC-5078775-15835398)
- [CW RMM - Task - Windows 11 Compatibility Validation](https://proval.itglue.com/DOC-5078775-15835244)

## Group Creation

1. Navigate to `Devices` > `Device Groups`.
   ![Step 1](../../../static/img/Upgrade-Enabled-Windows-11-Compatible-Machines/image_1.png)

2. Create a new dynamic group by clicking the `Dynamic Group` button.
   ![Step 2](../../../static/img/Upgrade-Enabled-Windows-11-Compatible-Machines/image_2.png)
   
   This page will appear after clicking on the `Dynamic Group` button:  
   ![Step 2 Continued](../../../static/img/Upgrade-Enabled-Windows-11-Compatible-Machines/image_3.png)

3. Set the group name to `Upgrade Enabled Windows 11 Compatible Machines`.  
   Description: `A group of Windows 10 machines that are compatible with Windows 11 installation and upgrade has been enabled through the custom fields.`  
   ![Step 3](../../../static/img/Upgrade-Enabled-Windows-11-Compatible-Machines/image_4.png)

4. Click the `+ Add Criteria` in the `Criteria` section of the group.  
   ![Step 4](../../../static/img/Upgrade-Enabled-Windows-11-Compatible-Machines/image_5.png)  
   This search box will appear.  
   ![Step 4 Continued](../../../static/img/Upgrade-Enabled-Windows-11-Compatible-Machines/image_6.png)

5. Search and select the `Enable Windows 11 Installation` custom field from the search box.  
   ![Step 5](../../../static/img/Upgrade-Enabled-Windows-11-Compatible-Machines/image_7.png)  
   Set `True` in the comparison condition.  
   ![Step 5 Continued](../../../static/img/Upgrade-Enabled-Windows-11-Compatible-Machines/image_8.png)  
   **Condition:** `Enable Windows 11 Installation` `Equal` `True`

6. Click the `+ Add Criteria` button.  
   ![Step 6](../../../static/img/Upgrade-Enabled-Windows-11-Compatible-Machines/image_9.png)  
   A new search box will appear.  
   ![Step 6 Continued](../../../static/img/Upgrade-Enabled-Windows-11-Compatible-Machines/image_10.png)  
   
   Search and select the `Exclude Windows 11 Installation` custom field from the search box. There are two custom fields with the same name. Select the site-level custom field in this step.  
   ![Step 6 Continued](../../../static/img/Upgrade-Enabled-Windows-11-Compatible-Machines/image_11.png)  
   Set `False` in the comparison condition.  
   ![Step 6 Continued](../../../static/img/Upgrade-Enabled-Windows-11-Compatible-Machines/image_12.png)  
   **Condition:** `Exclude Windows 11 Installation` `Equal` `False`

7. Click the `+ Add Criteria` button.  
   ![Step 7](../../../static/img/Upgrade-Enabled-Windows-11-Compatible-Machines/image_13.png)  
   A new search box will appear.  
   ![Step 7 Continued](../../../static/img/Upgrade-Enabled-Windows-11-Compatible-Machines/image_14.png)  
   
   Search and select the `Exclude Windows 11 Installation` custom field from the search box. There are two custom fields with the same name. Select the computer-level custom field in this step.  
   ![Step 7 Continued](../../../static/img/Upgrade-Enabled-Windows-11-Compatible-Machines/image_15.png)  
   Set `False` in the comparison condition.  
   ![Step 7 Continued](../../../static/img/Upgrade-Enabled-Windows-11-Compatible-Machines/image_12.png)  
   **Condition:** `Exclude Windows 11 Installation` `Equal` `False`

8. Click the `+ Add Criteria` button.  
   ![Step 8](../../../static/img/Upgrade-Enabled-Windows-11-Compatible-Machines/image_13.png)  
   A new search box will appear.  
   ![Step 8 Continued](../../../static/img/Upgrade-Enabled-Windows-11-Compatible-Machines/image_14.png)  

   Search and select the `OS` criteria.  
   ![Step 8 Continued](../../../static/img/Upgrade-Enabled-Windows-11-Compatible-Machines/image_16.png)  
   Select `Microsoft Windows 10` in the comparison condition.  
   ![Step 8 Continued](../../../static/img/Upgrade-Enabled-Windows-11-Compatible-Machines/image_17.png)  
   **Condition:** `OS` `Contains any of` `Microsoft Windows 10`

9. Click the `+ Add Criteria` button.  
   ![Step 9](../../../static/img/Upgrade-Enabled-Windows-11-Compatible-Machines/image_18.png)  
   A new search box will appear.  
   ![Step 9 Continued](../../../static/img/Upgrade-Enabled-Windows-11-Compatible-Machines/image_19.png)  

   Search and select the `Windows 11 compatible` custom field from the search box.  
   ![Step 9 Continued](../../../static/img/Upgrade-Enabled-Windows-11-Compatible-Machines/image_20.png)  
   Set `Yes` in the comparison condition.  
   ![Step 9 Continued](../../../static/img/Upgrade-Enabled-Windows-11-Compatible-Machines/image_21.png)  
   **Condition:** `Windows 11 Compatible` `Contains any of` `Yes`

10. Click the `Save` button to save/create the group.  
    ![Step 10](../../../static/img/Upgrade-Enabled-Windows-11-Compatible-Machines/image_22.png)

## Completed Group

![Completed Group 1](../../../static/img/Upgrade-Enabled-Windows-11-Compatible-Machines/image_23.png)  
![Completed Group 2](../../../static/img/Upgrade-Enabled-Windows-11-Compatible-Machines/image_24.png)






