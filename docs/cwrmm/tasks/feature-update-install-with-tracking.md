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

![Image](../../../static/img/Feature-Update-Install-With-Tracking/image_1.png)

**Parameters:**

- **Reboot** - If True: Will reboot the device immediately after the upgrade completes.
- **Reset** - If True: Will reset the tracker counter to 0.

## Sample Run

![Image](../../../static/img/Feature-Update-Install-With-Tracking/image_2.png)

## Parameters

- Reboot - If True: Will reboot the device immediately after the upgrade completes.
- Reset - If True: Will reset the tracker counter to 0.

![Image](../../../static/img/Feature-Update-Install-With-Tracking/image_3.png)

## Dependencies

- [CW RMM - Custom Field - WinFeatUpgradeAttempts](/docs/58b312bd-f26c-4b05-ab92-c184520d05de)
- [CW RMM - Custom Field - Feature Update Install Failure](/docs/1c9abaeb-17f0-4a3b-86ee-953b5b713dc3)
- [CW RMM - Custom Field - Feature Update Reboot Pending](/docs/45e14854-ba83-4737-8264-b5cd809fca56)
- [CW RMM - Task - Windows Feature Update Attempt Tracking (Subscript)](/docs/fa4da03b-8c90-4acc-a080-42af8f471a1c)
- [CW RMM - Device Group - Feature Pack Update Automation](/docs/b9c9e1fe-57af-4816-befb-f2701ba009ba)

## Create Script

Create a new `Script Editor` style script in the system to implement this task.

![Image](../../../static/img/Feature-Update-Install-With-Tracking/image_4.png)

![Image](../../../static/img/Feature-Update-Install-With-Tracking/image_5.png)

**Name:** `Feature Update Install With Tracking`

**Description:** `Attempts latest Feature Update using the Upgrade Assistant. Tracks attempt into Custom Field WinFeatUpgradeAttempts. Parameters: Reboot - If True: Will reboot the device immediately after the upgrade completes. Reset - If True: Will reset tracker counter to 0.`

**Category:** Patching

![Image](../../../static/img/Feature-Update-Install-With-Tracking/image_6.png)

### Parameters

Click the `Add Parameter` button.

![Image](../../../static/img/Feature-Update-Install-With-Tracking/image_7.png)

The `Add New Script Parameter` box will appear.

![Image](../../../static/img/Feature-Update-Install-With-Tracking/image_8.png)

In the box, fill in the following details and select `Save` to create the `Reboot` parameter.

![Image](../../../static/img/Feature-Update-Install-With-Tracking/image_9.png)

Add another parameter and fill in the following details to create the `Reset` parameter.

![Image](../../../static/img/Feature-Update-Install-With-Tracking/image_10.png)

### Script

Start by adding a row. You can do this by clicking the `Add Row` button at the bottom of the script page.

![Image](../../../static/img/Feature-Update-Install-With-Tracking/image_11.png)

#### Row 1 Function: Script

Choose `Script` from the dropdown menu; by default, it will show `Function`.

![Image](../../../static/img/Feature-Update-Install-With-Tracking/image_12.png)

Search for the `Windows Feature Update Attempt Tracking (Subscript)` and select it.

![Image](../../../static/img/Feature-Update-Install-With-Tracking/image_13.png)

**NOTE:** Make sure to select the 'Continue on Failure' checkbox.

#### Row 2 Function: Set User Variable

Insert a new row by clicking the `Add Row` button.

![Image](../../../static/img/Feature-Update-Install-With-Tracking/image_14.png)

Select `Set User Variable` function.

![Image](../../../static/img/Feature-Update-Install-With-Tracking/image_15.png)

![Image](../../../static/img/Feature-Update-Install-With-Tracking/image_16.png)

![Image](../../../static/img/Feature-Update-Install-With-Tracking/image_17.png)

Type `Win11LatestBuild` in the `Variable Name` field and `10.0.22631` in the `Value` field. `10.0.22631` is the latest available feature build for Windows 11 at the moment. Click `Save` to create the `Win11LatestBuild` variable.

