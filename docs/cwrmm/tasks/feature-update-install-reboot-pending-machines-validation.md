---
id: '0c60dc74-ce8f-4332-b19c-d956287d66a7'
slug: /0c60dc74-ce8f-4332-b19c-d956287d66a7
title: 'Feature Update Install (Reboot Pending Machines Validation)'
title_meta: 'Feature Update Install (Reboot Pending Machines Validation)'
keywords: ['feature', 'update', 'install', 'reboot', 'pending', 'machines', 'validation']
description: 'This document outlines a script that monitors computers with pending reboots after executing the Feature Update Install with Tracking task. It verifies whether the update was successful and updates relevant custom fields accordingly.'
tags: ['patching', 'update', 'windows']
draft: false
unlisted: false
---

## Summary

The script runs on machines where the `Feature Update Reboot Pending` custom field is flagged after the execution of the `Feature Update Install With Tracking` task, signifying a pending reboot to finalize the Feature Pack Update. Subsequently, the script updates the `Feature Update Install Failure` custom field with the outcome for monitoring purposes.

The script compares the current operating system build with the latest available build before and after the upgrade, with the latest build requiring manual entry into the script. For any new releases, the build number must be manually set in the script at step 1 for Windows 11 and step 2 for Windows 10.

![Image](../../../static/img/docs/0c60dc74-ce8f-4332-b19c-d956287d66a7/image_1.webp)

## Sample Run

![Image](../../../static/img/docs/0c60dc74-ce8f-4332-b19c-d956287d66a7/image_2.webp)

![Image](../../../static/img/docs/0c60dc74-ce8f-4332-b19c-d956287d66a7/image_3.webp)

## Dependencies

[CW RMM - Task - Feature Update Install With Tracking](/docs/5244ac77-6926-4902-a183-b4b2aac18e2b)  
[CW RMM - Custom Field - Feature Update Install Failure](/docs/1c9abaeb-17f0-4a3b-86ee-953b5b713dc3)  
[CW RMM - Custom Field - Feature Update Reboot Pending](/docs/45e14854-ba83-4737-8264-b5cd809fca56)  

## Create Script

Create a new `Script Editor` style script in the system to implement this Task.

![Image](../../../static/img/docs/0c60dc74-ce8f-4332-b19c-d956287d66a7/image_4.webp)

![Image](../../../static/img/docs/0c60dc74-ce8f-4332-b19c-d956287d66a7/image_5.webp)

**Name:** `Feature Update Install (Reboot Pending Machines Validation)`  
**Description:** `Monitors computers with pending reboots where the Feature Update Install with Tracking script was run but not yet rebooted, verifying the success of the update.`  
**Category:** Patching  

![Image](../../../static/img/docs/0c60dc74-ce8f-4332-b19c-d956287d66a7/image_6.webp)

## Script

Start by adding a row. You can do this by clicking the `Add Row` button at the bottom of the script page.

![Image](../../../static/img/docs/0c60dc74-ce8f-4332-b19c-d956287d66a7/image_7.webp)

### Row 1 Function: Set User Variable

Select the `Set User Variable` function.

![Image](../../../static/img/docs/0c60dc74-ce8f-4332-b19c-d956287d66a7/image_8.webp) ![Image](../../../static/img/docs/0c60dc74-ce8f-4332-b19c-d956287d66a7/image_9.webp)

![Image](../../../static/img/docs/0c60dc74-ce8f-4332-b19c-d956287d66a7/image_10.webp)

Type `Win11LatestBuild` in the `Variable Name` field and `10.0.22631` in the `Value` field. `10.0.22631` is the latest available Feature build for Windows 11 at the moment. Click `Save` to create the `Win11LatestBuild` variable.

![Image](../../../static/img/docs/0c60dc74-ce8f-4332-b19c-d956287d66a7/image_11.webp)

![Image](../../../static/img/docs/0c60dc74-ce8f-4332-b19c-d956287d66a7/image_12.webp)

### Row 2 Function: Set User Variable

Insert a new row by clicking the `Add Row` button.

![Image](../../../static/img/docs/0c60dc74-ce8f-4332-b19c-d956287d66a7/image_13.webp)

Select the `Set User Variable` function.

![Image](../../../static/img/docs/0c60dc74-ce8f-4332-b19c-d956287d66a7/image_8.webp) ![Image](../../../static/img/docs/0c60dc74-ce8f-4332-b19c-d956287d66a7/image_9.webp)

