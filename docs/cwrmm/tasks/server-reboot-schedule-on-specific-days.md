---
id: '26d390ba-1542-4524-b9ff-7a420004cb73'
slug: /26d390ba-1542-4524-b9ff-7a420004cb73
title: 'Server Reboot Schedule on Specific Days'
title_meta: 'Server Reboot Schedule on Specific Days'
keywords: ['reboot', 'schedule', 'server', 'automation', 'task']
description: 'This document outlines the process for scheduling a forced reboot of a server on specific days based on an approved window check. It includes a sample run, user parameters, dependencies, and detailed implementation steps for creating and managing the task in ConnectWise RMM.'
tags: ['custom-fields']
draft: false
unlisted: false
---

## Summary

This document outlines the process for scheduling a forced reboot of the server on specific days based on the approved window check.

## Sample Run

Select the device and search for 'Workstation Re' in the search box, then click.

![Sample Run Step 1](../../../static/img/docs/26d390ba-1542-4524-b9ff-7a420004cb73/image_1.png)

Provide the user parameter value as per the requirement and then click 'Continue to scheduling'.

![Sample Run Step 2](../../../static/img/docs/26d390ba-1542-4524-b9ff-7a420004cb73/image_2.png)

Click 'Run task' to schedule the task immediately.

![Sample Run Step 3](../../../static/img/docs/26d390ba-1542-4524-b9ff-7a420004cb73/image_3.png)

## User Parameters

| Name                | Example                       | Required | Description                                                                                                                                      |
|---------------------|-------------------------------|----------|--------------------------------------------------------------------------------------------------------------------------------------------------|
| HoursToReboot       | 4                             | True     | The hour of the day to reboot in a 24-hour format. Example: 13 = 1:00 PM                                                                       |
| MinutesToReboot     | 0                             | True     | The minute of the hour to reboot. Supports values from 0 - 59                                                                                  |
| DaysToReboot        | 'Tuesday','Wednesday','Thursday' | True     | Must be a comma-separated list of strings in single quotes with the names of the days of the week to reboot. Example: 'Tuesday','Wednesday','Thursday' |

## Dependencies

[CW RMM - Custom Fields - Reboot Trigger/Schedule](/docs/c0aece55-4e18-4914-9e43-965c8c9e23a6)

## Implementation

### Create Task

To implement this script, please create a new "Script Editor" style script in the system.

![Create Task](../../../static/img/docs/26d390ba-1542-4524-b9ff-7a420004cb73/image_4.png)

- Name: Server Reboot Schedule on Specific Days
- Description: This schedules the forced reboot of the server on the scheduled days based on the approved window check.
- Category: Maintenance

![Create Task Details](../../../static/img/docs/26d390ba-1542-4524-b9ff-7a420004cb73/image_5.png)

### Script

Start by making three separate rows. You can do this by clicking the "Add Row" button at the bottom of the script page.

![Add Row](../../../static/img/docs/26d390ba-1542-4524-b9ff-7a420004cb73/image_6.png)

### Row 1: Function: Script Log

![Row 1](../../../static/img/docs/26d390ba-1542-4524-b9ff-7a420004cb73/image_7.png)

Paste the highlighted text: `Checking OS`

![Row 1 Detail](../../../static/img/docs/26d390ba-1542-4524-b9ff-7a420004cb73/image_8.png)

### Row 2: Function: PowerShell Script

![Row 2](../../../static/img/docs/26d390ba-1542-4524-b9ff-7a420004cb73/image_9.png)

![Row 2 Detail](../../../static/img/docs/26d390ba-1542-4524-b9ff-7a420004cb73/image_10.png)

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

![Row 3](../../../static/img/docs/26d390ba-1542-4524-b9ff-7a420004cb73/image_11.png)

In the script log message, simply type `%output%` so that the script will send the results of the PowerShell script above to the output on the Automation tab for the target device.

![Row 3 Detail](../../../static/img/docs/26d390ba-1542-4524-b9ff-7a420004cb73/image_12.png)

### Row 4: Logic: If/Then

![Row 4](../../../static/img/docs/26d390ba-1542-4524-b9ff-7a420004cb73/image_13.png)

### Row 4a: Condition: Output Contains

In the IF part, enter `Server` in the right box of the "Output Does Not Contain" part.

![Row 4a](../../../static/img/docs/26d390ba-1542-4524-b9ff-7a420004cb73/image_14.png)

### Row 4b: Function: Script Log

![Row 4b](../../../static/img/docs/26d390ba-1542-4524-b9ff-7a420004cb73/image_11.png)

