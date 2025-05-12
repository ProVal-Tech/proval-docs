---
id: 'fa4da03b-8c90-4acc-a080-42af8f471a1c'
slug: /fa4da03b-8c90-4acc-a080-42af8f471a1c
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

The script is intended to be called from the task [Feature Update Install With Tracking](/docs/5244ac77-6926-4902-a183-b4b2aac18e2b) and should not be executed manually.

## Dependencies

- [Task - Feature Update Install With Tracking](/docs/5244ac77-6926-4902-a183-b4b2aac18e2b)
- [Custom Field - WinFeatUpgradeAttempts](/docs/58b312bd-f26c-4b05-ab92-c184520d05de)

## Create Script

Create a new `Script Editor` style script in the system to implement this task.

![Image](../../../static/img/docs/fa4da03b-8c90-4acc-a080-42af8f471a1c/image_1.webp)

![Image](../../../static/img/docs/fa4da03b-8c90-4acc-a080-42af8f471a1c/image_2.webp)

**Name:** `Windows Feature Update Attempt Tracking (Subscript)`

**Description:** `This script is a subscript used for tracking the number of times the Win Feature Upgrade solution has run and enters that value into the WinFeatUpgradeAttempts field.`

**Category:** Patching

![Image](../../../static/img/docs/fa4da03b-8c90-4acc-a080-42af8f471a1c/image_3.webp)

Start by adding a row. You can do this by clicking the `Add Row` button at the bottom of the script page.

![Image](../../../static/img/docs/fa4da03b-8c90-4acc-a080-42af8f471a1c/image_4.webp)

### Row 1 Function: PowerShell Script

Insert a new row by clicking the `Add Row` button.

![Image](../../../static/img/docs/fa4da03b-8c90-4acc-a080-42af8f471a1c/image_5.webp)

Select `PowerShell Script` function.

![Image](../../../static/img/docs/fa4da03b-8c90-4acc-a080-42af8f471a1c/image_6.webp)

![Image](../../../static/img/docs/fa4da03b-8c90-4acc-a080-42af8f471a1c/image_7.webp)

![Image](../../../static/img/docs/fa4da03b-8c90-4acc-a080-42af8f471a1c/image_8.webp)

Paste in the following PowerShell script, set the expected time of script execution to `300` seconds, and click the `Save` button.

```powershell
$output='@reset@'
$output
```

![Image](../../../static/img/docs/fa4da03b-8c90-4acc-a080-42af8f471a1c/image_9.webp)

Mark the `Continue on Failure` checkbox.

![Image](../../../static/img/docs/fa4da03b-8c90-4acc-a080-42af8f471a1c/image_10.webp)

### Row 2 Logic: If Then

Insert a new `If/Then` logic from the `Add Logic` dropdown menu.

![Image](../../../static/img/docs/fa4da03b-8c90-4acc-a080-42af8f471a1c/image_11.webp)  
![Image](../../../static/img/docs/fa4da03b-8c90-4acc-a080-42af8f471a1c/image_12.webp)

### Row 2a Condition: Output Contains

Type `True` in the Value box and press `Enter`.

![Image](../../../static/img/docs/fa4da03b-8c90-4acc-a080-42af8f471a1c/image_13.webp)

#### Row 2b Function: Script Log

Insert a new row by clicking the `Add Row` button inside the `If Then` logic after the `Output Contains` condition.

![Image](../../../static/img/docs/fa4da03b-8c90-4acc-a080-42af8f471a1c/image_14.webp)

Search and select the `Script Log` function in the new row.

![Image](../../../static/img/docs/fa4da03b-8c90-4acc-a080-42af8f471a1c/image_15.webp)

![Image](../../../static/img/docs/fa4da03b-8c90-4acc-a080-42af8f471a1c/image_16.webp)

Paste this line in the `Script Log Message` box and click the `Save` button.  
`Reset Variable = %output%  
Resetting WinFeatUpgradeAttempts Custom Field to 0.`

![Image](../../../static/img/docs/fa4da03b-8c90-4acc-a080-42af8f471a1c/image_17.webp)

![Image](../../../static/img/docs/fa4da03b-8c90-4acc-a080-42af8f471a1c/image_18.webp)

#### Row 2c Function: Set Custom Field

Insert a new row by clicking the `Add Row` button inside the `If Then` logic.

![Image](../../../static/img/docs/fa4da03b-8c90-4acc-a080-42af8f471a1c/image_19.webp)

![Image](../../../static/img/docs/fa4da03b-8c90-4acc-a080-42af8f471a1c/image_20.webp)

Search and select the `Set Custom Field` function in the new row.

![Image](../../../static/img/docs/fa4da03b-8c90-4acc-a080-42af8f471a1c/image_21.webp)

![Image](../../../static/img/docs/fa4da03b-8c90-4acc-a080-42af8f471a1c/image_22.webp)

Search and select the `WinFeatUpgradeAttempts` Custom Field.

![Image](../../../static/img/docs/fa4da03b-8c90-4acc-a080-42af8f471a1c/image_23.webp)

Type `0` in the `Value` box and click the `Save` button.

![Image](../../../static/img/docs/fa4da03b-8c90-4acc-a080-42af8f471a1c/image_24.webp)

