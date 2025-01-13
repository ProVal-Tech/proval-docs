---
id: 'rmm-force-workstation-reboot'
title: 'Force Workstation Reboot With Reboot Windows Verification'
title_meta: 'Force Workstation Reboot With Reboot Windows Verification'
keywords: ['reboot', 'workstation', 'windows', 'automation', 'script']
description: 'This document outlines a script designed to reboot workstation endpoints based on specified reboot windows defined by custom fields. It includes implementation steps, sample runs, and detailed script logic to ensure reboots occur only within the designated timeframes.'
tags: ['maintenance', 'scripting', 'automation', 'custom-fields', 'task']
draft: false
unlisted: false
---
## Summary

This script is designed to reboot the workstations endpoints based on the custom field `@WorkstationRebootWindowStart@`, `@WorkstationRebootWindowEnd@`, and `@WorkstationRebootWindowDay@`. If the reboot time does not fall between the windows then the reboot will not trigger.

## Sample Run

![Sample Run 1](..\..\..\static\img\Force-Reboot-Workstation-With-Reboot-Windows-Verification\image_1.png)

![Sample Run 2](..\..\..\static\img\Force-Reboot-Workstation-With-Reboot-Windows-Verification\image_2.png)

## Dependencies

[CW RMM - Custom Fields - Reboot Trigger/Schedule](https://proval.itglue.com/DOC-5078775-15502216)

## Implementation

### Create Task

**Force Reboot Workstation With Reboot Windows Verification:** To implement this script, please create a new "Script Editor" style script in the system.

![Create Task](..\..\..\static\img\Force-Reboot-Workstation-With-Reboot-Windows-Verification\image_3.png)

- **Name:** Force Workstation Server With Reboot Windows Verification
- **Description:** This script is designed to reboot the endpoints based on the custom field WorkstationRebootWindowStart, WorkstationRebootWindowEnd, and WorkstationRebootWindowDay. If the reboot time does not fall between the windows then the reboot will not trigger.
- **Category:** Maintenance

![Task Details](..\..\..\static\img\Force-Reboot-Workstation-With-Reboot-Windows-Verification\image_4.png)

## Script

Start by making three separate rows. You can do this by clicking the "Add Row" button at the bottom of the script page.

![Add Rows](..\..\..\static\img\Force-Reboot-Workstation-With-Reboot-Windows-Verification\image_5.png)

### Row 1: Function: Script Log

![Row 1](..\..\..\static\img\Force-Reboot-Workstation-With-Reboot-Windows-Verification\image_6.png)

Paste the highlighted text: `Checking OS`

![Row 1 Log](..\..\..\static\img\Force-Reboot-Workstation-With-Reboot-Windows-Verification\image_7.png)

### Row 2: Function: PowerShell Script

![Row 2](..\..\..\static\img\Force-Reboot-Workstation-With-Reboot-Windows-Verification\image_8.png)

![Row 2 Log](..\..\..\static\img\Force-Reboot-Workstation-With-Reboot-Windows-Verification\image_9.png)

Paste in the following PowerShell script and set the expected time of script execution to `600` seconds.

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

![Row 3](..\..\..\static\img\Force-Reboot-Workstation-With-Reboot-Windows-Verification\image_10.png)

In the script log message, simply type `%output%` so that the script will send the results of the PowerShell script above to the output on the Automation tab for the target device.

![Row 3 Log](..\..\..\static\img\Force-Reboot-Workstation-With-Reboot-Windows-Verification\image_11.png)

### Row 4: Logic: If/Then

![Row 4](..\..\..\static\img\Force-Reboot-Workstation-With-Reboot-Windows-Verification\image_12.png)

![Row 4 Logic](..\..\..\static\img\Force-Reboot-Workstation-With-Reboot-Windows-Verification\image_13.png)

### Row 4a: Condition: Output Contains

In the IF part, enter `Workstation` in the right box of the "Output Does Not Contain" Part.

![Row 4a](..\..\..\static\img\Force-Reboot-Workstation-With-Reboot-Windows-Verification\image_14.png)

### Row 4b: Function: Script Log

![Row 4b](..\..\..\static\img\Force-Reboot-Workstation-With-Reboot-Windows-Verification\image_10.png)

In the script log message, type `The OS detected is confirmed not a Workstation. Please try the script 'Force Reboot Server with Reboot Windows Verification'. Exiting script without any action.` so that the script will send the results of the PowerShell script above to the output on the Automation tab for the target device.

![Row 4b Log](..\..\..\static\img\Force-Reboot-Workstation-With-Reboot-Windows-Verification\image_15.png)

### Row 4c: Function: Script Exit

Add a new row by clicking on the Add row button.

![Row 4c](..\..\..\static\img\Force-Reboot-Workstation-With-Reboot-Windows-Verification\image_16.png)

In the script exit message, leave it blank.

![Row 4c Exit](..\..\..\static\img\Force-Reboot-Workstation-With-Reboot-Windows-Verification\image_17.png)

### Row 5: Logic: If/Then

![Row 5](..\..\..\static\img\Force-Reboot-Workstation-With-Reboot-Windows-Verification\image_12.png)

### Row 5a: Condition: Custom Field Equals

In the IF part, enter `true` in the right box of the "Custom Field Equals" Part.

![Row 5a](..\..\..\static\img\Force-Reboot-Workstation-With-Reboot-Windows-Verification\image_18.png)

### Row 5b: Function: Script Log

![Row 5b](..\..\..\static\img\Force-Reboot-Workstation-With-Reboot-Windows-Verification\image_10.png)

In the script log message, type `Force reboot is allowed on the endpoint. Proceeding for reboot without windows validation.` so that the script will send the results of the PowerShell script above to the output on the Automation tab for the target device.

![Row 5b Log](..\..\..\static\img\Force-Reboot-Workstation-With-Reboot-Windows-Verification\image_19.png)

### Row 5c: Function: Command Prompt (CMD) Script

![Row 5c](..\..\..\static\img\Force-Reboot-Workstation-With-Reboot-Windows-Verification\image_20.png)

![Row 5c CMD](..\..\..\static\img\Force-Reboot-Workstation-With-Reboot-Windows-Verification\image_21.png)

Run it as 'Continue on Failure' and paste.

Paste in the following PowerShell script and set the expected time of script execution to `300` seconds.

```powershell
shutdown -r -f -t 60
```

### Row 5d: Function: Script Exit

Add a new row by clicking on the Add row button.

![Row 5d](..\..\..\static\img\Force-Reboot-Workstation-With-Reboot-Windows-Verification\image_16.png)

In the script exit message, leave it blank.

![Row 5d Exit](..\..\..\static\img\Force-Reboot-Workstation-With-Reboot-Windows-Verification\image_17.png)

### Row 6: Function: Set Pre-defined Variable

![Row 6](..\..\..\static\img\Force-Reboot-Workstation-With-Reboot-Windows-Verification\image_22.png)

Select the custom field 'WorkstationRebootWindowStart' and set the variable 'RebootWindowStart'.

![Row 6 Variable](..\..\..\static\img\Force-Reboot-Workstation-With-Reboot-Windows-Verification\image_23.png)

### Row 7: Function: Set Pre-defined Variable

![Row 7](..\..\..\static\img\Force-Reboot-Workstation-With-Reboot-Windows-Verification\image_24.png)

Select the custom field 'WorkstationRebootWindowEnd' and set the variable 'RebootWindowEnd'.

![Row 7 Variable](..\..\..\static\img\Force-Reboot-Workstation-With-Reboot-Windows-Verification\image_25.png)

### Row 8: Function: Set Pre-defined Variable

![Row 8](..\..\..\static\img\Force-Reboot-Workstation-With-Reboot-Windows-Verification\image_26.png)

Select the custom field 'WorkstationRebootWindowDay' and set the variable 'RebootWindowDay'.

![Row 8 Variable](..\..\..\static\img\Force-Reboot-Workstation-With-Reboot-Windows-Verification\image_27.png)

### Row 9: Logic: If/Then

![Row 9](..\..\..\static\img\Force-Reboot-Workstation-With-Reboot-Windows-Verification\image_12.png)

### Row 9a: Condition: Custom Field Equals

In the IF part, enter `true` in the right box of the "Custom Field Equals" Part.

![Row 9a](..\..\..\static\img\Force-Reboot-Workstation-With-Reboot-Windows-Verification\image_28.png)

### Row 9b: Function: Script Log

![Row 9b](..\..\..\static\img\Force-Reboot-Workstation-With-Reboot-Windows-Verification\image_10.png)

In the script log message, type `This endpoint has 'Exclude Reboot' flag checked. Exiting script without any action.` so that the script will send the results of the PowerShell script above to the output on the Automation tab for the target device.

![Row 9b Log](..\..\..\static\img\Force-Reboot-Workstation-With-Reboot-Windows-Verification\image_29.png)

### Row 9c: Function: Script Exit

Add a new row by clicking on the Add row button.

![Row 9c](..\..\..\static\img\Force-Reboot-Workstation-With-Reboot-Windows-Verification\image_16.png)

In the script exit message, leave it blank.

![Row 9c Exit](..\..\..\static\img\Force-Reboot-Workstation-With-Reboot-Windows-Verification\image_17.png)

### Row 10: Function: Script Log

![Row 10](..\..\..\static\img\Force-Reboot-Workstation-With-Reboot-Windows-Verification\image_10.png)

In the script log message, type `Verifying that machine is in approved window between @RebootWindowStart@ and @RebootWindowEnd@ (Note: 0=12:00 AM, 23=11:00 PM) and Day @RebootWindowDay@.` so that the script will send the results of the PowerShell script above to the output on the Automation tab for the target device.

![Row 10 Log](..\..\..\static\img\Force-Reboot-Workstation-With-Reboot-Windows-Verification\image_30.png)

### Row 11: Function: PowerShell Script

![Row 11](..\..\..\static\img\Force-Reboot-Workstation-With-Reboot-Windows-Verification\image_8.png)

![Row 11 Log](..\..\..\static\img\Force-Reboot-Workstation-With-Reboot-Windows-Verification\image_31.png)

Paste in the following PowerShell script and set the expected time of script execution to `600` seconds.

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

![Row 12](..\..\..\static\img\Force-Reboot-Workstation-With-Reboot-Windows-Verification\image_10.png)

In the script log message, simply type `%output%` so that the script will send the results of the PowerShell script above to the output on the Automation tab for the target device.

![Row 12 Log](..\..\..\static\img\Force-Reboot-Workstation-With-Reboot-Windows-Verification\image_11.png)

### Row 13: Logic: If/Then

![Row 13](..\..\..\static\img\Force-Reboot-Workstation-With-Reboot-Windows-Verification\image_12.png)

![Row 13 Logic](..\..\..\static\img\Force-Reboot-Workstation-With-Reboot-Windows-Verification\image_13.png)

### Row 13a: Condition: Output Contains

In the IF part, enter `Machine is in reboot window` in the right box of the "Output Contain" Part.

![Row 13a](..\..\..\static\img\Force-Reboot-Workstation-With-Reboot-Windows-Verification\image_32.png)

### Row 13b: Function: Script Log

![Row 13b](..\..\..\static\img\Force-Reboot-Workstation-With-Reboot-Windows-Verification\image_10.png)

In the script log message, type `Proceeding for the reboot as the reboot falls under the reboot window provided in the script.` so that the script will send the results of the PowerShell script above to the output on the Automation tab for the target device.

![Row 13b Log](..\..\..\static\img\Force-Reboot-Workstation-With-Reboot-Windows-Verification\image_33.png)

### Row 13c: Function: Command Prompt (CMD) Script

![Row 13c](..\..\..\static\img\Force-Reboot-Workstation-With-Reboot-Windows-Verification\image_20.png)

![Row 13c CMD](..\..\..\static\img\Force-Reboot-Workstation-With-Reboot-Windows-Verification\image_21.png)

Run it as 'Continue on Failure' and paste.

Paste in the following PowerShell script and set the expected time of script execution to `300` seconds.

```powershell
shutdown -r -f -t 60
```

### Row 13d: Function: Script Exit

Add a new row by clicking on the Add row button.

![Row 13d](..\..\..\static\img\Force-Reboot-Workstation-With-Reboot-Windows-Verification\image_16.png)

In the script exit message, leave it blank.

![Row 13d Exit](..\..\..\static\img\Force-Reboot-Workstation-With-Reboot-Windows-Verification\image_17.png)

### Row 14: Complete

The complete script looks as shown below:

![Complete Script](..\..\..\static\img\Force-Reboot-Workstation-With-Reboot-Windows-Verification\image_34.png)

![Complete Script 2](..\..\..\static\img\Force-Reboot-Workstation-With-Reboot-Windows-Verification\image_35.png)

![Complete Script 3](..\..\..\static\img\Force-Reboot-Workstation-With-Reboot-Windows-Verification\image_36.png)

## Deployment

This task can be run manually or in a group. It will only reboot endpoints if the reboot falls under the reboot window provided at the company-level custom fields.

[CW RMM - Custom Fields - Reboot Trigger/Schedule](https://proval.itglue.com/DOC-5078775-15502216)

- Go to `Automation` > `Tasks.`
- Search for `Force Reboot Workstation With Reboot Windows Verification` Task.
- Select the concerned task.
- Click on `Schedule` button to schedule the task/script.

![Schedule Task](..\..\..\static\img\Force-Reboot-Workstation-With-Reboot-Windows-Verification\image_37.png)

This screen will appear.

![Schedule Screen](..\..\..\static\img\Force-Reboot-Workstation-With-Reboot-Windows-Verification\image_38.png)

- Select the relevant time to run the script and click the Do not repeat button.

![Select Time](..\..\..\static\img\Force-Reboot-Workstation-With-Reboot-Windows-Verification\image_39.png)

![Select Time 2](..\..\..\static\img\Force-Reboot-Workstation-With-Reboot-Windows-Verification\image_40.png)

- Select the target to schedule the 'Force Reboot Workstation With Reboot Windows Verification'.

![Select Target](..\..\..\static\img\Force-Reboot-Workstation-With-Reboot-Windows-Verification\image_41.png)

- Now click the `Run` button once all customization is set to initiate the task.

![Run Task](..\..\..\static\img\Force-Reboot-Workstation-With-Reboot-Windows-Verification\image_42.png)

- The task will start appearing in the Scheduled Tasks.

## Output

- Task & Sequences Log


