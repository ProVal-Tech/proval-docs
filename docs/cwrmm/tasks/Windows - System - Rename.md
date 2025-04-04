---
id: 'cd9905c4-ec7d-45ac-818f-f56ec85357de'
title: 'Windows - System - Rename'
title_meta: 'Windows - System - Rename'
keywords: ['Rename', 'Windows']
description: 'This script can be used to rename a machine and validate the success or failure of the rename. The script will first check if the machine is domain-joined or not. If it is, then it will attempt to create a PSCredential object to pass into the Rename-Computer cmdlet. This will use the Username and Password parameters. It then attempts the rename the computer and stores the success status in $computerChangeInfo. The reboot will be required to complete the renaming process.'
tags: ['Rename', 'Windows']
draft: false
unlisted: false
---

## Summary

This script can be used to rename a machine and validate the success or failure of the rename.
The script will first check if the machine is domain-joined or not. If it is, then it will attempt to create a PSCredential object to pass into the Rename-Computer cmdlet. This will use the Username and Password parameters. It then attempts the rename the computer and stores the success status in $computerChangeInfo. 
The reboot will be required to complete the renaming process.

## Dependencies

[Custom Fields Rename-Machine](</docs/cwrmm/custom-fields/Rename-Machine Custom fields.md>)

[Agnostic Rename-Machine](</docs/powershell/Rename-Machine.md>)

## User Parameters

| Name    | Example   | Required | Default | Type       | Description                                      |
|---------|-----------|----------|---------|------------|--------------------------------------------------|
| NewName | COMPUTER2 | True     |         | Text String| The new name to be set for the Windows System    |
| Reboot  | True or False | False |         | Flag       | If this is checked, the system will be rebooted after the renaming of the system |


![User Parameters](<../../../static/img/docs/Windows - System - Rename/{02C97121-7F43-4EB9-BB5C-C0979E633563}.png>)

## Task Creation

Create a new `Script Editor` style script in the system to implement this task.

![Add Task](<../../../static/img/docs/Windows - System - Rename/{62909443-EE1C-4D44-9DB9-07031A56039B}.png>)
![Add Task Continue](<../../../static/img/docs/Windows - System - Rename/{D06E43E9-D65E-484B-B8E3-A22078F74E72}.png>)

**Name:** `Windows - System - Rename`  
**Description:** `This script can be used to rename a machine and validate the success or failure of the rename. The script will first check if the machine is domain-joined or not. If it is, then it will attempt to create a PSCredential object to pass into the Rename-Computer cmdlet. This will use the Username and Password parameters. It then attempts the rename the computer and stores the success status in $computerChangeInfo. The reboot will be required to complete the renaming process.`  
**Category:** `Management`  

![Task Creation](<../../../static/img/docs/Windows - System - Rename/{DAFB92CF-A0BA-4C41-86E1-8E66C3DAAACE}.png>)

## Parameters

### Title:

Add a new parameter by clicking the `Add Parameter` button located at the top-right corner of the screen.

![Add Parameter](<../../../static/img/docs/Windows - System - Rename/image-1.png>)

This screen will appear.  

![Add New Parameter](<../../../static/img/docs/Windows - System - Rename/{8B47709B-6F3E-4946-8D90-A4AC648FBF4D}.png>)

- Set `NewName` in the `Parameter Name` field.
- Enable the `Required Field` option.
- Select `Text String` from the `Parameter Type` dropdown menu.
- Click the `Save` button.

![NewName Parameter](<../../../static/img/docs/Windows - System - Rename/image.png>)

Add another new parameter by clicking the `Add Parameter` button located at the top-right corner of the screen.

![Add Parameter](<../../../static/img/docs/Windows - System - Rename/image-1.png>)

This screen will appear.  

![Add New Parameter](<../../../static/img/docs/Windows - System - Rename/{8B47709B-6F3E-4946-8D90-A4AC648FBF4D}.png>)

- Set `Reboot` in the `Parameter Name` field.
- Select `Flag` from the `Parameter Type` dropdown menu.
- Select the Default Value to 'False'
- Click the `Save` button.

![Reboot Parameter](<../../../static/img/docs/Windows - System - Rename/image-2.png>)

## Task

Navigate to the Script Editor section and start by adding a row. You can do this by clicking the `Add Row` button at the bottom of the script page.

![Add Row](<../../../static/img/docs/Windows - System - Rename/{89348762-7718-4887-97F7-EB15B2A6AC8D}.png>)

A blank function will appear.

