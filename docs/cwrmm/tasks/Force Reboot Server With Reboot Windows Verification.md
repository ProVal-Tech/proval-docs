---
id: 'a1fc1dc3-b9aa-414f-bf6e-7a9bf79cedd1'
title: 'Force Reboot Server With Reboot Windows Verification'
title_meta: 'Force Reboot Server With Reboot Windows Verification'
keywords: ['reboot', 'endpoints', 'custom', 'script', 'automation']
description: 'This document outlines a script designed to reboot endpoints based on specific custom fields that define the reboot window. It includes detailed instructions for implementation, sample runs, dependencies, and deployment steps, ensuring that reboots only occur within the designated time frames.'
tags: ['custom-fields']
draft: false
unlisted: false
---
## Summary

This script is designed to reboot the endpoints based on the custom field `@ServerRebootWindowStart@`, `@ServerRebootWindowEnd@`, and `@ServerRebootWindowDay@`. If the reboot time does not fall between the windows then reboot will not trigger.

**NOTE:** To exclude this client from the solution, please enter 'Exclude' in the `@ServerRebootWindowDay@` and `@WorkstationRebootWindowDay@` field. That will cause the script to exit and not take any actions on the target partner.

## Sample Run

![Sample Run Image 1](../../../static/img/Force-Reboot-Server-With-Reboot-Windows-Verification/image_1.png)
![Sample Run Image 2](../../../static/img/Force-Reboot-Server-With-Reboot-Windows-Verification/image_2.png)

## Dependencies

[CW RMM - Custom Fields - Reboot Trigger/Schedule](<../custom-fields/Reboot TriggerSchedule.md>)

## Implementation

### Create Task

Force Reboot Server With Reboot Windows Verification: To implement this script, please create a new "Script Editor" style script in the system.

![Create Task Image](../../../static/img/Force-Reboot-Server-With-Reboot-Windows-Verification/image_3.png)

Name: Force Reboot Server With Reboot Windows Verification  
Description: This script is designed to reboot the endpoints based on the custom field `@ServerRebootWindowStart@`, `@ServerRebootWindowEnd@`, and `@ServerRebootWindowDay@`. If the reboot time does not fall between the windows then reboot will not trigger.  
Category: Maintenance

![Create Task Image 2](../../../static/img/Force-Reboot-Server-With-Reboot-Windows-Verification/image_4.png)

## Script

Start by making three separate rows. You can do this by clicking the "Add Row" button at the bottom of the script page.

![Script Image](../../../static/img/Force-Reboot-Server-With-Reboot-Windows-Verification/image_5.png)

### Row 1: Function: Script Log

![Row 1 Image](../../../static/img/Force-Reboot-Server-With-Reboot-Windows-Verification/image_6.png)

Paste the highlighted text: `Checking OS`

![Row 1 Image 2](../../../static/img/Force-Reboot-Server-With-Reboot-Windows-Verification/image_7.png)

### Row 2: Function: PowerShell Script

![Row 2 Image](../../../static/img/Force-Reboot-Server-With-Reboot-Windows-Verification/image_8.png)
![Row 2 Image 2](../../../static/img/Force-Reboot-Server-With-Reboot-Windows-Verification/image_9.png)

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

![Row 3 Image](../../../static/img/Force-Reboot-Server-With-Reboot-Windows-Verification/image_10.png)

In the script log message, simply type `%output%` so that the script will send the results of the PowerShell script above to the output on the Automation tab for the target device.

![Row 3 Image 2](../../../static/img/Force-Reboot-Server-With-Reboot-Windows-Verification/image_11.png)

### Row 4: Logic: If/Then

![Row 4 Image](../../../static/img/Force-Reboot-Server-With-Reboot-Windows-Verification/image_12.png)
![Row 4 Image 2](../../../static/img/Force-Reboot-Server-With-Reboot-Windows-Verification/image_13.png)

### Row 4a: Condition: Output Contains

In the IF part, enter `Server` in the right box of the "Output Does Not Contain" Part.

![Row 4a Image](../../../static/img/Force-Reboot-Server-With-Reboot-Windows-Verification/image_14.png)

### Row 4b: Function: Script Log

![Row 4b Image](../../../static/img/Force-Reboot-Server-With-Reboot-Windows-Verification/image_10.png)

In the script log message, type `The OS detected is confirmed not a Server. Please try the script 'Force Reboot Workstation with Reboot Windows Verification'. Exiting script without any action.` so that the script will send the results of the PowerShell script above to the output on the Automation tab for the target device.

![Row 4b Image 2](../../../static/img/Force-Reboot-Server-With-Reboot-Windows-Verification/image_15.png)

### Row 4c: Function: Script Exit

Add a new row by clicking on the Add row button.

