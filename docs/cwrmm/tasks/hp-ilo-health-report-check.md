---
id: 'e5e4ea6b-1d75-49c9-9569-26a213006bc7'
slug: /e5e4ea6b-1d75-49c9-9569-26a213006bc7
title: 'HP iLO - Health Report - Check'
title_meta: 'HP iLO - Health Report - Check'
keywords: ['hp', 'ilo', 'health', 'report', 'check', 'rmm']
description: 'This document provides a comprehensive guide on implementing a script to check the health status of HP iLO devices using ConnectWise RMM. It includes user parameters, task creation steps, and a sample PowerShell script for execution.'
tags: ['connectwise']
draft: false
unlisted: false
---

## Summary

The script will check and return the health status of the HP iLO devices, writing the output in a script log. It is a CW RMM implementation of [Get-HPiLOHealthReport](/docs/71faa943-e504-4e87-b8d1-39471af44780), an agnostic script.

## Sample Run

![Sample Run 1](../../../static/img/HP-iLO---Health-Report---Check/image_1.png)

![Sample Run 2](../../../static/img/HP-iLO---Health-Report---Check/image_2.png)

![Sample Run 3](../../../static/img/HP-iLO---Health-Report---Check/image_3.png)

## Dependencies

[EPM - Data Collection - Agnostic - Get-HPiLOHealthReport](/docs/71faa943-e504-4e87-b8d1-39471af44780)

## User Parameters

| Name        | Example                     | Required | Type        | Description                                                                                     |
|-------------|-----------------------------|----------|-------------|-------------------------------------------------------------------------------------------------|
| `Address`   | 192.168.2.16, 192.168.7.13:54 | True     | Text String | IP address of the iLO device. Port number must be added if a custom port is being used.       |
| `Username`  | Administrator               | True     | Text String | Admin username to connect with the iLO device.                                               |
| `Password`  | @!#f2GW@f2!$                | True     | Text String | Password for the admin user.                                                                    |

![User Parameters Image](../../../static/img/HP-iLO---Health-Report---Check/image_4.png)

## Task Creation

Create a new `Script Editor` style script in the system to implement this task.

![Task Creation Image 1](../../../static/img/HP-iLO---Health-Report---Check/image_5.png)

![Task Creation Image 2](../../../static/img/HP-iLO---Health-Report---Check/image_6.png)

**Name:** `HP iLO - Health Report - Check`  
**Description:** `The script will check and return the health status of the HP iLO devices, writing the output in a script log.`  
**Category:** Custom

![Task Creation Image 3](../../../static/img/HP-iLO---Health-Report---Check/image_7.png)

## Parameters

### Address:
Add a new parameter by clicking the `Add Parameter` button present at the top-right corner of the screen.

![Add Parameter Image 1](../../../static/img/HP-iLO---Health-Report---Check/image_8.png)

This screen will appear.

![Add Parameter Image 2](../../../static/img/HP-iLO---Health-Report---Check/image_9.png)

- Set `Address` in the `Parameter Name` field.
- Select `Text String` from the `Parameter Type` dropdown menu.
- Enable the `Required Field` button.
- Click the `Save` button.

![Add Parameter Image 3](../../../static/img/HP-iLO---Health-Report---Check/image_10.png)

### Username:
Add a new parameter by clicking the `Add Parameter` button present at the top-right corner of the screen.

![Add Parameter Image 1](../../../static/img/HP-iLO---Health-Report---Check/image_8.png)

This screen will appear.

![Add Parameter Image 2](../../../static/img/HP-iLO---Health-Report---Check/image_9.png)

- Set `Username` in the `Parameter Name` field.
- Select `Text String` from the `Parameter Type` dropdown menu.
- Enable the `Required Field` button.
- Click the `Save` button.

![Add Parameter Image 3](../../../static/img/HP-iLO---Health-Report---Check/image_11.png)

### Password:
Add a new parameter by clicking the `Add Parameter` button present at the top-right corner of the screen.

![Add Parameter Image 1](../../../static/img/HP-iLO---Health-Report---Check/image_8.png)

This screen will appear.

![Add Parameter Image 2](../../../static/img/HP-iLO---Health-Report---Check/image_9.png)

- Set `Password` in the `Parameter Name` field.
- Select `Text String` from the `Parameter Type` dropdown menu.
- Enable the `Required Field` button.
- Click the `Save` button.

![Add Parameter Image 3](../../../static/img/HP-iLO---Health-Report---Check/image_12.png)

## Task

Navigate to the Script Editor section and start by adding a row. You can do this by clicking the `Add Row` button at the bottom of the script page.

