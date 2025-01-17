---
id: 'f52aada4-6207-4766-9b7c-24d022812e3c'
title: 'Disable FastBoot Script for Windows Workstations'
title_meta: 'Disable FastBoot Script for Windows Workstations'
keywords: ['disable', 'fastboot', 'windows', 'registry', 'script']
description: 'This document provides a comprehensive guide on how to implement a script that modifies registry keys to disable fastboot on Windows workstations, ensuring optimal system performance. The guide includes sample runs, dependencies, task creation steps, and deployment instructions.'
tags: ['performance', 'registry', 'windows']
draft: false
unlisted: false
---
## Summary

The script will attempt to modify the registry keys to disable fastboot on the Windows workstations if it is not already disabled.

## Sample Run

![Sample Run 1](../../../static/img/Disable-FastBoot/image_14.png)  
![Sample Run 2](../../../static/img/Disable-FastBoot/image_15.png)  

## Dependencies

- [CW RMM - Custom Field - Company - Disable_FastBoot](https://proval.itglue.com/DOC-5078775-16020399) 
- [CW RMM - Custom Field - Endpoint - FastBoot_Disabled](https://proval.itglue.com/DOC-5078775-16020673) 
- [CW RMM - Custom Field - Endpoint - Disable_Fastboot_Exclusion](https://proval.itglue.com/DOC-5078775-16020404) 
- [CW RMM - Custom Field - Site - Disable_Fastboot_Exclusion](https://proval.itglue.com/DOC-5078775-16020405) 
- [CW RMM - Device Group - Disable FastBoot](https://proval.itglue.com/DOC-5078775-16020416) 

## Task Creation

Create a new `Script Editor` style script in the system to implement this Task.

![Task Creation 1](../../../static/img/Disable-FastBoot/image_16.png)  
![Task Creation 2](../../../static/img/Disable-FastBoot/image_17.png)  

**Name:** Disable FastBoot  
**Description:** The script will attempt to modify the registry keys to disable fastboot on the Windows workstations if it is not already disabled.  
**Category:** Custom  
![Task Creation 3](../../../static/img/Disable-FastBoot/image_18.png)  

## Task

1. Start by adding a row. You can do this by clicking the `Add Row` button at the bottom of the script page.  
   ![Add Row](../../../static/img/Disable-FastBoot/image_19.png)  
   This function will appear.  
   ![Function Appears](../../../static/img/Disable-FastBoot/image_20.png)  

### Row 1 Function: PowerShell Script

Search and select the `PowerShell Script` function.  
![Select PowerShell Script 1](../../../static/img/Disable-FastBoot/image_21.png)  
![Select PowerShell Script 2](../../../static/img/Disable-FastBoot/image_22.png)  
![Select PowerShell Script 3](../../../static/img/Disable-FastBoot/image_23.png)  

Paste in the following PowerShell script and set the expected time of script execution to `300` seconds. Click the `Save` button.

```powershell
$registryPath = 'HKLM://SYSTEM//CurrentControlSet//Control//Session Manager//Power'
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

![Row 2 Logic](../../../static/img/Disable-FastBoot/image_24.png)  
![Row 2 Logic 2](../../../static/img/Disable-FastBoot/image_25.png)  

#### Row 2a Condition: Output Contains

Type `Success` in the `Input Value or Variable` field and press `Enter`.  
![Output Contains](../../../static/img/Disable-FastBoot/image_26.png)  

#### Row 2b Function: Set Custom Field

Add a new row by clicking on `Add row` button.  
![Add Row 2](../../../static/img/Disable-FastBoot/image_27.png)  

Search and select `Set Custom Field` Function.  
![Select Set Custom Field 1](../../../static/img/Disable-FastBoot/image_28.png)  
![Select Set Custom Field 2](../../../static/img/Disable-FastBoot/image_29.png)  

Search and select `FastBoot_Disabled` in the `Search Custom Field` field and set `True` in the `Value` field and click the `Save` button.  
![Set FastBoot_Disabled](../../../static/img/Disable-FastBoot/image_30.png)  
![FastBoot Disabled](../../../static/img/Disable-FastBoot/image_31.png)  

#### Row 2d Function: Set Custom Field

Add a new row by clicking on `Add row` button in the `Else` section.  
![Add Row Else](../../../static/img/Disable-FastBoot/image_32.png)  

Search and select `Set Custom Field` Function.  
![Select Set Custom Field 3](../../../static/img/Disable-FastBoot/image_28.png)  
![Select Set Custom Field 4](../../../static/img/Disable-FastBoot/image_29.png)  

Search and select `FastBoot_Disabled` in the `Search Custom Field` field and set `False` in the `Value` field and click the `Save` button.  
![Set FastBoot_Disabled False](../../../static/img/Disable-FastBoot/image_33.png)  
![FastBoot Disabled False](../../../static/img/Disable-FastBoot/image_34.png)  

#### Row 2c Function: Script Exit

Add a new row by clicking on `Add row` button.  
![Add Row Script Exit](../../../static/img/Disable-FastBoot/image_35.png)  

Search and select `Script Exit` Function.  
![Select Script Exit](../../../static/img/Disable-FastBoot/image_36.png)  

Following function will pop-up on to the screen:  
![Function Pop-up](../../../static/img/Disable-FastBoot/image_37.png)  

Paste the following lines in the `Error Message` field and click the `Save` button.  
```plaintext
Failed to disable FastBoot.
```
![Error Message](../../../static/img/Disable-FastBoot/image_38.png)  

Click the `Save` button at the top-right corner of the screen to save the script.  
![Save Script](../../../static/img/Disable-FastBoot/image_39.png)  

## Completed Script

![Completed Script 1](../../../static/img/Disable-FastBoot/image_40.png)  
![Completed Script 2](../../../static/img/Disable-FastBoot/image_41.png)  

## Deployment

The task should be scheduled to run once per day against the [Disable FastBoot](https://proval.itglue.com/DOC-5078775-16020416) device group.

- Go to `Automation` > `Tasks.`
- Search for `Disable FastBoot` Task.
- Select the concerned task.
- Click on `Schedule` button to schedule the task.  
  ![Schedule Task](../../../static/img/Disable-FastBoot/image_42.png)  
- This screen will appear.  
  ![Schedule Screen](../../../static/img/Disable-FastBoot/image_43.png)  
- Click the `Does not repeat` button.  
  ![Does Not Repeat](../../../static/img/Disable-FastBoot/image_44.png)  
- This pop-up box will appear.  
  ![Pop-up Box](../../../static/img/Disable-FastBoot/image_45.png)  
- Click the `OK` button without making any changes to run the task `Every day`.  
  ![OK Button](../../../static/img/Disable-FastBoot/image_46.png)  
- Recurrence will be updated to `Every Day`.  
  ![Recurrence Updated](../../../static/img/Disable-FastBoot/image_47.png)  
- Select the `Device Groups` option in the `Targeted Resources` section.  
  ![Targeted Resources](../../../static/img/Disable-FastBoot/image_48.png)  
- Search and Select the [Disable FastBoot](https://proval.itglue.com/DOC-5078775-16020416) device group.  
  ![Select Device Group](../../../static/img/Disable-FastBoot/image_49.png)  
- Now click the `Run` button to initiate the task.  
  ![Run Task](../../../static/img/Disable-FastBoot/image_50.png)  
- The task will start appearing in the Scheduled Tasks.  
  ![Scheduled Tasks 1](../../../static/img/Disable-FastBoot/image_51.png)  
  ![Scheduled Tasks 2](../../../static/img/Disable-FastBoot/image_52.png)  

## Output

- Script Log
- Custom Field











