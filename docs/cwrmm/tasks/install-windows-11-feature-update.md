---
id: 'b397d199-6675-451a-b2fc-eba5fd57031a'
slug: /b397d199-6675-451a-b2fc-eba5fd57031a
title: 'Install Windows 11 Feature Update [Beta, Reboot]'
title_meta: 'Install Windows 11 Feature Update [Beta, Reboot]'
keywords: ['install', 'feature update', 'upgrade', 'windows', 'windows 11', 'troubleshooting', 'reboot']
description: 'The script automates the installation of the latest Windows 11 Feature Update. It performs comprehensive pre-checks, maintenance, and validation to ensure a smooth upgrade process.'
tags: ['installation', 'update', 'windows']
draft: false
unlisted: false
---

## Summary

This document describes the CW RMM implementation of the agnostic script [Install-WindowsFeatureUpdate](/docs/837e00a9-4fde-4457-9516-591da7ba4da0).

The script automates the installation of the latest Windows 11 Feature Update. It performs comprehensive pre-checks, maintenance, and validation to ensure a smooth upgrade process.

The script supports both Windows 10 and Windows 11:

- For Windows 10, it attempts to upgrade to the latest available version of Windows 11.  
- For Windows 11, it ensures the system is updated to the latest available feature update.

**Important Notes:**

1. The script does not track progress or results. It simply initiates the agnostic script.
2. The computer may restart up to seven times during the process. The agnostic script re-schedules itself through a startup scheduled task to continue the process after each reboot.
3. The `NoReboot` parameter may not reliably prevent reboots. The script attempts to install missing drivers, firmware, and BIOS updates, which may force a restart regardless of this parameter. Use this parameter with caution.
4. It is recommended to initiate the script after business hours and ensure the computer remains connected to AC power. The entire process may take up to six hours in some cases, though it typically completes within two hours.
5. Be aware of [known issues](https://learn.microsoft.com/en-us/windows/release-health/status-windows-11-24h2) with the feature update 24H2 before using the script.

## Requirements

- Windows 10 or Windows 11
- Administrative privileges
- Internet connectivity
- At least 64GB of free space on the system drive
- [Windows 11 Compatible Machine](https://www.microsoft.com/en-us/windows/windows-11-specifications)

## Sample Run

![Image5](../../../static/img/docs/b397d199-6675-451a-b2fc-eba5fd57031a/image5.png)  
![Image6](../../../static/img/docs/b397d199-6675-451a-b2fc-eba5fd57031a/image6.png)  
![Image7](../../../static/img/docs/b397d199-6675-451a-b2fc-eba5fd57031a/image7.png)

## Dependencies

- [Install-WindowsFeatureUpdate](/docs/837e00a9-4fde-4457-9516-591da7ba4da0)

## User Parameters

| Name | Example | Accepted Values | Required | Default | Type | Description |
| ---- | ------- | --------------- | -------- | ------- | ---- | ----------- |
| NoReboot | | | False | | Flag | If enabled, the script will attempt to suppress reboots. However, reboots may still occur due to driver, firmware, or feature update requirements. Use this parameter judiciously. |

## Task Creation

### Script Details

#### Step 1

Navigate to `Automation` ➞ `Tasks`  
![step1](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/step1.png)

#### Step 2

Create a new `Script Editor` style task by choosing the `Script Editor` option from the `Add` dropdown menu  
![step2](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/step2.png)

The `New Script` page will appear on clicking the `Script Editor` button:  
![step3](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/step3.png)

#### Step 3

Fill in the following details in the `Description` section:  

**Name:** `Install Windows 11 Feature Update [Beta, Reboot]`  
**Description:** `The script automates the installation of the latest Windows 11 Feature Update. It performs comprehensive pre-checks, maintenance, and validation to ensure a smooth upgrade process. The script can restart the computer up to seven times.`  
**Category:** `Custom`

![Image1](../../../static/img/docs/b397d199-6675-451a-b2fc-eba5fd57031a/image1.png)

### Parameters

#### NoReboot

Locate the `Add Parameter` button on the right-hand side of the screen and click on it to create a new parameter.  
![AddParameter](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/addparameter.png)

The `Add New Script Parameter` page will appear on clicking the `Add Parameter` button.  
![AddNewScriptParameter](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/addnewscriptparameter.png)

- Set `NoReboot` in the `Parameter Name` field.  
- Select `Flag` from the `Parameter Type` dropdown menu.  
- Click the `Save` button.

![Image2](../../../static/img/docs/b397d199-6675-451a-b2fc-eba5fd57031a/image2.png)

### Script Editor

Click the `Add Row` button in the `Script Editor` section to start creating the script  
![AddRow](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/addrow.png)

A blank function will appear:  
![BlankFunction](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/blankfunction.png)

#### Row 1 Function: PowerShell

Search and select the `PowerShell Script` function.  
![AddPowerShell](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/addpowershellfunction.png)  
![AddedPowerShell](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/addedpowershellfunction.png)  

The following function will pop up on the screen:  
![BlankPowerShell](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/blankpowershellfunction.png)

Paste in the following PowerShell script and set the `Expected time of script execution in seconds` to `7200` seconds. Click the `Save` button.

```PowerShell
#region parameters
$noReboot = '@NoReboot@'
if ( $noReboot -match '1|Yes|True') {
    $Parameters = @{
        NoReboot = $true
    }
}
#endregion
#region Setup - Variables
$ProjectName = 'Install-Windows11FeatureUpdate'
[Net.ServicePointManager]::SecurityProtocol = [enum]::ToObject([Net.SecurityProtocolType], 3072)
Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope Process -Force -Confirm:$false -ErrorAction SilentlyContinue -WarningAction SilentlyContinue
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
    & $PS1Path @Parameters
} else {
    & $PS1Path
}
#endregion
#region log verification
if ( !(Test-Path $LogPath) ) {
    throw 'PowerShell Failure. A Security application seems to have restricted the execution of the PowerShell Script.'
}
if ( Test-Path $ErrorLogPath ) {
    $ErrorContent = ( Get-Content -Path $ErrorLogPath )
    throw $ErrorContent
}
Get-Content -Path $LogPath
#endregion
```

![Image3](../../../static/img/docs/b397d199-6675-451a-b2fc-eba5fd57031a/image3.png)

### Row 2 Function: Script Log

Add a new row by clicking the `Add Row` button.  
![AddRow](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/addrow.png)

A blank function will appear.  
![BlankFunction](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/blankfunction.png)

Search and select the `Script Log` function.  
![AddScriptLogFunction](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/addscriptlogfunction.png)

The following function will pop up on the screen:  
![BlankScriptLogFunction](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/blankscriptlogfunction.png)

In the script log message, simply type `%Output%` and click the `Save` button.  
![OutputScriptLogFunction](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/outputscriptlogfunction.png)

## Save Task

Click the `Save` button at the top-right corner of the screen to save the script.  
![SaveButton](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/savebutton.png)

## Completed Task

![Image4](../../../static/img/docs/b397d199-6675-451a-b2fc-eba5fd57031a/image4.png)

## Output

- Script Log