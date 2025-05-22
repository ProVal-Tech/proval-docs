---
id: '39d1ff3c-effe-4eee-8a28-d745073c5e0f'
slug: /39d1ff3c-effe-4eee-8a28-d745073c5e0f
title: 'Winget Install Application'
title_meta: 'Winget Install Application'
keywords: ['winget', 'install', 'application', 'script', 'windows']
description: 'This document provides a detailed guide on how to create and execute a PowerShell script to install applications using Winget on Windows devices. It includes parameters, dependencies, and step-by-step instructions for script creation and deployment.'
tags: ['installation', 'setup', 'software', 'windows']
draft: false
unlisted: false
---

## Summary

Attempts to install or update an application via Winget.
To get the PackageId and source, you can search in cmd using **"winget search appname"** or by browsing to winget.run

## Sample Run

![Image1](../../../static/img/docs/39d1ff3c-effe-4eee-8a28-d745073c5e0f/image1.webp)

**Example 1:** Installing application without any optional parameters

![Image2](../../../static/img/docs/39d1ff3c-effe-4eee-8a28-d745073c5e0f/image2.webp)

**Example 2:** Installing application with optional parameter

![Image3](../../../static/img/docs/39d1ff3c-effe-4eee-8a28-d745073c5e0f/image3.webp)

![Image4](../../../static/img/docs/39d1ff3c-effe-4eee-8a28-d745073c5e0f/image4.webp)

## Dependencies

[Invoke-WingetProcessor](/docs/8496c2e9-0e52-4961-a1f1-4a95296e8cf7)

## User Parameters

| Name | Example | Accepted Values | Required | Default | Type | Description |
| ---- | ------- | --------------- | -------- | ------- | ---- | ----------- |
| PackageId | `AgileBits.1Password` | | Yes |  | Text String | winget application ID |
| Source | `winget` | `winget`, `msstore` | Yes | | Text String | Specifies winget or msstore as the source for package install |
| OptionalParameter | `--Scope machine --Override "/qn /norestart MANAGED_UPDATE=1"` | | No | | Text String | Specifies option parameters to deploy the application |

## Task Creation

### Script Details

#### Step 1

Navigate to `Automation` ➞ `Tasks`  
![step1](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/step1.webp)

#### Step 2

Create a new `Script Editor` style task by choosing the `Script Editor` option from the `Add` dropdown menu  
![step2](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/step2.webp)

The `New Script` page will appear on clicking the `Script Editor` button:  
![step3](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/step3.webp)

#### Step 3

Fill in the following details in the `Description` section:  

**Name:** `Winget Install Application`  
**Description:**

```PlainText
Attempts to install or update an application via Winget
Parameter:
PackageId = winget application ID (Example: Google.Chrome)
Source could be either 'winget', 'msstore'
To get the PackageId and source, you can search in cmd using "winget search appname" or by browsing to winget.run
```

**Category:** `Application`

![Image5](../../../static/img/docs/39d1ff3c-effe-4eee-8a28-d745073c5e0f/image5.webp)

### Parameters

#### **PackageId**

Locate the `Add Parameter` button on the right-hand side of the screen and click on it to create a new parameter.  
![AddParameter](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/addparameter.webp)

The `Add New Script Parameter` page will appear on clicking the `Add Parameter` button.  
![AddNewScriptParameter](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/addnewscriptparameter.webp)

Configure the parameter as described below:  
**Parameter Name:** `PackageId`  
**Required Field:** `True`  
**Parameter Type:** `Text String`  
**Default Value:** `False`  

Click the `Save` button to add the parameter.  
![Image6](../../../static/img/docs/39d1ff3c-effe-4eee-8a28-d745073c5e0f/image6.webp)

Read the message that will appear after clicking the `Save` button and click the `Confirm` button to save the changes.  
![Image7](../../../static/img/docs/39d1ff3c-effe-4eee-8a28-d745073c5e0f/image7.webp)

#### **Source**

Locate the `Add Parameter` button on the right-hand side of the screen and click on it to create a new parameter.  
![AddParameter](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/addparameter.webp)

The `Add New Script Parameter` page will appear on clicking the `Add Parameter` button.  
![AddNewScriptParameter](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/addnewscriptparameter.webp)

Configure the parameter as described below:  
**Parameter Name:** `Source`  
**Required Field:** `True`  
**Parameter Type:** `Text String`  
**Default Value:** `False`  

Click the `Save` button to add the parameter.  
![Image8](../../../static/img/docs/39d1ff3c-effe-4eee-8a28-d745073c5e0f/image8.webp)

Read the message that will appear after clicking the `Save` button and click the `Confirm` button to save the changes.  
![Image7](../../../static/img/docs/39d1ff3c-effe-4eee-8a28-d745073c5e0f/image7.webp)

#### **OptionalParameter**

