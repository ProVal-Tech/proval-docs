---
id: 'a1fc1dc3-b9aa-414f-bf6e-7a9bf79cedd1'
slug: /a1fc1dc3-b9aa-414f-bf6e-7a9bf79cedd1
title: 'Force Reboot Server With Reboot Windows Verification'
title_meta: 'Force Reboot Server With Reboot Windows Verification'
keywords: ['reboot', 'endpoints', 'custom', 'script', 'automation']
description: 'This document outlines a script designed to reboot endpoints based on specific custom fields that define the reboot window. It includes detailed instructions for implementation, sample runs, dependencies, and deployment steps, ensuring that reboots only occur within the designated time frames.'
tags: ['custom-fields']
draft: false
unlisted: false
---

## Summary

This script is designed to reboot the endpoints based on the custom fields `@ServerRebootWindowStart@`, `@ServerRebootWindowEnd@`, and `@ServerRebootWindowDay@`. If the reboot time does not fall between the defined windows, the reboot will not trigger.

**NOTE:** To exclude this client from the solution, please enter 'Exclude' in the `@ServerRebootWindowDay@` and `@WorkstationRebootWindowDay@` fields. This will cause the script to exit and not take any actions on the target partner.

## Sample Run

![Sample Run Image 1](../../../static/img/docs/a1fc1dc3-b9aa-414f-bf6e-7a9bf79cedd1/image_1.webp)
![Sample Run Image 2](../../../static/img/docs/a1fc1dc3-b9aa-414f-bf6e-7a9bf79cedd1/image_2.webp)

## Dependencies

[Custom Fields - Reboot Trigger/Schedule](/docs/c0aece55-4e18-4914-9e43-965c8c9e23a6)

## Implementation

### Create Task

To implement this script, please create a new "Script Editor" style script in the system.

![Create Task Image](../../../static/img/docs/a1fc1dc3-b9aa-414f-bf6e-7a9bf79cedd1/image_3.webp)

- **Name:** Force Reboot Server With Reboot Windows Verification  
- **Description:** This script is designed to reboot the endpoints based on the custom fields `@ServerRebootWindowStart@`, `@ServerRebootWindowEnd@`, and `@ServerRebootWindowDay@`. If the reboot time does not fall between the defined windows, the reboot will not trigger.  
- **Category:** Maintenance

![Create Task Image 2](../../../static/img/docs/a1fc1dc3-b9aa-414f-bf6e-7a9bf79cedd1/image_4.webp)

## Script

Start by creating three separate rows. You can do this by clicking the "Add Row" button at the bottom of the script page.

![Script Image](../../../static/img/docs/a1fc1dc3-b9aa-414f-bf6e-7a9bf79cedd1/image_5.webp)

### Row 1: Function: Script Log

![Row 1 Image](../../../static/img/docs/a1fc1dc3-b9aa-414f-bf6e-7a9bf79cedd1/image_6.webp)

Paste the highlighted text: `Checking OS`

![Row 1 Image 2](../../../static/img/docs/a1fc1dc3-b9aa-414f-bf6e-7a9bf79cedd1/image_7.webp)

### Row 2: Function: PowerShell Script

![Row 2 Image](../../../static/img/docs/a1fc1dc3-b9aa-414f-bf6e-7a9bf79cedd1/image_8.webp)
![Row 2 Image 2](../../../static/img/docs/a1fc1dc3-b9aa-414f-bf6e-7a9bf79cedd1/image_9.webp)

Paste in the following PowerShell script and set the expected time of script execution to **600 seconds**.

```powershell
$os = Get-CimInstance -ClassName Win32_OperatingSystem
if ($os.ProductType -eq 1) {
    return 'Workstation'
} elseif ($os.ProductType -eq 2 -or $os.ProductType -eq 3) {
    return 'Server'
} else {
    return 'Unknown OS Type'
}
```

### Row 3: Function: Script Log

![Row 3 Image](../../../static/img/docs/a1fc1dc3-b9aa-414f-bf6e-7a9bf79cedd1/image_10.webp)

In the script log message, simply type `%output%` so that the script will send the results of the PowerShell script above to the output on the Automation tab for the target device.

![Row 3 Image 2](../../../static/img/docs/a1fc1dc3-b9aa-414f-bf6e-7a9bf79cedd1/image_11.webp)

