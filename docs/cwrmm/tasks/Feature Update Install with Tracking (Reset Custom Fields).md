---
id: '40144621-2d0b-4294-b5cb-cec356cf9d74'
title: 'Feature Update Install with Tracking (Reset Custom Fields)'
title_meta: 'Feature Update Install with Tracking (Reset Custom Fields)'
keywords: ['feature', 'update', 'install', 'custom', 'fields', 'reset', 'tracking']
description: 'This document provides a comprehensive guide on resetting custom fields for Windows 10 and Windows 11 computers after a successful feature update installation. It includes sample runs, dependencies, script creation, and deployment instructions to ensure proper automation and monitoring.'
tags: ['patching', 'windows']
draft: false
unlisted: false
---

## Summary

The script clears the related custom fields on machines where the Feature Update is successfully installed, thereby excluding those machines from automation and monitoring.

## Sample Run

![Sample Run 1](../../../static/img/Feature-Update-Install-with-Tracking-(Reset-Custom-Fields)/image_1.png)  
![Sample Run 2](../../../static/img/Feature-Update-Install-with-Tracking-(Reset-Custom-Fields)/image_2.png)  

## Dependencies

- [CW RMM - Task - Feature Update Install With Tracking](<./Feature Update Install With Tracking.md>)
- [CW RMM - Custom Field - WinFeatUpgradeAttempts](<../custom-fields/WinFeatUpgradeAttempts.md>)
- [CW RMM - Custom Field - Feature Update Install Failure](https://proval.itglue.com/DOC-5078775-14592254)
- [CW RMM - Custom Field - Feature Update Reboot Pending](<../custom-fields/Feature Update Reboot Pending.md>)
- [CW RMM - Device Group - Feature Pack Update - Updated Computers](<../groups/Feature Pack Update - Updated Computers.md>)

## Create Script

Create a new `Script Editor` style script in the system to implement this task.

![Create Script](../../../static/img/Feature-Update-Install-with-Tracking-(Reset-Custom-Fields)/image_3.png)  
![Create Script 2](../../../static/img/Feature-Update-Install-with-Tracking-(Reset-Custom-Fields)/image_4.png)  

**Name:** `Feature Update Install with Tracking (Reset Custom Fields)`  
**Description:** `Reset the values of the Feature Update Install Failure, Feature Update Reboot Pending, and WinFeatUpgradeAttempts Custom Fields for Windows 10 and Windows 11 computers that are already on the latest build version.`  
**Category:** Patching  

![Create Script 3](../../../static/img/Feature-Update-Install-with-Tracking-(Reset-Custom-Fields)/image_5.png)  

## Script

Start by adding a row. You can do this by clicking the `Add Row` button at the bottom of the script page.

![Add Row](../../../static/img/Feature-Update-Install-with-Tracking-(Reset-Custom-Fields)/image_6.png)  

### Row 1 Function: Set Custom Field  
![Row 1](../../../static/img/Feature-Update-Install-with-Tracking-(Reset-Custom-Fields)/image_7.png)  
Search and select the `Set Custom Field` function in the new row.  
![Set Custom Field 1](../../../static/img/Feature-Update-Install-with-Tracking-(Reset-Custom-Fields)/image_8.png)  
![Set Custom Field 2](../../../static/img/Feature-Update-Install-with-Tracking-(Reset-Custom-Fields)/image_9.png)  

Search and select the `WinFeatUpgradeAttempts` Custom Field.  
![WinFeatUpgradeAttempts](../../../static/img/Feature-Update-Install-with-Tracking-(Reset-Custom-Fields)/image_10.png)  
Type ` ` (there is a single space) in the `Value` box and click the Save button.  
![Value Field](../../../static/img/Feature-Update-Install-with-Tracking-(Reset-Custom-Fields)/image_11.png)  
![Save Button](../../../static/img/Feature-Update-Install-with-Tracking-(Reset-Custom-Fields)/image_12.png)  

### Row 2 Function: Set Custom Field  
Insert a new row by clicking the `Add Row` button.  
![Row 2](../../../static/img/Feature-Update-Install-with-Tracking-(Reset-Custom-Fields)/image_13.png)  
![Row 2 2](../../../static/img/Feature-Update-Install-with-Tracking-(Reset-Custom-Fields)/image_7.png)  

Search and select the `Set Custom Field` function in the new row.  
![Set Custom Field 3](../../../static/img/Feature-Update-Install-with-Tracking-(Reset-Custom-Fields)/image_8.png)  
![Set Custom Field 4](../../../static/img/Feature-Update-Install-with-Tracking-(Reset-Custom-Fields)/image_9.png)  

Search and select the `Feature Update Reboot Pending` Custom Field.  
![Feature Update Reboot Pending](../../../static/img/Feature-Update-Install-with-Tracking-(Reset-Custom-Fields)/image_14.png)  
Type `False` in the `Value` box and click the Save button.  
![Save Button 2](../../../static/img/Feature-Update-Install-with-Tracking-(Reset-Custom-Fields)/image_15.png)  

### Row 3 Function: Set Custom Field  
Insert a new row by clicking the `Add Row` button.  
![Row 3](../../../static/img/Feature-Update-Install-with-Tracking-(Reset-Custom-Fields)/image_13.png)  
![Row 3 2](../../../static/img/Feature-Update-Install-with-Tracking-(Reset-Custom-Fields)/image_7.png)  

Search and select the `Set Custom Field` function in the new row.  
![Set Custom Field 5](../../../static/img/Feature-Update-Install-with-Tracking-(Reset-Custom-Fields)/image_8.png)  
![Set Custom Field 6](../../../static/img/Feature-Update-Install-with-Tracking-(Reset-Custom-Fields)/image_9.png)  

Search and select the `Feature Update Install Failure` Custom Field.  
![Feature Update Install Failure](../../../static/img/Feature-Update-Install-with-Tracking-(Reset-Custom-Fields)/image_16.png)  
Type ` ` (there is a single space) in the `Value` box and click the Save button.  
![Value Field 2](../../../static/img/Feature-Update-Install-with-Tracking-(Reset-Custom-Fields)/image_17.png)  

Click the `Save` button to save the task.  
![Save Task](../../../static/img/Feature-Update-Install-with-Tracking-(Reset-Custom-Fields)/image_18.png)  

## Completed Script

![Completed Script](../../../static/img/Feature-Update-Install-with-Tracking-(Reset-Custom-Fields)/image_19.png)  

## Deployment

1. Go to `Automation` > `Tasks`.
2. Search for `Feature Update Install With Tracking (Reset Custom Fields)` task.
3. Select the concerned task.
4. Click on the `Schedule` button to schedule the task/script.  
   ![Schedule Task](../../../static/img/Feature-Update-Install-with-Tracking-(Reset-Custom-Fields)/image_20.png)  
5. This screen will appear.  
   ![Schedule Screen](../../../static/img/Feature-Update-Install-with-Tracking-(Reset-Custom-Fields)/image_21.png)  
6. Click the `Does not repeat` button.  
   ![Does Not Repeat](../../../static/img/Feature-Update-Install-with-Tracking-(Reset-Custom-Fields)/image_22.png)  
7. This pop-up box will appear.  
   ![Pop-up Box](../../../static/img/Feature-Update-Install-with-Tracking-(Reset-Custom-Fields)/image_23.png)  
8. Click the `OK` button to run the task once per day.  
   ![OK Button](../../../static/img/Feature-Update-Install-with-Tracking-(Reset-Custom-Fields)/image_24.png)  
9. Select the relevant time to execute the script. It is suggested to run this task during working hours when most of the workstations are online.  
   ![Execution Time](../../../static/img/Feature-Update-Install-with-Tracking-(Reset-Custom-Fields)/image_24.png)  
10. Search and select the `Feature Pack Update - Updated Computers` group in the `Resources`.  
    ![Resources](../../../static/img/Feature-Update-Install-with-Tracking-(Reset-Custom-Fields)/image_25.png)  
11. Clicking the `Run` button will initiate the schedule.  
    ![Run Button](../../../static/img/Feature-Update-Install-with-Tracking-(Reset-Custom-Fields)/image_26.png)  
12. The task will start appearing in the Scheduled Tasks.  
    ![Scheduled Tasks](../../../static/img/Feature-Update-Install-with-Tracking-(Reset-Custom-Fields)/image_27.png)  
    ![Scheduled Tasks 2](../../../static/img/Feature-Update-Install-with-Tracking-(Reset-Custom-Fields)/image_28.png)  
13. The `Suspend` option can be used to `suspend/stop` the schedule.  
    ![Suspend Option](../../../static/img/Feature-Update-Install-with-Tracking-(Reset-Custom-Fields)/image_29.png)  
    ![Suspend Option 2](../../../static/img/Feature-Update-Install-with-Tracking-(Reset-Custom-Fields)/image_30.png)  

## Output

- Custom Field
