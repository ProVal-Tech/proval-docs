---
id: '359dfd23-db61-4c14-99e5-16e3b723ace4'
slug: /359dfd23-db61-4c14-99e5-16e3b723ace4
title: 'Get Specific/Multiple User Audit'
title_meta: 'Get Specific/Multiple User Audit'
keywords: ['user', 'test', 'audit', 'logs', 'SID']
description: 'This script is designed to get the specific or multiple user(s) information (Username, SIDs, and Status).'
tags: []
draft: false
unlisted: false
---

## Summary

This script is designed to get the specific or multiple user(s) information (Username, SIDs, and Status).
Note: If the agent is a Domain Controller, it will audit the domain accounts; otherwise, it will audit the local accounts.

## Sample Run
![Sample Run 1](<../../../static/img/docs/359dfd23-db61-4c14-99e5-16e3b723ace4/image.webp>)
![Sample Run 3](<../../../static/img/docs/359dfd23-db61-4c14-99e5-16e3b723ace4/image-2.webp>)
![Sample Run 4](<../../../static/img/docs/359dfd23-db61-4c14-99e5-16e3b723ace4/image-3.webp>)

## Dependencies

[User-Audit](/docs/b2914f30-25ee-4d74-ac6a-77260b88ddcb)

## User Parameters

| Name              | Example  | Accepted Values       | Required | Default | Type       | Description                                                                                      |
|-------------------|----------|-----------------------|----------|---------|------------|--------------------------------------------------------------------------------------------------|
| UserList_To_Audit | Test,Pro | Test, Test,Pro,System | True     |     | Text String| This parameter should be filled with a pattern to fetch the user list matching the pattern. Multiple user lists can be provided, separated by commas, as shown in the accepted values. |

## Task Creation

Create a new `Script Editor` style script in the system to implement this task.

![Task Creation 1](<../../../static/img/docs/359dfd23-db61-4c14-99e5-16e3b723ace4/{F601A57B-0F63-4EA2-9886-87F58FA5EFC4}.webp>)
![Task Creation 2](<../../../static/img/docs/359dfd23-db61-4c14-99e5-16e3b723ace4/{A69BE110-DAB2-4D46-B675-38F0BD83E4B5}.webp>)

**Name:** `Get Specific/Multiple User Audit`  
**Description:** `This script is designed to get the specific or multiple user information (Username, SIDs, and Status).`  
**Category:** `Security`  

![Task Creation 3](<../../../static/img/docs/359dfd23-db61-4c14-99e5-16e3b723ace4/{235BC59E-798C-4F76-93D1-1E926573A764}.webp>)

## Task

## Parameter

Add a new parameter by clicking the `Add Parameter` button present at the top-right corner of the screen.

![Add Parameter](<../../../static/img/docs/359dfd23-db61-4c14-99e5-16e3b723ace4/{058061B3-5330-41CB-8660-5946EAB2F7C2}.webp>)

This screen will appear.  
![Parameter Screen Image](<../../../static/img/docs/359dfd23-db61-4c14-99e5-16e3b723ace4/{460F4D51-9C66-4ECD-AEF4-ADE2F4E6E949}.webp>)

- Set `UserList_To_Audit` in the `Parameter Name` field.
- Enable the `Required Field` button.
- Select `Text String` from the `Parameter Type` dropdown menu.
- Click the `Save` button.

![Parameter Setup Image](<../../../static/img/docs/359dfd23-db61-4c14-99e5-16e3b723ace4/image-4.webp>)

### Row 1 Function: PowerShell Script

Add a new `Add Row` button.

![Row 1](<../../../static/img/docs/359dfd23-db61-4c14-99e5-16e3b723ace4/{AAEF99C1-A7C3-4B08-966B-56DE699C51DE}.webp>)

Search and select the `PowerShell Script` function.  

![PowerShell Script](<../../../static/img/docs/359dfd23-db61-4c14-99e5-16e3b723ace4/{6A720E04-582E-466E-8F42-3FCDF7EAAA18}.webp>)

The following function will pop up on the screen:  

![PowerShell Function](<../../../static/img/docs/359dfd23-db61-4c14-99e5-16e3b723ace4/{03095D5F-3E72-4C73-A413-77757939D580}.webp>)

Paste the following PowerShell script and set the `Expected time of script execution in seconds` to `900` seconds. Click the `Save` button.

