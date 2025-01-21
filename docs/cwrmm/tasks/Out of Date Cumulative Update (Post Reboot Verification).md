---
id: '34205607-a9c5-463b-9a45-9f7ac02c0d71'
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

![Sample Run 1](../../../static/img/Out-of-Date-Cumulative-Update-(Post-Reboot-Verification)/image_1.png)  
![Sample Run 2](../../../static/img/Out-of-Date-Cumulative-Update-(Post-Reboot-Verification)/image_2.png)  

## Dependencies

- [CW RMM - Custom Field - EndPoint - Out_of_Date_CU_Autofix_Result](<../custom-fields/EndPoint - Out_of_Date_CU_Autofix_Result.md>)
- [CW RMM - Custom Field - EndPoint - Out_of_Date_CU_Autofix_Date](<../custom-fields/EndPoint - Out_of_Date_CU_Autofix_Date.md>)
- [CW RMM - Device Group - Out of Date CU _ Reboot Pending](<../groups/Out of Date CU _ Reboot Pending.md>)
- [CW RMM - Task - Out of Date Cumulative Update (Autofix)](<./Out of Date Cumulative Update (Autofix).md>)

## Variables

| Name         | Description                                                                                                                                                        |
|--------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| TaskRunTime  | Value stored in the [EndPoint - Out_of_Date_CU_Autofix_Date](<../custom-fields/EndPoint - Out_of_Date_CU_Autofix_Date.md>) Custom Field.                                  |
| Output       | Output of the previously executed PowerShell script.                                                                                                            |

## Task Creation

Create a new `Script Editor` style script in the system to implement this Task.  
![Create Script](../../../static/img/Out-of-Date-Cumulative-Update-(Post-Reboot-Verification)/image_3.png)  
![Create Script 2](../../../static/img/Out-of-Date-Cumulative-Update-(Post-Reboot-Verification)/image_4.png)  

**Name:** Out of Date Cumulative Update (Post Reboot Verification)  
**Description:** This task validates whether the Cumulative Update installed by the Out of Date Cumulative Update (Autofix) task succeeded post-reboot.  
**Category:** Patching  
![Task Category](../../../static/img/Out-of-Date-Cumulative-Update-(Post-Reboot-Verification)/image_5.png)  

## Task

Navigate to the Script Editor section and start by adding a row. You can do this by clicking the `Add Row` button at the bottom of the script page.  
![Add Row](../../../static/img/Out-of-Date-Cumulative-Update-(Post-Reboot-Verification)/image_6.png)  

A blank function will appear.  
![Blank Function](../../../static/img/Out-of-Date-Cumulative-Update-(Post-Reboot-Verification)/image_7.png)  

### Row 1 Function: Set Pre-defined Variable

Search and select the `Set Pre-defined Variable` function.  
![Set Pre-defined Variable 1](../../../static/img/Out-of-Date-Cumulative-Update-(Post-Reboot-Verification)/image_8.png)  
![Set Pre-defined Variable 2](../../../static/img/Out-of-Date-Cumulative-Update-(Post-Reboot-Verification)/image_9.png)  

The following function will pop up on the screen:  
![Set Pre-defined Variable Function](../../../static/img/Out-of-Date-Cumulative-Update-(Post-Reboot-Verification)/image_10.png)  

- Type `TaskRunTime` in the `Variable Name` field.
- Select the `Custom Field` radio button.
- Search and select the company-level `Out_of_Date_CU_Autofix_Date` custom field in the `Search Custom Field` field.
- Click the `Save` button to save the changes.  
![Save Changes 1](../../../static/img/Out-of-Date-Cumulative-Update-(Post-Reboot-Verification)/image_11.png)  
![Save Changes 2](../../../static/img/Out-of-Date-Cumulative-Update-(Post-Reboot-Verification)/image_12.png)  

### Row 2 Function: PowerShell Script

Add a new row by clicking on the `Add Row` button.  
![Add Row](../../../static/img/Out-of-Date-Cumulative-Update-(Post-Reboot-Verification)/image_13.png)  

A blank function will appear.  
![Blank Function](../../../static/img/Out-of-Date-Cumulative-Update-(Post-Reboot-Verification)/image_7.png)  

Search and select the `PowerShell Script` function.  
![PowerShell Script 1](../../../static/img/Out-of-Date-Cumulative-Update-(Post-Reboot-Verification)/image_14.png)  
![PowerShell Script 2](../../../static/img/Out-of-Date-Cumulative-Update-(Post-Reboot-Verification)/image_15.png)  

