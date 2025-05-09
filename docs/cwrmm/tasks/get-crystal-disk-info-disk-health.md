---
id: '37220488-64d2-4de9-8e65-1cd53f5dee3b'
slug: /37220488-64d2-4de9-8e65-1cd53f5dee3b
title: 'Get Crystal Disk Info (Disk Health)'
title_meta: 'Get Crystal Disk Info (Disk Health)'
keywords: ['disk', 'health', 'monitoring', 'custom', 'field', 'crystal', 'info', 'windows']
description: 'This document describes a script that runs the Crystal Disk Info tool on end machines to fetch and monitor disk health statuses, storing the results in a custom field within ConnectWise RMM for further auditing purposes.'
tags: ['data-collection', 'disk', 'windows']
draft: false
unlisted: false
---

## Summary

The script runs the Crystal Disk Info tool on the end machines and fetches the Disk Health. The data is then formatted and stored in [CW RMM - Custom Field - Crystal Disk Info_Disk Health](/docs/1e713ef3-1378-4601-a00a-c8a8ecd60c01) Custom Field for further auditing and monitoring purposes.

**Output Syntax:** `Harddisk - \\<Model> (Drives: \\<Drive Letter(s)>): Health Status - \\<Status>`

## Sample Run

![Sample Run 1](../../../static/img/docs/37220488-64d2-4de9-8e65-1cd53f5dee3b/image_1.webp)  
![Sample Run 2](../../../static/img/docs/37220488-64d2-4de9-8e65-1cd53f5dee3b/image_2.webp)  
![Sample Run 3](../../../static/img/docs/37220488-64d2-4de9-8e65-1cd53f5dee3b/image_3.webp)  

## Dependencies

- [CW RMM - Custom Field - Crystal Disk Info_Disk Health](/docs/1e713ef3-1378-4601-a00a-c8a8ecd60c01)  
- [EPM - Disk - Agnostic - Get-CrystalDiskInfo](/docs/b08e9cd3-931f-4c70-a084-6193fe3702fb)  

## User Parameters

| Name                | Example | Required | Type          | Description                                                                                                                                          |
|---------------------|---------|----------|---------------|------------------------------------------------------------------------------------------------------------------------------------------------------|
| ReallocatedSector    | 65      | False    | Number Value  | The threshold for the number of reallocated sectors to mark an HDD as `caution` (not applicable to SSDs). The default threshold is 50.            |

![Parameter Example](../../../static/img/docs/37220488-64d2-4de9-8e65-1cd53f5dee3b/image_4.webp)

## Task Creation

Create a new `Script Editor` style script in the system to implement this task.

![Task Creation Step 1](../../../static/img/docs/37220488-64d2-4de9-8e65-1cd53f5dee3b/image_5.webp)  
![Task Creation Step 2](../../../static/img/docs/37220488-64d2-4de9-8e65-1cd53f5dee3b/image_6.webp)  

**Name:** `Get Crystal Disk Info (Disk Health)`  
**Description:** `The script runs the Crystal Disk Info tool on the end machines and fetches the Disk Health.`  
**Category:** `Data Collection`  

![Task Creation Icon](../../../static/img/docs/37220488-64d2-4de9-8e65-1cd53f5dee3b/image_7.webp)

## Parameters

### ReallocatedSector

Add a new parameter by clicking the `Add Parameter` button present at the top-right corner of the screen.

![Add Parameter Step 1](../../../static/img/docs/37220488-64d2-4de9-8e65-1cd53f5dee3b/image_8.webp)  

This screen will appear.  
![Add Parameter Step 2](../../../static/img/docs/37220488-64d2-4de9-8e65-1cd53f5dee3b/image_9.webp)  

- Set `ReallocatedSector` in the `Parameter Name` field.
- Select `Number Value` from the `Parameter Type` dropdown menu.
- Click the `Save` button.

![Parameter Save Example](../../../static/img/docs/37220488-64d2-4de9-8e65-1cd53f5dee3b/image_10.webp)

## Task

Navigate to the Script Editor section and start by adding a row. You can do this by clicking the `Add Row` button at the bottom of the script page.

![Add Row Step](../../../static/img/docs/37220488-64d2-4de9-8e65-1cd53f5dee3b/image_11.webp)  

A blank function will appear.  
![Blank Function](../../../static/img/docs/37220488-64d2-4de9-8e65-1cd53f5dee3b/image_12.webp)  

### Row 1 Function: PowerShell Script