![Image](../../../static/img/Feature-Update-Install-With-Tracking/image_18.png)

![Image](../../../static/img/Feature-Update-Install-With-Tracking/image_19.png)

#### Row 3 Function: Set User Variable

Insert a new row by clicking the `Add Row` button.

![Image](../../../static/img/Feature-Update-Install-With-Tracking/image_14.png)

Select `Set User Variable` function.

![Image](../../../static/img/Feature-Update-Install-With-Tracking/image_15.png)

![Image](../../../static/img/Feature-Update-Install-With-Tracking/image_16.png)

![Image](../../../static/img/Feature-Update-Install-With-Tracking/image_17.png)

Type `Win10LatestBuild` in the `Variable Name` field and `10.0.19045` in the `Value` field. `10.0.19045` is the latest available feature build for Windows 10 at the moment. Click `Save` to create the `Win10LatestBuild` variable.

![Image](../../../static/img/Feature-Update-Install-With-Tracking/image_20.png)

![Image](../../../static/img/Feature-Update-Install-With-Tracking/image_21.png)

#### Row 4 Function: PowerShell Script

Insert a new row by clicking the `Add Row` button.

![Image](../../../static/img/Feature-Update-Install-With-Tracking/image_14.png)

Select `PowerShell Script` function.

![Image](../../../static/img/Feature-Update-Install-With-Tracking/image_22.png)

![Image](../../../static/img/Feature-Update-Install-With-Tracking/image_23.png)

![Image](../../../static/img/Feature-Update-Install-With-Tracking/image_24.png)

Paste in the following PowerShell script, set the expected time of script execution to `300` seconds, and click the `Save` button.

```
$osinfo = Get-CimInstance -ClassName Win32_OperatingSystem
if ( $osinfo.buildnumber -ge '20000' ) { [Version]$osinfo.version -ge [Version]'@Win11LatestBuild@' } else  { [Version]$osinfo.Version -ge [Version]'@Win10LatestBuild@' }
```

![Image](../../../static/img/Feature-Update-Install-With-Tracking/image_25.png)

Mark the `Continue on Failure` checkbox.

![Image](../../../static/img/Feature-Update-Install-With-Tracking/image_26.png)

#### Row 5 Logic: If Then

Insert a new `If/Then` logic from the `Add Logic` dropdown menu.

![Image](../../../static/img/Feature-Update-Install-With-Tracking/image_27.png)

![Image](../../../static/img/Feature-Update-Install-With-Tracking/image_28.png)

#### Row 5a Condition: Output Contains

Type `True` in the Value box and press `Enter`.

![Image](../../../static/img/Feature-Update-Install-With-Tracking/image_29.png)

#### Row 5b Function: Script Log

Insert a new row by clicking the `Add Row` button inside the `If Then` logic after the `Output Contains` condition.

![Image](../../../static/img/Feature-Update-Install-With-Tracking/image_30.png)

Search and select the `Script Log` function in the new row.

![Image](../../../static/img/Feature-Update-Install-With-Tracking/image_31.png)

![Image](../../../static/img/Feature-Update-Install-With-Tracking/image_32.png)

Paste this line in the `Script Log Message` box and click the `Save` button.

`The machine has already been updated to the latest feature build available for the operating system.`

![Image](../../../static/img/Feature-Update-Install-With-Tracking/image_33.png)

![Image](../../../static/img/Feature-Update-Install-With-Tracking/image_34.png)

#### Row 5c Function: Script Exit

Insert a new row by clicking the `Add Row` button inside the `If Then` logic after the `Script Log` function.

![Image](../../../static/img/Feature-Update-Install-With-Tracking/image_35.png)

Search and select the `Script Exit` function in the new row.

![Image](../../../static/img/Feature-Update-Install-With-Tracking/image_36.png)

![Image](../../../static/img/Feature-Update-Install-With-Tracking/image_37.png)