![Image](../../../static/img/docs/0c60dc74-ce8f-4332-b19c-d956287d66a7/image_10.webp)

Type `Win10LatestBuild` in the `Variable Name` field and `10.0.19045` in the `Value` field. `10.0.19045` is the latest available Feature build for Windows 10 at the moment. Click `Save` to create the `Win10LatestBuild` variable.

![Image](../../../static/img/docs/0c60dc74-ce8f-4332-b19c-d956287d66a7/image_14.webp)

![Image](../../../static/img/docs/0c60dc74-ce8f-4332-b19c-d956287d66a7/image_15.webp)

### Row 3 Function: PowerShell Script

Insert a new row by clicking the `Add Row` button.

![Image](../../../static/img/docs/0c60dc74-ce8f-4332-b19c-d956287d66a7/image_13.webp)

Select the `PowerShell Script` function.

![Image](../../../static/img/docs/0c60dc74-ce8f-4332-b19c-d956287d66a7/image_16.webp)

![Image](../../../static/img/docs/0c60dc74-ce8f-4332-b19c-d956287d66a7/image_17.webp)

![Image](../../../static/img/docs/0c60dc74-ce8f-4332-b19c-d956287d66a7/image_18.webp)

Paste in the following PowerShell script, set the expected time of script execution to `300` seconds, and click the `Save` button.

```
$ProgressPreference = 'SilentlyContinue'
[Net.ServicePointManager]::SecurityProtocol = [Enum]::ToObject([Net.SecurityProtocolType], 3072)
Get-PackageProvider -Name NuGet -ForceBootstrap | Out-Null
Set-PSRepository -Name PSGallery -InstallationPolicy Trusted
try {
    Update-Module -Name PendingReboot -ErrorAction Stop
} catch {
    Install-Module -Name PendingReboot -Repository PSGallery -SkipPublisherCheck -Force
    Get-Module -Name PendingReboot -ListAvailable | Where-Object { $_.Version -ne (Get-InstalledModule -Name PendingReboot).Version } | ForEach-Object { Uninstall-Module -Name PendingReboot -MaximumVersion $_.Version }
}
Import-Module -Name PendingReboot 3>&1 2>&1 1>$null
if ((Test-PendingReboot -WarningAction SilentlyContinue).IsRebootPending) { return 'Still Reboot Pending'} else {return 'Good to Proceed'}
```

![Image](../../../static/img/docs/0c60dc74-ce8f-4332-b19c-d956287d66a7/image_19.webp)

Mark the `Continue on Failure` checkbox.

![Image](../../../static/img/docs/0c60dc74-ce8f-4332-b19c-d956287d66a7/image_20.webp)

### Row 4 Logic: If Then

Insert a new `If/Then` logic from the `Add Logic` dropdown menu.

![Image](../../../static/img/docs/0c60dc74-ce8f-4332-b19c-d956287d66a7/image_21.webp)  
![Image](../../../static/img/docs/0c60dc74-ce8f-4332-b19c-d956287d66a7/image_22.webp)

### Row 4a Condition: Output Contains

Type `Good to Proceed` in the Value box and press `Enter`.  
![Image](../../../static/img/docs/0c60dc74-ce8f-4332-b19c-d956287d66a7/image_23.webp)

### Row 4b Function: Set Custom Field

Insert a new row by clicking the `Add Row` button inside the `If Then` logic.  

![Image](../../../static/img/docs/0c60dc74-ce8f-4332-b19c-d956287d66a7/image_24.webp)

![Image](../../../static/img/docs/0c60dc74-ce8f-4332-b19c-d956287d66a7/image_25.webp)

Search and select the `Set Custom Field` function in the new row.  

![Image](../../../static/img/docs/0c60dc74-ce8f-4332-b19c-d956287d66a7/image_26.webp)

![Image](../../../static/img/docs/0c60dc74-ce8f-4332-b19c-d956287d66a7/image_27.webp)

Search and select the `Feature Update Reboot Pending` custom field.  
![Image](../../../static/img/docs/0c60dc74-ce8f-4332-b19c-d956287d66a7/image_28.webp)

Type `False` in the `Value` box and click the Save button.  
![Image](../../../static/img/docs/0c60dc74-ce8f-4332-b19c-d956287d66a7/image_29.webp)  
![Image](../../../static/img/docs/0c60dc74-ce8f-4332-b19c-d956287d66a7/image_30.webp)

### Step 4c Function: PowerShell Script

