---
id: 'f52aada4-6207-4766-9b7c-24d022812e3c'
slug: /f52aada4-6207-4766-9b7c-24d022812e3c
title: 'Disable FastBoot'
title_meta: 'Disable FastBoot'
keywords: ['disable', 'fastboot', 'windows', 'registry', 'script']
description: 'This document provides a comprehensive guide on how to implement a script that modifies registry keys to disable fastboot on Windows workstations, ensuring optimal system performance. The guide includes sample runs, dependencies, task creation steps, and deployment instructions.'
tags: ['performance', 'registry', 'windows']
draft: false
unlisted: false
---

## Summary

The script will attempt to modify the registry keys to disable fastboot on the Windows workstations if it is not already disabled.

## Sample Run

![Sample Run 1](../../../static/img/docs/df5b7a85-683f-4fd6-9a24-4fc836ccfd8a/image_14.webp)  
![Sample Run 2](../../../static/img/docs/df5b7a85-683f-4fd6-9a24-4fc836ccfd8a/image_15.webp)  

## Dependencies

- [Custom Field - Company - Disable_FastBoot](/docs/9c1d0f0a-7ae4-46bd-a9a7-ae15df2ca633)  
- [Custom Field - Endpoint - FastBoot_Disabled](/docs/3c87c303-e892-4f6b-889f-acde66928978)  
- [Custom Field - Endpoint - Disable_Fastboot_Exclusion](/docs/b17237cc-d3cf-42a9-84fe-eda8d00bdd19)  
- [Custom Field - Site - Disable_Fastboot_Exclusion](/docs/693eeb66-9fb2-4653-8cf3-e23fb53c0f56)  
- [Device Group - Disable FastBoot](/docs/df5b7a85-683f-4fd6-9a24-4fc836ccfd8a)

## Task Creation

Create a new `Script Editor` style script in the system to implement this task.

![Task Creation 1](../../../static/img/docs/df5b7a85-683f-4fd6-9a24-4fc836ccfd8a/image_16.webp)  
![Task Creation 2](../../../static/img/docs/df5b7a85-683f-4fd6-9a24-4fc836ccfd8a/image_17.webp)  

**Name:** Disable FastBoot  
**Description:** The script will attempt to modify the registry keys to disable fastboot on the Windows workstations if it is not already disabled.  
**Category:** Custom  
![Task Creation 3](../../../static/img/docs/df5b7a85-683f-4fd6-9a24-4fc836ccfd8a/image_18.webp)  

## Task

1. Start by adding a row. You can do this by clicking the `Add Row` button at the bottom of the script page.  
   ![Add Row](../../../static/img/docs/df5b7a85-683f-4fd6-9a24-4fc836ccfd8a/image_19.webp)  
   This function will appear.  
   ![Function Appears](../../../static/img/docs/df5b7a85-683f-4fd6-9a24-4fc836ccfd8a/image_20.webp)  

### Row 1 Function: PowerShell Script

Search and select the `PowerShell Script` function.  
![Select PowerShell Script 1](../../../static/img/docs/df5b7a85-683f-4fd6-9a24-4fc836ccfd8a/image_21.webp)  
![Select PowerShell Script 2](../../../static/img/docs/df5b7a85-683f-4fd6-9a24-4fc836ccfd8a/image_22.webp)  
![Select PowerShell Script 3](../../../static/img/docs/df5b7a85-683f-4fd6-9a24-4fc836ccfd8a/image_23.webp)  

Paste in the following PowerShell script and set the expected time of script execution to `300` seconds. Click the `Save` button.

```powershell
$registryPath = 'HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Power'
if (Test-Path $registryPath) {
    $hiberbootEnabled = Get-ItemProperty -Path $registryPath -Name HiberbootEnabled -ErrorAction SilentlyContinue
    if ($hiberbootEnabled.HiberbootEnabled -eq 1) {
        Set-ItemProperty -Path $registryPath -Name HiberbootEnabled -Value 0
        $hiberbootEnabled = Get-ItemProperty -Path $registryPath -Name HiberbootEnabled -ErrorAction SilentlyContinue
        if ($hiberbootEnabled.HiberbootEnabled -ne 0) {
            return 'Failed'
        } else {
            return 'Success'
        }
    } else {
        return 'Success'
    }
} else {
    return 'Success'
}
```

### Row 2 Logic: If Then Else

![Row 2 Logic](../../../static/img/docs/df5b7a85-683f-4fd6-9a24-4fc836ccfd8a/image_24.webp)  
![Row 2 Logic 2](../../../static/img/docs/df5b7a85-683f-4fd6-9a24-4fc836ccfd8a/image_25.webp)  

#### Row 2a Condition: Output Contains

Type `Success` in the `Input Value or Variable` field and press `Enter`.  
![Output Contains](../../../static/img/docs/df5b7a85-683f-4fd6-9a24-4fc836ccfd8a/image_26.webp)  

#### Row 2b Function: Set Custom Field

Add a new row by clicking on the `Add row` button.  
![Add Row 2](../../../static/img/docs/df5b7a85-683f-4fd6-9a24-4fc836ccfd8a/image_27.webp)  

Search and select the `Set Custom Field` function.  
![Select Set Custom Field 1](../../../static/img/docs/df5b7a85-683f-4fd6-9a24-4fc836ccfd8a/image_28.webp)  
![Select Set Custom Field 2](../../../static/img/docs/df5b7a85-683f-4fd6-9a24-4fc836ccfd8a/image_29.webp)  