![Image](../../../static/img/Feature-Update-Install-With-Tracking/image_38.png)

#### Row 6 Function: PowerShell Script

Insert a new row by clicking the `Add Row` button.

![Image](../../../static/img/Feature-Update-Install-With-Tracking/image_14.png)

Select `PowerShell Script` function.

![Image](../../../static/img/Feature-Update-Install-With-Tracking/image_22.png)

![Image](../../../static/img/Feature-Update-Install-With-Tracking/image_23.png)

![Image](../../../static/img/Feature-Update-Install-With-Tracking/image_24.png)

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

![Image](../../../static/img/Feature-Update-Install-With-Tracking/image_39.png)

Mark the `Continue on Failure` checkbox.

![Image](../../../static/img/Feature-Update-Install-With-Tracking/image_26.png)

#### Row 7 Function: Script Log

Insert a new row by clicking the `Add Row` button.

![Image](../../../static/img/Feature-Update-Install-With-Tracking/image_14.png)

Select `Script Log` function.

![Image](../../../static/img/Feature-Update-Install-With-Tracking/image_31.png)

![Image](../../../static/img/Feature-Update-Install-With-Tracking/image_32.png)

Paste this line in the `Script Log Message` box and click the `Save` button.

`Script Output: %output%`

![Image](../../../static/img/Feature-Update-Install-With-Tracking/image_40.png)

![Image](../../../static/img/Feature-Update-Install-With-Tracking/image_41.png)

#### Row 8 Function: PowerShell Script

Insert a new row by clicking the `Add Row` button.

![Image](../../../static/img/Feature-Update-Install-With-Tracking/image_14.png)

Select `PowerShell Script` function.

![Image](../../../static/img/Feature-Update-Install-With-Tracking/image_22.png)

![Image](../../../static/img/Feature-Update-Install-With-Tracking/image_23.png)

![Image](../../../static/img/Feature-Update-Install-With-Tracking/image_24.png)

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

![Image](../../../static/img/Feature-Update-Install-With-Tracking/image_42.png)

Mark the `Continue on Failure` checkbox.

![Image](../../../static/img/Feature-Update-Install-With-Tracking/image_26.png)

#### Row 9 Function: Script Log

Insert a new row by clicking the `Add Row` button.

![Image](../../../static/img/Feature-Update-Install-With-Tracking/image_14.png)

Select `Script Log` function.

![Image](../../../static/img/Feature-Update-Install-With-Tracking/image_31.png)

![Image](../../../static/img/Feature-Update-Install-With-Tracking/image_32.png)

Paste this line in the `Script Log Message` box and click the `Save` button.

`Log Content: %output%`

![Image](../../../static/img/Feature-Update-Install-With-Tracking/image_43.png)

![Image](../../../static/img/Feature-Update-Install-With-Tracking/image_41.png)

#### Row 10 Function: PowerShell Script

Insert a new row by clicking the `Add Row` button.

![Image](../../../static/img/Feature-Update-Install-With-Tracking/image_14.png)

Select `PowerShell Script` function.

![Image](../../../static/img/Feature-Update-Install-With-Tracking/image_22.png)

![Image](../../../static/img/Feature-Update-Install-With-Tracking/image_23.png)

![Image](../../../static/img/Feature-Update-Install-With-Tracking/image_24.png)

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

![Image](../../../static/img/Feature-Update-Install-With-Tracking/image_44.png)

Mark the `Continue on Failure` checkbox.

![Image](../../../static/img/Feature-Update-Install-With-Tracking/image_26.png)

#### Row 11 Logic: If Then

Insert a new `If/Then` logic from the `Add Logic` dropdown menu.

![Image](../../../static/img/Feature-Update-Install-With-Tracking/image_27.png)

![Image](../../../static/img/Feature-Update-Install-With-Tracking/image_28.png)

#### Row 11a Condition: Output Does Not Contain

In the `Output Contains` condition, select the `Does Not Contain` condition from the drop-down menu, type `Error Log File not found` in the `input value or variable` box, and press `Enter`.