Insert a new row by clicking the `Add Row` button inside the `If Then` logic.  
![Image](../../../static/img/docs/0c60dc74-ce8f-4332-b19c-d956287d66a7/image_24.webp)

![Image](../../../static/img/docs/0c60dc74-ce8f-4332-b19c-d956287d66a7/image_25.webp)

Search and select the `PowerShell Script` in the newly added row.  
![Image](../../../static/img/docs/0c60dc74-ce8f-4332-b19c-d956287d66a7/image_31.webp)

![Image](../../../static/img/docs/0c60dc74-ce8f-4332-b19c-d956287d66a7/image_32.webp)

![Image](../../../static/img/docs/0c60dc74-ce8f-4332-b19c-d956287d66a7/image_18.webp)

Paste in the following PowerShell script, set the expected time of script execution to `300` seconds, and click the `Save` button.

```
$osinfo = Get-CimInstance -ClassName Win32_OperatingSystem
if ( $osinfo.buildnumber -ge '20000' ) { [Version]$osinfo.version -ge [Version]'@Win11LatestBuild@' } else  { [Version]$osinfo.Version -ge [Version]'@Win10LatestBuild@' }
```

![Image](../../../static/img/docs/0c60dc74-ce8f-4332-b19c-d956287d66a7/image_33.webp)

Mark the `Continue on Failure` checkbox.

![Image](../../../static/img/docs/0c60dc74-ce8f-4332-b19c-d956287d66a7/image_20.webp)

![Image](../../../static/img/docs/0c60dc74-ce8f-4332-b19c-d956287d66a7/image_34.webp)

### Step 4d Logic: If Then

Insert a new `If/Then` logic inside the external `If Then` logic from the `Add Logic` dropdown menu.

![Image](../../../static/img/docs/0c60dc74-ce8f-4332-b19c-d956287d66a7/image_35.webp)

![Image](../../../static/img/docs/0c60dc74-ce8f-4332-b19c-d956287d66a7/image_36.webp)

### Step 4d(i) Condition: Output Contains

Type `False` in the Value box and press `Enter`.  
![Image](../../../static/img/docs/0c60dc74-ce8f-4332-b19c-d956287d66a7/image_37.webp)

### Row 4d(ii) Function: Set Custom Field

Insert a new row by clicking the `Add Row` button inside the internal `If Then` logic.  

![Image](../../../static/img/docs/0c60dc74-ce8f-4332-b19c-d956287d66a7/image_24.webp)

![Image](../../../static/img/docs/0c60dc74-ce8f-4332-b19c-d956287d66a7/image_25.webp)

Search and select the `Set Custom Field` function in the new row.  

![Image](../../../static/img/docs/0c60dc74-ce8f-4332-b19c-d956287d66a7/image_26.webp)

![Image](../../../static/img/docs/0c60dc74-ce8f-4332-b19c-d956287d66a7/image_27.webp)

Search and select the `Feature Update Install Failure` custom field.  
![Image](../../../static/img/docs/0c60dc74-ce8f-4332-b19c-d956287d66a7/image_38.webp)

Type `Installation Failure/Error` in the `Value` box and click the Save button.  
![Image](../../../static/img/docs/0c60dc74-ce8f-4332-b19c-d956287d66a7/image_39.webp)

![Image](../../../static/img/docs/0c60dc74-ce8f-4332-b19c-d956287d66a7/image_40.webp)

### Row 4d(iii) Function: Script Exit

Insert a new row by clicking the `Add Row` button inside the internal `If Then` logic.  
![Image](../../../static/img/docs/0c60dc74-ce8f-4332-b19c-d956287d66a7/image_24.webp)

![Image](../../../static/img/docs/0c60dc74-ce8f-4332-b19c-d956287d66a7/image_25.webp)

Search and select the `Script Exit` function in the new row.  
![Image](../../../static/img/docs/0c60dc74-ce8f-4332-b19c-d956287d66a7/image_41.webp)

Type `Script Failed to install the latest available feature update.` in the Error Message field and click the `Save` button.  
![Image](../../../static/img/docs/0c60dc74-ce8f-4332-b19c-d956287d66a7/image_42.webp)

![Image](../../../static/img/docs/0c60dc74-ce8f-4332-b19c-d956287d66a7/image_43.webp)

![Image](../../../static/img/docs/0c60dc74-ce8f-4332-b19c-d956287d66a7/image_44.webp)

### Step 4e Logic: If Then

Insert a new `If/Then` logic inside the external `If Then` logic from the `Add Logic` dropdown menu.