Locate the `Add Parameter` button on the right-hand side of the screen and click on it to create a new parameter.  
![AddParameter](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/addparameter.webp)

The `Add New Script Parameter` page will appear on clicking the `Add Parameter` button.  
![AddNewScriptParameter](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/addnewscriptparameter.webp)

Configure the parameter as described below:  
**Parameter Name:** `OptionalParameter`  
**Required Field:** `False`  
**Parameter Type:** `Text String`  
**Default Value:** `False`  

Click the `Save` button to add the parameter.  
![Image9](../../../static/img/docs/39d1ff3c-effe-4eee-8a28-d745073c5e0f/image9.webp)

Read the message that will appear after clicking the `Save` button and click the `Confirm` button to save the changes.  
![Image7](../../../static/img/docs/39d1ff3c-effe-4eee-8a28-d745073c5e0f/image7.webp)

### Script Editor

Click the `Add Row` button in the `Script Editor` section to start creating the script  
![AddRow](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/addrow.webp)

A blank function will appear:  
![BlankFunction](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/blankfunction.webp)

#### **Row 1 Function: PowerShell script**

Search and select the `PowerShell Script` function.  
![AddPowerShell](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/addpowershellfunction.webp)  
![AddedPowerShell](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/addedpowershellfunction.webp)  

The following function will pop up on the screen:  
![BlankPowerShell](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/blankpowershellfunction.webp)

Paste in the following PowerShell script and set the `Expected time of script execution in seconds` to `900` seconds. Click the `Save` button.

```PowerShell
#region parameters
$packageId = '@PackageId@'
$source = '@Source@'
$optionalParameter = '@OptionalParameter@'

$Parameters = @{
    'Install' = $true
    'AllowUpdate' = $true
    'PackageId' = $packageId
    'Source' = $source
}

if (-not [String]::IsNullOrEmpty($optionalParameter) -and $optionalParameter -notmatch 'OptionalParameter') {
    $optionalParameter = $optionalParameter -replace '\s{1,}', ' '
    $pattern = '("[^"]+"|\S+)'
    $optionalParamArray = ([regex]::matches($optionalParameter, $pattern)).Value
    $Parameters.Add('OptionalParameter', $optionalParamArray)
}
#endRegion
#region Setup - Variables
$ProjectName = 'Invoke-WingetProcessor'
[Net.ServicePointManager]::SecurityProtocol = [enum]::ToObject([Net.SecurityProtocolType], 3072)
$BaseURL = 'https://file.provaltech.com/repo'
$PS1URL = "$BaseURL/script/$ProjectName.ps1"
$WorkingDirectory = "C:\ProgramData\_automation\script\$ProjectName"
$PS1Path = "$WorkingDirectory\$ProjectName.ps1"
$Workingpath = $WorkingDirectory
$LogPath = "$WorkingDirectory\$ProjectName-log.txt"
$ErrorLogPath = "$WorkingDirectory\$ProjectName-Error.txt"
#endRegion
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
#endRegion
#region Execution
if ($Parameters) {
    Write-Information ('Parameters Used: {0}' -f ($Parameters | Out-String)) -InformationAction Continue
    & $PS1Path @Parameters
} else {
    & $PS1Path
}
#endRegion
#region log verification
if ( !(Test-Path $LogPath) ) {
    throw 'PowerShell Failure. A Security application seems to have restricted the execution of the PowerShell Script.'
}
if ( Test-Path $ErrorLogPath ) {
    $ErrorContent = ( Get-Content -Path $ErrorLogPath )
    throw ('Error Content: {0}' -f ($ErrorContent | Out-String))
}
$content = Get-Content -Path $LogPath
$logContent = $content[ $($($content.IndexOf($($content -match "$($ProjectName)$")[-1])) + 1)..$($Content.length - 1) ]
return ('Log Content: {0}' -f ($logContent | Out-String))
#endRegion
```

![Image10](../../../static/img/docs/39d1ff3c-effe-4eee-8a28-d745073c5e0f/image10.webp)

#### **Row 2 Function: Script Log**

Add a new row by clicking the `Add Row` button.  
![AddRow](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/addrow.webp)

A blank function will appear.  
![BlankFunction](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/blankfunction.webp)

Search and select the `Script Log` function.  
![AddScriptLogFunction](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/addscriptlogfunction.webp)

The following function will pop up on the screen:  
![BlankScriptLogFunction](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/blankscriptlogfunction.webp)

In the script log message, simply type `%Output%` and click the `Save` button.  
![OutputScriptLogFunction](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/outputscriptlogfunction.webp)

## Save Task

Click the `Save` button at the top-right corner of the screen to save the script.  
![SaveButton](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/savebutton.webp)

## Completed Task

![Image11](../../../static/img/docs/39d1ff3c-effe-4eee-8a28-d745073c5e0f/image11.webp)

## Output

- Script Log
