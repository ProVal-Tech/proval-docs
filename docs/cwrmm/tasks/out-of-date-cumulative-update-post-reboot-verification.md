---
id: '34205607-a9c5-463b-9a45-9f7ac02c0d71'
slug: /34205607-a9c5-463b-9a45-9f7ac02c0d71
title: 'Out of Date Cumulative Update (Post Reboot Verification)'
title_meta: 'Out of Date Cumulative Update (Post Reboot Verification)'
keywords: ['cumulative', 'update', 'verification', 'reboot', 'task']
description: 'This document outlines a task to validate whether the Cumulative Update installed by the Out of Date Cumulative Update (Autofix) task succeeded after a reboot. It includes sample runs, dependencies, variable definitions, task creation steps, and deployment instructions.'
tags: ['deployment']
draft: false
unlisted: false
---

## Summary

This task validates whether the Cumulative Update installed by the Out of Date Cumulative Update (Autofix) task succeeded post-reboot.

## Sample Run

![Sample Run 1](../../../static/img/docs/34205607-a9c5-463b-9a45-9f7ac02c0d71/image_1.webp)  
![Sample Run 2](../../../static/img/docs/34205607-a9c5-463b-9a45-9f7ac02c0d71/image_2.webp)  

## Dependencies

- [Custom Field - EndPoint - Out_of_Date_CU_Autofix_Result](/docs/2d24daab-16cb-4b2d-b7e6-0e757b4f2523)
- [Custom Field - EndPoint - Out_of_Date_CU_Autofix_Date](/docs/044210c4-14ae-4996-ab9f-009290bf05e4)
- [Device Group - Out of Date CU _ Reboot Pending](/docs/87d623c4-d8e2-4c25-b838-f9c0dee5043d)
- [Task - Out of Date Cumulative Update (Autofix)](/docs/5170978d-feb6-455c-8806-20224e27d923)

## Variables

| Name         | Description                                                                                                                                                        |
|--------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| TaskRunTime  | Value stored in the [EndPoint - Out_of_Date_CU_Autofix_Date](/docs/044210c4-14ae-4996-ab9f-009290bf05e4) Custom Field.                                  |
| Output       | Output of the previously executed PowerShell script.                                                                                                            |

## Task Creation

Create a new `Script Editor` style script in the system to implement this Task.  
![Create Script](../../../static/img/docs/34205607-a9c5-463b-9a45-9f7ac02c0d71/image_3.webp)  
![Create Script 2](../../../static/img/docs/34205607-a9c5-463b-9a45-9f7ac02c0d71/image_4.webp)  

**Name:** Out of Date Cumulative Update (Post Reboot Verification)  
**Description:** This task validates whether the Cumulative Update installed by the Out of Date Cumulative Update (Autofix) task succeeded post-reboot.  
**Category:** Patching  
![Task Category](../../../static/img/docs/34205607-a9c5-463b-9a45-9f7ac02c0d71/image_5.webp)  

## Task

Navigate to the Script Editor section and start by adding a row. You can do this by clicking the `Add Row` button at the bottom of the script page.  
![Add Row](../../../static/img/docs/34205607-a9c5-463b-9a45-9f7ac02c0d71/image_6.webp)  

A blank function will appear.  
![Blank Function](../../../static/img/docs/34205607-a9c5-463b-9a45-9f7ac02c0d71/image_7.webp)  

### Row 1 Function: Set Pre-defined Variable

Search and select the `Set Pre-defined Variable` function.  
![Set Pre-defined Variable 1](../../../static/img/docs/34205607-a9c5-463b-9a45-9f7ac02c0d71/image_8.webp)  
![Set Pre-defined Variable 2](../../../static/img/docs/34205607-a9c5-463b-9a45-9f7ac02c0d71/image_9.webp)  

The following function will pop up on the screen:  
![Set Pre-defined Variable Function](../../../static/img/docs/34205607-a9c5-463b-9a45-9f7ac02c0d71/image_10.webp)  

- Type `TaskRunTime` in the `Variable Name` field.
- Select the `Custom Field` radio button.
- Search and select the company-level `Out_of_Date_CU_Autofix_Date` custom field in the `Search Custom Field` field.
- Click the `Save` button to save the changes.  
![Save Changes 1](../../../static/img/docs/34205607-a9c5-463b-9a45-9f7ac02c0d71/image_11.webp)  
![Save Changes 2](../../../static/img/docs/34205607-a9c5-463b-9a45-9f7ac02c0d71/image_12.webp)  

### Row 2 Function: PowerShell Script

Add a new row by clicking on the `Add Row` button.  
![Add Row](../../../static/img/docs/34205607-a9c5-463b-9a45-9f7ac02c0d71/image_13.webp)  

