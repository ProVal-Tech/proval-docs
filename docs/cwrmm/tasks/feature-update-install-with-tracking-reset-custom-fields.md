---
id: '40144621-2d0b-4294-b5cb-cec356cf9d74'
slug: /40144621-2d0b-4294-b5cb-cec356cf9d74
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

![Sample Run 1](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_1_1.png)  
![Sample Run 2](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_2_1.png)  

## Dependencies

- [CW RMM - Task - Feature Update Install With Tracking](/docs/5244ac77-6926-4902-a183-b4b2aac18e2b)
- [CW RMM - Custom Field - WinFeatUpgradeAttempts](/docs/58b312bd-f26c-4b05-ab92-c184520d05de)
- [CW RMM - Custom Field - Feature Update Install Failure](/docs/1c9abaeb-17f0-4a3b-86ee-953b5b713dc3)
- [CW RMM - Custom Field - Feature Update Reboot Pending](/docs/45e14854-ba83-4737-8264-b5cd809fca56)
- [CW RMM - Device Group - Feature Pack Update - Updated Computers](/docs/72490aca-9d0d-47b9-88a9-437279e21d7a)

## Create Script

Create a new `Script Editor` style script in the system to implement this task.

![Create Script](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_3_1.png)  
![Create Script 2](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_4_1.png)  

**Name:** `Feature Update Install with Tracking (Reset Custom Fields)`  
**Description:** `Reset the values of the Feature Update Install Failure, Feature Update Reboot Pending, and WinFeatUpgradeAttempts Custom Fields for Windows 10 and Windows 11 computers that are already on the latest build version.`  
**Category:** Patching  

![Create Script 3](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_5_1.png)  

## Script

Start by adding a row. You can do this by clicking the `Add Row` button at the bottom of the script page.

![Add Row](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_6_1.png)  

### Row 1 Function: Set Custom Field  
![Row 1](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_7_1.png)  
Search and select the `Set Custom Field` function in the new row.  
![Set Custom Field 1](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_8_1.png)  
![Set Custom Field 2](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_9_1.png)  

Search and select the `WinFeatUpgradeAttempts` Custom Field.  
![WinFeatUpgradeAttempts](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_10_1.png)  
Type ` ` (there is a single space) in the `Value` box and click the Save button.  
![Value Field](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_11_1.png)  
![Save Button](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_12_1.png)  

### Row 2 Function: Set Custom Field  
Insert a new row by clicking the `Add Row` button.  
![Row 2](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_13_1.png)  
![Row 2 2](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_7_1.png)  

Search and select the `Set Custom Field` function in the new row.  
![Set Custom Field 3](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_8_1.png)  
![Set Custom Field 4](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_9_1.png)  

Search and select the `Feature Update Reboot Pending` Custom Field.  
![Feature Update Reboot Pending](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_14_1.png)  
Type `False` in the `Value` box and click the Save button.  
![Save Button 2](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_15_1.png)  

### Row 3 Function: Set Custom Field  
Insert a new row by clicking the `Add Row` button.  
![Row 3](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_13_1.png)  
![Row 3 2](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_7_1.png)  

Search and select the `Set Custom Field` function in the new row.  
![Set Custom Field 5](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_8_1.png)  
![Set Custom Field 6](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_9_1.png)  

Search and select the `Feature Update Install Failure` Custom Field.  
![Feature Update Install Failure](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_16_1.png)  
Type ` ` (there is a single space) in the `Value` box and click the Save button.  
![Value Field 2](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_17_1.png)  

Click the `Save` button to save the task.  
![Save Task](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_18_1.png)  

## Completed Script

![Completed Script](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_19_1.png)  

## Deployment

1. Go to `Automation` > `Tasks`.
2. Search for `Feature Update Install With Tracking (Reset Custom Fields)` task.
3. Select the concerned task.
4. Click on the `Schedule` button to schedule the task/script.  
   ![Schedule Task](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_20_1.png)  
5. This screen will appear.  
   ![Schedule Screen](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_21_1.png)  
6. Click the `Does not repeat` button.  
   ![Does Not Repeat](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_22_1.png)  
7. This pop-up box will appear.  
   ![Pop-up Box](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_23_1.png)  
8. Click the `OK` button to run the task once per day.  
   ![OK Button](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_24_1.png)  
9. Select the relevant time to execute the script. It is suggested to run this task during working hours when most of the workstations are online.  
   ![Execution Time](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_24_1.png)  
10. Search and select the `Feature Pack Update - Updated Computers` group in the `Resources`.  
    ![Resources](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_25_1.png)  
11. Clicking the `Run` button will initiate the schedule.  
    ![Run Button](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_26_1.png)  
12. The task will start appearing in the Scheduled Tasks.  
    ![Scheduled Tasks](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_27_1.png)  
    ![Scheduled Tasks 2](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_28_1.png)  
13. The `Suspend` option can be used to `suspend/stop` the schedule.  
    ![Suspend Option](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_29_1.png)  
    ![Suspend Option 2](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_30_1.png)  

## Output

- Custom Field


