---
id: '359dfd23-db61-4c14-99e5-16e3b723ace4'
title: 'Get Specific/Multiple User Audit'
title_meta: 'Get Specific/Multiple User Audit'
keywords: ['user', 'test', 'audit', 'logs', 'SID']
description: 'This script is designed to get the specific or multiple user(s) information (Username, SIDs, and Status).'
tags: ['user', 'test', 'audit', 'logs', 'SID']
draft: false
unlisted: false
---

## Summary
This script is designed to get the specific or multiple user(s) information (Username, SIDs, and Status).
Note: If the agent is a Domain Controller, it will audit the domain accounts; otherwise, it will audit the local accounts.

## Sample Run
![Sample Run 1](<../../../static/img/docs/Get Specific-Multiple User Audit/image.png>)
![Sample Run 2](<../../../static/img/docs/Get Specific-Multiple User Audit/image-1.png>)
![Sample Run 3](<../../../static/img/docs/Get Specific-Multiple User Audit/image-2.png>)
![Sample Run 4](<../../../static/img/docs/Get Specific-Multiple User Audit/image-3.png>)

## Dependencies
[Agnostic-User-Audit](</docs/powershell/User-Audit.md>)

## User Parameters

| Name              | Example  | Accepted Values       | Required | Default | Type       | Description                                                                                      |
|-------------------|----------|-----------------------|----------|---------|------------|--------------------------------------------------------------------------------------------------|
| UserList_To_Audit | Test,Pro | Test, Test,Pro,System | True     | Test    | Text String| This parameter should be filled with a pattern to fetch the user list matching the pattern. Multiple user lists can be provided, separated by commas, as shown in the accepted values. |

## Task Creation
Create a new `Script Editor` style script in the system to implement this task.

![Task Creation 1](<../../../static/img/docs/Get Specific-Multiple User Audit/{F601A57B-0F63-4EA2-9886-87F58FA5EFC4}.png>)
![Task Creation 2](<../../../static/img/docs/Get Specific-Multiple User Audit/{A69BE110-DAB2-4D46-B675-38F0BD83E4B5}.png>)

**Name:** `Get Specific/Multiple User Audit`  
**Description:** `This script is designed to get the specific or multiple user information (Username, SIDs, and Status).`  
**Category:** `Security`  

![Task Creation 3](<../../../static/img/docs/Get Specific-Multiple User Audit/{235BC59E-798C-4F76-93D1-1E926573A764}.png>)

## Task

## Parameter

Add a new parameter by clicking the `Add Parameter` button present at the top-right corner of the screen.

![Add Parameter](<../../../static/img/docs/Get Specific-Multiple User Audit/{058061B3-5330-41CB-8660-5946EAB2F7C2}.png>)

This screen will appear.  
![Parameter Screen Image](<../../../static/img/docs/Get Specific-Multiple User Audit/{460F4D51-9C66-4ECD-AEF4-ADE2F4E6E949}.png>)

- Set `UserList_To_Audit` in the `Parameter Name` field.
- Enable the `Required Field` button.
- Select `Text String` from the `Parameter Type` dropdown menu.
- Click the `Save` button.

![Parameter Setup Image](<../../../static/img/docs/Get Specific-Multiple User Audit/image-4.png>)

### Row 1 Function: PowerShell Script

Add a new `Add Row` button.

![Row 1](<../../../static/img/docs/Get Specific-Multiple User Audit/{AAEF99C1-A7C3-4B08-966B-56DE699C51DE}.png>)

Search and select the `PowerShell Script` function.  

![PowerShell Script](<../../../static/img/docs/Get Specific-Multiple User Audit/{6A720E04-582E-466E-8F42-3FCDF7EAAA18}.png>)

The following function will pop up on the screen:  

