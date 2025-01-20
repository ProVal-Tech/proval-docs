---
id: '67eaa7f5-bf6c-4680-982b-8b64fc27a76f'
title: 'Feature Update Install Failure Alerts'
title_meta: 'Feature Update Install Failure Alerts'
keywords: ['alerts', 'monitor', 'failure', 'update', 'tracking']
description: 'This document provides a step-by-step guide to create alerts for monitoring failures during the Feature Update Install process using the ConnectWise RMM platform. It includes dependencies, monitor setup instructions, and visual aids for clarity.'
tags: ['update']
draft: false
unlisted: false
---
## Summary

Alerts on the computer where the `Feature Update Install with Tracking` script failed to upgrade the machine because of some reason.

## Dependencies

- [CW RMM - Custom Field - Feature Update Install Failure](https://proval.itglue.com/DOC-5078775-14592254)
- [CW RMM - Task - Feature Update Install With Tracking](<../tasks/Feature Update Install With Tracking.md>)

## Monitor

1. Go to Alert Management > Monitors.  
   ![Step 1](../../../static/img/Feature-Update-Install-Failure/image_3.png)
   
2. Click the `Create Monitor` button.  
   ![Step 2](../../../static/img/Feature-Update-Install-Failure/image_4.png)
   
3. This screen will appear.  
   ![Step 3](../../../static/img/Feature-Update-Install-Failure/image_5.png)
   
4. Fill the Name and Description boxes.  
   **Name:** Feature Update Install Failure  
   **Description:** Alerts on the computer where the `Feature Update Install with Tracking` script failed to upgrade the machine because of some reason.  
   ![Step 4](../../../static/img/Feature-Update-Install-Failure/image_6.png)
   
5. Select the `Custom Field` in the Type dropdown, `Others` in the Severity, and `Patch Management` for the Family.  
   ![Step 5](../../../static/img/Feature-Update-Install-Failure/image_7.png)
   
6. Select the `Text Box` from `Custom Field Type` dropdown and `Feature Update Install Failure` from the `Custom Field Name` dropdown menu. Type `Error` and press enter in the `Enter Value` field.  
   ![Step 6](../../../static/img/Feature-Update-Install-Failure/image_8.png)
   
7. Choose the same values/options in the `Ticket Resolution` Section, with the only difference being to use "`Does Not Contain`" as the operator instead of "`Contains`."  
   ![Step 7](../../../static/img/Feature-Update-Install-Failure/image_9.png)
   
8. Click the `Select Targets` button to select the clients to monitor.  
   ![Step 8](../../../static/img/Feature-Update-Install-Failure/image_10.png)
   
9. Select the relevant clients to monitor and click the `Save Selection` button.  
   ![Step 9](../../../static/img/Feature-Update-Install-Failure/image_11.png)
   
10. Confirm that this is the final appearance of the monitor set, then save it by clicking the `Save` button.  
    ![Step 10](../../../static/img/Feature-Update-Install-Failure/image_12.png)