![Blank Function](<../../../static/img/docs/Windows - System - Rename/{9E86F789-D67F-42C9-854F-47C90F55BE14}.png>)  

### Row 1 Function: Set Pre-defined Variable

Select function "Set Pre-Defined Variable"

![Set Pre-defined Variable](<../../../static/img/docs/Windows - System - Rename/{9310FFA1-E94C-4265-8669-44B4430CE151}.png>)

Variable Name: `UserName`

Select `Custom Field`

Select `Domain_Admin_User`

Click Save

![Username](<../../../static/img/docs/Windows - System - Rename/image-3.png>)

### Row 2 Function: Set Pre-defined Variable

Add a new row by clicking the Add Row button.

![alt text](<../../../static/img/docs/Windows - System - Rename/{61A07D5E-2D1F-467E-AEE8-1835B0F82EF6}.png>)

Select function "Set Pre-Defined Variable"

![Set Pre-defined Variable](<../../../static/img/docs/Windows - System - Rename/{9310FFA1-E94C-4265-8669-44B4430CE151}.png>)

Variable Name: `Password`

Select `Custom Field`

Select `Domain_Admin_Pws`

Click Save

![Password](<../../../static/img/docs/Windows - System - Rename/image-4.png>)

### Row 3 Function: Set Pre-defined Variable

Add a new row by clicking the Add Row button.

![alt text](<../../../static/img/docs/Windows - System - Rename/{61A07D5E-2D1F-467E-AEE8-1835B0F82EF6}.png>)

Select function "Set Pre-Defined Variable"

![Set Pre-defined Variable](<../../../static/img/docs/Windows - System - Rename/{9310FFA1-E94C-4265-8669-44B4430CE151}.png>)

Variable Name: `CurrentName`

Select `System Variable`

Select `friendlyName`

Click Save

![CurrentName](<../../../static/img/docs/Windows - System - Rename/image-5.png>)

### Row 4 Function: PowerShell Script

Add a new row by clicking the Add Row button.

![Add Row](<../../../static/img/docs/Windows - System - Rename/{61A07D5E-2D1F-467E-AEE8-1835B0F82EF6}.png>)

Search and select the `PowerShell Script` function.

![PowerShell Function](<../../../static/img/docs/Windows - System - Rename/{E7716EE6-0D0F-4D95-86B7-04C64CEC4A97}.png>)

The following function will pop up on the screen:

![PowerShell Popup](<../../../static/img/docs/Windows - System - Rename/{0DD9AB77-6B2B-48E3-9DBD-012408B8A443}.png>)

Paste the following PowerShell script and set the `Expected time of script execution in seconds` to `600`. Click the `Save` button.

```
[Net.ServicePointManager]::SecurityProtocol = [enum]::ToObject([Net.SecurityProtocolType], 3072)
#region Setup - Variables
$BaseURL = 'https://file.provaltech.com/repo'
$PS1URL = "$BaseURL/script/Rename-Machine.ps1"
$WorkingDirectory = "C:\ProgramData\_automation\script\Rename-Machine"
$PS1Path = "$WorkingDirectory\Rename-Machine.ps1"
$PS1Log = "$WorkingDirectory\Rename-Machine-log.txt"
$PS1ErrorLog = "$WorkingDirectory\Rename-Machine-error.txt"
#endregion

#region Setup - Folder Structure
if ( !(Test-Path $WorkingDirectory) ) {
    try {
        New-Item -Path $WorkingDirectory -ItemType Directory -Force -ErrorAction Stop | Out-Null
    }
    catch {
        Write-Error -Message "An error occurred: Failed to Create $WorkingDirectory. Reason: $($Error[0].Exception.Message)" -Level Error
    }
} if (-not ( ( ( Get-Acl $WorkingDirectory ).Access | Where-Object { $_.IdentityReference -Match 'EveryOne' } ).FileSystemRights -Match 'FullControl' ) ) {
    $ACl = Get-Acl $WorkingDirectory
    $AccessRule = New-Object System.Security.AccessControl.FileSystemAccessRule('Everyone', 'FullControl', 'ContainerInherit, ObjectInherit', 'none', 'Allow')
    $Acl.AddAccessRule($AccessRule)
    Set-Acl $WorkingDirectory $Acl
}
$response = Invoke-WebRequest -Uri $PS1URL -UseBasicParsing
if (($response.StatusCode -ne 200) -and (!(Test-Path -Path $PS1Path))) {
    Write-Error -Message "An error occurred: No pre-downloaded script exists and the script '$PS1URL' failed to download. Exiting."
    return
}
elseif ($response.StatusCode -eq 200) {
    Remove-Item -Path $PS1Path -ErrorAction SilentlyContinue
    [System.IO.File]::WriteAllLines($PS1Path, $response.Content)
}
if (!(Test-Path -Path $PS1Path)) {
    Write-Error -Message 'An error occurred: The script was unable to be downloaded. Exiting.'
    return
}
#endregion

#region Execution
$Output = & $PS1Path -NewName '@NewName@' -Username '@Username@' -Password '@Password@'
#endregion
if (Test-Path -Path $PS1ErrorLog) {
    $errorcontent = Get-Content -path $PS1ErrorLog
    Write-Error -Message "The script encountered an error when running the process. Refer to the log: $errorcontent."
    return
}
$timeout = 60
$elapsed = 0
while ($elapsed -lt $timeout -and !(Test-Path -Path $PS1Log)) {
    Start-Sleep -Seconds 1
    $elapsed++
}

if (Test-Path -Path $PS1Log) {
    $content = Get-Content -path $PS1Log
    $content[ $($($content.IndexOf($($content -match 'Rename-Machine$')[-1])) + 1)..$($Content.length - 1) ]
    Write-Output "The system renamed successfully"
}
else {
    Write-Error -Message "The log file was not created within the expected time."
}
if($Reboot -eq 'True' -or $Reboot -eq 1) {
    Write-Output 'Rebooting the agent for the system rename'
    shutdown -r -t 00
}
```

