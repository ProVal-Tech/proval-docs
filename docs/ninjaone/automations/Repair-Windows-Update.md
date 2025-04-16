---
id: 'e332f62-ee7a-4559-9672-ac936f5efb88'
slug: /e332f62-ee7a-4559-9672-ac936f5efb88
title: 'Repair Windows Update'
title_meta: 'Repair Windows Update'
keywords:  ['Repair','Update','windows','DISM','SFCScan']
description: 'This is used to reset Windows update settings. It is not necessary that running the script will resolve any issue with the Windows updates. It will simply attempt to reset Windows update settings.'
tags: ['windows']
draft: False
unlisted: false
---

## Overview
This is used to reset Windows update settings. It is not necessary that running the script will resolve any issue with the Windows updates. It will simply attempt to reset Windows update settings.

## Sample Run

`Play Button` > `Run Automation` > `Script`  
![SampleRun1](../../../static/img/ninja-one-automations-common-screenshots/samplerun1.png)

## Dependencies

## Parameters

| Name       | Example | Accepted Values | Required | Default | Type     | Description                                                   |
|------------|---------|-----------------|----------|---------|----------|---------------------------------------------------------------|
| SfcScan    | -       | -               | False    | False   | Checkbox | Toggles an optional SFC scan as a repair option for Windows updates |
| DISMRepair | -       | -               | False    | False   | Checkbox | Toggles an optional DISM repair                               |

## Automation Setup/Import

### Step 1

Navigate to `Administration` > `Library` > `Automation`  
![Step1](../../../static/img/ninja-one-automations-common-screenshots/step1.png)

### Step 2

Locate the `Add` button on the right-hand side of the screen, click on it and click the `New Script` button.  
![Step2](../../../static/img/ninja-one-automations-common-screenshots/step2.png)

The scripting window will open.  
![ScriptingScreen](../../../static/img/ninja-one-automations-common-screenshots/scriptingscreen.png)

**Name:** `Repair Windows Update`  
**Description:** `This is used to reset Windows update settings. It is not necessary that running the script will resolve any issue with the Windows updates. It will simply attempt to reset Windows update settings.`  
**Categories:** `ProVal`  
**Language:** `PowerShell`  
**Operating System:** `Windows`  
**Architecture:** `All`  
**Run As:** `System`  

![ScriptLogic](../../../static/img/NinjaOne-Repair-Windows-Update/image1.png)
```powershell
#region parameters
$SfcScan = $env:SfcScan
$DISMRepair = $env:DISMRepair
 
$Parameters = @{}
 
if ( $SfcScan -match '1|Yes|True' ) {
    $Parameters.Add('SfcScan', $true)
}
if ( $DISMRepair -match '1|Yes|True' ) {
	$Parameters.Add('DISMRepair', $true)
}
#endregion
#region Setup - Variables
$ProjectName = 'Repair-WindowsUpdate'
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
![ScriptLogic](../../../static/img/NinjaOne-Repair-Windows-Update/image2.png)
## Script Variables

Click the `Add` button next to `Script Variables`.  
![AddVariableButton](../../../static/img/ninja-one-automations-common-screenshots/addvariablebutton.png)

Select the `Checkbox` option.  
![Checkbox](../../../static/img/NinjaOne-Repair-Windows-Update/image4.png)

The `Add Checkbox Variable` window will open.  
![Checbox](../../../static/img/NinjaOne-Repair-Windows-Update/image3.png)

In the box, fill in the following details and select `Add` to create the script variable.

**Name:** `SfcScan`  
**Description:** `Toggles an optional SFC scan as a repair option for Windows updates.`  
**Mandatory:** `<Leave it Unchecked>`  
![Checbox](../../../static/img/NinjaOne-Repair-Windows-Update/image5.png)

Add another Script variable and Select the `Checkbox` option. `Add Checkbox Variable` window will open. In the box, fill in the following details and select `Add` to create the script variable.

**Name:** `DISMRepair`  
**Description:** `Toggles an optional DISM repair`  
**Mandatory:** `<Leave it Unchecked>`  
![Checbox](../../../static/img/NinjaOne-Repair-Windows-Update/image6.png)


## Saving the Automation

Click the Save button in the top-right corner of the screen to save your automation.  
![SaveButton](../../../static/img/ninja-one-automations-common-screenshots/savebutton.png)

You will be prompted to enter your MFA code. Provide the code and press the Continue button to finalize the process.  
![MFA](../../../static/img/ninja-one-automations-common-screenshots/mfa.png)

## Completed Automation
![CompleteTask](../../../static/img/NinjaOne-Repair-Windows-Update/image7.png)

## Output

- Activity Details  
