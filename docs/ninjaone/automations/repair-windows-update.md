---
id: 'd7bb77e6-e7b8-45d2-9fa7-f109574aa887'
slug: /d7bb77e6-e7b8-45d2-9fa7-f109574aa887
title: 'Repair Windows Update'
title_meta: 'Repair Windows Update'
keywords: ['repair', 'windows', 'update', 'settings', 'script', 'dism', 'sfcscan']
description: 'This document outlines a script designed to repair and reset Windows update settings, aiming to resolve potential patching issues on Windows devices. It details the script’s dependencies, global and user parameters, process, and expected output, including logging of successes and failures.'
tags: ['performance', 'software', 'update', 'windows']
draft: false
unlisted: false
---

## Summary

This script attempts to repair and reset Windows update settings using the ProVal script: [Repair-WindowsUpdate](/docs/39345bfd-d9e2-4e68-9d7a-3e8b443140cc)  
The goal of this script is to fix potential patching issues for Windows devices.

## Sample Run

Select any computer where you want to run the script. Then go to `Play Button` > `Run Automation` > `Script`  
![SampleRun1](../../../static/img/docs/b97b3d2c-ecc6-42ff-9236-36b14765c9b7/samplerun1.webp)  

Search the script name and click on it:  
![SampleRun](../../../static/img/docs/d7bb77e6-e7b8-45d2-9fa7-f109574aa887/image9.webp)  

Select the parameters as per your requirement and then click on `Run`:  
![SampleRun](../../../static/img/docs/d7bb77e6-e7b8-45d2-9fa7-f109574aa887/Image10.webp)  

Click on `Yes` to run the script
![SampleRun](../../../static/img/docs/b97b3d2c-ecc6-42ff-9236-36b14765c9b7/runautomation.webp)

## Dependencies

[Repair-WindowsUpdate](/docs/39345bfd-d9e2-4e68-9d7a-3e8b443140cc)

## Parameters

| Name       | Example | Accepted Values | Required | Default | Type     | Description                                                   |
|------------|---------|-----------------|----------|---------|----------|---------------------------------------------------------------|
| SfcScan    | -       | -               | False    | False   | Checkbox | Toggles an optional SFC scan as a repair option for Windows updates |
| DISMRepair | -       | -               | False    | False   | Checkbox | Toggles an optional DISM repair                               |
| Reboot | -       | -               | False    | False   | Checkbox | If enabled, the script will forcefully restart the computer after completing the repair operations.                               |

## Automation Setup/Import

### Step 1

Navigate to `Administration` > `Library` > `Automation`  
![Step1](../../../static/img/docs/b97b3d2c-ecc6-42ff-9236-36b14765c9b7/step1.webp)

### Step 2

Locate the `Add` button on the right-hand side of the screen, click on it and click the `New Script` button.  
![Step2](../../../static/img/docs/b97b3d2c-ecc6-42ff-9236-36b14765c9b7/step2.webp)

The scripting window will open.  
![ScriptingScreen](../../../static/img/docs/b97b3d2c-ecc6-42ff-9236-36b14765c9b7/scriptingscreen.webp)

**Name:** `Repair Windows Update`  
**Description:** `This is used to reset Windows update settings. It is not necessary that running the script will resolve any issue with the Windows updates. It will simply attempt to reset Windows update settings.`  
**Categories:** `ProVal`  
**Language:** `PowerShell`  
**Operating System:** `Windows`  
**Architecture:** `All`  
**Run As:** `System`  

![ScriptLogic](../../../static/img/docs/d7bb77e6-e7b8-45d2-9fa7-f109574aa887/image1.webp)

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

![ScriptLogic](../../../static/img/docs/d7bb77e6-e7b8-45d2-9fa7-f109574aa887/image2.webp)

## Script Variables

Click the `Add` button next to `Script Variables`.  
![AddVariableButton](../../../static/img/docs/b97b3d2c-ecc6-42ff-9236-36b14765c9b7/addvariablebutton.webp)

Select the `Checkbox` option.  
![Checkbox](../../../static/img/docs/d7bb77e6-e7b8-45d2-9fa7-f109574aa887/image4.webp)

The `Add Checkbox Variable` window will open.  
![Checbox](../../../static/img/docs/d7bb77e6-e7b8-45d2-9fa7-f109574aa887/image3.webp)

In the box, fill in the following details and select `Add` to create the script variable.

**Name:** `SfcScan`  
**Description:** `Toggles an optional SFC scan as a repair option for Windows updates.`  
**Set Default Value:** `<Leave it Unchecked>`  
![Checbox](../../../static/img/docs/d7bb77e6-e7b8-45d2-9fa7-f109574aa887/image5.webp)

Add another Script variable and Select the `Checkbox` option. `Add Checkbox Variable` window will open. In the box, fill in the following details and select `Add` to create the script variable.

**Name:** `DISMRepair`  
**Description:** `Toggles an optional DISM repair`  
**Set Default Value:** `<Leave it Unchecked>`  
![Checbox](../../../static/img/docs/d7bb77e6-e7b8-45d2-9fa7-f109574aa887/image6.webp)

Add another Script variable and Select the `Checkbox` option. `Add Checkbox Variable` window will open. In the box, fill in the following details and select `Add` to create the script variable.

**Name:** `Reboot`  
**Description:** `If enabled, the script will forcefully restart the computer after completing the repair operations.`  
**Set Default Value:** `<Leave it Unchecked>`  
![Checbox](../../../static/img/docs/d7bb77e6-e7b8-45d2-9fa7-f109574aa887/image8.webp)

## Saving the Automation

Click the Save button in the top-right corner of the screen to save your automation.  
![SaveButton](../../../static/img/docs/b97b3d2c-ecc6-42ff-9236-36b14765c9b7/savebutton.webp)

If you are prompted to enter your MFA code, provide the code and press the `Continue` button to finalize the process.  
![MFA](../../../static/img/docs/b97b3d2c-ecc6-42ff-9236-36b14765c9b7/mfa.webp)

## Completed Automation

![CompleteTask](../../../static/img/docs/d7bb77e6-e7b8-45d2-9fa7-f109574aa887/image7.webp)

## Output

- Activity Details  