In the script log message, type `The OS detected is confirmed not a Server. Please try the script 'Force Reboot Workstation with Reboot Windows Verification'. Exiting script without any action.` so that the script will send the results of the PowerShell script above to the output on the Automation tab for the target device.

![Row 4b Detail](../../../static/img/docs/26d390ba-1542-4524-b9ff-7a420004cb73/image_15.png)

### Row 4c: Function: Script Exit

Add a new row by clicking on the Add Row button.

![Row 4c](../../../static/img/docs/26d390ba-1542-4524-b9ff-7a420004cb73/image_16.png)

In the script exit message, leave it blank.

![Row 4c Detail](../../../static/img/docs/26d390ba-1542-4524-b9ff-7a420004cb73/image_17.png)

### Row 5: Logic: If/Then

![Row 5](../../../static/img/docs/26d390ba-1542-4524-b9ff-7a420004cb73/image_13.png)

### Row 5a: Condition: Custom Field Equals

In the IF part, enter `true` in the right box of the "Custom Field Equals" part.

![Row 5a](../../../static/img/docs/26d390ba-1542-4524-b9ff-7a420004cb73/image_18.png)

### Row 5b: Function: Script Log

![Row 5b](../../../static/img/docs/26d390ba-1542-4524-b9ff-7a420004cb73/image_11.png)

In the script log message, type `Force Reboot is approved on the endpoint via Reboot Scripts. Proceeding for reboot schedule without reboot window validation.` so that the script will send the results of the PowerShell script above to the output on the Automation tab for the target device.

![Row 5b Detail](../../../static/img/docs/26d390ba-1542-4524-b9ff-7a420004cb73/image_19.png)

### Row 5c: Function: PowerShell Script

![Row 5c](../../../static/img/docs/26d390ba-1542-4524-b9ff-7a420004cb73/image_9.png)

![Row 5c Detail](../../../static/img/docs/26d390ba-1542-4524-b9ff-7a420004cb73/image_20.png)

Paste in the following PowerShell script and set the expected time of script execution to **900 seconds**.

```powershell
function Restart-ComputerOnSchedule {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory)][string[]]$Days,
        [Parameter(Mandatory)][int]$Hour,
        [Parameter(Mandatory)][int]$Minute,
        [switch]$Test
    )
    if(-not [bool]$Days) {
        Write-Output "ERROR: No days specified to reboot."
        return
    }
    $INCORRECT_DAYS = $Days | Where-Object {$_ -notmatch "^(Sunday|Monday|Tuesday|Wednesday|Thursday|Friday|Saturday)$"}
    if([bool]$INCORRECT_DAYS) {
        Write-Output "ERROR: Specified days are incorrect: $($INCORRECT_DAYS -join ',')"
        return
    }
    if((0..23) -notcontains $Hour) {
        Write-Output "ERROR: Specified hour is incorrect: $Hour"
        return
    }
    if((0..59) -notcontains $Minute) {
        Write-Output "ERROR: Specified minute is incorrect: $Minute"
        return
    }
    $currentDate = Get-Date
    $rebootDate = $(Get-Date -Hour $Hour -Minute $Minute).AddDays(1)
    $failsafe = 0
    while($Days -notcontains $rebootDate.DayOfWeek) {
        if($failsafe -gt 7) {break}
        $rebootDate = $rebootDate.AddDays(1)
        $failsafe++
    }
    if($failsafe -gt 7) {
        Write-Output "ERROR: Something went wrong and the reboot date could not be determined."
        return
    }
    $rebootDelay = [Math]::Round($($rebootDate - $currentDate).TotalSeconds)
    $rebootComment = "Server is being rebooted automatically at: $($rebootDate.tostring())"
    $rebootArgs = @("/r", "/t", $rebootDelay, "/c", $rebootComment)
    if(-not $Test) {
        & shutdown /a 2>&1 | Out-Null
        & shutdown $rebootArgs 2>&1 | Out-Null
    }
    
    Write-Output "RebootDateTime=$($rebootDate.tostring('yyyy-MM-dd hh:mm:ss'))"
}

Restart-ComputerOnSchedule -Days (@DaysToReboot@) -Hour @HoursToReboot@ -Minute @MinutesToReboot@
```

### Row 5d: Function: Script Log

![Row 5d](../../../static/img/docs/26d390ba-1542-4524-b9ff-7a420004cb73/image_11.png)

In the script log message, simply type `%output%` so that the script will send the results of the PowerShell script above to the output on the Automation tab for the target device.