![Image](../../../static/img/Feature-Update-Install-With-Tracking/image_45.png)

#### Row 11b Logic: If Then

Insert a new `If/Then` logic from the `Add Logic` dropdown menu after the `Output Does Not Contain` condition.

![Image](../../../static/img/Feature-Update-Install-With-Tracking/image_46.png)

#### Row 11b(i) Condition: Output Contains

In the `Output Contains` condition, type `The volume health check returned a negative result` in the `input value or variable` box and press `Enter`.

![Image](../../../static/img/Feature-Update-Install-With-Tracking/image_47.png)

#### Row 11b(ii) Function: Set Custom Field

Click the `Add Row` button inside the internal `If Then` logic to add a new function.

![Image](../../../static/img/Feature-Update-Install-With-Tracking/image_48.png)

Search and select the `Set Custom Field` function.

![Image](../../../static/img/Feature-Update-Install-With-Tracking/image_49.png)

![Image](../../../static/img/Feature-Update-Install-With-Tracking/image_50.png)

Search and select the `Feature Update Install Failure` custom field.

![Image](../../../static/img/Feature-Update-Install-With-Tracking/image_51.png)

Type `Volume Health Error` in the `Value` box and click the `Save` button.

![Image](../../../static/img/Feature-Update-Install-With-Tracking/image_52.png)

![Image](../../../static/img/Feature-Update-Install-With-Tracking/image_53.png)

#### Row 11c Logic: If Then

Insert a new `If/Then` logic inside the external `If Then` logic from the `Add Logic` dropdown menu.

![Image](../../../static/img/Feature-Update-Install-With-Tracking/image_54.png)

#### Row 11c(i) Condition: Output Contains

In the `Output Contains` condition, type `The Windows Update health check returned a negative result` in the `input value or variable` box and press `Enter`.

![Image](../../../static/img/Feature-Update-Install-With-Tracking/image_55.png)

#### Row 11c(ii) Function: Set Custom Field

Click the `Add Row` button inside the internal `If Then` logic to add a new function.

![Image](../../../static/img/Feature-Update-Install-With-Tracking/image_56.png)

Search and select the `Set Custom Field` function.

![Image](../../../static/img/Feature-Update-Install-With-Tracking/image_49.png)

![Image](../../../static/img/Feature-Update-Install-With-Tracking/image_50.png)

Search and select the `Feature Update Install Failure` custom field.

![Image](../../../static/img/Feature-Update-Install-With-Tracking/image_51.png)

Type `Health Check Error` in the `Value` box and click the `Save` button.

![Image](../../../static/img/Feature-Update-Install-With-Tracking/image_57.png)

![Image](../../../static/img/Feature-Update-Install-With-Tracking/image_58.png)

#### Row 11d Logic: If Then

Insert a new `If/Then` logic inside the external `If Then` logic from the `Add Logic` dropdown menu.

![Image](../../../static/img/Feature-Update-Install-With-Tracking/image_59.png)

#### Row 11d(i) Condition: Output Contains

In the `Output Contains` condition, type `The Drive Space health check failed` in the `input value or variable` box and press `Enter`.

![Image](../../../static/img/Feature-Update-Install-With-Tracking/image_61.png)

#### Row 11d(ii) Function: Set Custom Field

Click the `Add Row` button inside the internal `If Then` logic to add a new function.

![Image](../../../static/img/Feature-Update-Install-With-Tracking/image_62.png)

Search and select the `Set Custom Field` function.

![Image](../../../static/img/Feature-Update-Install-With-Tracking/image_49.png)

![Image](../../../static/img/Feature-Update-Install-With-Tracking/image_50.png)

Search and select the `Feature Update Install Failure` custom field.

![Image](../../../static/img/Feature-Update-Install-With-Tracking/image_51.png)

Type `Low Drive Space Error` in the `Value` box and click the `Save` button.

![Image](../../../static/img/Feature-Update-Install-With-Tracking/image_63.png)