![Image](../../../static/img/docs/fa4da03b-8c90-4acc-a080-42af8f471a1c/image_25.webp)

### Step 3 Function: Set Pre-defined Variable

Insert a new row by clicking the `Add Row` button.

![Image](../../../static/img/docs/fa4da03b-8c90-4acc-a080-42af8f471a1c/image_5.webp)

Select `Set Pre-defined Variable` function.

![Image](../../../static/img/docs/fa4da03b-8c90-4acc-a080-42af8f471a1c/image_26.webp)

![Image](../../../static/img/docs/fa4da03b-8c90-4acc-a080-42af8f471a1c/image_27.webp)

Type `VarCheck` in the `Variable Name` field, mark the `Custom Field` checkbox, select `WinFeatUpgradeAttempts` in the Custom Field box, and click the `Save` button.

![Image](../../../static/img/docs/fa4da03b-8c90-4acc-a080-42af8f471a1c/image_28.webp)

![Image](../../../static/img/docs/fa4da03b-8c90-4acc-a080-42af8f471a1c/image_29.webp)

### Step 4 Function: Script Log

Insert a new row by clicking the `Add Row` button.

![Image](../../../static/img/docs/fa4da03b-8c90-4acc-a080-42af8f471a1c/image_5.webp)

Search and select the `Script Log` function in the new row.

![Image](../../../static/img/docs/fa4da03b-8c90-4acc-a080-42af8f471a1c/image_15.webp)

![Image](../../../static/img/docs/fa4da03b-8c90-4acc-a080-42af8f471a1c/image_16.webp)

Paste this line in the `Script Log Message` box and click the `Save` button.  
`Win Feature Pack Upgrade Attempts = @varcheck@`

![Image](../../../static/img/docs/fa4da03b-8c90-4acc-a080-42af8f471a1c/image_30.webp)

![Image](../../../static/img/docs/fa4da03b-8c90-4acc-a080-42af8f471a1c/image_31.webp)

### Row 5 Function: PowerShell Script

Insert a new row by clicking the `Add Row` button.

![Image](../../../static/img/docs/fa4da03b-8c90-4acc-a080-42af8f471a1c/image_5.webp)

Select `PowerShell Script` function.

![Image](../../../static/img/docs/fa4da03b-8c90-4acc-a080-42af8f471a1c/image_6.webp)

![Image](../../../static/img/docs/fa4da03b-8c90-4acc-a080-42af8f471a1c/image_7.webp)

![Image](../../../static/img/docs/fa4da03b-8c90-4acc-a080-42af8f471a1c/image_8.webp)

Paste in the following PowerShell script, set the expected time of script execution to `300` seconds, and click the `Save` button.

```Powershell
$Number = @VarCheck@
$Number++
$Number
```

![Image](../../../static/img/docs/fa4da03b-8c90-4acc-a080-42af8f471a1c/image_32.webp)

Mark the `Continue on Failure` checkbox.

![Image](../../../static/img/docs/fa4da03b-8c90-4acc-a080-42af8f471a1c/image_10.webp)

### Step 6 Function: Script Log

Insert a new row by clicking the `Add Row` button.

![Image](../../../static/img/docs/fa4da03b-8c90-4acc-a080-42af8f471a1c/image_5.webp)

Search and select the `Script Log` function in the new row.

![Image](../../../static/img/docs/fa4da03b-8c90-4acc-a080-42af8f471a1c/image_15.webp)

![Image](../../../static/img/docs/fa4da03b-8c90-4acc-a080-42af8f471a1c/image_16.webp)

Paste this line in the `Script Log Message` box and click the `Save` button.  
`%output%`

![Image](../../../static/img/docs/fa4da03b-8c90-4acc-a080-42af8f471a1c/image_33.webp)

![Image](../../../static/img/docs/fa4da03b-8c90-4acc-a080-42af8f471a1c/image_31.webp)

### Row 7 Function: Set Custom Field

Insert a new row by clicking the `Add Row` button.

![Image](../../../static/img/docs/fa4da03b-8c90-4acc-a080-42af8f471a1c/image_5.webp)

Search and select the `Set Custom Field` function in the new row.

![Image](../../../static/img/docs/fa4da03b-8c90-4acc-a080-42af8f471a1c/image_34.webp)

![Image](../../../static/img/docs/fa4da03b-8c90-4acc-a080-42af8f471a1c/image_22.webp)

Search and select the `WinFeatUpgradeAttempts` Custom Field.

![Image](../../../static/img/docs/fa4da03b-8c90-4acc-a080-42af8f471a1c/image_23.webp)

Type `%Output%` in the `Value` box and click the `Save` button.

![Image](../../../static/img/docs/fa4da03b-8c90-4acc-a080-42af8f471a1c/image_35.webp)

![Image](../../../static/img/docs/fa4da03b-8c90-4acc-a080-42af8f471a1c/image_36.webp)

Click the `Save` button to save the task.

![Image](../../../static/img/docs/fa4da03b-8c90-4acc-a080-42af8f471a1c/image_37.webp)

## Completed Script

![Image](../../../static/img/docs/fa4da03b-8c90-4acc-a080-42af8f471a1c/image_38.webp)

![Image](../../../static/img/docs/fa4da03b-8c90-4acc-a080-42af8f471a1c/image_39.webp)

## Output

- Script Log
- Custom Field