![Row 5d Detail](../../../static/img/docs/26d390ba-1542-4524-b9ff-7a420004cb73/image_12.png)

### Row 5e: Logic: If/Then

![Row 5e](../../../static/img/docs/26d390ba-1542-4524-b9ff-7a420004cb73/image_13.png)

### Row 5e.1: Condition: Output Does Not Contain

In the IF part, enter `RebootDateTime` in the right box of the "Output Does Not Contain" part.

![Row 5e.1](../../../static/img/docs/26d390ba-1542-4524-b9ff-7a420004cb73/image_21.png)

### Row 5e.2: Function: Script Exit

![Row 5e.2](../../../static/img/docs/26d390ba-1542-4524-b9ff-7a420004cb73/image_22.png)

In the script exit message, type `Reboot Schedule Failed with an error %output%.` so that the script will send the results of the PowerShell script above to the output on the Automation tab for the target device. This will end the task with failure.

![Row 5e.2 Detail](../../../static/img/docs/26d390ba-1542-4524-b9ff-7a420004cb73/image_23.png)

### Row 5f: Function: Script Log

![Row 5f](../../../static/img/docs/26d390ba-1542-4524-b9ff-7a420004cb73/image_11.png)

In the script log message, type `Reboot successfully scheduled on %output%.` so that the script will send the results of the PowerShell script above to the output on the Automation tab for the target device.

![Row 5f Detail](../../../static/img/docs/26d390ba-1542-4524-b9ff-7a420004cb73/image_24.png)

### Row 5g: Function: Script Exit

Add a new row by clicking on the Add Row button.

![Row 5g](../../../static/img/docs/26d390ba-1542-4524-b9ff-7a420004cb73/image_16.png)

In the script exit message, leave it blank.

![Row 5g Detail](../../../static/img/docs/26d390ba-1542-4524-b9ff-7a420004cb73/image_17.png)

### Row 6: Function: Set Pre-defined Variable

![Row 6](../../../static/img/docs/26d390ba-1542-4524-b9ff-7a420004cb73/image_25.png)

Select the custom field 'ServerRebootWindowStart' and set the variable 'RebootWindowStart'.

![Row 6 Detail](../../../static/img/docs/26d390ba-1542-4524-b9ff-7a420004cb73/image_26.png)

### Row 7: Function: Set Pre-defined Variable

![Row 7](../../../static/img/docs/26d390ba-1542-4524-b9ff-7a420004cb73/image_27.png)

Select the custom field 'ServerRebootWindowEnd' and set the variable 'RebootWindowEnd'.

![Row 7 Detail](../../../static/img/docs/26d390ba-1542-4524-b9ff-7a420004cb73/image_28.png)

### Row 8: Function: Set Pre-defined Variable

![Row 8](../../../static/img/docs/26d390ba-1542-4524-b9ff-7a420004cb73/image_29.png)

Select the custom field 'ServerRebootWindowDay' and set the variable 'RebootWindowDay'.

![Row 8 Detail](../../../static/img/docs/26d390ba-1542-4524-b9ff-7a420004cb73/image_30.png)

### Row 9: Logic: If/Then

![Row 9](../../../static/img/docs/26d390ba-1542-4524-b9ff-7a420004cb73/image_13.png)

### Row 9a: Condition: Custom Field Equals

In the IF part, enter `true` in the right box of the "Custom Field Equals" part.

![Row 9a](../../../static/img/docs/26d390ba-1542-4524-b9ff-7a420004cb73/image_31.png)

### Row 9b: Function: Script Log

![Row 9b](../../../static/img/docs/26d390ba-1542-4524-b9ff-7a420004cb73/image_11.png)

In the script log message, type `This endpoint has 'Exclude Reboot' flag checked. Exiting script without any action.` so that the script will send the results of the PowerShell script above to the output on the Automation tab for the target device.

![Row 9b Detail](../../../static/img/docs/26d390ba-1542-4524-b9ff-7a420004cb73/image_32.png)

### Row 9c: Function: Script Exit

Add a new row by clicking on the Add Row button.

![Row 9c](../../../static/img/docs/26d390ba-1542-4524-b9ff-7a420004cb73/image_16.png)

In the script exit message, leave it blank.

![Row 9c Detail](../../../static/img/docs/26d390ba-1542-4524-b9ff-7a420004cb73/image_17.png)

### Row 10: Function: Script Log

![Row 10](../../../static/img/docs/26d390ba-1542-4524-b9ff-7a420004cb73/image_11.png)