The following function will pop up on the screen:  
![PowerShell Script Function](../../../static/img/Out-of-Date-Cumulative-Update-(Post-Reboot-Verification)/image_16.png)  

Paste in the following PowerShell script and leave the expected time of script execution to `300` seconds. Click the `Save` button.  

```powershell
$TaskRunTime = '@TaskRunTime@'
if ( $TaskRunTime -eq '0001-01-01 00:00:00' ) {
    return 'Exit'
} else {
    $Uptime = ( systeminfo | Find 'System Boot Time' )
    if ( $Uptime -match '([0-9]{1,2}///[0-9]{1,2}///[0-9]{4}, [0-9]{1,2}:[0-9]{1,2}:[0-9]{1,2})' ) {
        $uptime = $Matches[1]
    }
    $uptime = $uptime -replace '///', '-' -replace ',', ''
    if ( [DateTime]$uptime -ge [DateTime]$TaskRunTime ) {
        return 'Rebooted'
    } else {
        return 'Still Pending'
    }
}
```
![PowerShell Script Example](../../../static/img/Out-of-Date-Cumulative-Update-(Post-Reboot-Verification)/image_17.png)  

### Row 3 Logic: If/Then/Else

![If/Then/Else Logic](../../../static/img/Out-of-Date-Cumulative-Update-(Post-Reboot-Verification)/image_18.png)  
![If/Then/Else Logic 2](../../../static/img/Out-of-Date-Cumulative-Update-(Post-Reboot-Verification)/image_19.png)  

#### Row 3a Condition: Output Does Not Contain

Change the comparator to `Does Not Contain`.  
![Output Does Not Contain](../../../static/img/Out-of-Date-Cumulative-Update-(Post-Reboot-Verification)/image_20.png)  

Type `Rebooted` in the `Input Value or Variable` field and press `Enter`.  
![Input Value](../../../static/img/Out-of-Date-Cumulative-Update-(Post-Reboot-Verification)/image_21.png)  

#### Row 3b Function: Script Log

Add a new row by clicking the `Add Row` button inside the `If` section.  
![Add Row in If](../../../static/img/Out-of-Date-Cumulative-Update-(Post-Reboot-Verification)/image_22.png)  

A blank function will appear.  
![Blank Function](../../../static/img/Out-of-Date-Cumulative-Update-(Post-Reboot-Verification)/image_23.png)  

Search and select the `Script Log` function in the newly appeared row.  
![Script Log 1](../../../static/img/Out-of-Date-Cumulative-Update-(Post-Reboot-Verification)/image_24.png)  
![Script Log 2](../../../static/img/Out-of-Date-Cumulative-Update-(Post-Reboot-Verification)/image_25.png)  

The following function will pop up on the screen:  
![Script Log Function](../../../static/img/Out-of-Date-Cumulative-Update-(Post-Reboot-Verification)/image_26.png)  

Type `Still reboot pending` in the `Script Log Message` field and click the `Save` button.  
![Save Script Log](../../../static/img/Out-of-Date-Cumulative-Update-(Post-Reboot-Verification)/image_27.png)  

#### Row 3c Function: Script Exit

Click the `Add Row` button inside the `If` section.  
![Add Row in If](../../../static/img/Out-of-Date-Cumulative-Update-(Post-Reboot-Verification)/image_22.png)  
![Add Row in If 2](../../../static/img/Out-of-Date-Cumulative-Update-(Post-Reboot-Verification)/image_23.png)  

Search and select the `Script Exit` function in the newly appeared row.  
![Script Exit 1](../../../static/img/Out-of-Date-Cumulative-Update-(Post-Reboot-Verification)/image_28.png)  
![Script Exit 2](../../../static/img/Out-of-Date-Cumulative-Update-(Post-Reboot-Verification)/image_29.png)  

The following function will pop up on the screen:  
![Script Exit Function](../../../static/img/Out-of-Date-Cumulative-Update-(Post-Reboot-Verification)/image_30.png)  

Click the `Save` button without typing anything in the `Error Message` field.  
![Save Script Exit](../../../static/img/Out-of-Date-Cumulative-Update-(Post-Reboot-Verification)/image_31.png)  

#### Row 3d Script: Cumulative Update Audit

Click the `Add Row` button in the `Else` section.  
![Add Row in Else](../../../static/img/Out-of-Date-Cumulative-Update-(Post-Reboot-Verification)/image_32.png)  
![Add Row in Else 2](../../../static/img/Out-of-Date-Cumulative-Update-(Post-Reboot-Verification)/image_33.png)  

Change the `Function` to `Script` from the dropdown.  
![Change Function to Script](../../../static/img/Out-of-Date-Cumulative-Update-(Post-Reboot-Verification)/image_34.png)  

