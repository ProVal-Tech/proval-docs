---
id: '97ff1c2c-6782-4bd1-a169-d2aa908c89b4'
slug: /97ff1c2c-6782-4bd1-a169-d2aa908c89b4
title: 'Remove User Profile'
title_meta: 'Remove User Profile'
keywords: ['user', 'profile', 'remove', 'account', 'local']
description: 'This document provides a detailed guide on how to delete a user profile and remove the associated user account in ConnectWise RMM. It includes sample runs, user parameters, task creation steps, and a PowerShell script implementation for the task.'
tags: ['security', 'setup', 'uninstallation', 'windows']
draft: false
unlisted: false
---

## Summary

### <span style={{color: 'red'}}>***This script is destructive and should only be used after fully understanding the implications.***</span>

This script is designed to delete a user profile and remove the user account if it is local. Note that the `SID` and `Username` parameters cannot be used simultaneously.

The `SID` parameter is specifically intended for removing cached or unknown user profiles.
Running the [Unknown User Profiles](/docs/93f21631-9100-46fc-864b-3af17bc91699) script will return the `SID` of the inferred profiles.

<span style={{color: 'Orange'}}> **User Agreement: *"I acknowledge that I am using a destructive script. I understand that any typographical errors could result in the removal of production profiles, and I accept full responsibility for any consequences."*** </span>

It it a ConnectWise RMM implementation of the agnostic script [Remove-UserProfile](/docs/af494143-56df-448c-8f30-44cf93a441ac).

### Notes

- The user must accept the `I_have_read_the_description_and_agree_to_the_user_agreement` parameter while running the script.
- `SID` and `Username` parameters cannot be used simultaneously.
- `PreserveUser` parameter can only be used with the `Username` parameter.
- One user account or profile can be removed using the `Username` parameter at a time. 
- `SID` parameter accepts comma separated list of Security Identifies to remove and can be used to remove multiple user profiles at once.

## Sample Run

![Sample Run 1](../../../static/img/docs/97ff1c2c-6782-4bd1-a169-d2aa908c89b4/image_1.webp)  

**Example 1:** Removing a local user account and profile

![Sample Run 2](../../../static/img/docs/97ff1c2c-6782-4bd1-a169-d2aa908c89b4/Image2.webp) 

**Example 2:** Removing an user profile and preserving the user

![Sample Run 3](../../../static/img/docs/97ff1c2c-6782-4bd1-a169-d2aa908c89b4/Image3.webp) 

**Example 3:** Removing the user profile of a domain user

![Sample Run 4](../../../static/img/docs/97ff1c2c-6782-4bd1-a169-d2aa908c89b4/Image4.webp) 

**Example 4:** Removing multiple unknown/cached user profiles using `SID`

![Sample Run 5](../../../static/img/docs/97ff1c2c-6782-4bd1-a169-d2aa908c89b4/Image5.webp) 

![Sample Run 6](../../../static/img/docs/97ff1c2c-6782-4bd1-a169-d2aa908c89b4/image_3.webp) 

## Dependencies

[Remove-UserProfile](/docs/af494143-56df-448c-8f30-44cf93a441ac)

## User Parameters

| Name          | Example    | Required | Type        | Description  |
|---------------|------------|----------|-------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| UserName      | TestAdmin  | Partially | Text String | The username of the user whose profile is to be removed. Valid entries for this parameter are: <ul><li>username</li><li>./username</li><li>domain/username</li></ul> |
| PreserveUser  | 0/1        | False    | Flag        | Use this switch to preserve the user account after profile deletion. |
| SID | <ul><li>S-1-5-21-3623811015-3361044348-30300820-1013</li><li>S-1-5-21-1173666872-732068812-3818650923-1004, S-1-5-21-1173666872-732068812-3818650923-1008</li></ul> | Partially | Text String | The SID of the user profile to remove. The PreserveUser parameter cannot be used with SID. This parameter can be used when the UserName is not available.<br /><br />**Both UserName and SID cannot be used together** |
| I_have_read_the_description_and_agree_to_the_user_agreement  | 0/1  | True    | Flag        | The script will not run without flagging this checkbox. Marking this checkbox indicates that the user has read the warning and is running the script with caution. |