![Image](../../../static/img/Feature-Update-Install-With-Tracking/image_64.png)

#### Row 11e Logic: If Then

Insert a new `If/Then` logic inside the external `If Then` logic from the `Add Logic` dropdown menu.

![Image](../../../static/img/Feature-Update-Install-With-Tracking/image_65.png)

#### Row 11e(i) Condition: Output Contains

In the `Output Contains` condition, type `incompatible with windows 11 upgrade` in the `input value or variable` box and press `Enter`.

![Image](../../../static/img/Feature-Update-Install-With-Tracking/image_67.png)

#### Row 11e(ii) Function: Set Custom Field

Click the `Add Row` button inside the internal `If Then` logic to add a new function.

![Image](../../../static/img/Feature-Update-Install-With-Tracking/image_68.png)

Search and select the `Set Custom Field` function.

![Image](../../../static/img/Feature-Update-Install-With-Tracking/image_49.png)

![Image](../../../static/img/Feature-Update-Install-With-Tracking/image_50.png)

Search and select the `Feature Update Install Failure` custom field.

![Image](../../../static/img/Feature-Update-Install-With-Tracking/image_51.png)

Type `Compatibility Check Error` in the `Value` box and click the `Save` button.

![Image](../../../static/img/Feature-Update-Install-With-Tracking/image_69.png)

![Image](../../../static/img/Feature-Update-Install-With-Tracking/image_70.png)

#### Row 11f Logic: If Then

Insert a new `If/Then` logic inside the external `If Then` logic from the `Add Logic` dropdown menu.

![Image](../../../static/img/Feature-Update-Install-With-Tracking/image_71.png)

#### Row 11f(i) Condition: Custom Field Does Not Contain

Select `Custom Field` option from the first dropdown menu of the `output contains` condition.

![Image](../../../static/img/Feature-Update-Install-With-Tracking/image_73.png)

Search and select the `Feature Update Install Failure` custom field.

![Image](../../../static/img/Feature-Update-Install-With-Tracking/image_74.png)

Select the `Does Not Contain` condition from the condition's dropdown menu.

![Image](../../../static/img/Feature-Update-Install-With-Tracking/image_75.png)

Type `Error` in the comparison field.

![Image](../../../static/img/Feature-Update-Install-With-Tracking/image_76.png)

Add another condition by clicking the `Add Condition` button.

![Image](../../../static/img/Feature-Update-Install-With-Tracking/image_77.png)

Type `Error Log File not found` in the `Input Value or Variable` box and press `Enter`.

![Image](../../../static/img/Feature-Update-Install-With-Tracking/image_78.png)

#### Row 11f(ii) Function: Set Custom Field

Click the `Add Row` button inside the internal `If Then` logic to add a new function.

![Image](../../../static/img/Feature-Update-Install-With-Tracking/image_79.png)

Search and select the `Set Custom Field` function.

![Image](../../../static/img/Feature-Update-Install-With-Tracking/image_49.png)

![Image](../../../static/img/Feature-Update-Install-With-Tracking/image_50.png)

Search and select the `Feature Update Install Failure` custom field.

![Image](../../../static/img/Feature-Update-Install-With-Tracking/image_51.png)

Type `Installation Failure/Error` in the `Value` box and click the `Save` button.

![Image](../../../static/img/Feature-Update-Install-With-Tracking/image_80.png)

![Image](../../../static/img/Feature-Update-Install-With-Tracking/image_81.png)

#### Row 11g Function: Script Exit

Click the `Add Row` button inside the external `If Then` logic to add a new function.

![Image](../../../static/img/Feature-Update-Install-With-Tracking/image_82.png)

Select the `Script Exit` function.

![Image](../../../static/img/Feature-Update-Install-With-Tracking/image_83.png)

Type `Error Log Content: %Output%` in the Error Message field and click the `Save` button.

![Image](../../../static/img/Feature-Update-Install-With-Tracking/image_84.png)