### Row 4: Logic: If/Then

![Row 4 Image](../../../static/img/docs/a1fc1dc3-b9aa-414f-bf6e-7a9bf79cedd1/image_12.webp)
![Row 4 Image 2](../../../static/img/docs/a1fc1dc3-b9aa-414f-bf6e-7a9bf79cedd1/image_13.webp)

#### Row 4a: Condition: Output Contains

In the IF part, enter `Server` in the right box of the "Output Does Not Contain" part.

![Row 4a Image](../../../static/img/docs/a1fc1dc3-b9aa-414f-bf6e-7a9bf79cedd1/image_14.webp)

#### Row 4b: Function: Script Log

![Row 4b Image](../../../static/img/docs/a1fc1dc3-b9aa-414f-bf6e-7a9bf79cedd1/image_10.webp)

In the script log message, type `The OS detected is confirmed not a Server. Please try the script 'Force Reboot Workstation with Reboot Windows Verification'. Exiting script without any action.` This will send the results of the PowerShell script above to the output on the Automation tab for the target device.

![Row 4b Image 2](../../../static/img/docs/a1fc1dc3-b9aa-414f-bf6e-7a9bf79cedd1/image_15.webp)

#### Row 4c: Function: Script Exit

Add a new row by clicking on the Add row button.

![Row 4c Image](../../../static/img/docs/a1fc1dc3-b9aa-414f-bf6e-7a9bf79cedd1/image_16.webp)

In the script exit message, leave it blank.

![Row 4c Image 2](../../../static/img/docs/a1fc1dc3-b9aa-414f-bf6e-7a9bf79cedd1/image_17.webp)

### Row 5: Logic: If/Then

![Row 5 Image](../../../static/img/docs/a1fc1dc3-b9aa-414f-bf6e-7a9bf79cedd1/image_12.webp)

#### Row 5a: Condition: Custom Field Equals

In the IF part, enter `true` in the right box of the "Custom Field Equals" part.

![Row 5a Image](../../../static/img/docs/a1fc1dc3-b9aa-414f-bf6e-7a9bf79cedd1/image_18.webp)

#### Row 5b: Function: Script Log

![Row 5b Image](../../../static/img/docs/a1fc1dc3-b9aa-414f-bf6e-7a9bf79cedd1/image_10.webp)

In the script log message, type `Force reboot is allowed on the endpoint. Proceeding for reboot without windows validation.` This will send the results of the PowerShell script above to the output on the Automation tab for the target device.

![Row 5b Image 2](../../../static/img/docs/a1fc1dc3-b9aa-414f-bf6e-7a9bf79cedd1/image_19.webp)

#### Row 5c: Function: Command Prompt (CMD) Script

![Row 5c Image](../../../static/img/docs/a1fc1dc3-b9aa-414f-bf6e-7a9bf79cedd1/image_20.webp)
![Row 5c Image 2](../../../static/img/docs/a1fc1dc3-b9aa-414f-bf6e-7a9bf79cedd1/image_21.webp)

Run it as 'Continue on Failure' and paste.

Paste in the following PowerShell script and set the expected time of script execution to **300 seconds**.

```shell
shutdown -r -f -t 60
```

#### Row 5d: Function: Script Exit

Add a new row by clicking on the Add row button.

![Row 5d Image](../../../static/img/docs/a1fc1dc3-b9aa-414f-bf6e-7a9bf79cedd1/image_16.webp)

In the script exit message, leave it blank.

![Row 5d Image 2](../../../static/img/docs/a1fc1dc3-b9aa-414f-bf6e-7a9bf79cedd1/image_17.webp)

### Row 6: Function: Set Pre-defined Variable

![Row 6 Image](../../../static/img/docs/a1fc1dc3-b9aa-414f-bf6e-7a9bf79cedd1/image_22.webp)

Select the custom field 'ServerRebootWindowStart' and set the variable 'RebootWindowStart'.

![Row 6 Image 2](../../../static/img/docs/a1fc1dc3-b9aa-414f-bf6e-7a9bf79cedd1/image_23.webp)

### Row 7: Function: Set Pre-defined Variable

![Row 7 Image](../../../static/img/docs/a1fc1dc3-b9aa-414f-bf6e-7a9bf79cedd1/image_24.webp)