Search and select the `Cumulative Update Audit` script.  
![Cumulative Update Audit 1](../../../static/img/Out-of-Date-Cumulative-Update-(Post-Reboot-Verification)/image_35.png)  
![Cumulative Update Audit 2](../../../static/img/Out-of-Date-Cumulative-Update-(Post-Reboot-Verification)/image_36.png)  

### Row 3e Logic: If/Then/Else

Add a new `If/Then/Else` logic inside the `Else` section.  
![If/Then/Else Logic](../../../static/img/Out-of-Date-Cumulative-Update-(Post-Reboot-Verification)/image_37.png)  
![If/Then/Else Logic 2](../../../static/img/Out-of-Date-Cumulative-Update-(Post-Reboot-Verification)/image_38.png)  

#### Row 3e(i) Condition: Custom Field Contains

Select the `Custom Field` from the dropdown menu.  
![Custom Field Dropdown](../../../static/img/Out-of-Date-Cumulative-Update-(Post-Reboot-Verification)/image_39.png)  
![Custom Field Selection](../../../static/img/Out-of-Date-Cumulative-Update-(Post-Reboot-Verification)/image_40.png)  

Search and select the `Latest Cumulative Update` custom field and type `Failed` in the comparator and press `Enter`.  
![Latest Cumulative Update Condition](../../../static/img/Out-of-Date-Cumulative-Update-(Post-Reboot-Verification)/image_41.png)  

#### Row 3e(ii) Function: Set Custom Field

Add a new row by clicking the `Add Row` button inside the `If` section.  
![Add Row in If](../../../static/img/Out-of-Date-Cumulative-Update-(Post-Reboot-Verification)/image_22.png)  
![Add Row in If 2](../../../static/img/Out-of-Date-Cumulative-Update-(Post-Reboot-Verification)/image_23.png)  

Search and select the `Set Custom Field` function.  
![Set Custom Field 1](../../../static/img/Out-of-Date-Cumulative-Update-(Post-Reboot-Verification)/image_42.png)  
![Set Custom Field 2](../../../static/img/Out-of-Date-Cumulative-Update-(Post-Reboot-Verification)/image_43.png)  

Search and select `Out_of_Date_CU_Autofix_Result` in the `Search Custom Field` field and set `Failed` in the `Value` field and click the `Save` button.  
![Set Custom Field Example 1](../../../static/img/Out-of-Date-Cumulative-Update-(Post-Reboot-Verification)/image_44.png)  
![Set Custom Field Example 2](../../../static/img/Out-of-Date-Cumulative-Update-(Post-Reboot-Verification)/image_45.png)  

#### Row 3e(iii) Function: Script Exit

Click the `Add Row` button inside the `If/Then` logic.  
![Add Row in If/Then](../../../static/img/Out-of-Date-Cumulative-Update-(Post-Reboot-Verification)/image_22.png)  
![Add Row in If/Then 2](../../../static/img/Out-of-Date-Cumulative-Update-(Post-Reboot-Verification)/image_23.png)  

Search and select the `Script Exit` function in the newly appeared row.  
![Script Exit 1](../../../static/img/Out-of-Date-Cumulative-Update-(Post-Reboot-Verification)/image_28.png)  
![Script Exit 2](../../../static/img/Out-of-Date-Cumulative-Update-(Post-Reboot-Verification)/image_29.png)  

The following function will pop up on the screen:  
![Script Exit Function](../../../static/img/Out-of-Date-Cumulative-Update-(Post-Reboot-Verification)/image_30.png)  

Paste the following lines in the `Error Message` field and click the `Save` button.  
`Cumulative Update Failed to install after restarting the computer as well.`  
![Save Error Message](../../../static/img/Out-of-Date-Cumulative-Update-(Post-Reboot-Verification)/image_46.png)  

#### Row 3e(iv) Function: Set Custom Field

Add a new row by clicking the `Add Row` button inside the `Else` section.  
![Add Row in Else](../../../static/img/Out-of-Date-Cumulative-Update-(Post-Reboot-Verification)/image_22.png)  
![Add Row in Else 2](../../../static/img/Out-of-Date-Cumulative-Update-(Post-Reboot-Verification)/image_23.png)  

Search and select the `Set Custom Field` function.  
![Set Custom Field 1](../../../static/img/Out-of-Date-Cumulative-Update-(Post-Reboot-Verification)/image_42.png)  
![Set Custom Field 2](../../../static/img/Out-of-Date-Cumulative-Update-(Post-Reboot-Verification)/image_43.png)  

