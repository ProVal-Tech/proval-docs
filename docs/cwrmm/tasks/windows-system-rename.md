---
id: 'cd9905c4-ec7d-45ac-818f-f56ec85357de'
slug: /cd9905c4-ec7d-45ac-818f-f56ec85357de
title: 'Windows - System - Rename'
title_meta: 'Windows - System - Rename'
keywords: ['Rename', 'Windows']
description: 'This script can be used to rename a machine and validate the success or failure of the rename. The script will first check if the machine is domain-joined or not. If it is, then it will attempt to create a PSCredential object to pass into the Rename-Computer cmdlet. This will use the Username and Password parameters. It then attempts the rename the computer and stores the success status in $computerChangeInfo. The reboot will be required to complete the renaming process.'
tags: ['windows']
draft: false
unlisted: false
---

## Summary

This script can be used to rename a machine and validate the success or failure of the rename.
The script will first check if the machine is domain-joined or not. If it is, then it will attempt to create a PSCredential object to pass into the Rename-Computer cmdlet. This will use the Username and Password parameters. It then attempts the rename the computer and stores the success status in $computerChangeInfo. 
The reboot will be required to complete the renaming process.

## Dependencies

[Custom Fields Rename-Machine](/docs/ba3c12eb-f166-4982-ab21-a2337a989614)

[Rename-Machine](/docs/a556909a-ff2f-489f-ab3a-6e928722c09c)

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

```
Note: Before setting the Pre-defined Variable please create the custom fields [Rename-Machine custom fields](/docs/ba3c12eb-f166-4982-ab21-a2337a989614)
```

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

```powershell
[Net.ServicePointManager]::SecurityProtocol = [enum]::ToObject([Net.SecurityProtocolType], 3072)
#region Setup - Variables
$BaseURL = 'https://file.provaltech.com/repo'
$PS1URL = "$BaseURL/script/Rename-Machine.ps1"
$WorkingDirectory = "C:\ProgramData\_automation\script\Rename-Machine"
$PS1Path = "$WorkingDirectory\Rename-Machine.ps1"
$PS1Log = "$WorkingDirectory\Rename-Machine-log.txt"
$PS1ErrorLog = "$WorkingDirectory\Rename-Machine-error.txt"
$Reboot = '@Reboot@'
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
```

![PowerShell Script 1](<../../../static/img/docs/Windows - System - Rename/{6A770FE1-D959-40BB-A551-3A67753A406A}.png>)


### Row 5: Logic: If/Then

Add a new logic and select `If/Then`.

![If/Then](<../../../static/img/docs/Windows - System - Rename/{74BC6F28-5F11-4050-91A6-9A9ABE9408AB}.png>)

![If/Then Popup](<../../../static/img/docs/Windows - System - Rename/{04226646-47A0-4BD8-85B6-C9F750B97AF5}.png>)

### Row 5a: Condition: Output Contains

In the IF part, enter `An error occurred` in the right box of the "Output Contains" part.

![Condition](<../../../static/img/docs/Windows - System - Rename/{D1A3F413-991F-408D-BBCB-838D49E180F9}.png>)

### Row 5b: Function: Script Exit

Add a new row in the IF section and select `Script Exit`.

![Add row](<../../../static/img/docs/Windows - System - Rename/{61A07D5E-2D1F-467E-AEE8-1835B0F82EF6}.png>)

![Script Exit](<../../../static/img/docs/Windows - System - Rename/{656227CF-E1BC-43D3-BD1F-7C8C1B1AC88D}.png>)

In the script exit message, simply type `The Rename-Machine.ps1 download failed. Refer to the logs: %output%` and click `Save`.

![Script Exit Message](<../../../static/img/docs/Windows - System - Rename/{84F02F7A-B1A3-400C-8787-470C7A2AB56E}.png>)

### Row 6 Function: Command Prompt (CMD) Script

Add a new row by clicking the Add Row button.

![Add Row](<../../../static/img/docs/Windows - System - Rename/{61A07D5E-2D1F-467E-AEE8-1835B0F82EF6}.png>)

A blank function will appear.

![Blank Function](<../../../static/img/docs/Windows - System - Rename/{64F1B31B-C151-44EA-8068-0D39ADB59767}.png>)

Search and select the `Command Prompt` function.

![Command Prompt (CMD) Script](<../../../static/img/docs/Windows - System - Rename/image-7.png>)

Paste the following Command and set the `Expected time of script execution in seconds` to `300`. Click the `Save` button.

```shell
C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -ExecutionPolicy Bypass -Command "& 'C:\ProgramData\_automation\script\Rename-Machine\Rename-Machine.ps1' -NewName '@NewName@' -Username '@Username@' -Password '@Password@'"
```

![Command Prompt Code](<../../../static/img/docs/Windows - System - Rename/{5B4A4BBC-98E8-4D4C-B204-EEBC325D9FC6}.png>)

### Row 7 Function: Script log

Add a new row by clicking the Add Row button.

![Add Row](<../../../static/img/docs/Windows - System - Rename/{61A07D5E-2D1F-467E-AEE8-1835B0F82EF6}.png>)

A blank function will appear.

![Blank Function](<../../../static/img/docs/Windows - System - Rename/{64F1B31B-C151-44EA-8068-0D39ADB59767}.png>)

