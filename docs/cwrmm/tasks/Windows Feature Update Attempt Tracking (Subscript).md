---
id: 'fa4da03b-8c90-4acc-a080-42af8f471a1c'
title: 'Windows Feature Update Attempt Tracking (Subscript)'
title_meta: 'Windows Feature Update Attempt Tracking (Subscript)'
keywords: ['windows', 'tracking', 'upgrade', 'feature', 'custom', 'field', 'script', 'log']
description: 'This document outlines a subscript for tracking the number of times the Windows Feature Upgrade solution has been executed, storing that count in the WinFeatUpgradeAttempts custom field. It includes step-by-step instructions for creating and implementing the script within the ConnectWise RMM platform.'
tags: ['windows']
draft: false
unlisted: false
---

## Summary

This script is a subscript used for tracking the number of times the Windows Feature Upgrade solution has run and enters that value into the `WinFeatUpgradeAttempts` field.

## Sample Run

The script is intended to be called from the task [CW RMM - Task - Feature Update Install With Tracking](<./Feature Update Install With Tracking.md>) and should not be executed manually.

## Dependencies

- [CW RMM - Task - Feature Update Install With Tracking](<./Feature Update Install With Tracking.md>)
- [CW RMM - Custom Field - WinFeatUpgradeAttempts](<../custom-fields/WinFeatUpgradeAttempts.md>)

## Create Script

Create a new `Script Editor` style script in the system to implement this task.

![Image](../../../static/img/Windows-Feature-Update-Attempt-Tracking-(Subscript)/image_1.png)

![Image](../../../static/img/Windows-Feature-Update-Attempt-Tracking-(Subscript)/image_2.png)

**Name:** `Windows Feature Update Attempt Tracking (Subscript)`

**Description:** `This script is a subscript used for tracking the number of times the Win Feature Upgrade solution has run and enters that value into the WinFeatUpgradeAttempts field.`

**Category:** Patching

![Image](../../../static/img/Windows-Feature-Update-Attempt-Tracking-(Subscript)/image_3.png)

Start by adding a row. You can do this by clicking the `Add Row` button at the bottom of the script page.

![Image](../../../static/img/Windows-Feature-Update-Attempt-Tracking-(Subscript)/image_4.png)

### Row 1 Function: PowerShell Script

Insert a new row by clicking the `Add Row` button.

![Image](../../../static/img/Windows-Feature-Update-Attempt-Tracking-(Subscript)/image_5.png)

Select `PowerShell Script` function.

![Image](../../../static/img/Windows-Feature-Update-Attempt-Tracking-(Subscript)/image_6.png)

![Image](../../../static/img/Windows-Feature-Update-Attempt-Tracking-(Subscript)/image_7.png)

![Image](../../../static/img/Windows-Feature-Update-Attempt-Tracking-(Subscript)/image_8.png)

Paste in the following PowerShell script, set the expected time of script execution to `300` seconds, and click the `Save` button.

```
$output='@reset@'
$output
```

![Image](../../../static/img/Windows-Feature-Update-Attempt-Tracking-(Subscript)/image_9.png)

Mark the `Continue on Failure` checkbox.

![Image](../../../static/img/Windows-Feature-Update-Attempt-Tracking-(Subscript)/image_10.png)

### Row 2 Logic: If Then

Insert a new `If/Then` logic from the `Add Logic` dropdown menu.

![Image](../../../static/img/Windows-Feature-Update-Attempt-Tracking-(Subscript)/image_11.png)  
![Image](../../../static/img/Windows-Feature-Update-Attempt-Tracking-(Subscript)/image_12.png)

### Row 2a Condition: Output Contains

Type `True` in the Value box and press `Enter`.

![Image](../../../static/img/Windows-Feature-Update-Attempt-Tracking-(Subscript)/image_13.png)

#### Row 2b Function: Script Log

Insert a new row by clicking the `Add Row` button inside the `If Then` logic after the `Output Contains` condition.

![Image](../../../static/img/Windows-Feature-Update-Attempt-Tracking-(Subscript)/image_14.png)

Search and select the `Script Log` function in the new row.

![Image](../../../static/img/Windows-Feature-Update-Attempt-Tracking-(Subscript)/image_15.png)

![Image](../../../static/img/Windows-Feature-Update-Attempt-Tracking-(Subscript)/image_16.png)

Paste this line in the `Script Log Message` box and click the `Save` button.  
`Reset Variable = %output%  
Resetting WinFeatUpgradeAttempts Custom Field to 0.`

![Image](../../../static/img/Windows-Feature-Update-Attempt-Tracking-(Subscript)/image_17.png)

![Image](../../../static/img/Windows-Feature-Update-Attempt-Tracking-(Subscript)/image_18.png)

#### Row 2c Function: Set Custom Field

Insert a new row by clicking the `Add Row` button inside the `If Then` logic.

![Image](../../../static/img/Windows-Feature-Update-Attempt-Tracking-(Subscript)/image_19.png)

![Image](../../../static/img/Windows-Feature-Update-Attempt-Tracking-(Subscript)/image_20.png)

Search and select the `Set Custom Field` function in the new row.

![Image](../../../static/img/Windows-Feature-Update-Attempt-Tracking-(Subscript)/image_21.png)

![Image](../../../static/img/Windows-Feature-Update-Attempt-Tracking-(Subscript)/image_22.png)

Search and select the `WinFeatUpgradeAttempts` Custom Field.