In the script log message, type `Verifying that machine is in approved window between @RebootWindowStart@ and @RebootWindowEnd@ (Note: 0=12:00 AM, 23=11:00 PM) and Day @RebootWindowDay@.` so that the script will send the results of the PowerShell script above to the output on the Automation tab for the target device.

![Row 10 Detail](../../../static/img/docs/26d390ba-1542-4524-b9ff-7a420004cb73/image_33.png)

### Row 11: Function: PowerShell Script

![Row 11](../../../static/img/docs/26d390ba-1542-4524-b9ff-7a420004cb73/image_9.png)

![Row 11 Detail](../../../static/img/docs/26d390ba-1542-4524-b9ff-7a420004cb73/image_34.png)

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
    } else {
        return 'Time is not in approved window'
    }
} else {
    return 'Day is not in approved window'
}
```

### Row 12: Function: Script Log

![Row 12](../../../static/img/docs/26d390ba-1542-4524-b9ff-7a420004cb73/image_11.png)

In the script log message, simply type `%output%` so that the script will send the results of the PowerShell script above to the output on the Automation tab for the target device.

![Row 12 Detail](../../../static/img/docs/26d390ba-1542-4524-b9ff-7a420004cb73/image_12.png)

### Row 13: Logic: If/Then

![Row 13](../../../static/img/docs/26d390ba-1542-4524-b9ff-7a420004cb73/image_13.png)

### Row 13a: Condition: Output Contains

In the IF part, enter `Machine is in reboot window` in the right box of the "Output Does Not Contain" part.

![Row 13a](../../../static/img/docs/26d390ba-1542-4524-b9ff-7a420004cb73/image_35.png)

### Row 13b: Function: Script Log

![Row 13b](../../../static/img/docs/26d390ba-1542-4524-b9ff-7a420004cb73/image_11.png)

In the script log message, type `Scheduling the reboot as the reboot schedule falls under the reboot window set on the company level.` so that the script will send the results of the PowerShell script above to the output on the Automation tab for the target device.

![Row 13b Detail](../../../static/img/docs/26d390ba-1542-4524-b9ff-7a420004cb73/image_36.png)

### Row 13c: Function: PowerShell Script

![Row 13c](../../../static/img/docs/26d390ba-1542-4524-b9ff-7a420004cb73/image_9.png)

![Row 13c Detail](../../../static/img/docs/26d390ba-1542-4524-b9ff-7a420004cb73/image_20.png)

Paste in the following PowerShell script and set the expected time of script execution to **900 seconds**.

```powershell
function Restart-ComputerOnSchedule {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory)][string[]]$Days,
        [Parameter(Mandatory)][int]$Hour,
        [Parameter(Mandatory)][int]$Minute,
        [switch]$Test
    )
    if(-not [bool]$Days) {
        Write-Output "ERROR: No days specified to reboot."
        return
    }
    $INCORRECT_DAYS = $Days | Where-Object {$_ -notmatch "^(Sunday|Monday|Tuesday|Wednesday|Thursday|Friday|Saturday)$"}
    if([bool]$INCORRECT_DAYS) {
        Write-Output "ERROR: Specified days are incorrect: $($INCORRECT_DAYS -join ',')"
        return
    }
    if((0..23) -notcontains $Hour) {
        Write-Output "ERROR: Specified hour is incorrect: $Hour"
        return
    }
    if((0..59) -notcontains $Minute) {
        Write-Output "ERROR: Specified minute is incorrect: $Minute"
        return
    }
    $currentDate = Get-Date
    $rebootDate = $(Get-Date -Hour $Hour -Minute $Minute).AddDays(1)
    $failsafe = 0
    while($Days -notcontains $rebootDate.DayOfWeek) {
        if($failsafe -gt 7) {break}
        $rebootDate = $rebootDate.AddDays(1)
        $failsafe++
    }
    if($failsafe -gt 7) {
        Write-Output "ERROR: Something went wrong and the reboot date could not be determined."
        return
    }
    $rebootDelay = [Math]::Round($($rebootDate - $currentDate).TotalSeconds)
    $rebootComment = "Server is being rebooted automatically at: $($rebootDate.tostring())"
    $rebootArgs = @("/r", "/t", $rebootDelay, "/c", $rebootComment)
    if(-not $Test) {
        & shutdown /a 2>&1 | Out-Null
        & shutdown $rebootArgs 2>&1 | Out-Null
    }
    
    Write-Output "RebootDateTime=$($rebootDate.tostring('yyyy-MM-dd hh:mm:ss'))"
}