![Image](../../../static/img/docs/0c60dc74-ce8f-4332-b19c-d956287d66a7/image_35.webp)

![Image](../../../static/img/docs/0c60dc74-ce8f-4332-b19c-d956287d66a7/image_36.webp)

### Step 4e(i) Condition: Output Contains

Type `True` in the Value box and press `Enter`.  
![Image](../../../static/img/docs/0c60dc74-ce8f-4332-b19c-d956287d66a7/image_45.webp)

### Row 4e(ii) Function: Set Custom Field

Insert a new row by clicking the `Add Row` button inside the internal `If Then` logic.  

![Image](../../../static/img/docs/0c60dc74-ce8f-4332-b19c-d956287d66a7/image_24.webp)

![Image](../../../static/img/docs/0c60dc74-ce8f-4332-b19c-d956287d66a7/image_25.webp)

Search and select the `Set Custom Field` function in the new row.  

![Image](../../../static/img/docs/0c60dc74-ce8f-4332-b19c-d956287d66a7/image_26.webp)

![Image](../../../static/img/docs/0c60dc74-ce8f-4332-b19c-d956287d66a7/image_27.webp)

Search and select the `Feature Update Install Failure` custom field.  
![Image](../../../static/img/docs/0c60dc74-ce8f-4332-b19c-d956287d66a7/image_38.webp)

Type ` ` in the `Value` box and click the `Save` button. (There is a single `space` in the `Value` field.)  
![Image](../../../static/img/docs/0c60dc74-ce8f-4332-b19c-d956287d66a7/image_46.webp)

![Image](../../../static/img/docs/0c60dc74-ce8f-4332-b19c-d956287d66a7/image_47.webp)

Click the `Save` button to save the Task.  
![Image](../../../static/img/docs/0c60dc74-ce8f-4332-b19c-d956287d66a7/image_48.webp)

## Completed Script

![Image](../../../static/img/docs/0c60dc74-ce8f-4332-b19c-d956287d66a7/image_49.webp)

![Image](../../../static/img/docs/0c60dc74-ce8f-4332-b19c-d956287d66a7/image_50.webp)

![Image](../../../static/img/docs/0c60dc74-ce8f-4332-b19c-d956287d66a7/image_51.webp)

## Deployment

- Go to `Automation` > `Tasks.`
- Search for `Feature Update Install (Reboot Pending Machines Validation)` task.
- Select the concerned task.
- Click on the `Schedule` button to schedule the task/script.  
![Image](../../../static/img/docs/0c60dc74-ce8f-4332-b19c-d956287d66a7/image_52.webp)

- This screen will appear.  
![Image](../../../static/img/docs/0c60dc74-ce8f-4332-b19c-d956287d66a7/image_53.webp)

- Click the `Does not repeat` button.  
![Image](../../../static/img/docs/0c60dc74-ce8f-4332-b19c-d956287d66a7/image_54.webp)

- This pop-up box will appear.  
![Image](../../../static/img/docs/0c60dc74-ce8f-4332-b19c-d956287d66a7/image_55.webp)

- Click the `OK` button to run the task once per day.  
![Image](../../../static/img/docs/0c60dc74-ce8f-4332-b19c-d956287d66a7/image_56.webp)

- Select the relevant time to execute the script. It is suggested to run this task during working hours, when most of the workstations are online.  
![Image](../../../static/img/docs/0c60dc74-ce8f-4332-b19c-d956287d66a7/image_56.webp)

- Search and select the `Windows Feature Pack Update: Reboot Pending` group in the `Resources`.  
![Image](../../../static/img/docs/0c60dc74-ce8f-4332-b19c-d956287d66a7/image_57.webp)

- Clicking the `Run` button will initiate the schedule.  
![Image](../../../static/img/docs/0c60dc74-ce8f-4332-b19c-d956287d66a7/image_58.webp)

- The task will start appearing in the Scheduled Tasks.  
![Image](../../../static/img/docs/0c60dc74-ce8f-4332-b19c-d956287d66a7/image_59.webp)  
![Image](../../../static/img/docs/0c60dc74-ce8f-4332-b19c-d956287d66a7/image_60.webp)

- The `Suspend` option can be used to `suspend/stop` the schedule.  
![Image](../../../static/img/docs/0c60dc74-ce8f-4332-b19c-d956287d66a7/image_61.webp)  
![Image](../../../static/img/docs/0c60dc74-ce8f-4332-b19c-d956287d66a7/image_62.webp)

## Output

- Custom Field