A blank function will appear.  
![Blank Function](../../../static/img/docs/34205607-a9c5-463b-9a45-9f7ac02c0d71/image_7.webp)  

Search and select the `PowerShell Script` function.  
![PowerShell Script 1](../../../static/img/docs/34205607-a9c5-463b-9a45-9f7ac02c0d71/image_14.webp)  
![PowerShell Script 2](../../../static/img/docs/34205607-a9c5-463b-9a45-9f7ac02c0d71/image_15.webp)  

The following function will pop up on the screen:  
![PowerShell Script Function](../../../static/img/docs/34205607-a9c5-463b-9a45-9f7ac02c0d71/image_16.webp)  

Paste in the following PowerShell script and leave the expected time of script execution to `300` seconds. Click the `Save` button.  

```powershell
$TaskRunTime = '@TaskRunTime@'
if ( $TaskRunTime -eq '0001-01-01 00:00:00' ) {
    return 'Exit'
} else {
    $Uptime = ( systeminfo | Find 'System Boot Time' )
    if ( $Uptime -match '([0-9]{1,2}\/[0-9]{1,2}\/[0-9]{4}, [0-9]{1,2}:[0-9]{1,2}:[0-9]{1,2})' ) {
        $uptime = $Matches[1]
    }
    $uptime = $uptime -replace '\/', '-' -replace ',', ''
    if ( [DateTime]$uptime -ge [DateTime]$TaskRunTime ) {
        return 'Rebooted'
    } else {
        return 'Still Pending'
    }
}
```
![PowerShell Script Example](../../../static/img/docs/34205607-a9c5-463b-9a45-9f7ac02c0d71/image_17.webp)  

### Row 3 Logic: If/Then/Else

![If/Then/Else Logic](../../../static/img/docs/34205607-a9c5-463b-9a45-9f7ac02c0d71/image_18.webp)  
![If/Then/Else Logic 2](../../../static/img/docs/34205607-a9c5-463b-9a45-9f7ac02c0d71/image_19.webp)  

#### Row 3a Condition: Output Does Not Contain

Change the comparator to `Does Not Contain`.  
![Output Does Not Contain](../../../static/img/docs/34205607-a9c5-463b-9a45-9f7ac02c0d71/image_20.webp)  

Type `Rebooted` in the `Input Value or Variable` field and press `Enter`.  
![Input Value](../../../static/img/docs/34205607-a9c5-463b-9a45-9f7ac02c0d71/image_21.webp)  

#### Row 3b Function: Script Log

Add a new row by clicking the `Add Row` button inside the `If` section.  
![Add Row in If](../../../static/img/docs/34205607-a9c5-463b-9a45-9f7ac02c0d71/image_22.webp)  

A blank function will appear.  
![Blank Function](../../../static/img/docs/34205607-a9c5-463b-9a45-9f7ac02c0d71/image_23.webp)  

Search and select the `Script Log` function in the newly appeared row.  
![Script Log 1](../../../static/img/docs/34205607-a9c5-463b-9a45-9f7ac02c0d71/image_24.webp)  
![Script Log 2](../../../static/img/docs/34205607-a9c5-463b-9a45-9f7ac02c0d71/image_25.webp)  

The following function will pop up on the screen:  
![Script Log Function](../../../static/img/docs/34205607-a9c5-463b-9a45-9f7ac02c0d71/image_26.webp)  

Type `Still reboot pending` in the `Script Log Message` field and click the `Save` button.  
![Save Script Log](../../../static/img/docs/34205607-a9c5-463b-9a45-9f7ac02c0d71/image_27.webp)  

#### Row 3c Function: Script Exit

Click the `Add Row` button inside the `If` section.  
![Add Row in If](../../../static/img/docs/34205607-a9c5-463b-9a45-9f7ac02c0d71/image_22.webp)  
![Add Row in If 2](../../../static/img/docs/34205607-a9c5-463b-9a45-9f7ac02c0d71/image_23.webp)  

Search and select the `Script Exit` function in the newly appeared row.  
![Script Exit 1](../../../static/img/docs/34205607-a9c5-463b-9a45-9f7ac02c0d71/image_28.webp)  
![Script Exit 2](../../../static/img/docs/34205607-a9c5-463b-9a45-9f7ac02c0d71/image_29.webp)  

The following function will pop up on the screen:  
![Script Exit Function](../../../static/img/docs/34205607-a9c5-463b-9a45-9f7ac02c0d71/image_30.webp)  

Click the `Save` button without typing anything in the `Error Message` field.  
![Save Script Exit](../../../static/img/docs/34205607-a9c5-463b-9a45-9f7ac02c0d71/image_31.webp)  

#### Row 3d Script: Cumulative Update Audit