```powershell
[Net.ServicePointManager]::SecurityProtocol = [enum]::ToObject([Net.SecurityProtocolType], 3072)
#region Setup - Variables
$BaseURL = 'https://file.provaltech.com/repo'
$PS1URL = "$BaseURL/script/User-Audit.ps1"
$WorkingDirectory = "C:\ProgramData\_automation\script\User-Audit"
$PS1Path = "$WorkingDirectory\User-Audit.ps1"
#endregion

#region Setup - Folder Structure
if ( !(Test-Path $WorkingDirectory) ) {
    try {
        New-Item -Path $WorkingDirectory -ItemType Directory -Force -ErrorAction Stop | Out-Null
    }
    catch {
        Write-Error -Message "An error occurred. Failed to Create $WorkingDirectory. Reason: $($Error[0].Exception.Message)"
    }
} if (-not ( ( ( Get-Acl $WorkingDirectory ).Access | Where-Object { $_.IdentityReference -Match 'EveryOne' } ).FileSystemRights -Match 'FullControl' ) ) {
    $ACl = Get-Acl $WorkingDirectory
    $AccessRule = New-Object System.Security.AccessControl.FileSystemAccessRule('Everyone', 'FullControl', 'ContainerInherit, ObjectInherit', 'none', 'Allow')
    $Acl.AddAccessRule($AccessRule)
    Set-Acl $WorkingDirectory $Acl
}
try {
    Invoke-WebRequest -Uri $PS1URL -OutFile $PS1path -UseBasicParsing -ErrorAction Stop
} catch {
    if (!(Test-Path -Path $PS1Path )) {
        throw ('Failed to download the script from ''{0}'', and no local copy of the script exists on the machine. Reason: {1}' -f $PS1URL, $($Error[0].Exception.Message))
    }
}
#endregion

#region Execution
& $PS1Path -Pattern '@UserList_To_Audit@'
#endregion
```

![PowerShell Script 2](<../../../static/img/docs/359dfd23-db61-4c14-99e5-16e3b723ace4/{3180AC3A-BE62-4BB0-9B4F-991C78DA19EE}.webp>)

### Row 2 Logic: If/Then

Add a new `If/Then/Else` logic from the Add Logic dropdown menu.

![If Then](<../../../static/img/docs/359dfd23-db61-4c14-99e5-16e3b723ace4/{C28637EA-117E-40B1-9FB1-2501BA3B3849}.webp>)

#### ROW 2a Condition: Output Contains

Type `An error occurred` in the Value box.

![Output Contains](<../../../static/img/docs/359dfd23-db61-4c14-99e5-16e3b723ace4/{108A9F99-83D8-4019-B4E6-65DE0316DE7B}.webp>)

#### Row 2b Function: Script Exit

Add a new row by clicking the `Add Row` button.

![Add Row 2b](<../../../static/img/docs/359dfd23-db61-4c14-99e5-16e3b723ace4/{9EB5801F-D804-4D75-A7E0-13B037A6C5A8}.webp>)

A blank function will appear.  

![Blank Function](<../../../static/img/docs/359dfd23-db61-4c14-99e5-16e3b723ace4/{F21A7ABB-D06A-431C-9304-B098DBF40F79}.webp>)

Search and select the `Script Exit` function.

![Script Exit 1](<../../../static/img/docs/359dfd23-db61-4c14-99e5-16e3b723ace4/{E1720377-A147-483B-AD6F-5F0383B2CB7A}.webp>)
![Script Exit 2](<../../../static/img/docs/359dfd23-db61-4c14-99e5-16e3b723ace4/{9FBA566C-DA9A-4F6E-9675-65FD7F838169}.webp>)

The following function will pop up on the screen:  

![Script Exit Function](<../../../static/img/docs/359dfd23-db61-4c14-99e5-16e3b723ace4/{17068975-ADE8-405C-B15A-06744CB8D679}.webp>)

In the script exit message, simply type:

```Shell
Failed to execute the PowerShell for user audit. Refer to the logs:
%output%
```

and click the `Save` button.

![Script Exit Save](<../../../static/img/docs/359dfd23-db61-4c14-99e5-16e3b723ace4/{7CA91A21-DBD8-4BAE-8DC6-2791B721B987}.webp>)

### Row 3 Function: Script Log

Add a new row by clicking the `Add Row` button.

![Add Row 3](<../../../static/img/docs/359dfd23-db61-4c14-99e5-16e3b723ace4/{C0855BF2-4FE1-4A59-B142-440779BC85DC}.webp>)

A blank function will appear.  

![Blank Function 3](<../../../static/img/docs/359dfd23-db61-4c14-99e5-16e3b723ace4/{AEC47FA4-8A07-47E1-88DC-95893F3EB011}.webp>)

Search and select the `Script Log` function.

![Script Log](<../../../static/img/docs/359dfd23-db61-4c14-99e5-16e3b723ace4/{C17499D6-993D-43D2-AF1D-20699AFEE032}.webp>)
![Script Log 2](<../../../static/img/docs/359dfd23-db61-4c14-99e5-16e3b723ace4/{293EFE72-65E9-4F40-8D37-15461D000AA3}.webp>)

The following function will pop up on the screen:  

![Script Log Function](<../../../static/img/docs/359dfd23-db61-4c14-99e5-16e3b723ace4/{16174C8D-FDE9-444A-9A96-F6D3D5B1E751}.webp>)

In the script log message, type:

```Shell
%Output%
```

and click the `Save` button.

![Script Log Save](<../../../static/img/docs/359dfd23-db61-4c14-99e5-16e3b723ace4/{8E51F169-0791-4076-91C6-E41E33393985}.webp>)

## Completed Task

![Complete Task](<../../../static/img/docs/359dfd23-db61-4c14-99e5-16e3b723ace4/{D5E37548-533C-4DA1-81E0-A41B246F47C2}.webp>)

## Output

- Script Log