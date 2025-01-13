---
id: 'rmm-reboot-schedule-custom-fields'
title: 'Reboot Schedule Custom Fields'
title_meta: 'Reboot Schedule Custom Fields'
keywords: ['reboot', 'schedule', 'custom', 'fields', 'solution']
description: 'This document outlines the custom fields used in the Reboot Schedule Solution, detailing their configurations, dependencies, and steps to create and manage them effectively within the system.'
tags: ['configuration', 'windows', 'server', 'endpoint', 'software']
draft: false
unlisted: false
---
## Summary

The below custom fields are used in the Reboot Schedule Solution.

## Dependencies

## Details

| Name                           | Level   | Type      | Default | Editable | Description                                                                                                                                                                                                                     |
|--------------------------------|---------|-----------|---------|----------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| WorkstationRebootWindowStart   | Company | Text Box  | 1       | Yes      | This sets the minimum time when the reboot can start for workstations. Set the numeric value in 24-hour format. For Examples: 0 = Midnight, 1 = 1:00 AM, 5 = 5:00 AM, 11 = 11:00 AM, 23 = 11:00 PM.                       |
| WorkstationRebootWindowEnd     | Company | Text Box  | 5       | Yes      | This sets the maximum time till the reboot can end for workstations. Set the numeric value in 24 hour format. For Examples: 0 = Midnight, 1 = 1:00 AM, 5 = 5:00 AM, 11 = 11:00 AM, 23 = 11:00 PM.                       |
| WorkstationRebootWindowDay     | Company | Text Box  | 'Monday','Tuesday','Wednesday','Thursday','Friday' | Yes      | Approved reboot day for the workstation.  **NOTE:** To exclude this client from the solution, please enter 'Exclude' in the field. That will cause the script to exit and not take any actions on the target device.          |
| ServerRebootWindowStart        | Company | Text Box  | 1       | Yes      | This sets the minimum time when the reboot can start for servers. Set the numeric value in 24-hour format. For Examples: 0 = Midnight, 1 = 1:00 AM, 5 = 5:00 AM, 11 = 11:00 AM, 23 = 11:00 PM.                          |
| ServerRebootWindowEnd          | Company | Text Box  | 5       | Yes      | This sets the maximum time till the reboot can end for servers. Set the numeric value in 24 hour format. For Examples: 0 = Midnight, 1 = 1:00 AM, 5 = 5:00 AM, 11 = 11:00 AM, 23 = 11:00 PM.                          |
| ServerRebootWindowDay          | Company | Text Box  | 'Monday','Tuesday','Wednesday','Thursday','Friday' | Yes      | Approved reboot day for the server. **NOTE:** To exclude this client from the solution, please enter 'Exclude' in the field. That will cause the script to exit and not take any actions on the target device.                 |
| Force Reboot                   | Endpoint | Flag     | No      | Yes      | If this flag is checked on the agent then the reboot will be forced via Reboot Schedule or Force Reboot script.                                                                                                               |
| Exclude Reboot                 | Endpoint | Flag     | No      | No       | It will exclude the endpoint from the Reboot custom solutions.                                                                                                                                                               |

*Note: The Force Reboot flag has the highest priority than the Exclude Reboot flag.*

*So, if there is any endpoint where both 'Force Reboot' and 'Exclude Reboot' is checked then the endpoint will be rebooted or scheduled for reboot if the task is executed.*

## Steps to Create Custom Fields

1. Go to Settings > Custom Fields  
   ![Step 1 Image](..\..\..\static\img\Reboot-TriggerSchedule\image_1.png)

2. Click Add option  
   ![Step 2 Image](..\..\..\static\img\Reboot-TriggerSchedule\image_2.png)

3. Create Custom Field  
   Provide Name: `ServerRebootWindowEnd`  
   Select Level: `Company`  
   ![Step 3 Image](..\..\..\static\img\Reboot-TriggerSchedule\image_3.png)  
   Then check the Type option:  
   Type: `Text Box`  
   ![Step 3 Image](..\..\..\static\img\Reboot-TriggerSchedule\image_4.png)  
   Then Provide Default Value and Description:  
   Default: `5`  
   Description: This sets the maximum time till the reboot can end. Set the numeric value in 24-hour format. For Examples: 0 = Midnight, 1 = 1:00 AM, 5 = 5:00 AM, 11 = 11:00 AM, 23 = 11:00 PM.  
   Editable: `Yes`  
   ![Step 3 Image](..\..\..\static\img\Reboot-TriggerSchedule\image_5.png)  
   **Note:** Description is mandatory to be filled and it doesn't accept **'NEW LINE'.** Write everything in one phrase to describe the detail of the custom field.

4. Click Save  
   Once all detail filled click Save, and the custom field will be created.  
   ![Step 4 Image](..\..\..\static\img\Reboot-TriggerSchedule\image_6.png)

5. Repeat the above 4 steps to create all other custom fields based on the Name, Level, Type, Default, Description, Editable provided in the table.  
   **NOTE:** To exclude this client from the solution, please enter 'Exclude' in the field. That will cause the script to exit and not take any actions on the target device.