Search and select `Script Log`

![Script Log Selection](../../../static/img/Remove-Font/image_19.png)  

The following function will pop up on the screen:

![Script Log Popup](../../../static/img/Remove-Font/image_20.png)  

In the script log message, simply type `The system was renamed from @CurrentName@ to the @NewName@. Refer to the logs: %output%` and click the `Save` button.

![Script log Message 1](<../../../static/img/docs/Windows - System - Rename/{752892B3-D547-48FF-8C58-4806EC9884A4}.png>)

### Row 8 Function: PowerShell Script

Add a new row by clicking the Add Row button.

![Add Row](<../../../static/img/docs/Windows - System - Rename/{61A07D5E-2D1F-467E-AEE8-1835B0F82EF6}.png>)

Search and select the `PowerShell Script` function.

![PowerShell Function](<../../../static/img/docs/Windows - System - Rename/{E7716EE6-0D0F-4D95-86B7-04C64CEC4A97}.png>)

The following function will pop up on the screen:

![PowerShell Popup](<../../../static/img/docs/Windows - System - Rename/{0DD9AB77-6B2B-48E3-9DBD-012408B8A443}.png>)

Paste the following PowerShell script and set the `Expected time of script execution in seconds` to `600`. Click the `Save` button.
Also, Select the `Continue on Failure`.

![PowerShell Continue on Failure](<../../../static/img/docs/Windows - System - Rename/image-8.png>)

```powershell
$WorkingDirectory = 'C:\ProgramData\_automation\script\Rename-Machine'
$PS1Log = "$WorkingDirectory\Rename-Machine-log.txt"
$PS1ErrorLog = "$WorkingDirectory\Rename-Machine-error.txt"
$Reboot = '1'
if (Test-Path -Path $PS1ErrorLog) {
    $errorcontent = Get-Content -path $PS1ErrorLog
    Write-Error -Message "An error occurred: The script encountered an error when running the process. Refer to the log: $errorcontent."
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
    Write-Output "The system renamed successfully. Reboot is required to reflect the new name i.e. @NewName@"
}
else {
    Write-Error -Message "An error occurred: The log file was not created within the expected time."
}
if ($Reboot -eq 'True' -or $Reboot -eq 1) {
    Write-Output 'Rebooting the agent for the system rename'
    shutdown -r -t 00
}
```

![PowerShell Script 2](<../../../static/img/docs/Windows - System - Rename/{22F3D981-636F-4FB1-80B9-5601CC3532D7}.png>)

### Row 9 Logic: If/Then

Add a new logic and select `If/Then`.

![If/Then](<../../../static/img/docs/Windows - System - Rename/{74BC6F28-5F11-4050-91A6-9A9ABE9408AB}.png>)

![If/Then Popup](<../../../static/img/docs/Windows - System - Rename/{04226646-47A0-4BD8-85B6-C9F750B97AF5}.png>)

### Row 9a: Condition: Output Contains

In the IF part, enter `An error occurred` in the right box of the "Output Contains" part.

![Condition](<../../../static/img/docs/Windows - System - Rename/{D1A3F413-991F-408D-BBCB-838D49E180F9}.png>)

### Row 9b: Function: Script Exit

Add a new row in the IF section and select `Script Exit`.

![Add row](<../../../static/img/docs/Windows - System - Rename/{61A07D5E-2D1F-467E-AEE8-1835B0F82EF6}.png>)

![Script Exit](<../../../static/img/docs/Windows - System - Rename/{656227CF-E1BC-43D3-BD1F-7C8C1B1AC88D}.png>)

In the script exit message, simply type `The error was detected in renaming the machine. Refer to the logs: %Output%`.

![Script Exit Message 2](<../../../static/img/docs/Windows - System - Rename/{54BAFEDC-0015-4611-B3AC-627E0294263D}.png>)

### Row 10: Function: Script Log

Add a new row by clicking the Add Row button.

![Add Row](<../../../static/img/docs/Windows - System - Rename/{61A07D5E-2D1F-467E-AEE8-1835B0F82EF6}.png>)

A blank function will appear.

![Blank Function](<../../../static/img/docs/Windows - System - Rename/{64F1B31B-C151-44EA-8068-0D39ADB59767}.png>)

Search and select `Script Log`

![Script Log Selection](../../../static/img/Remove-Font/image_19.png)  

The following function will pop up on the screen:

![Script Log Popup](../../../static/img/Remove-Font/image_20.png)  

In the script log message, simply type `%output%` and click the `Save` button.

![Script log Message 2](<../../../static/img/docs/Windows - System - Rename/{986EF4C4-9C56-4EB4-A3BA-0CCD5308D21C}.png>)

Click `Save` at the top right corner of the script

![Save Script](<../../../static/img/docs/Windows - System - Rename/image-6.png>)

## Completed Task

![Complete Task](<../../../static/img/docs/Windows - System - Rename/{09D0A7E7-284F-4CE6-880D-E4495794EDAE}.png>)
![Complete Task 1](<../../../static/img/docs/Windows - System - Rename/{0E704D7A-E166-46E7-9B3A-49D411AA40B1}.png>)

## Output

- Script log