Click the `Add Row` button in the `Else` section.  
![Add Row in Else](../../../static/img/docs/34205607-a9c5-463b-9a45-9f7ac02c0d71/image_32.webp)  
![Add Row in Else 2](../../../static/img/docs/34205607-a9c5-463b-9a45-9f7ac02c0d71/image_33.webp)  

Change the `Function` to `Script` from the dropdown.  
![Change Function to Script](../../../static/img/docs/34205607-a9c5-463b-9a45-9f7ac02c0d71/image_34.webp)  

Search and select the `Cumulative Update Audit` script.  
![Cumulative Update Audit 1](../../../static/img/docs/34205607-a9c5-463b-9a45-9f7ac02c0d71/image_35.webp)  
![Cumulative Update Audit 2](../../../static/img/docs/34205607-a9c5-463b-9a45-9f7ac02c0d71/image_36.webp)  

### Row 3e Logic: If/Then/Else

Add a new `If/Then/Else` logic inside the `Else` section.  
![If/Then/Else Logic](../../../static/img/docs/34205607-a9c5-463b-9a45-9f7ac02c0d71/image_37.webp)  
![If/Then/Else Logic 2](../../../static/img/docs/34205607-a9c5-463b-9a45-9f7ac02c0d71/image_38.webp)  

#### Row 3e(i) Condition: Custom Field Contains

Select the `Custom Field` from the dropdown menu.  
![Custom Field Dropdown](../../../static/img/docs/34205607-a9c5-463b-9a45-9f7ac02c0d71/image_39.webp)  
![Custom Field Selection](../../../static/img/docs/34205607-a9c5-463b-9a45-9f7ac02c0d71/image_40.webp)  

Search and select the `Latest Cumulative Update` custom field and type `Failed` in the comparator and press `Enter`.  
![Latest Cumulative Update Condition](../../../static/img/docs/34205607-a9c5-463b-9a45-9f7ac02c0d71/image_41.webp)  

#### Row 3e(ii) Function: Set Custom Field

Add a new row by clicking the `Add Row` button inside the `If` section.  
![Add Row in If](../../../static/img/docs/34205607-a9c5-463b-9a45-9f7ac02c0d71/image_22.webp)  
![Add Row in If 2](../../../static/img/docs/34205607-a9c5-463b-9a45-9f7ac02c0d71/image_23.webp)  

Search and select the `Set Custom Field` function.  
![Set Custom Field 1](../../../static/img/docs/34205607-a9c5-463b-9a45-9f7ac02c0d71/image_42.webp)  
![Set Custom Field 2](../../../static/img/docs/34205607-a9c5-463b-9a45-9f7ac02c0d71/image_43.webp)  

Search and select `Out_of_Date_CU_Autofix_Result` in the `Search Custom Field` field and set `Failed` in the `Value` field and click the `Save` button.  
![Set Custom Field Example 1](../../../static/img/docs/34205607-a9c5-463b-9a45-9f7ac02c0d71/image_44.webp)  
![Set Custom Field Example 2](../../../static/img/docs/34205607-a9c5-463b-9a45-9f7ac02c0d71/image_45.webp)  

#### Row 3e(iii) Function: Script Exit

Click the `Add Row` button inside the `If/Then` logic.  
![Add Row in If/Then](../../../static/img/docs/34205607-a9c5-463b-9a45-9f7ac02c0d71/image_22.webp)  
![Add Row in If/Then 2](../../../static/img/docs/34205607-a9c5-463b-9a45-9f7ac02c0d71/image_23.webp)  

Search and select the `Script Exit` function in the newly appeared row.  
![Script Exit 1](../../../static/img/docs/34205607-a9c5-463b-9a45-9f7ac02c0d71/image_28.webp)  
![Script Exit 2](../../../static/img/docs/34205607-a9c5-463b-9a45-9f7ac02c0d71/image_29.webp)  

The following function will pop up on the screen:  
![Script Exit Function](../../../static/img/docs/34205607-a9c5-463b-9a45-9f7ac02c0d71/image_30.webp)  

Paste the following lines in the `Error Message` field and click the `Save` button.  
`Cumulative Update Failed to install after restarting the computer as well.`  
![Save Error Message](../../../static/img/docs/34205607-a9c5-463b-9a45-9f7ac02c0d71/image_46.webp)  

#### Row 3e(iv) Function: Set Custom Field

Add a new row by clicking the `Add Row` button inside the `Else` section.  
![Add Row in Else](../../../static/img/docs/34205607-a9c5-463b-9a45-9f7ac02c0d71/image_22.webp)  
![Add Row in Else 2](../../../static/img/docs/34205607-a9c5-463b-9a45-9f7ac02c0d71/image_23.webp)  

Search and select the `Set Custom Field` function.  
![Set Custom Field 1](../../../static/img/docs/34205607-a9c5-463b-9a45-9f7ac02c0d71/image_42.webp)  
![Set Custom Field 2](../../../static/img/docs/34205607-a9c5-463b-9a45-9f7ac02c0d71/image_43.webp)  