Search and select `Out_of_Date_CU_Autofix_Result` in the `Search Custom Field` field and set `Installed` in the `Value` field and click the `Save` button.  
![Set Custom Field Example 1](../../../static/img/Out-of-Date-Cumulative-Update-(Post-Reboot-Verification)/image_47.png)  
![Set Custom Field Example 2](../../../static/img/Out-of-Date-Cumulative-Update-(Post-Reboot-Verification)/image_48.png)  

#### Row 3e(v) Function: Set Custom Field

Add a new row by clicking the `Add Row` button inside the `Else` section.  
![Add Row in Else](../../../static/img/Out-of-Date-Cumulative-Update-(Post-Reboot-Verification)/image_22.png)  
![Add Row in Else 2](../../../static/img/Out-of-Date-Cumulative-Update-(Post-Reboot-Verification)/image_23.png)  

Search and select the `Set Custom Field` function.  
![Set Custom Field 1](../../../static/img/Out-of-Date-Cumulative-Update-(Post-Reboot-Verification)/image_42.png)  
![Set Custom Field 2](../../../static/img/Out-of-Date-Cumulative-Update-(Post-Reboot-Verification)/image_43.png)  

Search and select `Out_of_Date_CU_Autofix_Date` in the `Search Custom Field` field and set `0001-01-01 00:00:00` in the `Value` field and click the `Save` button.  
![Set Custom Field Example 1](../../../static/img/Out-of-Date-Cumulative-Update-(Post-Reboot-Verification)/image_49.png)  
![Set Custom Field Example 2](../../../static/img/Out-of-Date-Cumulative-Update-(Post-Reboot-Verification)/image_50.png)  

Click the `Save` button at the top-right corner of the screen to save the script.  
![Save Script](../../../static/img/Out-of-Date-Cumulative-Update-(Post-Reboot-Verification)/image_51.png)  

## Completed Script

![Completed Script 1](../../../static/img/Out-of-Date-Cumulative-Update-(Post-Reboot-Verification)/image_52.png)  
![Completed Script 2](../../../static/img/Out-of-Date-Cumulative-Update-(Post-Reboot-Verification)/image_53.png)  

## Deployment

It is suggested to run the task once per day against the [Out of Date CU _ Reboot Pending](<../groups/Out of Date CU _ Reboot Pending.md>) device group.

- Go to `Automation` > `Tasks.`
- Search for `Out of Date Cumulative Update (Post Reboot Verification)` task.
- Select the concerned task.
- Click on the `Schedule` button to schedule the task.  
![Schedule Task](../../../static/img/Out-of-Date-Cumulative-Update-(Post-Reboot-Verification)/image_54.png)  

This screen will appear.  
![Schedule Screen](../../../static/img/Out-of-Date-Cumulative-Update-(Post-Reboot-Verification)/image_55.png)  

Click the `Does not repeat` button.  
![Does Not Repeat](../../../static/img/Out-of-Date-Cumulative-Update-(Post-Reboot-Verification)/image_56.png)  

This pop-up box will appear.  
![Pop-up Box](../../../static/img/Out-of-Date-Cumulative-Update-(Post-Reboot-Verification)/image_57.png)  

Click the `OK` button without making any changes to set it to run once per day.  
![OK Button](../../../static/img/Out-of-Date-Cumulative-Update-(Post-Reboot-Verification)/image_58.png)  

Recurrence will be updated to `Every Day`.  
![Every Day](../../../static/img/Out-of-Date-Cumulative-Update-(Post-Reboot-Verification)/image_59.png)  

Select the `Device Groups` option in the `Targeted Resources` section.  
![Targeted Resources](../../../static/img/Out-of-Date-Cumulative-Update-(Post-Reboot-Verification)/image_54.png)  

Search and select the [Out of Date CU _ Reboot Pending](<../groups/Out of Date CU _ Reboot Pending.md>) device group.  
![Device Group Selection](../../../static/img/Out-of-Date-Cumulative-Update-(Post-Reboot-Verification)/image_60.png)  

Now click the `Run` button to initiate the task.  
![Run Task](../../../static/img/Out-of-Date-Cumulative-Update-(Post-Reboot-Verification)/image_61.png)  

The task will start appearing in the Scheduled Tasks.  
![Scheduled Tasks 1](../../../static/img/Out-of-Date-Cumulative-Update-(Post-Reboot-Verification)/image_62.png)  
![Scheduled Tasks 2](../../../static/img/Out-of-Date-Cumulative-Update-(Post-Reboot-Verification)/image_63.png)  

## Output

- Script Log
- Custom Field