![Image](../../../static/img/Windows-Feature-Update-Attempt-Tracking-(Subscript)/image_23.png)

Type `0` in the `Value` box and click the `Save` button.

![Image](../../../static/img/Windows-Feature-Update-Attempt-Tracking-(Subscript)/image_24.png)

![Image](../../../static/img/Windows-Feature-Update-Attempt-Tracking-(Subscript)/image_25.png)

### Step 3 Function: Set Pre-defined Variable

Insert a new row by clicking the `Add Row` button.

![Image](../../../static/img/Windows-Feature-Update-Attempt-Tracking-(Subscript)/image_5.png)

Select `Set Pre-defined Variable` function.

![Image](../../../static/img/Windows-Feature-Update-Attempt-Tracking-(Subscript)/image_26.png)

![Image](../../../static/img/Windows-Feature-Update-Attempt-Tracking-(Subscript)/image_27.png)

Type `VarCheck` in the `Variable Name` field, mark the `Custom Field` checkbox, select `WinFeatUpgradeAttempts` in the Custom Field box, and click the `Save` button.

![Image](../../../static/img/Windows-Feature-Update-Attempt-Tracking-(Subscript)/image_28.png)

![Image](../../../static/img/Windows-Feature-Update-Attempt-Tracking-(Subscript)/image_29.png)

### Step 4 Function: Script Log

Insert a new row by clicking the `Add Row` button.

![Image](../../../static/img/Windows-Feature-Update-Attempt-Tracking-(Subscript)/image_5.png)

Search and select the `Script Log` function in the new row.

![Image](../../../static/img/Windows-Feature-Update-Attempt-Tracking-(Subscript)/image_15.png)

![Image](../../../static/img/Windows-Feature-Update-Attempt-Tracking-(Subscript)/image_16.png)

Paste this line in the `Script Log Message` box and click the `Save` button.  
`Win Feature Pack Upgrade Attempts = @varcheck@`

![Image](../../../static/img/Windows-Feature-Update-Attempt-Tracking-(Subscript)/image_30.png)

![Image](../../../static/img/Windows-Feature-Update-Attempt-Tracking-(Subscript)/image_31.png)

### Row 5 Function: PowerShell Script

Insert a new row by clicking the `Add Row` button.

![Image](../../../static/img/Windows-Feature-Update-Attempt-Tracking-(Subscript)/image_5.png)

Select `PowerShell Script` function.

![Image](../../../static/img/Windows-Feature-Update-Attempt-Tracking-(Subscript)/image_6.png)

![Image](../../../static/img/Windows-Feature-Update-Attempt-Tracking-(Subscript)/image_7.png)

![Image](../../../static/img/Windows-Feature-Update-Attempt-Tracking-(Subscript)/image_8.png)

Paste in the following PowerShell script, set the expected time of script execution to `300` seconds, and click the `Save` button.

```
$Number = @VarCheck@
$Number++
$Number
```

![Image](../../../static/img/Windows-Feature-Update-Attempt-Tracking-(Subscript)/image_32.png)

Mark the `Continue on Failure` checkbox.

![Image](../../../static/img/Windows-Feature-Update-Attempt-Tracking-(Subscript)/image_10.png)

### Step 6 Function: Script Log

Insert a new row by clicking the `Add Row` button.

![Image](../../../static/img/Windows-Feature-Update-Attempt-Tracking-(Subscript)/image_5.png)

Search and select the `Script Log` function in the new row.

![Image](../../../static/img/Windows-Feature-Update-Attempt-Tracking-(Subscript)/image_15.png)

![Image](../../../static/img/Windows-Feature-Update-Attempt-Tracking-(Subscript)/image_16.png)

Paste this line in the `Script Log Message` box and click the `Save` button.  
`%output%`

![Image](../../../static/img/Windows-Feature-Update-Attempt-Tracking-(Subscript)/image_33.png)

![Image](../../../static/img/Windows-Feature-Update-Attempt-Tracking-(Subscript)/image_31.png)

### Row 7 Function: Set Custom Field

Insert a new row by clicking the `Add Row` button.

![Image](../../../static/img/Windows-Feature-Update-Attempt-Tracking-(Subscript)/image_5.png)

Search and select the `Set Custom Field` function in the new row.

![Image](../../../static/img/Windows-Feature-Update-Attempt-Tracking-(Subscript)/image_34.png)

![Image](../../../static/img/Windows-Feature-Update-Attempt-Tracking-(Subscript)/image_22.png)

Search and select the `WinFeatUpgradeAttempts` Custom Field.

![Image](../../../static/img/Windows-Feature-Update-Attempt-Tracking-(Subscript)/image_23.png)

Type `%Output%` in the `Value` box and click the `Save` button.

![Image](../../../static/img/Windows-Feature-Update-Attempt-Tracking-(Subscript)/image_35.png)

![Image](../../../static/img/Windows-Feature-Update-Attempt-Tracking-(Subscript)/image_36.png)

Click the `Save` button to save the task.

![Image](../../../static/img/Windows-Feature-Update-Attempt-Tracking-(Subscript)/image_37.png)

## Completed Script

![Image](../../../static/img/Windows-Feature-Update-Attempt-Tracking-(Subscript)/image_38.png)

![Image](../../../static/img/Windows-Feature-Update-Attempt-Tracking-(Subscript)/image_39.png)

## Output

- Script Log
- Custom Field