Search and select `Out_of_Date_CU_Autofix_Result` in the `Search Custom Field` field and set `Installed` in the `Value` field and click the `Save` button.  
![Set Custom Field Example 1](../../../static/img/docs/34205607-a9c5-463b-9a45-9f7ac02c0d71/image_47.webp)  
![Set Custom Field Example 2](../../../static/img/docs/34205607-a9c5-463b-9a45-9f7ac02c0d71/image_48.webp)  

#### Row 3e(v) Function: Set Custom Field

Add a new row by clicking the `Add Row` button inside the `Else` section.  
![Add Row in Else](../../../static/img/docs/34205607-a9c5-463b-9a45-9f7ac02c0d71/image_22.webp)  
![Add Row in Else 2](../../../static/img/docs/34205607-a9c5-463b-9a45-9f7ac02c0d71/image_23.webp)  

Search and select the `Set Custom Field` function.  
![Set Custom Field 1](../../../static/img/docs/34205607-a9c5-463b-9a45-9f7ac02c0d71/image_42.webp)  
![Set Custom Field 2](../../../static/img/docs/34205607-a9c5-463b-9a45-9f7ac02c0d71/image_43.webp)  

Search and select `Out_of_Date_CU_Autofix_Date` in the `Search Custom Field` field and set `0001-01-01 00:00:00` in the `Value` field and click the `Save` button.  
![Set Custom Field Example 1](../../../static/img/docs/34205607-a9c5-463b-9a45-9f7ac02c0d71/image_49.webp)  
![Set Custom Field Example 2](../../../static/img/docs/34205607-a9c5-463b-9a45-9f7ac02c0d71/image_50.webp)  

Click the `Save` button at the top-right corner of the screen to save the script.  
![Save Script](../../../static/img/docs/34205607-a9c5-463b-9a45-9f7ac02c0d71/image_51.webp)  

## Completed Script

![Completed Script 1](../../../static/img/docs/34205607-a9c5-463b-9a45-9f7ac02c0d71/image_52.webp)  
![Completed Script 2](../../../static/img/docs/34205607-a9c5-463b-9a45-9f7ac02c0d71/image_53.webp)  

## Deployment

It is suggested to run the task once per day against the [Out of Date CU _ Reboot Pending](/docs/87d623c4-d8e2-4c25-b838-f9c0dee5043d) device group.

- Go to `Automation` > `Tasks.`
- Search for `Out of Date Cumulative Update (Post Reboot Verification)` task.
- Select the concerned task.
- Click on the `Schedule` button to schedule the task.  
![Schedule Task](../../../static/img/docs/34205607-a9c5-463b-9a45-9f7ac02c0d71/image_54.webp)  

This screen will appear.  
![Schedule Screen](../../../static/img/docs/34205607-a9c5-463b-9a45-9f7ac02c0d71/image_55.webp)  

Click the `Does not repeat` button.  
![Does Not Repeat](../../../static/img/docs/34205607-a9c5-463b-9a45-9f7ac02c0d71/image_56.webp)  

This pop-up box will appear.  
![Pop-up Box](../../../static/img/docs/34205607-a9c5-463b-9a45-9f7ac02c0d71/image_57.webp)  

Click the `OK` button without making any changes to set it to run once per day.  
![OK Button](../../../static/img/docs/34205607-a9c5-463b-9a45-9f7ac02c0d71/image_58.webp)  

Recurrence will be updated to `Every Day`.  
![Every Day](../../../static/img/docs/34205607-a9c5-463b-9a45-9f7ac02c0d71/image_59.webp)  

Select the `Device Groups` option in the `Targeted Resources` section.  
![Targeted Resources](../../../static/img/docs/34205607-a9c5-463b-9a45-9f7ac02c0d71/image_54.webp)  

Search and select the [Out of Date CU _ Reboot Pending](/docs/87d623c4-d8e2-4c25-b838-f9c0dee5043d) device group.  
![Device Group Selection](../../../static/img/docs/34205607-a9c5-463b-9a45-9f7ac02c0d71/image_60.webp)  

Now click the `Run` button to initiate the task.  
![Run Task](../../../static/img/docs/34205607-a9c5-463b-9a45-9f7ac02c0d71/image_61.webp)  

The task will start appearing in the Scheduled Tasks.  
![Scheduled Tasks 1](../../../static/img/docs/34205607-a9c5-463b-9a45-9f7ac02c0d71/image_62.webp)  
![Scheduled Tasks 2](../../../static/img/docs/34205607-a9c5-463b-9a45-9f7ac02c0d71/image_63.webp)  

## Output

- Script Log
- Custom Field