![User Parameters Image](../../../static/img/docs/97ff1c2c-6782-4bd1-a169-d2aa908c89b4/image_4.webp)

## Task Creation

Create a new `Script Editor` style script in the system to implement this task.  
![Task Creation Image 1](../../../static/img/docs/97ff1c2c-6782-4bd1-a169-d2aa908c89b4/image_5.webp)  
![Task Creation Image 2](../../../static/img/docs/97ff1c2c-6782-4bd1-a169-d2aa908c89b4/image_6.webp)  

**Name:** `Remove User Profile`  
**Description:** `Deletes a user profile and removes the user account if local`  
**Category:** `Custom`  
![Task Creation Image 3](../../../static/img/docs/97ff1c2c-6782-4bd1-a169-d2aa908c89b4/image_7.webp)  

## Parameters

### Username

Add a new parameter by clicking the `Add Parameter` button present at the top-right corner of the screen.  
![Add Username Parameter Image](../../../static/img/docs/97ff1c2c-6782-4bd1-a169-d2aa908c89b4/image_8.webp)  

This screen will appear.  
![Username Parameter Screen](../../../static/img/docs/97ff1c2c-6782-4bd1-a169-d2aa908c89b4/image_9.webp)  
- Set `Username` in the `Parameter Name` field.
- Select `Text String` from the `Parameter Type` dropdown menu.
- Click the `Save` button.

![Username Parameter Image](../../../static/img/docs/97ff1c2c-6782-4bd1-a169-d2aa908c89b4/image_10.webp)  

### PreserveUser

Add a new parameter by clicking the `Add Parameter` button present at the top-right corner of the screen.  
![Add PreserveUser Parameter Image](../../../static/img/docs/97ff1c2c-6782-4bd1-a169-d2aa908c89b4/image_8.webp)  

This screen will appear.  
![PreserveUser Parameter Screen](../../../static/img/docs/97ff1c2c-6782-4bd1-a169-d2aa908c89b4/image_9.webp)  
- Set `PreserveUser` in the `Parameter Name` field.
- Select `Flag` from the `Parameter Type` dropdown menu.
- Click the `Save` button.

![PreserveUser Parameter Image](../../../static/img/docs/97ff1c2c-6782-4bd1-a169-d2aa908c89b4/image_11.webp)  

### SID

Add a new parameter by clicking the `Add Parameter` button present at the top-right corner of the screen.  
![SID Add Parameter Image](../../../static/img/docs/97ff1c2c-6782-4bd1-a169-d2aa908c89b4/image_8.webp)  

This screen will appear.  
![SID Parameter Screen](../../../static/img/docs/97ff1c2c-6782-4bd1-a169-d2aa908c89b4/image_9.webp)  
- Set `SID` in the `Parameter Name` field.
- Select `Text String` from the `Parameter Type` dropdown menu.
- Click the `Save` button.

![SID Parameter Image](../../../static/img/docs/97ff1c2c-6782-4bd1-a169-d2aa908c89b4/Image10.webp)  

### I_have_read_the_description_and_agree_to_the_user_agreement:

Add a new parameter by clicking the `Add Parameter` button present at the top-right corner of the screen.  
![I_have_read_the_description_and_agree_to_the_user_agreement Image](../../../static/img/docs/97ff1c2c-6782-4bd1-a169-d2aa908c89b4/image_8.webp)  

This screen will appear.  
![I_have_read_the_description_and_agree_to_the_user_agreement Parameter Screen](../../../static/img/docs/97ff1c2c-6782-4bd1-a169-d2aa908c89b4/image_9.webp)  
- Set `I_have_read_the_description_and_agree_to_the_user_agreement` in the `Parameter Name` field.
- Enable the `Required Field` button.
- Select `Flag` from the `Parameter Type` dropdown menu.
- Click the `Save` button.

