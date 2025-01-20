---
id: '8ceb86c8-23b2-4a95-b920-f78e446d9e59'
title: 'Crystal Disk Info Health Monitor Setup'
title_meta: 'Crystal Disk Info Health Monitor Setup'
keywords: ['monitor', 'alert', 'disk', 'health', 'custom', 'field']
description: 'This document provides a step-by-step guide on setting up a monitor in ConnectWise RMM that generates alerts based on the health status of disks as reported by the Crystal Disk Info custom field. It also details how to automate ticket resolution based on the disk health status.'
tags: ['disk', 'setup']
draft: false
unlisted: false
---
## Summary

The monitor set will generate an alert for computers in which the custom field [CW RMM - Custom Field - Crystal Disk Info_Disk Health](<../custom-fields/Crystal Disk Info_Disk Health.md>) contains either 'Bad' or 'Caution.' Furthermore, it will automatically resolve the associated ticket if neither 'Bad' nor 'Caution' is present in the aforementioned custom field.

## Monitor

1. Go to Alert Management > Monitors.  
   ![Step 1](../../../static/img/Crystal-Disk-Info-Health-Status/image_1.png)

2. Click the `Add Monitor` button.  
   ![Step 2](../../../static/img/Crystal-Disk-Info-Health-Status/image_2.png)

3. This screen will appear.  
   ![Step 3](../../../static/img/Crystal-Disk-Info-Health-Status/image_3.png)

4. Fill the Name and Description boxes.  
   **Name:** Crystal Disk Info Health Status  
   **Description:** This monitor set will generate an alert for computers in which the custom field `Crystal Disk Info_Disk Health` contains either 'Bad' or 'Caution'. Furthermore, it will automatically resolve the associated ticket if neither 'Bad' nor 'Caution' is present in the aforementioned custom field.  
   ![Step 4](../../../static/img/Crystal-Disk-Info-Health-Status/image_4.png)

5. Select the `Custom Field` in the Type dropdown.  
   ![Step 5](../../../static/img/Crystal-Disk-Info-Health-Status/image_5.png)

6. Select the `Text Box` from `Custom Field Type` dropdown and `Crystal Disk Info_Disk Health` from the `Custom Field Name` dropdown for both `Conditions` and `Ticket Resolution` sections.  
   ![Step 6](../../../static/img/Crystal-Disk-Info-Health-Status/image_6.png)

7. Leave the `Conditions` section condition to `Contains` and select `Does not contain` condition for the `Ticket Resolution` section. Select `OR` for the operator in the `Conditions` section and `AND` as the operator in the `Ticket Resolution` section. For the `value field`, type `Bad` then press Enter and type `Caution` and press Enter for both sections.  
   ![Step 7](../../../static/img/Crystal-Disk-Info-Health-Status/image_7.png)

8. Select the Resources/Clients to apply the monitor set against.  
   ![Step 8](../../../static/img/Crystal-Disk-Info-Health-Status/image_8.png)

9. Select `Hardware` for the `Family` and `Critical Impact Alerts` or any relevant option for the `Severity`.  
   ![Step 9](../../../static/img/Crystal-Disk-Info-Health-Status/image_9.png)

10. This is how the monitor set should look before saving it.  
    ![Step 10](../../../static/img/Crystal-Disk-Info-Health-Status/image_10.png)

11. Click the `Save` button to save the monitor set.  
    ![Step 11](../../../static/img/Crystal-Disk-Info-Health-Status/image_11.png)

## Dependencies

- [CW RMM - Custom Field - Crystal Disk Info_Disk Health](<../custom-fields/Crystal Disk Info_Disk Health.md>)  
- [CW RMM - Task - Get Crystal Disk Info (Disk Health)](<../tasks/Get Crystal Disk Info (Disk Health).md>)