![PowerShell Script Image](<../../../static/img/docs/Windows - System - Rename/{0E6A478E-7B0B-4395-8C0A-C0FE7CBD813D}.png>)


### Row 5: Logic: If/Then

Add a new logic in the Else section and select `If/Then`.

![If/Then](<../../../static/img/docs/Windows - System - Rename/{74BC6F28-5F11-4050-91A6-9A9ABE9408AB}.png>)

![If/Then Popup](<../../../static/img/docs/Windows - System - Rename/{04226646-47A0-4BD8-85B6-C9F750B97AF5}.png>)

### Row 5a: Condition: Output Contains

In the IF part, enter `An error occurred` in the right box of the "Output Does Not Contains" part.

![Condition](<../../../static/img/docs/Windows - System - Rename/{D1A3F413-991F-408D-BBCB-838D49E180F9}.png>)

### Row 5b: Function: Script Exit

Add a new row in the IF section and select `Script Exit`.

![Add row](<../../../static/img/docs/Windows - System - Rename/{61A07D5E-2D1F-467E-AEE8-1835B0F82EF6}.png>)

![Script Exit](<../../../static/img/docs/Windows - System - Rename/{656227CF-E1BC-43D3-BD1F-7C8C1B1AC88D}.png>)

In the script exit message, simply type `The system rename failed. Refer to the logs: %output%`.

![Script Exit Message](<../../../static/img/docs/Windows - System - Rename/{A75EA08E-EB31-4D44-8D68-69EB82FDDE66}.png>)

### Row 6 Function: Script Log

Add a new row by clicking the Add Row button.

![Add Row](<../../../static/img/docs/Windows - System - Rename/{61A07D5E-2D1F-467E-AEE8-1835B0F82EF6}.png>)

A blank function will appear.

![Blank Function](<../../../static/img/docs/Windows - System - Rename/{64F1B31B-C151-44EA-8068-0D39ADB59767}.png>)

Search and select the `Script Log` function.

![Script Log Selection](../../../static/img/Remove-Font/image_19.png)  

The following function will pop up on the screen:

![Script Log Popup](../../../static/img/Remove-Font/image_20.png)  

In the script log message, simply type `The system was renamed from @CurrentName@ to the @NewName@. Refer to the logs: %output%` and click the `Save` button.

![ScripLog Message](<../../../static/img/docs/Windows - System - Rename/{16BCF376-5E8A-45A7-8931-4DB5FBD82F1C}.png>)

Click the `Save` button at the top-right corner of the screen to save the script.

![Save Script](<../../../static/img/docs/Windows - System - Rename/image-6.png>)

## Completed Task

![Complete Task](<../../../static/img/docs/Windows - System - Rename/{34F7EE32-FFB9-41E1-A0EC-57B121C08BCD}.png>)
![Complete Task Continue](<../../../static/img/docs/Windows - System - Rename/{999EFA73-C9E5-4DE4-992E-040A94E8558E}.png>)

## Output

- Script log