Select the custom field 'ServerRebootWindowEnd' and set the variable 'RebootWindowEnd'.

![Row 7 Image 2](../../../static/img/docs/a1fc1dc3-b9aa-414f-bf6e-7a9bf79cedd1/image_25.webp)

### Row 8: Function: Set Pre-defined Variable

![Row 8 Image](../../../static/img/docs/a1fc1dc3-b9aa-414f-bf6e-7a9bf79cedd1/image_26.webp)

Select the custom field 'ServerRebootWindowDay' and set the variable 'RebootWindowDay'.

![Row 8 Image 2](../../../static/img/docs/a1fc1dc3-b9aa-414f-bf6e-7a9bf79cedd1/image_27.webp)

### Row 9: Logic: If/Then

![Row 9 Image](../../../static/img/docs/a1fc1dc3-b9aa-414f-bf6e-7a9bf79cedd1/image_12.webp)

#### Row 9a: Condition: Custom Field Equals

In the IF part, enter `true` in the right box of the "Custom Field Equals" part.

![Row 9a Image](../../../static/img/docs/a1fc1dc3-b9aa-414f-bf6e-7a9bf79cedd1/image_28.webp)

#### Row 9b: Function: Script Log

![Row 9b Image](../../../static/img/docs/a1fc1dc3-b9aa-414f-bf6e-7a9bf79cedd1/image_10.webp)

In the script log message, type `This endpoint has 'Exclude Reboot' flag checked. Exiting script without any action.` This will send the results of the PowerShell script above to the output on the Automation tab for the target device.

![Row 9b Image 2](../../../static/img/docs/a1fc1dc3-b9aa-414f-bf6e-7a9bf79cedd1/image_29.webp)

#### Row 9c: Function: Script Exit

Add a new row by clicking on the Add row button.

![Row 9c Image](../../../static/img/docs/a1fc1dc3-b9aa-414f-bf6e-7a9bf79cedd1/image_16.webp)

In the script exit message, leave it blank.

![Row 9c Image 2](../../../static/img/docs/a1fc1dc3-b9aa-414f-bf6e-7a9bf79cedd1/image_17.webp)

### Row 10: Function: Script Log

![Row 10 Image](../../../static/img/docs/a1fc1dc3-b9aa-414f-bf6e-7a9bf79cedd1/image_10.webp)

In the script log message, type `Verifying that machine is in approved window between @RebootWindowStart@ and @RebootWindowEnd@ (Note: 0=12:00 AM, 23=11:00 PM) and Day @RebootWindowDay@.` This will send the results of the PowerShell script above to the output on the Automation tab for the target device.

![Row 10 Image 2](../../../static/img/docs/a1fc1dc3-b9aa-414f-bf6e-7a9bf79cedd1/image_30.webp)

### Row 11: Function: PowerShell Script

![Row 11 Image](../../../static/img/docs/a1fc1dc3-b9aa-414f-bf6e-7a9bf79cedd1/image_8.webp)
![Row 11 Image 2](../../../static/img/docs/a1fc1dc3-b9aa-414f-bf6e-7a9bf79cedd1/image_31.webp)

Paste in the following PowerShell script and set the expected time of script execution to **600 seconds**.

```powershell
$hour = [int](get-date -Format "HH");
$currentDay = (get-date).DayOfWeek
$Day = @RebootWindowDay@
$minHour = @RebootWindowStart@
$maxHour = @RebootWindowEnd@
if ($Day -contains $currentDay) {
    if (($hour -ge $minHour) -and ($hour -lt $maxHour)) {
        return 'Machine is in reboot window'
    }
    else {
        return 'Time is not in approved window'
    }
} else {
    return 'Day is not in approved window'
}
```

### Row 12: Function: Script Log

![Row 12 Image](../../../static/img/docs/a1fc1dc3-b9aa-414f-bf6e-7a9bf79cedd1/image_10.webp)

In the script log message, simply type `%output%` so that the script will send the results of the PowerShell script above to the output on the Automation tab for the target device.

![Row 12 Image 2](../../../static/img/docs/a1fc1dc3-b9aa-414f-bf6e-7a9bf79cedd1/image_11.webp)

### Row 13: Logic: If/Then

