---
id: '0c60dc74-ce8f-4332-b19c-d956287d66a7'
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

![Image](../../../static/img/Feature-Update-Install-(Reboot-Pending-Machines-Validation)/image_1.png)

## Sample Run

![Image](../../../static/img/Feature-Update-Install-(Reboot-Pending-Machines-Validation)/image_2.png)

![Image](../../../static/img/Feature-Update-Install-(Reboot-Pending-Machines-Validation)/image_3.png)

## Dependencies

[CW RMM - Task - Feature Update Install With Tracking](https://proval.itglue.com/DOC-5078775-12947845)  
[CW RMM - Custom Field - Feature Update Install Failure](https://proval.itglue.com/DOC-5078775-14592254)  
[CW RMM - Custom Field - Feature Update Reboot Pending](https://proval.itglue.com/DOC-5078775-14592255)  

## Create Script

Create a new `Script Editor` style script in the system to implement this Task.

![Image](../../../static/img/Feature-Update-Install-(Reboot-Pending-Machines-Validation)/image_4.png)

![Image](../../../static/img/Feature-Update-Install-(Reboot-Pending-Machines-Validation)/image_5.png)

**Name:** `Feature Update Install (Reboot Pending Machines Validation)`  
**Description:** `Monitors computers with pending reboots where the Feature Update Install with Tracking script was run but not yet rebooted, verifying the success of the update.`  
**Category:** Patching  

![Image](../../../static/img/Feature-Update-Install-(Reboot-Pending-Machines-Validation)/image_6.png)

## Script

Start by adding a row. You can do this by clicking the `Add Row` button at the bottom of the script page.

![Image](../../../static/img/Feature-Update-Install-(Reboot-Pending-Machines-Validation)/image_7.png)

### Row 1 Function: Set User Variable

Select `Set User Variable` function.

![Image](../../../static/img/Feature-Update-Install-(Reboot-Pending-Machines-Validation)/image_8.png) ![Image](../../../static/img/Feature-Update-Install-(Reboot-Pending-Machines-Validation)/image_9.png)

![Image](../../../static/img/Feature-Update-Install-(Reboot-Pending-Machines-Validation)/image_10.png)

Type `Win11LatestBuild` in the `Variable Name` field and `10.0.22631` in the `Value` field. `10.0.22631` is the latest available Feature build for Windows 11 at the moment. Click `Save` to create the `Win11LatestBuild` variable.

![Image](../../../static/img/Feature-Update-Install-(Reboot-Pending-Machines-Validation)/image_11.png)

![Image](../../../static/img/Feature-Update-Install-(Reboot-Pending-Machines-Validation)/image_12.png)

### Row 2 Function: Set User Variable

Insert a new row by clicking the `Add Row` button.

![Image](../../../static/img/Feature-Update-Install-(Reboot-Pending-Machines-Validation)/image_13.png)

Select `Set User Variable` function.

![Image](../../../static/img/Feature-Update-Install-(Reboot-Pending-Machines-Validation)/image_8.png) ![Image](../../../static/img/Feature-Update-Install-(Reboot-Pending-Machines-Validation)/image_9.png)

![Image](../../../static/img/Feature-Update-Install-(Reboot-Pending-Machines-Validation)/image_10.png)

Type `Win10LatestBuild` in the `Variable Name` field and `10.0.19045` in the `Value` field. `10.0.19045` is the latest available Feature build for Windows 10 at the moment. Click `Save` to create the `Win10LatestBuild` variable.

![Image](../../../static/img/Feature-Update-Install-(Reboot-Pending-Machines-Validation)/image_14.png)

![Image](../../../static/img/Feature-Update-Install-(Reboot-Pending-Machines-Validation)/image_15.png)

### Row 3 Function: PowerShell Script

Insert a new row by clicking the `Add Row` button.

![Image](../../../static/img/Feature-Update-Install-(Reboot-Pending-Machines-Validation)/image_13.png)

Select `PowerShell Script` function.

![Image](../../../static/img/Feature-Update-Install-(Reboot-Pending-Machines-Validation)/image_16.png)

![Image](../../../static/img/Feature-Update-Install-(Reboot-Pending-Machines-Validation)/image_17.png)

![Image](../../../static/img/Feature-Update-Install-(Reboot-Pending-Machines-Validation)/image_18.png)

Paste in the following PowerShell script, set the expected time of script execution to `300` seconds and click the `Save` button.

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

![Image](../../../static/img/Feature-Update-Install-(Reboot-Pending-Machines-Validation)/image_19.png)

Mark the `Continue on Failure` check box.

![Image](../../../static/img/Feature-Update-Install-(Reboot-Pending-Machines-Validation)/image_20.png)

### Row 4 Logic: If Then

Insert a new `If/Then` logic from the `Add Logic` Dropdown menu.

![Image](../../../static/img/Feature-Update-Install-(Reboot-Pending-Machines-Validation)/image_21.png)  
![Image](../../../static/img/Feature-Update-Install-(Reboot-Pending-Machines-Validation)/image_22.png)

### Row 4a Condition: Output Contains

Type `Good to Proceed` in the Value box and press `Enter`.  
![Image](../../../static/img/Feature-Update-Install-(Reboot-Pending-Machines-Validation)/image_23.png)

### Row 4b Function: Set Custom Field

Insert a new row by clicking the `Add Row` button inside the `If Then` logic.  

![Image](../../../static/img/Feature-Update-Install-(Reboot-Pending-Machines-Validation)/image_24.png)

![Image](../../../static/img/Feature-Update-Install-(Reboot-Pending-Machines-Validation)/image_25.png)

Search and select the `Set Custom Field` function in the new row.  

![Image](../../../static/img/Feature-Update-Install-(Reboot-Pending-Machines-Validation)/image_26.png)

![Image](../../../static/img/Feature-Update-Install-(Reboot-Pending-Machines-Validation)/image_27.png)

Search and select the `Feature Update Reboot Pending` Custom Field.  
![Image](../../../static/img/Feature-Update-Install-(Reboot-Pending-Machines-Validation)/image_28.png)

Type `False` in the `Value` box and click the Save button.  
![Image](../../../static/img/Feature-Update-Install-(Reboot-Pending-Machines-Validation)/image_29.png)  
![Image](../../../static/img/Feature-Update-Install-(Reboot-Pending-Machines-Validation)/image_30.png)

### Step 4c Function: PowerShell Script

Insert a new row by clicking the `Add Row` button inside the `If Then` logic.  
![Image](../../../static/img/Feature-Update-Install-(Reboot-Pending-Machines-Validation)/image_24.png)

![Image](../../../static/img/Feature-Update-Install-(Reboot-Pending-Machines-Validation)/image_25.png)

Search and select the `PowerShell Script` in the newly added row.  
![Image](../../../static/img/Feature-Update-Install-(Reboot-Pending-Machines-Validation)/image_31.png)

![Image](../../../static/img/Feature-Update-Install-(Reboot-Pending-Machines-Validation)/image_32.png)

![Image](../../../static/img/Feature-Update-Install-(Reboot-Pending-Machines-Validation)/image_18.png)

Paste in the following PowerShell script, set the expected time of script execution to `300` seconds and click the `Save` button.

```
$osinfo = Get-CimInstance -ClassName Win32_OperatingSystem
if ( $osinfo.buildnumber -ge '20000' ) { [Version]$osinfo.version -ge [Version]'@Win11LatestBuild@' } else  { [Version]$osinfo.Version -ge [Version]'@Win10LatestBuild@' }
```

![Image](../../../static/img/Feature-Update-Install-(Reboot-Pending-Machines-Validation)/image_33.png)

Mark the `Continue on Failure` check box.

![Image](../../../static/img/Feature-Update-Install-(Reboot-Pending-Machines-Validation)/image_20.png)

![Image](../../../static/img/Feature-Update-Install-(Reboot-Pending-Machines-Validation)/image_34.png)

### Step 4d Logic: If Then

Insert a new `If/Then` logic inside the external `If Then` logic from the `Add Logic` Dropdown menu.

![Image](../../../static/img/Feature-Update-Install-(Reboot-Pending-Machines-Validation)/image_35.png)

![Image](../../../static/img/Feature-Update-Install-(Reboot-Pending-Machines-Validation)/image_36.png)

### Step 4d(i) Condition: Output Contains

Type `False` in the Value box and press `Enter`.  
![Image](../../../static/img/Feature-Update-Install-(Reboot-Pending-Machines-Validation)/image_37.png)

### Row 4d(ii) Function: Set Custom Field

Insert a new row by clicking the `Add Row` button inside the internal `If Then` logic.  

![Image](../../../static/img/Feature-Update-Install-(Reboot-Pending-Machines-Validation)/image_24.png)

![Image](../../../static/img/Feature-Update-Install-(Reboot-Pending-Machines-Validation)/image_25.png)

Search and select the `Set Custom Field` function in the new row.  

![Image](../../../static/img/Feature-Update-Install-(Reboot-Pending-Machines-Validation)/image_26.png)

![Image](../../../static/img/Feature-Update-Install-(Reboot-Pending-Machines-Validation)/image_27.png)

Search and select the `Feature Update Install Failure` Custom Field.  
![Image](../../../static/img/Feature-Update-Install-(Reboot-Pending-Machines-Validation)/image_38.png)

Type `Installation Failure/Error` in the `Value` box and click the Save button.  
![Image](../../../static/img/Feature-Update-Install-(Reboot-Pending-Machines-Validation)/image_39.png)

![Image](../../../static/img/Feature-Update-Install-(Reboot-Pending-Machines-Validation)/image_40.png)

### Row 4d(iii) Function: Script Exit

Insert a new row by clicking the `Add Row` button inside the internal `If Then` logic.  
![Image](../../../static/img/Feature-Update-Install-(Reboot-Pending-Machines-Validation)/image_24.png)

![Image](../../../static/img/Feature-Update-Install-(Reboot-Pending-Machines-Validation)/image_25.png)

Search and select the `Script Exit` function in the new row.  
![Image](../../../static/img/Feature-Update-Install-(Reboot-Pending-Machines-Validation)/image_41.png)

Type `Script Failed to install the latest available feature update.` in the Error Message field and click the `Save` button.  
![Image](../../../static/img/Feature-Update-Install-(Reboot-Pending-Machines-Validation)/image_42.png)

![Image](../../../static/img/Feature-Update-Install-(Reboot-Pending-Machines-Validation)/image_43.png)

![Image](../../../static/img/Feature-Update-Install-(Reboot-Pending-Machines-Validation)/image_44.png)

### Step 4e Logic: If Then

Insert a new `If/Then` logic inside the external `If Then` logic from the `Add Logic` Dropdown menu.

![Image](../../../static/img/Feature-Update-Install-(Reboot-Pending-Machines-Validation)/image_35.png)

![Image](../../../static/img/Feature-Update-Install-(Reboot-Pending-Machines-Validation)/image_36.png)

### Step 4e(i) Condition: Output Contains

Type `True` in the Value box and press `Enter`.  
![Image](../../../static/img/Feature-Update-Install-(Reboot-Pending-Machines-Validation)/image_45.png)

### Row 4e(ii) Function: Set Custom Field

Insert a new row by clicking the `Add Row` button inside the internal `If Then` logic.  

![Image](../../../static/img/Feature-Update-Install-(Reboot-Pending-Machines-Validation)/image_24.png)

![Image](../../../static/img/Feature-Update-Install-(Reboot-Pending-Machines-Validation)/image_25.png)

Search and select the `Set Custom Field` function in the new row.  

![Image](../../../static/img/Feature-Update-Install-(Reboot-Pending-Machines-Validation)/image_26.png)

![Image](../../../static/img/Feature-Update-Install-(Reboot-Pending-Machines-Validation)/image_27.png)

Search and select the `Feature Update Install Failure` Custom Field.  
![Image](../../../static/img/Feature-Update-Install-(Reboot-Pending-Machines-Validation)/image_38.png)

Type ` ` in the `Value` box and click the `Save` button. (There is a single `space` in the `Value` field.)  
![Image](../../../static/img/Feature-Update-Install-(Reboot-Pending-Machines-Validation)/image_46.png)

![Image](../../../static/img/Feature-Update-Install-(Reboot-Pending-Machines-Validation)/image_47.png)

Click the `Save` button to save the Task.  
![Image](../../../static/img/Feature-Update-Install-(Reboot-Pending-Machines-Validation)/image_48.png)

## Completed Script

![Image](../../../static/img/Feature-Update-Install-(Reboot-Pending-Machines-Validation)/image_49.png)

![Image](../../../static/img/Feature-Update-Install-(Reboot-Pending-Machines-Validation)/image_50.png)

![Image](../../../static/img/Feature-Update-Install-(Reboot-Pending-Machines-Validation)/image_51.png)

## Deployment

- Go to `Automation` > `Tasks.`
- Search for `Feature Update Install (Reboot Pending Machines Validation)` Task.
- Select the concerned task.
- Click on `Schedule` button to schedule the task/script.  
![Image](../../../static/img/Feature-Update-Install-(Reboot-Pending-Machines-Validation)/image_52.png)

- This screen will appear.  
![Image](../../../static/img/Feature-Update-Install-(Reboot-Pending-Machines-Validation)/image_53.png)

- Click the `Does not repeat` button.  
![Image](../../../static/img/Feature-Update-Install-(Reboot-Pending-Machines-Validation)/image_54.png)

- This pop-up box will appear.  
![Image](../../../static/img/Feature-Update-Install-(Reboot-Pending-Machines-Validation)/image_55.png)

- Click `OK` button to run the Task once per day.  
![Image](../../../static/img/Feature-Update-Install-(Reboot-Pending-Machines-Validation)/image_56.png)

- Select the relevant time to execute the script. It is suggested to run this task during working hours, when most of the workstations are online.  
![Image](../../../static/img/Feature-Update-Install-(Reboot-Pending-Machines-Validation)/image_56.png)

- Search and select the `Windows Feature Pack Update: Reboot Pending` group in the `Resources`.  
![Image](../../../static/img/Feature-Update-Install-(Reboot-Pending-Machines-Validation)/image_57.png)

- Clicking the `Run` button will initiate the schedule.  
![Image](../../../static/img/Feature-Update-Install-(Reboot-Pending-Machines-Validation)/image_58.png)

- The task will start appearing in the Scheduled Tasks.  
![Image](../../../static/img/Feature-Update-Install-(Reboot-Pending-Machines-Validation)/image_59.png)  
![Image](../../../static/img/Feature-Update-Install-(Reboot-Pending-Machines-Validation)/image_60.png)

- `Suspend` option can be used to `suspend/stop` the schedule.  
![Image](../../../static/img/Feature-Update-Install-(Reboot-Pending-Machines-Validation)/image_61.png)  
![Image](../../../static/img/Feature-Update-Install-(Reboot-Pending-Machines-Validation)/image_62.png)

## Output

- Custom Field