![Row 4c Image](../../../static/img/Force-Reboot-Server-With-Reboot-Windows-Verification/image_16.png)

In the script exit message, leave it blank.

![Row 4c Image 2](../../../static/img/Force-Reboot-Server-With-Reboot-Windows-Verification/image_17.png)

### Row 5: Logic: If/Then

![Row 5 Image](../../../static/img/Force-Reboot-Server-With-Reboot-Windows-Verification/image_12.png)

### Row 5a: Condition: Custom Field Equals

In the IF part, enter `true` in the right box of the "Custom Field Equals" Part.

![Row 5a Image](../../../static/img/Force-Reboot-Server-With-Reboot-Windows-Verification/image_18.png)

### Row 5b: Function: Script Log

![Row 5b Image](../../../static/img/Force-Reboot-Server-With-Reboot-Windows-Verification/image_10.png)

In the script log message, type `Force reboot is allowed on the endpoint. Proceeding for reboot without windows validation.` so that the script will send the results of the PowerShell script above to the output on the Automation tab for the target device.

![Row 5b Image 2](../../../static/img/Force-Reboot-Server-With-Reboot-Windows-Verification/image_19.png)

### Row 5c: Function: Command Prompt (CMD) Script

![Row 5c Image](../../../static/img/Force-Reboot-Server-With-Reboot-Windows-Verification/image_20.png)
![Row 5c Image 2](../../../static/img/Force-Reboot-Server-With-Reboot-Windows-Verification/image_21.png)

Run it as 'Continue on Failure' and paste.

Paste in the following PowerShell script and set the expected time of script execution to **300 seconds**.

```cmd
shutdown -r -f -t 60
```

### Row 5d: Function: Script Exit

Add a new row by clicking on the Add row button.

![Row 5d Image](../../../static/img/Force-Reboot-Server-With-Reboot-Windows-Verification/image_16.png)

In the script exit message, leave it blank.

![Row 5d Image 2](../../../static/img/Force-Reboot-Server-With-Reboot-Windows-Verification/image_17.png)

### Row 6: Function: Set Pre-defined Variable

![Row 6 Image](../../../static/img/Force-Reboot-Server-With-Reboot-Windows-Verification/image_22.png)

Select the custom field 'ServerRebootWindowStart' and set the variable 'RebootWindowStart'.

![Row 6 Image 2](../../../static/img/Force-Reboot-Server-With-Reboot-Windows-Verification/image_23.png)

### Row 7: Function: Set Pre-defined Variable

![Row 7 Image](../../../static/img/Force-Reboot-Server-With-Reboot-Windows-Verification/image_24.png)

Select the custom field 'ServerRebootWindowEnd' and set the variable 'RebootWindowEnd'.

![Row 7 Image 2](../../../static/img/Force-Reboot-Server-With-Reboot-Windows-Verification/image_25.png)

### Row 8: Function: Set Pre-defined Variable

![Row 8 Image](../../../static/img/Force-Reboot-Server-With-Reboot-Windows-Verification/image_26.png)

Select the custom field 'ServerRebootWindowDay' and set the variable 'RebootWindowDay'.

![Row 8 Image 2](../../../static/img/Force-Reboot-Server-With-Reboot-Windows-Verification/image_27.png)

### Row 9: Logic: If/Then

![Row 9 Image](../../../static/img/Force-Reboot-Server-With-Reboot-Windows-Verification/image_12.png)

### Row 9a: Condition: Custom Field Equals

In the IF part, enter `true` in the right box of the "Custom Field Equals" Part.

![Row 9a Image](../../../static/img/Force-Reboot-Server-With-Reboot-Windows-Verification/image_28.png)

### Row 9b: Function: Script Log

![Row 9b Image](../../../static/img/Force-Reboot-Server-With-Reboot-Windows-Verification/image_10.png)

In the script log message, type `This endpoint has 'Exclude Reboot' flag checked. Exiting script without any action.` so that the script will send the results of the PowerShell script above to the output on the Automation tab for the target device.

![Row 9b Image 2](../../../static/img/Force-Reboot-Server-With-Reboot-Windows-Verification/image_29.png)

### Row 9c: Function: Script Exit

Add a new row by clicking on the Add row button.

![Row 9c Image](../../../static/img/Force-Reboot-Server-With-Reboot-Windows-Verification/image_16.png)

In the script exit message, leave it blank.

![Row 9c Image 2](../../../static/img/Force-Reboot-Server-With-Reboot-Windows-Verification/image_17.png)

### Row 10: Function: Script Log

![Row 10 Image](../../../static/img/Force-Reboot-Server-With-Reboot-Windows-Verification/image_10.png)

In the script log message, type `Verifying that machine is in approved window between @RebootWindowStart@ and @RebootWindowEnd@ (Note: 0=12:00 AM, 23=11:00 PM) and Day @RebootWindowDay@.` so that the script will send the results of the PowerShell script above to the output on the Automation tab for the target device.