Search and select `FastBoot_Disabled` in the `Search Custom Field` field, set `True` in the `Value` field, and click the `Save` button.  
![Set FastBoot_Disabled](../../../static/img/docs/df5b7a85-683f-4fd6-9a24-4fc836ccfd8a/image_30.webp)  
![FastBoot Disabled](../../../static/img/docs/df5b7a85-683f-4fd6-9a24-4fc836ccfd8a/image_31.webp)  

#### Row 2d Function: Set Custom Field

Add a new row by clicking on the `Add row` button in the `Else` section.  
![Add Row Else](../../../static/img/docs/df5b7a85-683f-4fd6-9a24-4fc836ccfd8a/image_32.webp)  

Search and select the `Set Custom Field` function.  
![Select Set Custom Field 3](../../../static/img/docs/df5b7a85-683f-4fd6-9a24-4fc836ccfd8a/image_28.webp)  
![Select Set Custom Field 4](../../../static/img/docs/df5b7a85-683f-4fd6-9a24-4fc836ccfd8a/image_29.webp)  

Search and select `FastBoot_Disabled` in the `Search Custom Field` field, set `False` in the `Value` field, and click the `Save` button.  
![Set FastBoot_Disabled False](../../../static/img/docs/df5b7a85-683f-4fd6-9a24-4fc836ccfd8a/image_33.webp)  
![FastBoot Disabled False](../../../static/img/docs/df5b7a85-683f-4fd6-9a24-4fc836ccfd8a/image_34.webp)  

#### Row 2c Function: Script Exit

Add a new row by clicking on the `Add row` button.  
![Add Row Script Exit](../../../static/img/docs/df5b7a85-683f-4fd6-9a24-4fc836ccfd8a/image_35.webp)  

Search and select the `Script Exit` function.  
![Select Script Exit](../../../static/img/docs/df5b7a85-683f-4fd6-9a24-4fc836ccfd8a/image_36.webp)  

The following function will pop up on the screen:  
![Function Pop-up](../../../static/img/docs/df5b7a85-683f-4fd6-9a24-4fc836ccfd8a/image_37.webp)  

Paste the following lines in the `Error Message` field and click the `Save` button.  
```plaintext
Failed to disable FastBoot.
```
![Error Message](../../../static/img/docs/df5b7a85-683f-4fd6-9a24-4fc836ccfd8a/image_38.webp)  

Click the `Save` button at the top-right corner of the screen to save the script.  
![Save Script](../../../static/img/docs/df5b7a85-683f-4fd6-9a24-4fc836ccfd8a/image_39.webp)  

## Completed Script

![Completed Script 1](../../../static/img/docs/df5b7a85-683f-4fd6-9a24-4fc836ccfd8a/image_40.webp)  
![Completed Script 2](../../../static/img/docs/df5b7a85-683f-4fd6-9a24-4fc836ccfd8a/image_41.webp)  

## Deployment

The task should be scheduled to run once per day against the [Disable FastBoot](/docs/df5b7a85-683f-4fd6-9a24-4fc836ccfd8a) device group.

- Go to `Automation` > `Tasks.`
- Search for the `Disable FastBoot` task.
- Select the concerned task.
- Click on the `Schedule` button to schedule the task.  
  ![Schedule Task](../../../static/img/docs/df5b7a85-683f-4fd6-9a24-4fc836ccfd8a/image_42.webp)  
- This screen will appear.  
  ![Schedule Screen](../../../static/img/docs/df5b7a85-683f-4fd6-9a24-4fc836ccfd8a/image_43.webp)  
- Click the `Does not repeat` button.  
  ![Does Not Repeat](../../../static/img/docs/df5b7a85-683f-4fd6-9a24-4fc836ccfd8a/image_44.webp)  
- This pop-up box will appear.  
  ![Pop-up Box](../../../static/img/docs/df5b7a85-683f-4fd6-9a24-4fc836ccfd8a/image_45.webp)  
- Click the `OK` button without making any changes to run the task `Every day`.  
  ![OK Button](../../../static/img/docs/df5b7a85-683f-4fd6-9a24-4fc836ccfd8a/image_46.webp)  
- Recurrence will be updated to `Every Day`.  
  ![Recurrence Updated](../../../static/img/docs/df5b7a85-683f-4fd6-9a24-4fc836ccfd8a/image_47.webp)  
- Select the `Device Groups` option in the `Targeted Resources` section.  
  ![Targeted Resources](../../../static/img/docs/df5b7a85-683f-4fd6-9a24-4fc836ccfd8a/image_48.webp)  
- Search and select the [Disable FastBoot](/docs/df5b7a85-683f-4fd6-9a24-4fc836ccfd8a) device group.  
  ![Select Device Group](../../../static/img/docs/df5b7a85-683f-4fd6-9a24-4fc836ccfd8a/image_49.webp)  
- Now click the `Run` button to initiate the task.  
  ![Run Task](../../../static/img/docs/df5b7a85-683f-4fd6-9a24-4fc836ccfd8a/image_50.webp)  
- The task will start appearing in the Scheduled Tasks.  
  ![Scheduled Tasks 1](../../../static/img/docs/df5b7a85-683f-4fd6-9a24-4fc836ccfd8a/image_51.webp)  
  ![Scheduled Tasks 2](../../../static/img/docs/df5b7a85-683f-4fd6-9a24-4fc836ccfd8a/image_52.webp)  

## Output

- Script Log
- Custom Field