---
id: 'f5a58819-dcc7-4905-a3b5-52ff73751e21'
slug: /f5a58819-dcc7-4905-a3b5-52ff73751e21
title: 'Detect SMB1'
title_meta: 'Detect SMB1'
keywords: ['smb1', 'windows', 'custom', 'field', 'script', 'task']
description: 'This document outlines a task to detect if SMB1 is enabled on Windows machines. It saves the output to a custom field in ConnectWise RMM, allowing for easy identification of machines with SMB1 enabled. The implementation details include creating a script, logging output, and scheduling the task for regular checks.'
tags: ['windows']
draft: false
unlisted: false
---

## Summary

This task detects if SMB1 is enabled on the machine and saves its output to the [CW RMM - Custom Field - SMB1 Enabled](/docs/67da04f5-4170-402a-93b3-7e6236937263) custom field, which can be used to display information about the machines with SMB1 enabled.

## Sample Run

![Sample Run Image 1](../../../static/img/Detect-SMB1/image_1.png)

![Sample Run Image 2](../../../static/img/Detect-SMB1/image_2.png)

## Implementation

### Create Script

Create a new "Script Editor" style script in the system to implement this task.

![Create Script Image 1](../../../static/img/Detect-SMB1/image_3.png)

![Create Script Image 2](../../../static/img/Detect-SMB1/image_4.png)

**Name:** Detect SMB1  
**Description:** This task determines if SMB1 is enabled on the machine and saves its output to the "SMB1 Enabled" custom field  
**Category:** Custom  

![Script Image](../../../static/img/Detect-SMB1/image_5.png)

Start by making three separate rows. You can do this by clicking the "Add Row" button at the bottom of the script page.

![Add Row Image](../../../static/img/Detect-SMB1/image_6.png)

### Row 1 Function: PowerShell Script

![PowerShell Script Image 1](../../../static/img/Detect-SMB1/image_7.png)

![PowerShell Script Image 2](../../../static/img/Detect-SMB1/image_8.png)

Paste in the following PowerShell script and set the expected time of script execution to `300` seconds.

```
$ErroractionPreference= 'SilentlyContinue';  
$ver = [Version](get-WmiObject -Class Win32_OperatingSystem).version; 
"$($ver.Major).$($ver.Minor)"; 
if($ver -ge [version]'6.3') {
    if ( ( (Get-SmbServerConfiguration).EnableSMB1Protocol )  -ne 'True') {
        return 'False'
    } else {
        return 'True'
    } 
} else { 
    $s =  (Get-Item HKLM:\\SYSTEM\\CurrentControlSet\\Services\\LanmanServer\\Parameters | ForEach-Object {Get-ItemProperty $_.pspath -Name SMB1} );  
    if ( ( -not $s ) -or ( $s -contains 1 )) {
        return 'True' 
    } else {
        return 'False' 
    } 
}
```

![PowerShell Script Image 3](../../../static/img/Detect-SMB1/image_9.png)

Save and move to the next row.

### Row 2 Function: Script Log

![Script Log Image](../../../static/img/Detect-SMB1/image_10.png)

In the script log message, simply type `Output:%output%` so that the script will send the results of the PowerShell script above to the output on the Automation tab for the target device.

![Script Log Image 2](../../../static/img/Detect-SMB1/image_11.png)

### Row 3 Logic: If/Then/Else

![If Then Else Logic Image](../../../static/img/Detect-SMB1/image_12.png)

There will be two sections: If part and Else part.

![If Then Else Logic Image 2](../../../static/img/Detect-SMB1/image_13.png)

#### Row 3a Condition: Output Contains

In the IF part, enter `True` in the right box of the "Output Contains" part.

![Output Contains Image](../../../static/img/Detect-SMB1/image_14.png)

#### Row 3b Function: Set Custom Field

Add a new row by clicking on the Add row button.

Select the function 'Set Custom Field'. When you select `Set Custom Field`, it will open up a new window.

In this window, search for the `SMB1 Enabled` field.

**Custom Field:** `SMB1 Enabled`  
**Value:** True  

![Set Custom Field Image](../../../static/img/Detect-SMB1/image_15.png)

#### Row 3c Function: Set Custom Field

Add a new row by clicking on the Add row button in the ELSE part and select the 'Set Custom Field' function again.

In this one, set Custom Field and Value as shown below.

![Set Custom Field Image 2](../../../static/img/Detect-SMB1/image_16.png)

Once all items are added, please save the task. The final task should look like the screenshot below.

![Final Task Screenshot](../../../static/img/Detect-SMB1/image_17.png)

## Deployment

It is suggested to run the task once per week against Windows computers.

- Go to `Automation` > `Tasks`.
- Search for the `Detect SMB1` task.
- Select the concerned task.
- Click on the `Schedule` button to schedule the task/script.

This screen will appear.

![Schedule Task Image](../../../static/img/Detect-SMB1/image_18.png)

Select the relevant time to run the script and click the "Does not repeat" button.

![Schedule Time Image](../../../static/img/Detect-SMB1/image_19.png)

A pop-up box will appear.

Change the number of days to `7` and click `OK`.

![Change Days Image 1](../../../static/img/Detect-SMB1/image_20.png)

![Change Days Image 2](../../../static/img/Detect-SMB1/image_21.png)

Search for `Windows agents` in the `Resources*` and select it. You can search and select any relevant group you would like to schedule the task against. If the client doesn't have a device group that includes all Windows agents, then create one and schedule the task on it.

![Select Windows Agents Image](../../../static/img/Detect-SMB1/image_22.png)

Now click the `Run` button to initiate the task.

![Run Task Image](../../../static/img/Detect-SMB1/image_23.png)

The task will start appearing in the Scheduled Tasks.

## Output

- Script log
- Custom field - [CW RMM - Custom Field - SMB1 Enabled](/docs/67da04f5-4170-402a-93b3-7e6236937263)