![Image](../../../static/img/Feature-Update-Install-With-Tracking/image_85.png)

This is how Step 11 should look after completion.

![Image](../../../static/img/Feature-Update-Install-With-Tracking/image_86.png)

### Step 12 Logic: If Then Else

Add a new `If/Then/Else` logic from the Add Logic dropdown menu. **Make sure to not click on the one that is part of row 11.**

![Image](../../../static/img/Feature-Update-Install-With-Tracking/image_87.png)

![Image](../../../static/img/Feature-Update-Install-With-Tracking/image_88.png)

### Step 12a Condition: Value Equals

Select `Value` from the first dropdown menu in the `Output Contains` condition.

![Image](../../../static/img/Feature-Update-Install-With-Tracking/image_89.png)

Type `%reboot%` and press enter in the `Enter Value` field.

![Image](../../../static/img/Feature-Update-Install-With-Tracking/image_90.png)

Select `Equals` from the condition dropdown menu.

![Image](../../../static/img/Feature-Update-Install-With-Tracking/image_91.png)

Type `True` and press Enter in the `Input Value or Variable` field.

![Image](../../../static/img/Feature-Update-Install-With-Tracking/image_92.png)

![Image](../../../static/img/Feature-Update-Install-With-Tracking/image_93.png)

### Step 12b Function: PowerShell Script

Add a new row in the `If` section by clicking the `Add Row` button.

![Image](../../../static/img/Feature-Update-Install-With-Tracking/image_94.png)

![Image](../../../static/img/Feature-Update-Install-With-Tracking/image_95.png)

Search and select the `PowerShell Script` in the newly added row.

![Image](../../../static/img/Feature-Update-Install-With-Tracking/image_96.png)

![Image](../../../static/img/Feature-Update-Install-With-Tracking/image_97.png)

Paste in the following PowerShell script, set the expected time of script execution to `300` seconds, and click the `Save` button.

```
shutdown /f /r /t 00
```

![Image](../../../static/img/Feature-Update-Install-With-Tracking/image_98.png)

Mark the `Continue on Failure` checkbox.

![Image](../../../static/img/Feature-Update-Install-With-Tracking/image_26.png)

### Step 12c Function: PowerShell Script

Add a new row in the `If` section by clicking the `Add Row` button.

![Image](../../../static/img/Feature-Update-Install-With-Tracking/image_99.png)

![Image](../../../static/img/Feature-Update-Install-With-Tracking/image_100.png)

Search and select the `PowerShell Script` in the newly added row.

![Image](../../../static/img/Feature-Update-Install-With-Tracking/image_96.png)

![Image](../../../static/img/Feature-Update-Install-With-Tracking/image_97.png)

Paste in the following PowerShell script, set the expected time of script execution to `610` seconds, and click the `Save` button.

```
Start-Sleep 600
```

![Image](../../../static/img/Feature-Update-Install-With-Tracking/image_101.png)

Mark the `Continue on Failure` checkbox.

![Image](../../../static/img/Feature-Update-Install-With-Tracking/image_26.png)

### Step 12d Function: PowerShell Script

Add a new row in the `If` section by clicking the `Add Row` button.

![Image](../../../static/img/Feature-Update-Install-With-Tracking/image_102.png)

![Image](../../../static/img/Feature-Update-Install-With-Tracking/image_103.png)

Search and select the `PowerShell Script` in the newly added row.

![Image](../../../static/img/Feature-Update-Install-With-Tracking/image_96.png)

![Image](../../../static/img/Feature-Update-Install-With-Tracking/image_97.png)

Paste in the following PowerShell script, set the expected time of script execution to `300` seconds, and click the `Save` button.

```
$osinfo = Get-CimInstance -ClassName Win32_OperatingSystem
if ( $osinfo.buildnumber -ge '20000' ) { [Version]$osinfo.version -ge [Version]'@Win11LatestBuild@' } else  { [Version]$osinfo.Version -ge [Version]'@Win10LatestBuild@' }
```