![PowerShell Function](<../../../static/img/docs/Get Specific-Multiple User Audit/{03095D5F-3E72-4C73-A413-77757939D580}.png>)

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
$response = Invoke-WebRequest -Uri $PS1URL -UseBasicParsing
if (($response.StatusCode -ne 200) -and (!(Test-Path -Path $PS1Path))) {
    Write-Error -Message "An error occurred. No pre-downloaded script exists and the script '$PS1URL' failed to download. Exiting."
    return
}
elseif ($response.StatusCode -eq 200) {
    Remove-Item -Path $PS1Path -ErrorAction SilentlyContinue
    [System.IO.File]::WriteAllLines($PS1Path, $response.Content)
}
if (!(Test-Path -Path $PS1Path)) {
    Write-Error -Message 'An error occurred. The script was unable to be downloaded. Exiting.'
    return
}
#endregion

#region Execution
& $PS1Path -Pattern '@UserList_To_Audit@'
#endregion
```

![PowerShell Script 2](<../../../static/img/docs/Get Specific-Multiple User Audit/{3180AC3A-BE62-4BB0-9B4F-991C78DA19EE}.png>)

### Row 2 Logic: If/Then

Add a new `If/Then/Else` logic from the Add Logic dropdown menu.

![If Then](<../../../static/img/docs/Get Specific-Multiple User Audit/{C28637EA-117E-40B1-9FB1-2501BA3B3849}.png>)

#### ROW 2a Condition: Output Contains

Type `ERROR:` in the Value box.

![Output Contains](<../../../static/img/docs/Get Specific-Multiple User Audit/{108A9F99-83D8-4019-B4E6-65DE0316DE7B}.png>)

#### Row 2b Function: Script Exit

Add a new row by clicking the `Add Row` button.

![Add Row 2b](<../../../static/img/docs/Get Specific-Multiple User Audit/{9EB5801F-D804-4D75-A7E0-13B037A6C5A8}.png>)

A blank function will appear.  

![Blank Function](<../../../static/img/docs/Get Specific-Multiple User Audit/{F21A7ABB-D06A-431C-9304-B098DBF40F79}.png>)

Search and select the `Script Exit` function.

![Script Exit 1](<../../../static/img/docs/Get Specific-Multiple User Audit/{E1720377-A147-483B-AD6F-5F0383B2CB7A}.png>)
![Script Exit 2](<../../../static/img/docs/Get Specific-Multiple User Audit/{9FBA566C-DA9A-4F6E-9675-65FD7F838169}.png>)

The following function will pop up on the screen:  

![Script Exit Function](<../../../static/img/docs/Get Specific-Multiple User Audit/{17068975-ADE8-405C-B15A-06744CB8D679}.png>)

In the script exit message, simply type:

```
Failed to execute the PowerShell for user audit. Refer to the logs:
%output%
```

and click the `Save` button.

![Script Exit Save](<../../../static/img/docs/Get Specific-Multiple User Audit/{7CA91A21-DBD8-4BAE-8DC6-2791B721B987}.png>)

### Row 3 Function: Script Log

Add a new row by clicking the `Add Row` button.

![Add Row 3](<../../../static/img/docs/Get Specific-Multiple User Audit/{C0855BF2-4FE1-4A59-B142-440779BC85DC}.png>)

A blank function will appear.  

![Blank Function 3](<../../../static/img/docs/Get Specific-Multiple User Audit/{AEC47FA4-8A07-47E1-88DC-95893F3EB011}.png>)

Search and select the `Script Log` function.

![Script Log](<../../../static/img/docs/Get Specific-Multiple User Audit/{C17499D6-993D-43D2-AF1D-20699AFEE032}.png>)
![Script Log 2](<../../../static/img/docs/Get Specific-Multiple User Audit/{293EFE72-65E9-4F40-8D37-15461D000AA3}.png>)

The following function will pop up on the screen:  

![Script Log Function](<../../../static/img/docs/Get Specific-Multiple User Audit/{16174C8D-FDE9-444A-9A96-F6D3D5B1E751}.png>)

In the script log message, type:

```
%output%
```

and click the `Save` button.

![Script Log Save](<../../../static/img/docs/Get Specific-Multiple User Audit/{8E51F169-0791-4076-91C6-E41E33393985}.png>)

## Completed Task

![Complete Task](<../../../static/img/docs/Get Specific-Multiple User Audit/{D5E37548-533C-4DA1-81E0-A41B246F47C2}.png>)

## Output

- Script Log