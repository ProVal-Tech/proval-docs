---
id: '5244ac77-6926-4902-a183-b4b2aac18e2b'
slug: /5244ac77-6926-4902-a183-b4b2aac18e2b
title: 'Feature Update Install With Tracking'
title_meta: 'Feature Update Install With Tracking'
keywords: ['feature', 'update', 'install', 'tracking', 'windows', 'upgrade']
description: 'This document provides a comprehensive guide on how to create a script for installing the latest Windows feature updates while tracking the installation attempts and handling potential errors. It covers parameters, dependencies, and the step-by-step process to implement the script effectively.'
tags: ['installation', 'patching', 'update', 'windows']
draft: false
unlisted: false
---

## Summary

The script initiates the latest Feature Update using the Upgrade Assistant and records the attempt in the custom field `WinFeatUpgradeAttempts`. In case of failure, it updates the `Feature Update Install Failure` custom field with the error message. If the upgrade completes without error but a reboot is pending, the `Feature Update Reboot Pending` custom field is updated.

The script compares the current operating system build with the latest available build before and after the upgrade, with the latest build requiring manual entry into the script. For any new releases, the build number must be manually set in the script at step 2 for Windows 11 and step 3 for Windows 10.

![Image](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_1.webp)

**Parameters:**

- **Reboot** - If True: Will reboot the device immediately after the upgrade completes.
- **Reset** - If True: Will reset the tracker counter to 0.

## Sample Run

![Image](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_2.webp)

## Parameters

- Reboot - If True: Will reboot the device immediately after the upgrade completes.
- Reset - If True: Will reset the tracker counter to 0.

![Image](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_3.webp)

## Dependencies

- [CW RMM - Custom Field - WinFeatUpgradeAttempts](/docs/58b312bd-f26c-4b05-ab92-c184520d05de)
- [CW RMM - Custom Field - Feature Update Install Failure](/docs/1c9abaeb-17f0-4a3b-86ee-953b5b713dc3)
- [CW RMM - Custom Field - Feature Update Reboot Pending](/docs/45e14854-ba83-4737-8264-b5cd809fca56)
- [CW RMM - Task - Windows Feature Update Attempt Tracking (Subscript)](/docs/fa4da03b-8c90-4acc-a080-42af8f471a1c)
- [CW RMM - Device Group - Feature Pack Update Automation](/docs/b9c9e1fe-57af-4816-befb-f2701ba009ba)

## Create Script

Create a new `Script Editor` style script in the system to implement this task.

![Image](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_4.webp)

![Image](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_5.webp)

**Name:** `Feature Update Install With Tracking`

**Description:** `Attempts latest Feature Update using the Upgrade Assistant. Tracks attempt into Custom Field WinFeatUpgradeAttempts. Parameters: Reboot - If True: Will reboot the device immediately after the upgrade completes. Reset - If True: Will reset tracker counter to 0.`

**Category:** Patching

![Image](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_6.webp)

### Parameters

Click the `Add Parameter` button.

![Image](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_7.webp)

The `Add New Script Parameter` box will appear.

![Image](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_8.webp)

In the box, fill in the following details and select `Save` to create the `Reboot` parameter.

![Image](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_9.webp)

Add another parameter and fill in the following details to create the `Reset` parameter.

![Image](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_10.webp)

### Script

Start by adding a row. You can do this by clicking the `Add Row` button at the bottom of the script page.

![Image](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_11.webp)

#### Row 1 Function: Script

Choose `Script` from the dropdown menu; by default, it will show `Function`.

![Image](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_12.webp)

Search for the `Windows Feature Update Attempt Tracking (Subscript)` and select it.

![Image](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_13.webp)

**NOTE:** Make sure to select the 'Continue on Failure' checkbox.

#### Row 2 Function: Set User Variable

Insert a new row by clicking the `Add Row` button.

![Image](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_14.webp)

Select `Set User Variable` function.

![Image](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_15.webp)

![Image](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_16.webp)

![Image](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_17.webp)