Search and select the `PowerShell Script` function.  

![PowerShell Function Search](../../../static/img/docs/37220488-64d2-4de9-8e65-1cd53f5dee3b/image_13.webp)  
![PowerShell Function Selected](../../../static/img/docs/37220488-64d2-4de9-8e65-1cd53f5dee3b/image_14.webp)  

The following function will pop up on the screen:  
![PowerShell Function Example](../../../static/img/docs/37220488-64d2-4de9-8e65-1cd53f5dee3b/image_15.webp)  

Paste in the following PowerShell script and set the `Expected time of script execution in seconds` to `300` seconds. Click the `Save` button.

```powershell
$model = (Get-CimInstance -ClassName Win32_ComputerSystem).Model
if ( $model -match 'Virtual|Vmware' ) {
    return 'Virtual Machine - Crystal Disk Not Eligible'
}
#region parameters
$reallocatedSector = '@ReallocatedSector@'
if ( $reallocatedSectors -match '^[0-9]{1,4}$' ) {
    $Parameters = @{
        ReallocatedSector = $reallocatedSector
    }
} elseif ( !((Get-PhysicalDisk).Mediatype -match 'SSD') -and ($reallocatedSectors -notmatch '^[0-9]{1,4}$') ) {
    $Parameters = @{
        ReallocatedSector = 50
    }
}
#region Setup - Variables
$ProjectName = 'Get-CrystalDiskInfo'
[Net.ServicePointManager]::SecurityProtocol = [enum]::ToObject([Net.SecurityProtocolType], 3072)
$BaseURL = 'https://file.provaltech.com/repo'
$PS1URL = "$BaseURL/script/$ProjectName.ps1"
$WorkingDirectory = "C:\ProgramData\_automation\script\$ProjectName"
$PS1Path = "$WorkingDirectory\$ProjectName.ps1"
$WorkingPath = $WorkingDirectory
$LogPath = "$WorkingDirectory\$ProjectName-log.txt"
$ErrorLogPath = "$WorkingDirectory\$ProjectName-Error.txt"
#endregion
#region Setup - Folder Structure
New-Item -Path $WorkingDirectory -ItemType Directory -ErrorAction SilentlyContinue | Out-Null
$response = Invoke-WebRequest -Uri $PS1URL -UseBasicParsing
if (($response.StatusCode -ne 200) -and (!(Test-Path -Path $PS1Path))) {
    throw "No pre-downloaded script exists and the script '$PS1URL' failed to download. Exiting."
} elseif ($response.StatusCode -eq 200) {
    Remove-Item -Path $PS1Path -ErrorAction SilentlyContinue
    [System.IO.File]::WriteAllLines($PS1Path, $response.Content)
}
if (!(Test-Path -Path $PS1Path)) {
    throw 'An error occurred and the script was unable to be downloaded. Exiting.'
}
#endregion
#region Execution
if ($Parameters) {
    $disks = & $PS1Path @Parameters
} else {
    $disks = & $PS1Path
}
#endregion
if ( !(Test-Path $LogPath) ) {
    throw 'PowerShell Failure. A Security application seems to have restricted the execution of the PowerShell Script.'
}
if ( $disks ) {
    $op = @()
    foreach ( $disk in $disks ) {
        $op += "Harddisk - $($disk.Model)$(if($disk.'Drive Letter' -match '[A-z]'){' (Drive Letter: ' + $disk.'Drive Letter' + ')'}): Health Status - $($disk.'Health Status')"
    }
    return $op -join '\|'
}
if ( Test-Path $ErrorLogPath ) {
    $ErrorContent = ( Get-Content -Path $ErrorLogPath )
    throw $ErrorContent
}
```

![Script Example](../../../static/img/docs/37220488-64d2-4de9-8e65-1cd53f5dee3b/image_16.webp)  

### Row 2 Function: Script Log

Add a new row by clicking the `Add Row` button.  
![Add Row Step 1](../../../static/img/docs/37220488-64d2-4de9-8e65-1cd53f5dee3b/image_17.webp)  

A blank function will appear.  
![Blank Function](../../../static/img/docs/37220488-64d2-4de9-8e65-1cd53f5dee3b/image_18.webp)  

Search and select the `Script Log` function.  
![Script Log Search](../../../static/img/docs/37220488-64d2-4de9-8e65-1cd53f5dee3b/image_19.webp)  
![Script Log Selected](../../../static/img/docs/37220488-64d2-4de9-8e65-1cd53f5dee3b/image_20.webp)  