![Add Row Image](../../../static/img/HP-iLO---Health-Report---Check/image_13.png)

A blank function will appear.

![Blank Function Image](../../../static/img/HP-iLO---Health-Report---Check/image_14.png)

### Row 1 Function: PowerShell Script
Search and select the `PowerShell Script` function.

![PowerShell Script Selection Image 1](../../../static/img/HP-iLO---Health-Report---Check/image_15.png)

![PowerShell Script Selection Image 2](../../../static/img/HP-iLO---Health-Report---Check/image_16.png)

The following function will pop up on the screen:

![PowerShell Script Function Image](../../../static/img/HP-iLO---Health-Report---Check/image_17.png)

Paste in the following PowerShell script and set the `Expected time of script execution in seconds` to `900` seconds. Click the `Save` button.

```powershell
[Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSAvoidUsingConvertToSecureStringWithPlainText', '')]
[CmdletBinding()]
Param()
### parameters
$Address = '@Address@'
$Username = '@Username@'
$Password = '@Password@'

if ( $Address -match '/SAddress/S' -or ( $null -eq $Address ) )  {
    throw 'Address is not set correctly.'
} elseif ( $Address.Length -lt 2 ) {
    throw 'Address is not set correctly.'
}

if ( $Username -match '/SUsername/S' -or ( $null -eq $Username ) )  {
    throw 'Username is not set.'
} elseif ( $Username.Length -lt 2 ) {
    throw 'Username is not set.'
}

if ( $Password -match '/SPassword/S' -or ( $null -eq $Password ) )  {
    throw 'Password is not set.'
} elseif ( $Password.Length -lt 2 ) {
    throw 'Password is not set.'
}

$SecureString = ConvertTo-SecureString $Password -AsPlainText -Force

$Parameters = @{
    Address = $Address
    Username = $Username
    Password = $SecureString
}

function Write-Script {
    [CmdletBinding()]
    [OutputType([String])]
    param (
        [Parameter()][String]$ProjectName
    )
    [Net.ServicePointManager]::SecurityProtocol = [enum]::ToObject([Net.SecurityProtocolType], 3072)
    $BaseURL = 'https://file.provaltech.com/repo'
    $PS1URL = "$BaseURL/script/$ProjectName.ps1"
    $WorkingDirectory = "C:/ProgramData/_automation/script/$ProjectName"
    $PS1Path = "$WorkingDirectory/$ProjectName.ps1"
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
    return $WorkingDirectory
}

function Confirm-Output {
    [CmdletBinding()]
    param (
        [Parameter()][String]$ProjectName
    )
    $WorkingDirectory = "C:/ProgramData/_automation/script/$ProjectName"
    $LogPath = "$WorkingDirectory/$ProjectName-log.txt"
    $ErrorLogPath = "$WorkingDirectory/$ProjectName-Error.txt"

    if (!(Test-Path $LogPath)) {
        throw 'PowerShell Failure. A security application seems to have restricted the execution of the PowerShell script.'
    }
    if (Test-Path $ErrorLogPath) {
        $ErrorContent = (Get-Content -Path $ErrorLogPath)
        throw $ErrorContent
    }
}

foreach ($ProjectName in ('Update-PowerShellGet', 'Get-HPiLOHealthReport')) {
    $Workingpath = Write-Script -ProjectName $ProjectName
    $PS1Path = "$Workingpath/$ProjectName.ps1"
    if ($ProjectName -eq 'Update-PowerShellGet') {
        & $PS1Path
    } else {
        & $PS1Path @Parameters
    }
    Confirm-Output -ProjectName $ProjectName
}
```

![Row 1 Image](../../../static/img/HP-iLO---Health-Report---Check/image_18.png)

### Row 2 Function: Script Log
Add a new row by clicking the `Add Row` button.

![Add Row Image](../../../static/img/HP-iLO---Health-Report---Check/image_19.png)

A blank function will appear.

![Blank Function Image](../../../static/img/HP-iLO---Health-Report---Check/image_20.png)

Search and select the `Script Log` function.

![Script Log Selection Image](../../../static/img/HP-iLO---Health-Report---Check/image_21.png)

In the script log message, simply type `%output%` and click the `Save` button.

![Script Log Save Image](../../../static/img/HP-iLO---Health-Report---Check/image_22.png)

Click the `Save` button at the top-right corner of the screen to save the script.

![Save Script Image](../../../static/img/HP-iLO---Health-Report---Check/image_23.png)

## Completed Script

![Completed Script Image](../../../static/img/HP-iLO---Health-Report---Check/image_24.png)

## Output

- Script log