Type `Win11LatestBuild` in the `Variable Name` field and `10.0.22631` in the `Value` field. `10.0.22631` is the latest available feature build for Windows 11 at the moment. Click `Save` to create the `Win11LatestBuild` variable.

![Image](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_18.webp)

![Image](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_19.webp)

#### Row 3 Function: Set User Variable

Insert a new row by clicking the `Add Row` button.

![Image](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_14.webp)

Select `Set User Variable` function.

![Image](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_15.webp)

![Image](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_16.webp)

![Image](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_17.webp)

Type `Win10LatestBuild` in the `Variable Name` field and `10.0.19045` in the `Value` field. `10.0.19045` is the latest available feature build for Windows 10 at the moment. Click `Save` to create the `Win10LatestBuild` variable.

![Image](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_20.webp)

![Image](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_21.webp)

#### Row 4 Function: PowerShell Script

Insert a new row by clicking the `Add Row` button.

![Image](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_14.webp)

Select `PowerShell Script` function.

![Image](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_22.webp)

![Image](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_23.webp)

![Image](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_24.webp)

Paste in the following PowerShell script, set the expected time of script execution to `300` seconds, and click the `Save` button.

```
$osinfo = Get-CimInstance -ClassName Win32_OperatingSystem
if ( $osinfo.buildnumber -ge '20000' ) { [Version]$osinfo.version -ge [Version]'@Win11LatestBuild@' } else  { [Version]$osinfo.Version -ge [Version]'@Win10LatestBuild@' }
```

![Image](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_25.webp)

Mark the `Continue on Failure` checkbox.

![Image](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_26.webp)

#### Row 5 Logic: If Then

Insert a new `If/Then` logic from the `Add Logic` dropdown menu.

![Image](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_27.webp)

![Image](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_28.webp)

#### Row 5a Condition: Output Contains

Type `True` in the Value box and press `Enter`.

![Image](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_29.webp)

#### Row 5b Function: Script Log

Insert a new row by clicking the `Add Row` button inside the `If Then` logic after the `Output Contains` condition.

![Image](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_30.webp)

Search and select the `Script Log` function in the new row.

![Image](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_31.webp)

![Image](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_32.webp)

Paste this line in the `Script Log Message` box and click the `Save` button.

`The machine has already been updated to the latest feature build available for the operating system.`

![Image](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_33.webp)

![Image](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_34.webp)

#### Row 5c Function: Script Exit

Insert a new row by clicking the `Add Row` button inside the `If Then` logic after the `Script Log` function.

![Image](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_35.webp)

Search and select the `Script Exit` function in the new row.

![Image](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_36.webp)

![Image](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_37.webp)

![Image](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_38.webp)

#### Row 6 Function: PowerShell Script

Insert a new row by clicking the `Add Row` button.

![Image](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_14.webp)

Select `PowerShell Script` function.

![Image](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_22.webp)

![Image](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_23.webp)

![Image](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_24.webp)

Paste in the following PowerShell script, set the expected time of script execution to `7200` seconds, and click the `Save` button.

```
[Net.ServicePointManager]::SecurityProtocol = [enum]::ToObject([Net.SecurityProtocolType], 3072)
$workingpath = "$env:ProgramData/_automation/Script/FeatureUpdate"
$path = "$workingpath/Install-FeatureUpdate.ps1"
$url = 'https://file.provaltech.com/repo/script/Install-FeatureUpdate.ps1'
Remove-Item -Path $workingpath -Recurse -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Type Directory -Path $WorkingPath -Force -ErrorAction SilentlyContinue | Out-Null 
(New-Object System.Net.WebClient).DownloadFile($url, $path)
& $path
```

![Image](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_39.webp)

Mark the `Continue on Failure` checkbox.

![Image](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_26.webp)

#### Row 7 Function: Script Log

Insert a new row by clicking the `Add Row` button.

![Image](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_14.webp)

Select `Script Log` function.

![Image](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_31.webp)

![Image](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_32.webp)

Paste this line in the `Script Log Message` box and click the `Save` button.

`Script Output: %output%`

![Image](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_40.webp)

