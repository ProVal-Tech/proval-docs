---
id: '97ff1c2c-6782-4bd1-a169-d2aa908c89b4'
title: 'Remove User Profile'
title_meta: 'Remove User Profile'
keywords: ['user', 'profile', 'remove', 'account', 'local']
description: 'This document provides a detailed guide on how to delete a user profile and remove the associated user account in ConnectWise RMM. It includes sample runs, user parameters, task creation steps, and a PowerShell script implementation for the task.'
tags: ['security', 'setup', 'uninstallation', 'windows']
draft: false
unlisted: false
---
## Summary

Deletes a user profile and removes the user account if local. CW RMM implementation of the agnostic script [Remove-UserProfile](https://proval.itglue.com/DOC-5078775-8475171).

## Sample Run

![Sample Run 1](../../../static/img/Remove-User-Profile/image_1.png)  
![Sample Run 2](../../../static/img/Remove-User-Profile/image_2.png)  
![Sample Run 3](../../../static/img/Remove-User-Profile/image_3.png)  

## Dependencies

[EPM - Accounts - Agnostic - Remove-UserProfile](https://proval.itglue.com/DOC-5078775-8475171)

## User Parameters

| Name          | Example    | Required | Type        | Description                                                                                                                                                                                                                   |
|---------------|------------|----------|-------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| UserName      | TestAdmin  | True     | Text String | The username of the user to remove the profile for. Validated by the following regex: `^(((/.//)|(//w|//-|//.)+//)|)(//w|//.|//-)+$` Valid entries for this parameter are: \<ul>\<li>username\</li>\<li>.//username\</li>\<li>domain//username\</li>\</ul> |
| PreserveUser  | 0/1        | False    | Flag        | Use this switch to preserve the user account after profile deletion.                                                                                                                                                       |

![User Parameters Image](../../../static/img/Remove-User-Profile/image_4.png)

## Task Creation

Create a new `Script Editor` style script in the system to implement this Task.  
![Task Creation Image 1](../../../static/img/Remove-User-Profile/image_5.png)  
![Task Creation Image 2](../../../static/img/Remove-User-Profile/image_6.png)  

**Name:** `Remove User Profile`  
**Description:** `Remove the installed font from the Windows machines. Accepts the '*' wildcard to remove multiple matching fonts.`  
**Category:** `Custom`  
![Task Creation Image 3](../../../static/img/Remove-User-Profile/image_7.png)  

## Parameters

### Username:

Add a new parameter by clicking the `Add Parameter` button present at the top-right corner of the screen.  
![Add Username Parameter Image](../../../static/img/Remove-User-Profile/image_8.png)  

This screen will appear.  
![Username Parameter Screen](../../../static/img/Remove-User-Profile/image_9.png)  
- Set `Username` in the `Parameter Name` field.
- Enable the `Required Field` button.
- Select `Text String` from the `Parameter Type` dropdown menu.
- Click the `Save` button.

![Username Parameter Image](../../../static/img/Remove-User-Profile/image_10.png)  

### Preserveuser:

Add a new parameter by clicking the `Add Parameter` button present at the top-right corner of the screen.  
![Add Preserveuser Parameter Image](../../../static/img/Remove-User-Profile/image_8.png)  

This screen will appear.  
![Preserveuser Parameter Screen](../../../static/img/Remove-User-Profile/image_9.png)  
- Set `Preserveuser` in the `Parameter Name` field.
- Select `Flag` from the `Parameter Type` dropdown menu.
- Click the `Save` button.

![Preserveuser Parameter Image](../../../static/img/Remove-User-Profile/image_11.png)  

## Task Creation

Navigate to the Script Editor Section and start by adding a row. You can do this by clicking the `Add Row` button at the bottom of the script page.  
![Add Row Image](../../../static/img/Remove-User-Profile/image_12.png)  

A blank function will appear.  
![Blank Function Image](../../../static/img/Remove-User-Profile/image_13.png)  

### Row 1 Function: PowerShell Script

Search and select the `PowerShell Script` function.  
![PowerShell Script Selection Image 1](../../../static/img/Remove-User-Profile/image_14.png)  
![PowerShell Script Selection Image 2](../../../static/img/Remove-User-Profile/image_15.png)  

The following function will pop up on the screen:  
![PowerShell Script Function Image](../../../static/img/Remove-User-Profile/image_16.png)  

Paste in the following PowerShell script and set the `Expected time of script execution in seconds` to `300` seconds. Click the `Save` button.

```
#region parameters
$Username = '@Username@'
$PreserveUser = '@PreserveUser@'
$parameters = @{
    Username = $Username
}
if ( $PreserveUser -match '1|Yes|True' ) {
    $parameters.Add('PreserveUser', $true)
}
#endregion parameters
#region Setup - Variables
$ProjectName = 'Remove-UserProfile'
[Net.ServicePointManager]::SecurityProtocol = [enum]::ToObject([Net.SecurityProtocolType], 3072)
$BaseURL = 'https://file.provaltech.com/repo'
$PS1URL = "$BaseURL/script/$ProjectName.ps1"
$WorkingDirectory = "C:/ProgramData/_automation/script/$ProjectName"
$PS1Path = "$WorkingDirectory/$ProjectName.ps1"
$WorkingPath = $WorkingDirectory
$LogPath = "$WorkingDirectory/$ProjectName-log.txt"
$ErrorLogPath = "$WorkingDirectory/$ProjectName-Error.txt"
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

![PowerShell Script Image](../../../static/img/Remove-User-Profile/image_17.png)  

### Row 2 Function: Script Log

Add a new row by clicking the `Add Row` button.  
![Add Script Log Row Image](../../../static/img/Remove-User-Profile/image_18.png)  

A blank function will appear.  
![Blank Function Image](../../../static/img/Remove-User-Profile/image_19.png)  

Search and select the `Script Log` function.  
![Script Log Selection Image](../../../static/img/Remove-User-Profile/image_20.png)  

The following function will pop up on the screen:  
![Script Log Function Image](../../../static/img/Remove-User-Profile/image_21.png)  

In the script log message, simply type `%Output%` and click the `Save` button.  
![Save Script Log Image](../../../static/img/Remove-User-Profile/image_22.png)  

Click the `Save` button at the top-right corner of the screen to save the script.  
![Save Script Image](../../../static/img/Remove-User-Profile/image_23.png)  

## Completed Task

![Completed Task Image](../../../static/img/Remove-User-Profile/image_24.png)  

## Output

- Script log