![Row 13 Image](../../../static/img/docs/a1fc1dc3-b9aa-414f-bf6e-7a9bf79cedd1/image_12.webp)
![Row 13 Image 2](../../../static/img/docs/a1fc1dc3-b9aa-414f-bf6e-7a9bf79cedd1/image_13.webp)

#### Row 13a: Condition: Output Contains

In the IF part, enter `Machine is in reboot window` in the right box of the "Output Contains" part.

![Row 13a Image](../../../static/img/docs/a1fc1dc3-b9aa-414f-bf6e-7a9bf79cedd1/image_32.webp)

#### Row 13b: Function: Script Log

![Row 13b Image](../../../static/img/docs/a1fc1dc3-b9aa-414f-bf6e-7a9bf79cedd1/image_10.webp)

In the script log message, type `Proceeding for the reboot as the reboot falls under the reboot window provided in the script.` This will send the results of the PowerShell script above to the output on the Automation tab for the target device.

![Row 13b Image 2](../../../static/img/docs/a1fc1dc3-b9aa-414f-bf6e-7a9bf79cedd1/image_33.webp)

#### Row 13c: Function: Command Prompt (CMD) Script

![Row 13c Image](../../../static/img/docs/a1fc1dc3-b9aa-414f-bf6e-7a9bf79cedd1/image_20.webp)
![Row 13c Image 2](../../../static/img/docs/a1fc1dc3-b9aa-414f-bf6e-7a9bf79cedd1/image_21.webp)

Run it as 'Continue on Failure' and paste.

Paste in the following PowerShell script and set the expected time of script execution to **300 seconds**.

```shell
shutdown -r -f -t 60
```

#### Row 13d: Function: Script Exit

Add a new row by clicking on the Add row button.

![Row 13d Image](../../../static/img/docs/a1fc1dc3-b9aa-414f-bf6e-7a9bf79cedd1/image_16.webp)

In the script exit message, leave it blank.

![Row 13d Image 2](../../../static/img/docs/a1fc1dc3-b9aa-414f-bf6e-7a9bf79cedd1/image_17.webp)

### Row 14: Complete

The complete script looks as shown below:

![Complete Script Image 1](../../../static/img/docs/a1fc1dc3-b9aa-414f-bf6e-7a9bf79cedd1/image_34.webp)
![Complete Script Image 2](../../../static/img/docs/a1fc1dc3-b9aa-414f-bf6e-7a9bf79cedd1/image_35.webp)
![Complete Script Image 3](../../../static/img/docs/a1fc1dc3-b9aa-414f-bf6e-7a9bf79cedd1/image_36.webp)

## Deployment

This task can be run manually or in a group. It will only reboot endpoints if the reboot falls under the reboot window provided in the company-level custom fields.

[Reboot Trigger/Schedule](/docs/c0aece55-4e18-4914-9e43-965c8c9e23a6)

- Go to `Automation` > `Tasks.`
- Search for the `Force Reboot Server With Reboot Windows Verification` task.
- Select the concerned task.
- Click on the `Schedule` button to schedule the task/script.

![Schedule Task Image](../../../static/img/docs/a1fc1dc3-b9aa-414f-bf6e-7a9bf79cedd1/image_37.webp)

This screen will appear.

![Schedule Screen Image](../../../static/img/docs/a1fc1dc3-b9aa-414f-bf6e-7a9bf79cedd1/image_38.webp)

- Select the relevant time to run the script and click the 'Does not repeat' button.

![Select Time Image](../../../static/img/docs/a1fc1dc3-b9aa-414f-bf6e-7a9bf79cedd1/image_39.webp)

![Select Target Image](../../../static/img/docs/a1fc1dc3-b9aa-414f-bf6e-7a9bf79cedd1/image_40.webp)

- Select the target to schedule the 'Force Reboot Server With Reboot Windows Verification'.

For example:

![Select Target Example Image](../../../static/img/docs/a1fc1dc3-b9aa-414f-bf6e-7a9bf79cedd1/image_41.webp)

- Now click the `Run` button once all customization is set to initiate the task.

![Run Button Image](../../../static/img/docs/a1fc1dc3-b9aa-414f-bf6e-7a9bf79cedd1/image_42.webp)

- The task will start appearing in the Scheduled Tasks.

## Output

- Task & Sequences Log