![Image](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_41.webp)

#### Row 8 Function: PowerShell Script

Insert a new row by clicking the `Add Row` button.

![Image](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_14.webp)

Select `PowerShell Script` function.

![Image](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_22.webp)

![Image](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_23.webp)

![Image](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_24.webp)

Paste in the following PowerShell script, set the expected time of script execution to `300` seconds, and click the `Save` button.

```
$workingpath = "$env:ProgramData/_automation/Script/FeatureUpdate"
$logpath = "$workingpath/Install-FeatureUpdate-log.txt"
if ( Test-Path $logpath ) {
  Get-Content $logpath
} else {
  return 'Log File not found.'
}
```

![Image](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_42.webp)

Mark the `Continue on Failure` checkbox.

![Image](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_26.webp)

#### Row 9 Function: Script Log

Insert a new row by clicking the `Add Row` button.

![Image](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_14.webp)

Select `Script Log` function.

![Image](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_31.webp)

![Image](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_32.webp)

Paste this line in the `Script Log Message` box and click the `Save` button.

`Log Content: %output%`

![Image](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_43.webp)

![Image](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_41.webp)

#### Row 10 Function: PowerShell Script

Insert a new row by clicking the `Add Row` button.

![Image](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_14.webp)

Select `PowerShell Script` function.

![Image](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_22.webp)

![Image](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_23.webp)

![Image](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_24.webp)

Paste in the following PowerShell script, set the expected time of script execution to `300` seconds, and click the `Save` button.

```
$workingpath = "$env:ProgramData/_automation/Script/FeatureUpdate"
$errorlogpath = "$workingpath/Install-FeatureUpdate-error.txt"
if ( Test-Path $errorlogpath ) {
  Get-Content $errorlogpath
} else {
  return 'Error Log File not found.'
}
```

![Image](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_44.webp)

Mark the `Continue on Failure` checkbox.

![Image](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_26.webp)

#### Row 11 Logic: If Then

Insert a new `If/Then` logic from the `Add Logic` dropdown menu.

![Image](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_27.webp)

![Image](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_28.webp)

#### Row 11a Condition: Output Does Not Contain

In the `Output Contains` condition, select the `Does Not Contain` condition from the drop-down menu, type `Error Log File not found` in the `input value or variable` box, and press `Enter`.

![Image](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_45.webp)

#### Row 11b Logic: If Then

Insert a new `If/Then` logic from the `Add Logic` dropdown menu after the `Output Does Not Contain` condition.

![Image](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_46.webp)

#### Row 11b(i) Condition: Output Contains

In the `Output Contains` condition, type `The volume health check returned a negative result` in the `input value or variable` box and press `Enter`.

![Image](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_47.webp)

#### Row 11b(ii) Function: Set Custom Field

Click the `Add Row` button inside the internal `If Then` logic to add a new function.

![Image](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_48.webp)

Search and select the `Set Custom Field` function.

![Image](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_49.webp)

![Image](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_50.webp)

Search and select the `Feature Update Install Failure` custom field.

![Image](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_51.webp)

Type `Volume Health Error` in the `Value` box and click the `Save` button.

![Image](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_52.webp)

![Image](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_53.webp)

#### Row 11c Logic: If Then

Insert a new `If/Then` logic inside the external `If Then` logic from the `Add Logic` dropdown menu.

![Image](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_54.webp)

#### Row 11c(i) Condition: Output Contains

In the `Output Contains` condition, type `The Windows Update health check returned a negative result` in the `input value or variable` box and press `Enter`.

![Image](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_55.webp)

#### Row 11c(ii) Function: Set Custom Field

Click the `Add Row` button inside the internal `If Then` logic to add a new function.

![Image](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_56.webp)

Search and select the `Set Custom Field` function.

![Image](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_49.webp)

![Image](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_50.webp)

Search and select the `Feature Update Install Failure` custom field.

![Image](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_51.webp)

Type `Health Check Error` in the `Value` box and click the `Save` button.

![Image](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_57.webp)

![Image](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_58.webp)

#### Row 11d Logic: If Then