Restart-ComputerOnSchedule -Days (@DaysToReboot@) -Hour @HoursToReboot@ -Minute @MinutesToReboot@
```

### Row 13d: Function: Script Log

![Row 13d](../../../static/img/docs/26d390ba-1542-4524-b9ff-7a420004cb73/image_11.png)

In the script log message, simply type `%output%` so that the script will send the results of the PowerShell script above to the output on the Automation tab for the target device.

![Row 13d Detail](../../../static/img/docs/26d390ba-1542-4524-b9ff-7a420004cb73/image_12.png)

### Row 13e: Function: Script Log

![Row 13e](../../../static/img/docs/26d390ba-1542-4524-b9ff-7a420004cb73/image_13.png)

![Row 13e Detail](../../../static/img/docs/26d390ba-1542-4524-b9ff-7a420004cb73/image_37.png)

### Row 13e.1: Condition: Output Contains

In the IF part, enter `RebootDateTime` in the right box of the "Output Contains" part.

![Row 13e.1](../../../static/img/docs/26d390ba-1542-4524-b9ff-7a420004cb73/image_38.png)

### Row 13e.2: Function: Script Log

![Row 13e.2](../../../static/img/docs/26d390ba-1542-4524-b9ff-7a420004cb73/image_11.png)

In the script log message, type `Reboot successfully scheduled on %output%.` so that the script will send the results of the PowerShell script above to the output on the Automation tab for the target device.

![Row 13e.2 Detail](../../../static/img/docs/26d390ba-1542-4524-b9ff-7a420004cb73/image_24.png)

### Row 13e.3: Function: Script Exit

Add a new row by clicking on the Add Row button.

![Row 13e.3](../../../static/img/docs/26d390ba-1542-4524-b9ff-7a420004cb73/image_16.png)

In the script exit message, leave it blank.

![Row 13e.3 Detail](../../../static/img/docs/26d390ba-1542-4524-b9ff-7a420004cb73/image_17.png)

### Row 13f: Function: Script Exit

![Row 13f](../../../static/img/docs/26d390ba-1542-4524-b9ff-7a420004cb73/image_22.png)

In the script exit message, type `Reboot Schedule Failed with an error %output%.` so that the script will send the results of the PowerShell script above to the output on the Automation tab for the target device. This will end the task with failure.

![Row 13f Detail](../../../static/img/docs/26d390ba-1542-4524-b9ff-7a420004cb73/image_23.png)

### Row 14: Complete

![Row 14](../../../static/img/docs/26d390ba-1542-4524-b9ff-7a420004cb73/image_39.png)

![Row 14 Detail 1](../../../static/img/docs/26d390ba-1542-4524-b9ff-7a420004cb73/image_40.png)

![Row 14 Detail 2](../../../static/img/docs/26d390ba-1542-4524-b9ff-7a420004cb73/image_41.png)

![Row 14 Detail 3](../../../static/img/docs/26d390ba-1542-4524-b9ff-7a420004cb73/image_42.png)

## Deployment

This task can be run manually or in a group. It will only reboot endpoints if the reboot falls under the reboot window provided in the company-level custom fields.

[CW RMM - Custom Fields - Reboot Trigger/Schedule](/docs/c0aece55-4e18-4914-9e43-965c8c9e23a6)

- Go to `Automation` > `Tasks`.
- Search for `Server Reboot Schedule on Specific Days` task.
- Select the concerned task.
- Click on the `Schedule` button to schedule the task/script.

![Schedule Task](../../../static/img/docs/26d390ba-1542-4524-b9ff-7a420004cb73/image_5.png)

This screen will appear.

![Schedule Task Screen](../../../static/img/docs/26d390ba-1542-4524-b9ff-7a420004cb73/image_43.png)

- Select the relevant time to run the script and click the 'Does not repeat' button.

![Select Time](../../../static/img/docs/26d390ba-1542-4524-b9ff-7a420004cb73/image_44.png)

![Select Time Detail](../../../static/img/docs/26d390ba-1542-4524-b9ff-7a420004cb73/image_45.png)

- Select the target to schedule the 'Server Reboot Schedule on Specific Days'.

For example:

![Select Target](../../../static/img/docs/26d390ba-1542-4524-b9ff-7a420004cb73/image_46.png)

- Now click the `Run` button once all customization is set to initiate the task.

![Run Task](../../../static/img/docs/26d390ba-1542-4524-b9ff-7a420004cb73/image_47.png)

- The task will start appearing in the Scheduled Tasks.