![I_have_read_the_description_and_agree_to_the_user_agreement Parameter Image](../../../static/img/docs/97ff1c2c-6782-4bd1-a169-d2aa908c89b4/Image11.webp)  

## Task

Navigate to the Script Editor section and start by adding a row. You can do this by clicking the `Add Row` button at the bottom of the script page.  
![Add Row Image](../../../static/img/docs/97ff1c2c-6782-4bd1-a169-d2aa908c89b4/image_12.webp)  

A blank function will appear.  
![Blank Function Image](../../../static/img/docs/97ff1c2c-6782-4bd1-a169-d2aa908c89b4/image_13.webp)  

### Row 1 Function: PowerShell Script

Search and select the `PowerShell Script` function.  
![PowerShell Script Selection Image 1](../../../static/img/docs/97ff1c2c-6782-4bd1-a169-d2aa908c89b4/image_14.webp)  
![PowerShell Script Selection Image 2](../../../static/img/docs/97ff1c2c-6782-4bd1-a169-d2aa908c89b4/image_15.webp)  

The following function will pop up on the screen:  
![PowerShell Script Function Image](../../../static/img/docs/97ff1c2c-6782-4bd1-a169-d2aa908c89b4/image_16.webp)  

Paste in the following PowerShell script and set the `Expected time of script execution in seconds` to `300` seconds. Click the `Save` button.

```powershell
#region parameters
$username = '@Username@'
$preserveUser = '@PreserveUser@'
$sid = '@SID@'

if ($null -ne $sid -and $sid -notmatch 'sid' -and $sid -match 'S-\d-\d+-(\d+-){1,14}\d+') {
    if ($sid -match ',' ) {
        $sid = $sid -replace '\s', ''
        $sid = $sid -split ','
    } else {
        $sid = $sid -replace '\s', ''
        $Parameters = @{
            'SID' = $sid
        }
    }
} else {
    $parameters = @{
        'Username' = $username
    }
    if ( $preserveUser -match '1|Yes|True' ) {
        $parameters.Add('PreserveUser', $true)
    }
}

#endregion parameters
#region Setup - Variables
$ProjectName = 'Remove-UserProfile'
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
    foreach ($id in $sid) {
        & $PS1Path -SID $id
    }
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

![PowerShell Script Image](../../../static/img/docs/97ff1c2c-6782-4bd1-a169-d2aa908c89b4/image_17.webp)  

### Row 2 Function: Script Log

Add a new row by clicking the `Add Row` button.  
![Add Script Log Row Image](../../../static/img/docs/97ff1c2c-6782-4bd1-a169-d2aa908c89b4/image_18.webp)  

A blank function will appear.  
![Blank Function Image](../../../static/img/docs/97ff1c2c-6782-4bd1-a169-d2aa908c89b4/image_19.webp)  

Search and select the `Script Log` function.  
![Script Log Selection Image](../../../static/img/docs/97ff1c2c-6782-4bd1-a169-d2aa908c89b4/image_20.webp)  

The following function will pop up on the screen:  
![Script Log Function Image](../../../static/img/docs/97ff1c2c-6782-4bd1-a169-d2aa908c89b4/image_21.webp)  

In the script log message, simply type `%Output%` and click the `Save` button.  
![Save Script Log Image](../../../static/img/docs/97ff1c2c-6782-4bd1-a169-d2aa908c89b4/image_22.webp)  

Click the `Save` button at the top-right corner of the screen to save the script.  
![Save Script Image](../../../static/img/docs/97ff1c2c-6782-4bd1-a169-d2aa908c89b4/image_23.webp)  

## Completed Task

![Completed Task Image](../../../static/img/docs/97ff1c2c-6782-4bd1-a169-d2aa908c89b4/image_24.webp)  

## Output

- Script log