Insert a new `If/Then` logic inside the external `If Then` logic from the `Add Logic` dropdown menu.

![Image](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_59.webp)

#### Row 11d(i) Condition: Output Contains

In the `Output Contains` condition, type `The Drive Space health check failed` in the `input value or variable` box and press `Enter`.

![Image](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_61.webp)

#### Row 11d(ii) Function: Set Custom Field

Click the `Add Row` button inside the internal `If Then` logic to add a new function.

![Image](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_62.webp)

Search and select the `Set Custom Field` function.

![Image](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_49.webp)

![Image](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_50.webp)

Search and select the `Feature Update Install Failure` custom field.

![Image](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_51.webp)

Type `Low Drive Space Error` in the `Value` box and click the `Save` button.

![Image](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_63.webp)

![Image](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_64.webp)

#### Row 11e Logic: If Then

Insert a new `If/Then` logic inside the external `If Then` logic from the `Add Logic` dropdown menu.

![Image](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_65.webp)

#### Row 11e(i) Condition: Output Contains

In the `Output Contains` condition, type `incompatible with windows 11 upgrade` in the `input value or variable` box and press `Enter`.

![Image](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_67.webp)

#### Row 11e(ii) Function: Set Custom Field

Click the `Add Row` button inside the internal `If Then` logic to add a new function.

![Image](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_68.webp)

Search and select the `Set Custom Field` function.

![Image](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_49.webp)

![Image](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_50.webp)

Search and select the `Feature Update Install Failure` custom field.

![Image](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_51.webp)

Type `Compatibility Check Error` in the `Value` box and click the `Save` button.

![Image](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_69.webp)

![Image](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_70.webp)

#### Row 11f Logic: If Then

Insert a new `If/Then` logic inside the external `If Then` logic from the `Add Logic` dropdown menu.

![Image](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_71.webp)

#### Row 11f(i) Condition: Custom Field Does Not Contain

Select `Custom Field` option from the first dropdown menu of the `output contains` condition.

![Image](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_73.webp)

Search and select the `Feature Update Install Failure` custom field.

![Image](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_74.webp)

Select the `Does Not Contain` condition from the condition's dropdown menu.

![Image](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_75.webp)

Type `Error` in the comparison field.

![Image](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_76.webp)

Add another condition by clicking the `Add Condition` button.

![Image](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_77.webp)

Type `Error Log File not found` in the `Input Value or Variable` box and press `Enter`.

![Image](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_78.webp)

#### Row 11f(ii) Function: Set Custom Field

Click the `Add Row` button inside the internal `If Then` logic to add a new function.

![Image](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_79.webp)

Search and select the `Set Custom Field` function.

![Image](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_49.webp)

![Image](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_50.webp)

Search and select the `Feature Update Install Failure` custom field.

![Image](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_51.webp)

Type `Installation Failure/Error` in the `Value` box and click the `Save` button.

![Image](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_80.webp)

![Image](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_81.webp)

#### Row 11g Function: Script Exit

Click the `Add Row` button inside the external `If Then` logic to add a new function.

![Image](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_82.webp)

Select the `Script Exit` function.

![Image](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_83.webp)

Type `Error Log Content: %Output%` in the Error Message field and click the `Save` button.

![Image](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_84.webp)

![Image](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_85.webp)

This is how Step 11 should look after completion.

![Image](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_86.webp)

### Step 12 Logic: If Then Else

Add a new `If/Then/Else` logic from the Add Logic dropdown menu. **Make sure to not click on the one that is part of row 11.**

![Image](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_87.webp)

![Image](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_88.webp)

### Step 12a Condition: Value Equals

Select `Value` from the first dropdown menu in the `Output Contains` condition.

![Image](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_89.webp)

Type `%reboot%` and press enter in the `Enter Value` field.

![Image](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_90.webp)

Select `Equals` from the condition dropdown menu.

![Image](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_91.webp)

Type `True` and press Enter in the `Input Value or Variable` field.

![Image](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_92.webp)

![Image](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_93.webp)