![Row 10 Image 2](../../../static/img/Force-Reboot-Server-With-Reboot-Windows-Verification/image_30.png)

### Row 11: Function: PowerShell Script

![Row 11 Image](../../../static/img/Force-Reboot-Server-With-Reboot-Windows-Verification/image_8.png)
![Row 11 Image 2](../../../static/img/Force-Reboot-Server-With-Reboot-Windows-Verification/image_31.png)

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

![Row 12 Image](../../../static/img/Force-Reboot-Server-With-Reboot-Windows-Verification/image_10.png)

In the script log message, simply type `%output%` so that the script will send the results of the PowerShell script above to the output on the Automation tab for the target device.

![Row 12 Image 2](../../../static/img/Force-Reboot-Server-With-Reboot-Windows-Verification/image_11.png)

### Row 13: Logic: If/Then

![Row 13 Image](../../../static/img/Force-Reboot-Server-With-Reboot-Windows-Verification/image_12.png)
![Row 13 Image 2](../../../static/img/Force-Reboot-Server-With-Reboot-Windows-Verification/image_13.png)

### Row 13a: Condition: Output Contains

In the IF part, enter `Machine is in reboot window` in the right box of the "Output Contain" Part.

![Row 13a Image](../../../static/img/Force-Reboot-Server-With-Reboot-Windows-Verification/image_32.png)

### Row 13b: Function: Script Log

![Row 13b Image](../../../static/img/Force-Reboot-Server-With-Reboot-Windows-Verification/image_10.png)

In the script log message, type `Proceeding for the reboot as the reboot falls under the reboot window provided in the script.` so that the script will send the results of the PowerShell script above to the output on the Automation tab for the target device.

![Row 13b Image 2](../../../static/img/Force-Reboot-Server-With-Reboot-Windows-Verification/image_33.png)

### Row 13c: Function: Command Prompt (CMD) Script

![Row 13c Image](../../../static/img/Force-Reboot-Server-With-Reboot-Windows-Verification/image_20.png)
![Row 13c Image 2](../../../static/img/Force-Reboot-Server-With-Reboot-Windows-Verification/image_21.png)

Run it as 'Continue on Failure' and paste.

Paste in the following PowerShell script and set the expected time of script execution to **300 seconds**.

```cmd
shutdown -r -f -t 60
```

### Row 13d: Function: Script Exit

Add a new row by clicking on the Add row button.

![Row 13d Image](../../../static/img/Force-Reboot-Server-With-Reboot-Windows-Verification/image_16.png)

In the script exit message, leave it blank.

![Row 13d Image 2](../../../static/img/Force-Reboot-Server-With-Reboot-Windows-Verification/image_17.png)

### Row 14: Complete

The complete script looks as shown below:

![Complete Script Image 1](../../../static/img/Force-Reboot-Server-With-Reboot-Windows-Verification/image_34.png)
![Complete Script Image 2](../../../static/img/Force-Reboot-Server-With-Reboot-Windows-Verification/image_35.png)
![Complete Script Image 3](../../../static/img/Force-Reboot-Server-With-Reboot-Windows-Verification/image_36.png)

## Deployment

This task can be run manually or in a group. It will only reboot endpoints if the reboot falls under the reboot window provided at the company-level custom fields.

[CW RMM - Custom Fields - Reboot Trigger/Schedule](<../custom-fields/Reboot TriggerSchedule.md>)

- Go to `Automation` > `Tasks.`
- Search for `Force Reboot Server With Reboot Windows Verification` Task.
- Select the concerned task.
- Click on `Schedule` button to schedule the task/script.

![Schedule Task Image](../../../static/img/Force-Reboot-Server-With-Reboot-Windows-Verification/image_37.png)

This screen will appear.

![Schedule Screen Image](../../../static/img/Force-Reboot-Server-With-Reboot-Windows-Verification/image_38.png)

- Select the relevant time to run the script and click the 'Does not repeat' button.

![Select Time Image](../../../static/img/Force-Reboot-Server-With-Reboot-Windows-Verification/image_39.png)

![Select Target Image](../../../static/img/Force-Reboot-Server-With-Reboot-Windows-Verification/image_40.png)

- Select the target to schedule the 'Force Reboot Server With Reboot Windows Verification'.

For example:

![Select Target Example Image](../../../static/img/Force-Reboot-Server-With-Reboot-Windows-Verification/image_41.png)

- Now click the `Run` button once all customization is set to initiate the task.

![Run Button Image](../../../static/img/Force-Reboot-Server-With-Reboot-Windows-Verification/image_42.png)

- The task will start appearing in the Scheduled Tasks.

## Output

- Task & Sequences Log












