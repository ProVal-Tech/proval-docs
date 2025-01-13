---
id: 'rmm-microsoft-365-click-to-run-get-details'
title: 'Microsoft 365 - Click-to-Run - Get Details'
title_meta: 'Microsoft 365 - Click-to-Run - Get Details'
keywords: ['microsoft', 'click-to-run', 'office', 'update', 'version', 'auto-update', 'channel']
description: 'This document provides a comprehensive guide on how to retrieve the installed Microsoft Click-to-Run Office version on a machine, verify if auto-update is enabled, and obtain the update channel. The guide includes sample runs, dependencies, task creation steps, and implementation recommendations.'
tags: ['application', 'office', 'update', 'configuration', 'scripting']
draft: false
unlisted: false
---
## Summary

This script retrieves the installed Microsoft Click-to-Run Office version on the machine, verifies whether auto-update is enabled, and obtains the Update channel.

## Sample Run

![Sample Run 1](..\..\..\static\img\Microsoft-365---Click-to-Run---Get-Details\image_5.png)  
![Sample Run 2](..\..\..\static\img\Microsoft-365---Click-to-Run---Get-Details\image_6.png)  

## Dependencies

- [CW RMM - Custom Field - Endpoint - C2R Office Version](https://proval.itglue.com/DOC-5078775-17917395)
- [CW RMM - Custom Field - Endpoint - C2R Auto Update](https://proval.itglue.com/DOC-5078775-17917401)
- [CW RMM - Custom Field - Endpoint - C2R Update Channel](https://proval.itglue.com/DOC-5078775-17917393)
- [CW RMM - Custom Field - Endpoint - C2R Data Collection Time](https://proval.itglue.com/DOC-5078775-17917394)
- [CW RMM - Device Group - Office C2R Auditing](https://proval.itglue.com/DOC-5078775-17917403)

## Task Creation

Create a new `Script Editor` style script in the system to implement this Task.

![Script Editor](..\..\..\static\img\Microsoft-365---Click-to-Run---Get-Details\image_7.png)  
![Script Editor 2](..\..\..\static\img\Microsoft-365---Click-to-Run---Get-Details\image_8.png)  

**Name:** `Microsoft 365 - Click-to-Run - Get Details`  
**Description:** `This script retrieves the installed Microsoft Click-to-Run Office version on the machine, verifies whether auto-update is enabled, and obtains the Update channel.`  
**Category:** Application  
![Category Image](..\..\..\static\img\Microsoft-365---Click-to-Run---Get-Details\image_9.png)  

## Task

Navigate to the Script Editor Section and start by adding a row. You can do this by clicking the `Add Row` button at the bottom of the script page.  
![Add Row](..\..\..\static\img\Microsoft-365---Click-to-Run---Get-Details\image_10.png)  

A blank function will appear.  
![Blank Function](..\..\..\static\img\Microsoft-365---Click-to-Run---Get-Details\image_11.png)  

### Row 1 Function: PowerShell Script

Search and select the `PowerShell Script` function.  
![PowerShell Script](..\..\..\static\img\Microsoft-365---Click-to-Run---Get-Details\image_12.png)  
![PowerShell Script 2](..\..\..\static\img\Microsoft-365---Click-to-Run---Get-Details\image_13.png)  

The following function will pop up on the screen:  
![Function Popup](..\..\..\static\img\Microsoft-365---Click-to-Run---Get-Details\image_14.png)  

Paste in the following PowerShell script and leave the `Expected time of script execution in seconds` to `300` seconds. Click the `Save` button.

```powershell
$C2RInfo = Get-ItemProperty -Path 'HKLM:\\SOFTWARE\\Microsoft\\Office\\ClickToRun\\Configuration' -ErrorAction SilentlyContinue
if ( $C2RInfo ) {
    $version = $C2rInfo.ClientVersionToReport
    $autoUpdate = if ($C2RInfo.CDNBaseUrl) {
        '1'
    } else {
        '0'
    }
    $updateChannel = if ( $C2RInfo.UpdateChannel ) {
        switch ( $C2RInfo.UpdateChannel -replace 'http://officecdn.microsoft.com/pr/', '' ) {
            '492350f6-3a01-4f97-b9c0-c7c6ddf67d60' {
                'Current Channel'
            }
            '55336b82-a18d-4dd6-b5f6-9e5095c314a6' {
                'Monthly Enterprise Channel'
            }
            '7ffbc6bf-bc32-4f92-8982-f9dd17fd3114' {
                'Semi-Annual Enterprise Channel'
            }
            'b8f9b850-328d-4355-9145-c59439a0c4cf' {
                'Semi-Annual Enterprise Channel (Preview)'
            }
            '64256afe-f5d9-4f86-8936-8840a6a4f5be' {
                'Current Channel (Preview)'
            }
            '5440fd1f-7ecb-4221-8110-145efaa6372f' {
                'Beta Channel'
            }
            'f2e724c1-748f-4b47-8fb8-8e0d210e9208' {
                'LTSC Channel (upto Office 2019)'
            }
            '2e148de9-61c8-4051-b103-4af54baffbb4' {
                'LTSC Channel (Preview)'
            }
            '5030841d-c919-4594-8d2d-84ae4f96e58e' {
                'LTSC 2021 Channel (Office 2021+)'
            }
            default {
                'Unknown'
            }
        }
    } else {
        'Not Set'
    }
    $dataCollectionDate = (Get-Date).ToString('yyyy-MM-dd HH:mm:ss')
    return "Version=$version|AutoUpdate=$autoUpdate|UpdateChannel=$updateChannel|DataCollectionDate=$dataCollectionDate"
} else {
    return 'Office C2R is not installed'
}
```

![Next Row](..\..\..\static\img\Microsoft-365---Click-to-Run---Get-Details\image_15.png)  

### Row 2 Function: Set User Variable

Add a new row by clicking the `Add Row` button.  
![Add Row](..\..\..\static\img\Microsoft-365---Click-to-Run---Get-Details\image_16.png)  

Search and Select the `Set User Variable` function.  
![Set User Variable](..\..\..\static\img\Microsoft-365---Click-to-Run---Get-Details\image_17.png)  

The following function will pop up on the screen:  
![Function Popup](..\..\..\static\img\Microsoft-365---Click-to-Run---Get-Details\image_18.png)  

- Set `psout` in the `Variable Name` field.
- Set `%Output%` in the `Value` field.
- Click the `Save` button.  
![Save Button](..\..\..\static\img\Microsoft-365---Click-to-Run---Get-Details\image_19.png)  

![Next Step](..\..\..\static\img\Microsoft-365---Click-to-Run---Get-Details\image_20.png)  

### Row 3 Function: Script Log

Add a new row by clicking the `Add Row` button.  
![Add Row](..\..\..\static\img\Microsoft-365---Click-to-Run---Get-Details\image_16.png)  

A blank function will appear.  
![Blank Function](..\..\..\static\img\Microsoft-365---Click-to-Run---Get-Details\image_21.png)  

Search and select the `Script Log` function.  
![Script Log](..\..\..\static\img\Microsoft-365---Click-to-Run---Get-Details\image_22.png)  

The following function will pop up on the screen:  
![Function Popup](..\..\..\static\img\Microsoft-365---Click-to-Run---Get-Details\image_23.png)  

In the script log message, simply type `%output%` and click the `Save` button.  
![Save Log](..\..\..\static\img\Microsoft-365---Click-to-Run---Get-Details\image_24.png)  

### Row 4 Function: PowerShell Script

Add a new row by clicking the `Add Row` button.  
![Add Row](..\..\..\static\img\Microsoft-365---Click-to-Run---Get-Details\image_16.png)  

Search and select the `PowerShell Script` function.  
![PowerShell Script](..\..\..\static\img\Microsoft-365---Click-to-Run---Get-Details\image_25.png)  

The following function will pop up on the screen:  
![Function Popup](..\..\..\static\img\Microsoft-365---Click-to-Run---Get-Details\image_26.png)  

Paste in the following PowerShell script and leave the `Expected time of script execution in seconds` to `300` seconds. Click the `Save` button.

```powershell
$output = '@psout@'
if ( $output -match 'Version=') {
    return $($($output -split '\|')[0] -split '=')[1]
} else {
    return ''
}
```

![Next Step](..\..\..\static\img\Microsoft-365---Click-to-Run---Get-Details\image_27.png)  

### Row 5 Function: Set Custom Field

Add a new row by clicking the `Add Row` button.  
![Add Row](..\..\..\static\img\Microsoft-365---Click-to-Run---Get-Details\image_16.png)  

Search and Select the `Set Custom Field` function.  
![Set Custom Field](..\..\..\static\img\Microsoft-365---Click-to-Run---Get-Details\image_28.png)  

The following function will pop up on the screen:  
![Function Popup](..\..\..\static\img\Microsoft-365---Click-to-Run---Get-Details\image_29.png)  

- Search and select the Computer-Level Custom Field `C2R Office Version` from the Custom Field dropdown menu.
- Set `%Output%` in the `Value` field.
- Click the `Save` button.  
![Save Button](..\..\..\static\img\Microsoft-365---Click-to-Run---Get-Details\image_30.png)  

Flag the `Continue on Failure` field.  
![Continue on Failure](..\..\..\static\img\Microsoft-365---Click-to-Run---Get-Details\image_31.png)  

### Row 6 Function: PowerShell Script

Add a new row by clicking the `Add Row` button.  
![Add Row](..\..\..\static\img\Microsoft-365---Click-to-Run---Get-Details\image_16.png)  

Search and select the `PowerShell Script` function.  
![PowerShell Script](..\..\..\static\img\Microsoft-365---Click-to-Run---Get-Details\image_25.png)  

The following function will pop up on the screen:  
![Function Popup](..\..\..\static\img\Microsoft-365---Click-to-Run---Get-Details\image_26.png)  

Paste in the following PowerShell script and leave the `Expected time of script execution in seconds` to `300` seconds. Click the `Save` button.

```powershell
$output = '@psout@'
if ( $output -match 'AutoUpdate=') {
    if ($($($output -split '\|')[1] -split '=')[1] -eq 1) {
        return 'Enabled'
    } else {
        return 'Disabled'
    }
} else {
    return ''
}
```

![Next Step](..\..\..\static\img\Microsoft-365---Click-to-Run---Get-Details\image_32.png)  

### Row 7 Function: Set Custom Field

Add a new row by clicking the `Add Row` button.  
![Add Row](..\..\..\static\img\Microsoft-365---Click-to-Run---Get-Details\image_16.png)  

Search and Select the `Set Custom Field` function.  
![Set Custom Field](..\..\..\static\img\Microsoft-365---Click-to-Run---Get-Details\image_28.png)  

The following function will pop up on the screen:  
![Function Popup](..\..\..\static\img\Microsoft-365---Click-to-Run---Get-Details\image_29.png)  

- Search and select the Computer-Level Custom Field `C2R Auto Update` from the Custom Field dropdown menu.
- Set `%Output%` in the `Value` field.
- Click the `Save` button.  
![Save Button](..\..\..\static\img\Microsoft-365---Click-to-Run---Get-Details\image_33.png)  

Flag the `Continue on Failure` field.  
![Continue on Failure](..\..\..\static\img\Microsoft-365---Click-to-Run---Get-Details\image_34.png)  

### Row 8 Function: PowerShell Script

Add a new row by clicking the `Add Row` button.  
![Add Row](..\..\..\static\img\Microsoft-365---Click-to-Run---Get-Details\image_16.png)  

Search and select the `PowerShell Script` function.  
![PowerShell Script](..\..\..\static\img\Microsoft-365---Click-to-Run---Get-Details\image_25.png)  

The following function will pop up on the screen:  
![Function Popup](..\..\..\static\img\Microsoft-365---Click-to-Run---Get-Details\image_26.png)  

Paste in the following PowerShell script and leave the `Expected time of script execution in seconds` to `300` seconds. Click the `Save` button.

```powershell
$output = '@psout@'
if ( $output -match 'UpdateChannel=') {
    return $($($output -split '\|')[2] -split '=')[1]
} else {
    return ''
}
```

![Next Step](..\..\..\static\img\Microsoft-365---Click-to-Run---Get-Details\image_35.png)  

### Row 9 Function: Set Custom Field

Add a new row by clicking the `Add Row` button.  
![Add Row](..\..\..\static\img\Microsoft-365---Click-to-Run---Get-Details\image_16.png)  

Search and Select the `Set Custom Field` function.  
![Set Custom Field](..\..\..\static\img\Microsoft-365---Click-to-Run---Get-Details\image_28.png)  

The following function will pop up on the screen:  
![Function Popup](..\..\..\static\img\Microsoft-365---Click-to-Run---Get-Details\image_29.png)  

- Search and select the Computer-Level Custom Field `C2R Update Channel` from the Custom Field dropdown menu.
- Set `%Output%` in the `Value` field.
- Click the `Save` button.  
![Save Button](..\..\..\static\img\Microsoft-365---Click-to-Run---Get-Details\image_36.png)  

Flag the `Continue on Failure` field.  
![Continue on Failure](..\..\..\static\img\Microsoft-365---Click-to-Run---Get-Details\image_37.png)  

### Row 10 Function: PowerShell Script

Add a new row by clicking the `Add Row` button.  
![Add Row](..\..\..\static\img\Microsoft-365---Click-to-Run---Get-Details\image_16.png)  

Search and select the `PowerShell Script` function.  
![PowerShell Script](..\..\..\static\img\Microsoft-365---Click-to-Run---Get-Details\image_25.png)  

The following function will pop up on the screen:  
![Function Popup](..\..\..\static\img\Microsoft-365---Click-to-Run---Get-Details\image_26.png)  

Paste in the following PowerShell script and leave the `Expected time of script execution in seconds` to `300` seconds. Click the `Save` button.

```powershell
$output = '@psout@'
if ( $output -match 'DataCollectionDate=') {
    return $($($output -split '\|')[3] -split '=')[1]
} else {
    return "$((Get-Date).ToString('yyyy-MM-dd HH:mm:ss'))"
}
```

![Next Step](..\..\..\static\img\Microsoft-365---Click-to-Run---Get-Details\image_38.png)  

### Row 11 Function: Set Custom Field

Add a new row by clicking the `Add Row` button.  
![Add Row](..\..\..\static\img\Microsoft-365---Click-to-Run---Get-Details\image_16.png)  

Search and Select the `Set Custom Field` function.  
![Set Custom Field](..\..\..\static\img\Microsoft-365---Click-to-Run---Get-Details\image_28.png)  

The following function will pop up on the screen:  
![Function Popup](..\..\..\static\img\Microsoft-365---Click-to-Run---Get-Details\image_29.png)  

- Search and select the Computer-Level Custom Field `C2R Data Collection Time` from the Custom Field dropdown menu.
- Set `%Output%` in the `Value` field.
- Click the `Save` button.  
![Save Button](..\..\..\static\img\Microsoft-365---Click-to-Run---Get-Details\image_39.png)  

Flag the `Continue on Failure` field.  
![Continue on Failure](..\..\..\static\img\Microsoft-365---Click-to-Run---Get-Details\image_40.png)  

Click the `Save` button at the top-right corner of the screen to save the script.  
![Final Save](..\..\..\static\img\Microsoft-365---Click-to-Run---Get-Details\image_41.png)  

## Completed Task

![Completed Task 1](..\..\..\static\img\Microsoft-365---Click-to-Run---Get-Details\image_42.png)  
![Completed Task 2](..\..\..\static\img\Microsoft-365---Click-to-Run---Get-Details\image_43.png)  

## Implementation

It is suggested to run the Task once per month against the computers with the `Microsoft 365 Apps` installed.

- Go to `Automation` > `Tasks.`
- Search for [Microsoft 365 - Click-to-Run - Get Details](https://proval.itglue.com/5078775/docs/17917390#version=draft&documentMode=edit) Task.
- Select the concerned task.
- Click on `Schedule` button to schedule the task/script.  
![Schedule Button](..\..\..\static\img\Microsoft-365---Click-to-Run---Get-Details\image_44.png)  

This screen will appear.  
![Schedule Screen](..\..\..\static\img\Microsoft-365---Click-to-Run---Get-Details\image_45.png)  

Select the `Schedule` button and click the calendar-looking button present in front of the `Recurrence` option.  
![Recurrence Option](..\..\..\static\img\Microsoft-365---Click-to-Run---Get-Details\image_46.png)  

Select the `Days(s)` for the `Repeat`, `14` and click the `OK` button to save the schedule.  
![Save Schedule](..\..\..\static\img\Microsoft-365---Click-to-Run---Get-Details\image_47.png)  

Click the `Select Targets` button to select the concerned target.  
![Select Targets](..\..\..\static\img\Microsoft-365---Click-to-Run---Get-Details\image_48.png)  

Search and select the `Office C2R Auditing` Device Group for the target.  
![Device Group](..\..\..\static\img\Microsoft-365---Click-to-Run---Get-Details\image_49.png)  

Click the `Run` button to initiate the schedule.  
![Run Button](..\..\..\static\img\Microsoft-365---Click-to-Run---Get-Details\image_50.png)  

## Output

- Script log  
![Script Log](..\..\..\static\img\Microsoft-365---Click-to-Run---Get-Details\image_51.png)  

- Custom Fields  
![Custom Fields](..\..\..\static\img\Microsoft-365---Click-to-Run---Get-Details\image_52.png)  