### Step 12b Function: PowerShell Script

Add a new row in the `If` section by clicking the `Add Row` button.

![Image](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_94.webp)

![Image](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_95.webp)

Search and select the `PowerShell Script` in the newly added row.

![Image](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_96.webp)

![Image](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_97.webp)

Paste in the following PowerShell script, set the expected time of script execution to `300` seconds, and click the `Save` button.

```
shutdown /f /r /t 00
```

![Image](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_98.webp)

Mark the `Continue on Failure` checkbox.

![Image](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_26.webp)

### Step 12c Function: PowerShell Script

Add a new row in the `If` section by clicking the `Add Row` button.

![Image](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_99.webp)

![Image](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_100.webp)

Search and select the `PowerShell Script` in the newly added row.

![Image](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_96.webp)

![Image](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_97.webp)

Paste in the following PowerShell script, set the expected time of script execution to `610` seconds, and click the `Save` button.

```
Start-Sleep 600
```

![Image](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_101.webp)

Mark the `Continue on Failure` checkbox.

![Image](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_26.webp)

### Step 12d Function: PowerShell Script

Add a new row in the `If` section by clicking the `Add Row` button.

![Image](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_102.webp)

![Image](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_103.webp)

Search and select the `PowerShell Script` in the newly added row.

![Image](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_96.webp)

![Image](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_97.webp)

Paste in the following PowerShell script, set the expected time of script execution to `300` seconds, and click the `Save` button.

```
$osinfo = Get-CimInstance -ClassName Win32_OperatingSystem
if ( $osinfo.buildnumber -ge '20000' ) { [Version]$osinfo.version -ge [Version]'@Win11LatestBuild@' } else  { [Version]$osinfo.Version -ge [Version]'@Win10LatestBuild@' }
```

![Image](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_104.webp)

Mark the `Continue on Failure` checkbox.

![Image](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_26.webp)

This is how Step 12 should look after adding the above-mentioned PowerShell script steps.

![Image](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_105.webp)

### Completed Script

**Step 1:**

![Image](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_106.webp)

**Step 2:**

**Step 3:**

![Image](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_107.webp)

**Step 4:**

![Image](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_108.webp)

**Step 5:**

![Image](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_109.webp)

**Step 6:**

![Image](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_110.webp)

**Step 7:**

![Image](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_111.webp)

**Step 8:**

![Image](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_112.webp)

**Step 9:**

![Image](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_113.webp)

**Step 10:**

![Image](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_114.webp)

**Step 11:**

![Image](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_115.webp)

![Image](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_116.webp)

![Image](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_117.webp)

**Step 12:**

![Image](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_118.webp)

![Image](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_119.webp)

![Image](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_120.webp)

## Deployment

- Go to `Automation` > `Tasks.`
- Search for `Feature Update Install with Tracking` Task.
- Select the concerned task.
- Click on the `Schedule` button to schedule the task/script.

![Image](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_121.webp)

This screen will appear.

![Image](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_122.webp)

Click the `Does not repeat` button.

![Image](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_123.webp)

This pop-up box will appear.

![Image](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_124.webp)

Click the `OK` button to run the task once per day.

![Image](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_125.webp)

Select the relevant time to execute the script. It is suggested to run this task after hours.

![Image](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_126.webp)

Leave the parameters as they are unless your requirement is to restart the computer forcefully. Select `True` for the `Reboot` parameter to restart the computer during script run. Be careful with the script run time, especially with the `Reboot` parameter set to `True`.

![Image](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_127.webp)

Search and select the `Feature Pack Update Automation` group in the `Resources`.

![Image](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_128.webp)

Clicking the `Run` button will initiate the schedule.

![Image](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_129.webp)

The task will start appearing in the Scheduled Tasks.

![Image](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_130.webp)

![Image](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_131.webp)

The `Suspend` option can be used to `suspend/stop` the schedule.

![Image](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_132.webp)

![Image](../../../static/img/docs/40144621-2d0b-4294-b5cb-cec356cf9d74/image_133.webp)

## Output

- Script Log
- Custom Field