The following function will pop up on the screen:  
![Script Log Example](../../../static/img/docs/37220488-64d2-4de9-8e65-1cd53f5dee3b/image_21.webp)  

In the script log message, simply type `%output%` and click the `Save` button.  
![Script Log Save](../../../static/img/docs/37220488-64d2-4de9-8e65-1cd53f5dee3b/image_22.webp)  

### Row 3 Function: Set Custom Field

Add a new row by clicking the `Add Row` button.  
![Add Row Step 2](../../../static/img/docs/37220488-64d2-4de9-8e65-1cd53f5dee3b/image_17.webp)  

A blank function will appear.  
![Blank Function](../../../static/img/docs/37220488-64d2-4de9-8e65-1cd53f5dee3b/image_18.webp)  

Search and select the `Set Custom Field` function.  
![Set Custom Field Search](../../../static/img/docs/37220488-64d2-4de9-8e65-1cd53f5dee3b/image_23.webp)  

The following function will pop up on the screen:  
![Set Custom Field Example](../../../static/img/docs/37220488-64d2-4de9-8e65-1cd53f5dee3b/image_24.webp)  

- Search and select the Computer-Level Custom Field `Crystal Disk Info_Disk Health` from the Custom Field dropdown menu.
- Set `%Output%` in the `Value` field.
- Click the `Save` button.

![Set Custom Field Save 1](../../../static/img/docs/37220488-64d2-4de9-8e65-1cd53f5dee3b/image_25.webp)  
![Set Custom Field Save 2](../../../static/img/docs/37220488-64d2-4de9-8e65-1cd53f5dee3b/image_26.webp)  

Click the `Save` button at the top-right corner of the screen to save the script.  
![Final Save](../../../static/img/docs/37220488-64d2-4de9-8e65-1cd53f5dee3b/image_27.webp)  

## Completed Script

![Completed Script](../../../static/img/docs/37220488-64d2-4de9-8e65-1cd53f5dee3b/image_28.webp)  

## Deployment

It is suggested to run the task once per week against Windows computers.

- Go to `Automation` > `Tasks.`
- Search for the `Crystal Disk Info` Task.
- Select the concerned task.
- Click on the `Schedule` button to schedule the task/script.  
![Schedule Task](../../../static/img/docs/37220488-64d2-4de9-8e65-1cd53f5dee3b/image_29.webp)  

This screen will appear.  
![Schedule Screen](../../../static/img/docs/37220488-64d2-4de9-8e65-1cd53f5dee3b/image_30.webp)  

- Select the relevant time to run the script and click the "Does not repeat" button.  
![Does Not Repeat](../../../static/img/docs/37220488-64d2-4de9-8e65-1cd53f5dee3b/image_31.webp)  

This pop-up box will appear.  
![Pop-up Box](../../../static/img/docs/37220488-64d2-4de9-8e65-1cd53f5dee3b/image_32.webp)  

- Change the number of days to `7` and click `OK`.  
![Change Days](../../../static/img/docs/37220488-64d2-4de9-8e65-1cd53f5dee3b/image_33.webp)  
![Confirm Days](../../../static/img/docs/37220488-64d2-4de9-8e65-1cd53f5dee3b/image_34.webp)  

- Search for `windows` in the `Resources*` and select `Windows Desktops` and `Windows Servers` groups. You can search and select any relevant group you would like to schedule the task against.  
![Select Groups](../../../static/img/docs/37220488-64d2-4de9-8e65-1cd53f5dee3b/image_35.webp)  

- Now click the `Run` button to initiate the task.  
![Run Task](../../../static/img/docs/37220488-64d2-4de9-8e65-1cd53f5dee3b/image_36.webp)  

- The task will start appearing in the Scheduled Tasks.  
![Scheduled Tasks](../../../static/img/docs/37220488-64d2-4de9-8e65-1cd53f5dee3b/image_37.webp)  
![Scheduled Tasks Example](../../../static/img/docs/37220488-64d2-4de9-8e65-1cd53f5dee3b/image_38.webp)  

## Output

- Script log  
![Script Log Output](../../../static/img/docs/37220488-64d2-4de9-8e65-1cd53f5dee3b/image_39.webp)  
- Custom Field  
![Custom Field Output](../../../static/img/docs/37220488-64d2-4de9-8e65-1cd53f5dee3b/image_40.webp)  