![Image](../../../static/img/Feature-Update-Install-With-Tracking/image_104.png)

Mark the `Continue on Failure` checkbox.

![Image](../../../static/img/Feature-Update-Install-With-Tracking/image_26.png)

This is how Step 12 should look after adding the above-mentioned PowerShell script steps.

![Image](../../../static/img/Feature-Update-Install-With-Tracking/image_105.png)

### Completed Script

**Step 1:**

![Image](../../../static/img/Feature-Update-Install-With-Tracking/image_106.png)

**Step 2:**

**Step 3:**

![Image](../../../static/img/Feature-Update-Install-With-Tracking/image_107.png)

**Step 4:**

![Image](../../../static/img/Feature-Update-Install-With-Tracking/image_108.png)

**Step 5:**

![Image](../../../static/img/Feature-Update-Install-With-Tracking/image_109.png)

**Step 6:**

![Image](../../../static/img/Feature-Update-Install-With-Tracking/image_110.png)

**Step 7:**

![Image](../../../static/img/Feature-Update-Install-With-Tracking/image_111.png)

**Step 8:**

![Image](../../../static/img/Feature-Update-Install-With-Tracking/image_112.png)

**Step 9:**

![Image](../../../static/img/Feature-Update-Install-With-Tracking/image_113.png)

**Step 10:**

![Image](../../../static/img/Feature-Update-Install-With-Tracking/image_114.png)

**Step 11:**

![Image](../../../static/img/Feature-Update-Install-With-Tracking/image_115.png)

![Image](../../../static/img/Feature-Update-Install-With-Tracking/image_116.png)

![Image](../../../static/img/Feature-Update-Install-With-Tracking/image_117.png)

**Step 12:**

![Image](../../../static/img/Feature-Update-Install-With-Tracking/image_118.png)

![Image](../../../static/img/Feature-Update-Install-With-Tracking/image_119.png)

![Image](../../../static/img/Feature-Update-Install-With-Tracking/image_120.png)

## Deployment

- Go to `Automation` > `Tasks.`
- Search for `Feature Update Install with Tracking` Task.
- Select the concerned task.
- Click on the `Schedule` button to schedule the task/script.

![Image](../../../static/img/Feature-Update-Install-With-Tracking/image_121.png)

This screen will appear.

![Image](../../../static/img/Feature-Update-Install-With-Tracking/image_122.png)

Click the `Does not repeat` button.

![Image](../../../static/img/Feature-Update-Install-With-Tracking/image_123.png)

This pop-up box will appear.

![Image](../../../static/img/Feature-Update-Install-With-Tracking/image_124.png)

Click the `OK` button to run the task once per day.

![Image](../../../static/img/Feature-Update-Install-With-Tracking/image_125.png)

Select the relevant time to execute the script. It is suggested to run this task after hours.

![Image](../../../static/img/Feature-Update-Install-With-Tracking/image_126.png)

Leave the parameters as they are unless your requirement is to restart the computer forcefully. Select `True` for the `Reboot` parameter to restart the computer during script run. Be careful with the script run time, especially with the `Reboot` parameter set to `True`.

![Image](../../../static/img/Feature-Update-Install-With-Tracking/image_127.png)

Search and select the `Feature Pack Update Automation` group in the `Resources`.

![Image](../../../static/img/Feature-Update-Install-With-Tracking/image_128.png)

Clicking the `Run` button will initiate the schedule.

![Image](../../../static/img/Feature-Update-Install-With-Tracking/image_129.png)

The task will start appearing in the Scheduled Tasks.

![Image](../../../static/img/Feature-Update-Install-With-Tracking/image_130.png)

![Image](../../../static/img/Feature-Update-Install-With-Tracking/image_131.png)

The `Suspend` option can be used to `suspend/stop` the schedule.

![Image](../../../static/img/Feature-Update-Install-With-Tracking/image_132.png)

![Image](../../../static/img/Feature-Update-Install-With-Tracking/image_133.png)

## Output

- Script Log
- Custom Field



