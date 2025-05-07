---
id: 'defbdc2a-bd40-4baf-9c03-4768e026e0eb'
slug: /defbdc2a-bd40-4baf-9c03-4768e026e0eb
title: 'Cumulative Update Audit'
title_meta: 'Cumulative Update Audit'
keywords: ['cumulative', 'update', 'audit', 'windows', 'os', 'validation']
description: 'This document outlines the process of executing a script to validate the full version of the Windows OS and compare it with Microsoft’s database of Cumulative Updates. It details the implementation steps, dependencies, and how to set up a task in ConnectWise RMM to automate the audit process for monitoring purposes.'
tags: ['update', 'windows']
draft: false
unlisted: false
---

## Summary

This document executes a PowerShell script to validate the full version of the OS and compares it with Microsoft's database of Windows 10/11 Cumulative Updates to identify which cumulative update the device has. The data is then formatted and stored in the [CW RMM - Custom Field - Latest Cumulative Update](/docs/67416ac2-2311-43c4-8fbf-c5b0c9a48e71) for further auditing and monitoring purposes.

## Sample Run

![Sample Run 1](../../../static/img/docs/685b1f1d-527a-4d66-acb2-d1329ee8a368/image_12.png)
![Sample Run 2](../../../static/img/docs/685b1f1d-527a-4d66-acb2-d1329ee8a368/image_13.png)

## Dependencies

- [CW RMM - Custom Field - Latest Cumulative Update](/docs/67416ac2-2311-43c4-8fbf-c5b0c9a48e71)

## Variables

| Name              | Description                                                                                             |
|-------------------|---------------------------------------------------------------------------------------------------------|
| Threshold_Days    | Age of the latest installed Cumulative Update in days to determine if it is obsolete. Default is 75.   |
| Output            | Output of the PowerShell script gathering the data from the endpoint.                                   |

## Implementation

Create the Custom Field [CW RMM - Custom Field - Latest Cumulative Update](/docs/67416ac2-2311-43c4-8fbf-c5b0c9a48e71).

### Create Script

Create a new `Script Editor` style script in the system to implement this Task.

**Name:** Cumulative Update Audit  
**Description:** This script will run a PowerShell script to validate the full version of the OS and compare it with Microsoft's database of Windows 10/11 Cumulative Updates to identify which cumulative update the device has.  
**Category:** Custom  

![Script Editor](../../../static/img/docs/685b1f1d-527a-4d66-acb2-d1329ee8a368/image_14.png)

### Script

Start by adding a row. You can do this by clicking the "Add Row" button at the bottom of the script page.

![Add Row](../../../static/img/docs/685b1f1d-527a-4d66-acb2-d1329ee8a368/image_15.png)

#### Row 1 Function: Set User Variable

![Set User Variable](../../../static/img/docs/685b1f1d-527a-4d66-acb2-d1329ee8a368/image_16.png)

Type `Threshold_Days` for Variable Name and `75` for the value. This value represents the number of days to consider the latest installed Cumulative Update as obsolete. This threshold can be modified as needed.

The script will return `Failed` in the Custom Field if the most recently installed Cumulative Update on the computer is older than the days stored in this variable.

![Threshold Days](../../../static/img/docs/685b1f1d-527a-4d66-acb2-d1329ee8a368/image_17.png)

#### Row 2 Function: PowerShell Script

![PowerShell Script](../../../static/img/docs/685b1f1d-527a-4d66-acb2-d1329ee8a368/image_18.png) 
![PowerShell Script 2](../../../static/img/docs/685b1f1d-527a-4d66-acb2-d1329ee8a368/image_19.png)

Paste in the following PowerShell script and set the expected time of script execution to `600` seconds.

```powershell
# Needs rewriting to use the latest version that targets the JSON file
```

Save and move to the next row.

#### Row 3 Function: Script Log

![Script Log](../../../static/img/docs/685b1f1d-527a-4d66-acb2-d1329ee8a368/image_20.png)

In the script log message, simply type `%output%` so that the script will send the results of the PowerShell script above to the output on the Automation tab for the target device.

![Script Log Output](../../../static/img/docs/685b1f1d-527a-4d66-acb2-d1329ee8a368/image_21.png)

#### Row 4 Function: Set Custom Field

Add a new row by clicking on the "Add Row" button.

![Set Custom Field](../../../static/img/docs/685b1f1d-527a-4d66-acb2-d1329ee8a368/image_22.png)

Select `Set Custom Field` Function.

![Select Custom Field](../../../static/img/docs/685b1f1d-527a-4d66-acb2-d1329ee8a368/image_23.png)

When you select `Set Custom Field`, a new window will open.

![Custom Field Window](../../../static/img/docs/685b1f1d-527a-4d66-acb2-d1329ee8a368/image_24.png)

In this window, search for the `Latest Cumulative Update` field.

**Custom Field:** Latest Cumulative Update  
**Value:** %Output%

![Custom Field Value](../../../static/img/docs/685b1f1d-527a-4d66-acb2-d1329ee8a368/image_25.png)

Once all items are added, please save the task. The final task should look like the screenshot below.

![Final Task](../../../static/img/docs/685b1f1d-527a-4d66-acb2-d1329ee8a368/image_26.png)

## Deployment

It is suggested to run the Task once per month against Windows computers.

1. Go to `Automation` > `Tasks`.
2. Search for the `Cumulative Update Audit` Task.
3. Select the concerned task.
4. Click on the `Schedule` button to schedule the task/script.

![Schedule Task](../../../static/img/docs/685b1f1d-527a-4d66-acb2-d1329ee8a368/image_27.png)

This screen will appear.

![Schedule Screen](../../../static/img/docs/685b1f1d-527a-4d66-acb2-d1329ee8a368/image_28.png)

Select the relevant time to run the script and click the "Does not repeat" button.

![Select Time](../../../static/img/docs/685b1f1d-527a-4d66-acb2-d1329ee8a368/image_29.png)

This pop-up box will appear.

![Repeat Interval](../../../static/img/docs/685b1f1d-527a-4d66-acb2-d1329ee8a368/image_30.png)

Change the Repeat interval to once per month. Here, I am selecting the 15th of every month since Microsoft releases the patches on the second Tuesday of every month.

![Repeat Interval Selection](../../../static/img/docs/685b1f1d-527a-4d66-acb2-d1329ee8a368/image_31.png) 
![Repeat Interval Confirmation](../../../static/img/docs/685b1f1d-527a-4d66-acb2-d1329ee8a368/image_32.png)

Search for `windows` in the `Resources*` and select `Windows Desktops` and `Windows Servers` groups. You can search and select any relevant group you would like to schedule the task against.

![Select Resources](../../../static/img/docs/685b1f1d-527a-4d66-acb2-d1329ee8a368/image_33.png)

Now click the `Run` button to initiate the task.

![Run Task](../../../static/img/docs/685b1f1d-527a-4d66-acb2-d1329ee8a368/image_34.png)

The task will start appearing in the Scheduled Tasks.

![Scheduled Tasks](../../../static/img/docs/685b1f1d-527a-4d66-acb2-d1329ee8a368/image_35.png) 
![Scheduled Tasks 2](../../../static/img/docs/685b1f1d-527a-4d66-acb2-d1329ee8a368/image_36.png)

## Output

- **Script log**
![Script Log Output](../../../static/img/docs/685b1f1d-527a-4d66-acb2-d1329ee8a368/image_37.png)

- **Custom Field**
![Custom Field Output](../../../static/img/docs/685b1f1d-527a-4d66-acb2-d1329ee8a368/image_38.png)

