---
id: '8adcc7b6-d30a-4d7f-ba7a-e2fc3ca6f3c2'
title: 'Windows 11 Installation Failed'
title_meta: 'Windows 11 Installation Failed'
keywords: ['windows', 'monitor', 'installation', 'failed', 'custom', 'field', 'patch']
description: 'This document provides a step-by-step guide to create a monitor in ConnectWise RMM that detects computers where the Windows 11 Installer (Beta) task has failed. It includes necessary dependencies and detailed instructions for setup.'
tags: ['setup']
draft: false
unlisted: false
---

## Summary

This document detects the computers where the Windows 11 Installer (Beta) task has failed.

## Dependencies

- [CW RMM - Task - Windows 11 Installer (Beta)](<../tasks/Windows 11 Installer (Beta).md>) 
- [CW RMM - Task - Windows 11 Installation Validation](<../tasks/Windows 11 Installation Validation.md>) 
- [CW RMM - Custom Field - Endpoint - Windows 11 Upgrade Failed](<../custom-fields/Endpoint - Windows 11 Upgrade Failed.md>) 
- [CW RMM - Device Group - Windows 11 Upgrade Validation](<../groups/Upgrade Enabled Windows 11 Compatible Machines.md>)

## Monitor

1. Navigate to `Alert Management` > `Monitors`  
   ![Step 1 Image](../../../static/img/Windows-11-Installation-Failed/image_1.png)

2. Click the `Create Monitor` button at the top-right corner of the screen.  
   ![Step 2 Image](../../../static/img/Windows-11-Installation-Failed/image_2.png)  
   This will take you to the following screen.  
   ![Step 2 Image](../../../static/img/Windows-11-Installation-Failed/image_3.png)

3. Fill in the following details:  
   **Name:** Windows 11 Installation Failed  
   **Description:** Detects the computers where the Windows 11 Installer (Beta) task failed.  
   **Type:** Custom Field  
   **Severity:** Others  
   **Family:** Patch Management  
   ![Step 3 Image](../../../static/img/Windows-11-Installation-Failed/image_4.png)  
   The right half of the screen will change after setting the `Type` to `Custom Field`.  
   ![Step 3 Image](../../../static/img/Windows-11-Installation-Failed/image_5.png)

4. **Conditions**  
   - Change the `Custom Field Type` to `Text Box`.
   - Find and select the `Windows 11 Upgrade Failed` custom field in the `Custom Field Name` field.  
   - Set the comparator to `Contains`.  
   - Type `Failed` in the `Enter Value` field and press `Enter`.  
   ![Step 4 Image](../../../static/img/Windows-11-Installation-Failed/image_6.png)

5. **Ticket Resolution**  
   - Turn off the `Automatically resolve` button.  
   ![Step 5 Image](../../../static/img/Windows-11-Installation-Failed/image_7.png)

6. **Targeted Resources**  
   - Click the `Select Targets` button.  
   ![Step 6 Image](../../../static/img/Windows-11-Installation-Failed/image_8.png)  
   - Select all companies and click the `Save Selection` button.  
   ![Step 6 Image](../../../static/img/Windows-11-Installation-Failed/image_9.png)

7. Click the `Save` button at the top-right corner of the screen to create the monitor set.  
   ![Step 7 Image](../../../static/img/Windows-11-Installation-Failed/image_10.png)




