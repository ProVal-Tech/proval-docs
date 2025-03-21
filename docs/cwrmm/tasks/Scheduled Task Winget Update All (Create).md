---
id: 'a898b5ac-23d0-4e0d-89e5-79bca2277a6e'
title: 'Scheduled Task Winget Update All (Create)'
title_meta: 'Scheduled Task Winget Update All (Create)'
keywords: ['winget', 'scheduled', 'task', 'update', 'windows', 'automation']
description: 'This document outlines the process for creating and managing two scheduled tasks designed to update installed applications using Winget on Windows 10 and 11. It includes dependencies, variables, task creation steps, and deployment instructions.'
tags: ['update', 'windows']
draft: false
unlisted: false
---

## Summary

The ultimate objective of the task is to establish and oversee two scheduled tasks (Winget Update All [System] and Winget Update All [Logged on User]) designed to update installed applications utilizing Winget on Windows 10 and 11.

The task can only be executed against the companies where the company-level custom field [WingetUpdateAll_Task_Create](<../custom-fields/Company - WingetUpdateAll_Task_Create.md>) is marked.

## Sample Run

![Sample Run 1](../../../static/img/Scheduled-Task-Winget-Update-All-(Create)/image_1.png)

![Sample Run 2](../../../static/img/Scheduled-Task-Winget-Update-All-(Create)/image_2.png)

## Dependencies

- [CW RMM - Custom Field - Company - WingetUpdateAll_Task_Create](<../custom-fields/Company - WingetUpdateAll_Task_Create.md>)
- [CW RMM - Custom Field - Company - WingetUpdateAll_Task_Delete](<../custom-fields/Company - WingetUpdateAll_Task_Delete.md>)
- [CW RMM - Custom Field - Company - WingetUpdateAll_UserTask_Disable](<../custom-fields/Company - WingetUpdateAll_UserTask_Disable.md>)
- [CW RMM - Custom Field - Site - WingetUpdateAll_Task_Exclude](<../custom-fields/Site - WingetUpdateAll_Task_Exclude.md>)
- [CW RMM - Custom Field - Site - WingetUpdateAll_UserTask_Disable](<../custom-fields/Site - WingetUpdateAll_UserTask_Disable.md>)
- [CW RMM - Custom Field - EndPoint - WingetUpdateAll_Task_Exclude](<../custom-fields/EndPoint - WingetUpdateAll_Task_Exclude.md>)
- [CW RMM - Custom Field - EndPoint - WingetUpdateAll_Task_Result](<../custom-fields/EndPoint - WingetUpdateAll_Task_Result.md>)
- [CW RMM - Custom Field - EndPoint - WingetUpdateAll_UserTask_Disable](<../custom-fields/EndPoint - WingetUpdateAll_UserTask_Disable.md>)
- [CW RMM - Device Group - Winget Update All (Task Create)](<../groups/Winget Update All (Task Create).md>)

## Variables

| Name      | Description                                |
|-----------|--------------------------------------------|
| UserTask  | Whether the user task is disabled or not.  |
| Output    | Output of the PowerShell script.           |

## Task Creation

Create a new `Script Editor` style script in the system to implement this task.

![Task Creation 1](../../../static/img/Scheduled-Task-Winget-Update-All-(Create)/image_3.png)

![Task Creation 2](../../../static/img/Scheduled-Task-Winget-Update-All-(Create)/image_4.png)

**Name:** Scheduled Task Winget Update All (Create)

**Description:** The ultimate objective of the task is to establish and oversee two scheduled tasks (Winget Update All [System] and Winget Update All [Logged on User]) designed to update installed applications utilizing Winget on Windows 10 and 11.

**Category:** Patching

![Task Creation 3](../../../static/img/Scheduled-Task-Winget-Update-All-(Create)/image_5.png)

## Task

Start by adding a row. You can do this by clicking the `Add Row` button at the bottom of the script page.

![Add Row](../../../static/img/Scheduled-Task-Winget-Update-All-(Create)/image_6.png)

This function will appear.

![Function Appears](../../../static/img/Scheduled-Task-Winget-Update-All-(Create)/image_7.png)

### Row 1 Function: PowerShell Script

Search and select the `PowerShell Script` function.

![PowerShell Script Selection](../../../static/img/Scheduled-Task-Winget-Update-All-(Create)/image_8.png)

![PowerShell Script Selected](../../../static/img/Scheduled-Task-Winget-Update-All-(Create)/image_9.png)

Paste in the following PowerShell script and set the expected time of script execution to `300` seconds. Click the `Save` button.

```powershell
if ( (get-ciminstance -classname Win32_OperatingSystem).caption -match 'Windows 1[01]' ) { 'Supported' } else { 'Unsupported' }
```

![PowerShell Script Pasted](../../../static/img/Scheduled-Task-Winget-Update-All-(Create)/image_10.png)

### Row 2 Logic: If Then

![Row 2 Logic](../../../static/img/Scheduled-Task-Winget-Update-All-(Create)/image_11.png)

![Row 2 Logic 2](../../../static/img/Scheduled-Task-Winget-Update-All-(Create)/image_12.png)

### Row 2a Condition: Output Contains

Type `Unsupported` in the `Input Value or Variable` field and press `Enter`.

![Row 2a Condition](../../../static/img/Scheduled-Task-Winget-Update-All-(Create)/image_13.png)

### Row 2b Function: Script Log

Add a new row by clicking on the `Add Row` button.

![Add Row for Script Log](../../../static/img/Scheduled-Task-Winget-Update-All-(Create)/image_14.png)

Search and select the `Script Log` function.

![Script Log Selection](../../../static/img/Scheduled-Task-Winget-Update-All-(Create)/image_15.png)

![Script Log Selected](../../../static/img/Scheduled-Task-Winget-Update-All-(Create)/image_16.png)

Add the following log in the `Script Log Message` field and click the `Save` button:

```plaintext
Unsupported Operating System.
```

```plaintext
Supported OS are Windows 10 and Windows 11
```

### Row 2c Function: Script Exit

Add a new row by clicking on the `Add Row` button.

![Add Row for Script Exit](../../../static/img/Scheduled-Task-Winget-Update-All-(Create)/image_14.png)

Search and select the `Script Exit` function.

![Script Exit Selection](../../../static/img/Scheduled-Task-Winget-Update-All-(Create)/image_17.png)

**Note:** Do not add any message or words in the `Error Message` field. Leave it blank and click the `Save` button.

### Row 3 Logic: If Then

![Row 3 Logic](../../../static/img/Scheduled-Task-Winget-Update-All-(Create)/image_11.png)

![Row 3 Logic 2](../../../static/img/Scheduled-Task-Winget-Update-All-(Create)/image_12.png)

### Row 3a Condition: Custom Field Equals

Select the `Custom Field` option from the dropdown.

![Row 3a Condition](../../../static/img/Scheduled-Task-Winget-Update-All-(Create)/image_18.png)

![Row 3a Condition 2](../../../static/img/Scheduled-Task-Winget-Update-All-(Create)/image_19.png)

Search and select the `WingetUpdateAll_Task_Result` custom field in the `Search` field.

![Row 3a Condition 3](../../../static/img/Scheduled-Task-Winget-Update-All-(Create)/image_20.png)

![Row 3a Condition 4](../../../static/img/Scheduled-Task-Winget-Update-All-(Create)/image_21.png)

Change the operator to `Equals` from `Contains`.

![Row 3a Condition 5](../../../static/img/Scheduled-Task-Winget-Update-All-(Create)/image_22.png)

Type `Task Created` in the comparator field and press `Enter`.

![Row 3a Condition 6](../../../static/img/Scheduled-Task-Winget-Update-All-(Create)/image_23.png)

### Row 3b Function: Script Log

Add a new row by clicking on the `Add Row` button.

![Add Row for Script Log](../../../static/img/Scheduled-Task-Winget-Update-All-(Create)/image_14.png)

Search and select the `Script Log` function.

![Script Log Selection](../../../static/img/Scheduled-Task-Winget-Update-All-(Create)/image_15.png)

![Script Log Selected](../../../static/img/Scheduled-Task-Winget-Update-All-(Create)/image_16.png)

Add the following log in the `Script Log Message` field and click the `Save` button:

```plaintext
Task is already created on the computer.
```

### Row 3c Function: Script Exit

Add a new row by clicking on the `Add Row` button.

![Add Row for Script Exit](../../../static/img/Scheduled-Task-Winget-Update-All-(Create)/image_14.png)

Search and select the `Script Exit` function.

![Script Exit Selection](../../../static/img/Scheduled-Task-Winget-Update-All-(Create)/image_17.png)

**Note:** Do not add any message or words in the `Error Message` field. Leave it blank and click the `Save` button.

### Row 4 Logic: If Then

![Row 4 Logic](../../../static/img/Scheduled-Task-Winget-Update-All-(Create)/image_11.png)

![Row 4 Logic 2](../../../static/img/Scheduled-Task-Winget-Update-All-(Create)/image_12.png)

### Row 4a Condition: Custom Field Equals

Select the `Custom Field` option from the dropdown.

![Row 4a Condition](../../../static/img/Scheduled-Task-Winget-Update-All-(Create)/image_18.png)

![Row 4a Condition 2](../../../static/img/Scheduled-Task-Winget-Update-All-(Create)/image_19.png)

Search and select the `WingetUpdateAll_Task_Create` custom field in the `Search` field.

![Row 4a Condition 3](../../../static/img/Scheduled-Task-Winget-Update-All-(Create)/image_24.png)

![Row 4a Condition 4](../../../static/img/Scheduled-Task-Winget-Update-All-(Create)/image_25.png)

Change the operator to `Equals` from `Contains`.

![Row 4a Condition 5](../../../static/img/Scheduled-Task-Winget-Update-All-(Create)/image_26.png)

Keep the comparator to `False`.

![Row 4a Condition 6](../../../static/img/Scheduled-Task-Winget-Update-All-(Create)/image_27.png)

### Row 4b Function: Script Log

Add a new row by clicking on the `Add Row` button.

![Add Row for Script Log](../../../static/img/Scheduled-Task-Winget-Update-All-(Create)/image_14.png)

Search and select the `Script Log` function.

![Script Log Selection](../../../static/img/Scheduled-Task-Winget-Update-All-(Create)/image_15.png)

![Script Log Selected](../../../static/img/Scheduled-Task-Winget-Update-All-(Create)/image_16.png)

Add the following log in the `Script Log Message` field and click the `Save` button:

```plaintext
Winget Update All scheduled task creation is not enabled for the Company.
```

### Row 4c Function: Script Exit

Add a new row by clicking on the `Add Row` button.

![Add Row for Script Exit](../../../static/img/Scheduled-Task-Winget-Update-All-(Create)/image_14.png)

Search and select the `Script Exit` function.

![Script Exit Selection](../../../static/img/Scheduled-Task-Winget-Update-All-(Create)/image_17.png)

**Note:** Do not add any message or words in the `Error Message` field. Leave it blank and click the `Save` button.

### Row 5 Logic: If Then

![Row 5 Logic](../../../static/img/Scheduled-Task-Winget-Update-All-(Create)/image_11.png)

![Row 5 Logic 2](../../../static/img/Scheduled-Task-Winget-Update-All-(Create)/image_12.png)

### Row 5a Condition: Custom Field Equals

Select the `Custom Field` option from the dropdown.

![Row 5a Condition](../../../static/img/Scheduled-Task-Winget-Update-All-(Create)/image_18.png)

![Row 5a Condition 2](../../../static/img/Scheduled-Task-Winget-Update-All-(Create)/image_19.png)

Search and select the `wingetupdateall_task_Exclude` custom field in the `Search` field.

![Row 5a Condition 3](../../../static/img/Scheduled-Task-Winget-Update-All-(Create)/image_28.png)

Change the operator to `Equals` from `Contains`.

![Row 5a Condition 4](../../../static/img/Scheduled-Task-Winget-Update-All-(Create)/image_29.png)

Change the comparator to `True` from `False`.

![Row 5a Condition 5](../../../static/img/Scheduled-Task-Winget-Update-All-(Create)/image_30.png)

### Row 5b Function: Script Log

Add a new row by clicking on the `Add Row` button.

![Add Row for Script Log](../../../static/img/Scheduled-Task-Winget-Update-All-(Create)/image_14.png)

Search and select the `Script Log` function.

![Script Log Selection](../../../static/img/Scheduled-Task-Winget-Update-All-(Create)/image_15.png)

![Script Log Selected](../../../static/img/Scheduled-Task-Winget-Update-All-(Create)/image_16.png)

Add the following log in the `Script Log Message` field and click the `Save` button:

```plaintext
Computer is excluded from Winget Update All Scheduled Task Creation.
```

### Row 5c Function: Script Exit

Add a new row by clicking on the `Add Row` button.

![Add Row for Script Exit](../../../static/img/Scheduled-Task-Winget-Update-All-(Create)/image_14.png)

Search and select the `Script Exit` function.

![Script Exit Selection](../../../static/img/Scheduled-Task-Winget-Update-All-(Create)/image_17.png)

**Note:** Do not add any message or words in the `Error Message` field. Leave it blank and click the `Save` button.

### Row 6 Logic: If Then

![Row 6 Logic](../../../static/img/Scheduled-Task-Winget-Update-All-(Create)/image_11.png)

![Row 6 Logic 2](../../../static/img/Scheduled-Task-Winget-Update-All-(Create)/image_12.png)

### Row 6a Condition: Custom Field Equals

Select the `Custom Field` option from the dropdown.

![Row 6a Condition](../../../static/img/Scheduled-Task-Winget-Update-All-(Create)/image_18.png)

![Row 6a Condition 2](../../../static/img/Scheduled-Task-Winget-Update-All-(Create)/image_19.png)

Search and select the `wingetupdateall_task_Exclude` custom field in the `Search` field. In this step, select the Site-Level custom field.

Change the operator to `Equals` from `Contains`.

![Row 6a Condition 3](../../../static/img/Scheduled-Task-Winget-Update-All-(Create)/image_31.png)

Change the comparator to `True` from `False`.

![Row 6a Condition 4](../../../static/img/Scheduled-Task-Winget-Update-All-(Create)/image_30.png)

### Row 6b Function: Script Log

Add a new row by clicking on the `Add Row` button.

![Add Row for Script Log](../../../static/img/Scheduled-Task-Winget-Update-All-(Create)/image_14.png)

Search and select the `Script Log` function.

![Script Log Selection](../../../static/img/Scheduled-Task-Winget-Update-All-(Create)/image_15.png)

![Script Log Selected](../../../static/img/Scheduled-Task-Winget-Update-All-(Create)/image_16.png)

Add the following log in the `Script Log Message` field and click the `Save` button:

```plaintext
Site is excluded from Winget Update All Scheduled Task Creation.
```

### Row 6c Function: Script Exit

Add a new row by clicking on the `Add Row` button.

![Add Row for Script Exit](../../../static/img/Scheduled-Task-Winget-Update-All-(Create)/image_14.png)

Search and select the `Script Exit` function.

![Script Exit Selection](../../../static/img/Scheduled-Task-Winget-Update-All-(Create)/image_17.png)

**Note:** Do not add any message or words in the `Error Message` field. Leave it blank and click the `Save` button.

### Row 7 Logic: If Then Else

![Row 7 Logic](../../../static/img/Scheduled-Task-Winget-Update-All-(Create)/image_32.png)

![Row 7 Logic 2](../../../static/img/Scheduled-Task-Winget-Update-All-(Create)/image_33.png)

### Row 7a Condition: Custom Field Equals

Select the `Custom Field` option from the dropdown.

![Row 7a Condition](../../../static/img/Scheduled-Task-Winget-Update-All-(Create)/image_18.png)

![Row 7a Condition 2](../../../static/img/Scheduled-Task-Winget-Update-All-(Create)/image_19.png)

Search and select the `WingetUpdateAll_UserTask_Disable` custom field in the `Search` field. Select the `Company-Level Boolean` field.

![Row 7a Condition 3](../../../static/img/Scheduled-Task-Winget-Update-All-(Create)/image_34.png)

Change the operator to `Equals` from `Contains`.

![Row 7a Condition 4](../../../static/img/Scheduled-Task-Winget-Update-All-(Create)/image_35.png)

Change the comparator to `True` from `False`.

![Row 7a Condition 5](../../../static/img/Scheduled-Task-Winget-Update-All-(Create)/image_36.png)

Add another condition by clicking the `Add Condition` button.

![Add Condition](../../../static/img/Scheduled-Task-Winget-Update-All-(Create)/image_37.png)

Change the logical operator to `Or` from `And`.

![Change Logical Operator](../../../static/img/Scheduled-Task-Winget-Update-All-(Create)/image_38.png)

Select the `Custom Field` option from the dropdown.

![Row 7a Condition 6](../../../static/img/Scheduled-Task-Winget-Update-All-(Create)/image_39.png)

Search and select the `WingetUpdateAll_UserTask_Disable` custom field in the `Search` field. Select the `Site-Level Boolean` field.

Change the operator to `Equals` from `Contains` and the comparator to `True` from `False`.

Add another condition by clicking the `Add Condition` button.

Change the logical operator to `Or` from `And`.

Select the `Custom Field` option from the dropdown.

Search and select the `WingetUpdateAll_UserTask_Disable` custom field in the `Search` field. Select the `Computer-Level Boolean` field.

Change the operator to `Equals` from `Contains` and the comparator to `True` from `False`.

### Row 7b Function: Set User Variable

Add a new row by clicking on the `Add Row` button.

Search and select the `Set User Variable` function.

Add `UserTask` in the `Variable Name` field and `0` in the `Value` field, then click the `Save` button.

### Row 7c Function: Set User Variable

Add a new row by clicking on the `Add Row` button in the `Else` section.

Search and select the `Set User Variable` function.

Add `UserTask` in the `Variable Name` field and `1` in the `Value` field, then click the `Save` button.

### Row 8 Function: PowerShell Script

Add a new row by clicking on the `Add Row` button outside the If/Then/Else logic.

Search and select the `PowerShell Script` function.

Paste in the following PowerShell script and set the expected time of script execution to `600` seconds. Click the `Save` button.

```powershell
$DisableUserTask = if ( '@UserTask@' -eq 0 ) { $True } else { $False }
$Force = 1
$ProjectName = 'Invoke-WingetProcessor'
$WorkingDirectory = "C:\\ProgramData\\_automation\\script\\$ProjectName"
$FilePath = "$WorkingDirectory\\Winget-UpdateAll.ps1"

#region Setup - Folder Structure
if ( $Force ) {
    Remove-Item -Path $WorkingDirectory -Force -Recurse -ErrorAction SilentlyContinue -Confirm:$false | Out-Null
}
if ( !( Test-Path $WorkingDirectory ) ) {
    try {
        New-Item -Path $WorkingDirectory -ItemType Directory -ErrorAction Stop -Force | Out-Null
    } catch {
        throw "Failed to create the working directory. Reason: $($Error[0].Exception.Message)"
    }
}

if (-not ( ( ( Get-Acl $WorkingDirectory ).Access | Where-Object { $_.IdentityReference -Match 'EveryOne' } ).FileSystemRights -Match 'FullControl' ) ) {
    $ACl = Get-Acl $WorkingDirectory -ErrorAction SilentlyContinue
    $AccessRule = New-Object System.Security.AccessControl.FileSystemAccessRule('Everyone', 'FullControl', 'ContainerInherit, ObjectInherit', 'none', 'Allow')
    $Acl.AddAccessRule($AccessRule)
    Set-Acl  $WorkingDirectory $Acl -ErrorAction SilentlyContinue
}

$FileContent = @"
#region Setup - Variables
`$ProjectName = 'Invoke-WingetProcessor'
`$BaseURL = 'https://file.provaltech.com/repo'
`$PS1URL = "`$BaseURL/script/`$ProjectName.ps1"
`$WorkingDirectory = "C:\\ProgramData\\_automation\\script\\`$ProjectName"
`$PS1Path = "`$WorkingDirectory\\`$ProjectName.ps1"
`$LogPath = "`$WorkingDirectory\\`$ProjectName-log.txt"
`$OldLogPath = "`$WorkingDirectory\\`$ProjectName-log-old.txt"
#endregion
"@

if ( Test-Path `$OldLogPath ) {
    if ( (Get-ItemProperty -Path `$OldLogPath).CreationDate -le (Get-Date).AddDays(-29) ) {
        Remove-Item -Path `$OldLogPath -ErrorAction SilentlyContinue -Force -Confirm:`$false
    }
}

if ( Test-Path `$LogPath ) {
    if ( (Get-ItemProperty -Path `$LogPath).CreationDate -le (Get-Date).AddDays(-30) ) {
        Rename-Item -Path `$LogPath -NewName "`$(`$ProjectName)-log-old.txt" -ErrorAction SilentlyContinue -Force -Confirm:`$false
    }
}

`$Timeout = 1
do {
    try { `$connection = test-connection 8.8.8.8 -Erroraction Stop } catch { `$connection = 'down' }
    Start-Sleep -Seconds 1
    `$Timeout++
} until ( `$connection -ne 'Down' -or `$Timeout -lt 120 )

if ( `$Timeout -ge 120 ) {
    return
}

`$response = Invoke-WebRequest -Uri `$PS1URL -UseBasicParsing
if ( ( `$response.StatusCode -ne 200 ) -and ( !( Test-Path -Path `$PS1Path ) ) ) {
    throw "No pre-downloaded script exists and the script '`$PS1URL' failed to download. Exiting."
} elseif ( `$response.StatusCode -eq 200 ) {
    Remove-Item -Path `$PS1Path -ErrorAction SilentlyContinue
    `$Utf8NoBomEncoding = New-Object System.Text.UTF8Encoding `$False
    [System.IO.File]::WriteAllLines(`$PS1Path, `$response.Content, `$Utf8NoBomEncoding)
}
if ( !( Test-Path -Path `$PS1Path ) ) {
    throw 'An error occurred and the script was unable to be downloaded. Exiting.'
}
#region
`$op = & `$PS1Path -UpdateAll
Write-Log -Text "Output: `$op"
```

Mark the `Continue on Failure` flag for the function.

### Row 9 Function: Script Log

Add a new row by clicking on the `Add Row` button.

Search and select the `Script Log` function.

Add the following log in the `Script Log Message` field and click the `Save` button:

```plaintext
Script Result:
%Output%
```

## Completed Script

![Completed Script 1](../../../static/img/Scheduled-Task-Winget-Update-All-(Create)/image_40.png)

![Completed Script 2](../../../static/img/Scheduled-Task-Winget-Update-All-(Create)/image_41.png)

![Completed Script 3](../../../static/img/Scheduled-Task-Winget-Update-All-(Create)/image_42.png)

Click the `Save` button at the top right corner of the screen to save the script.

![Save Script](../../../static/img/Scheduled-Task-Winget-Update-All-(Create)/image_43.png)

## Deployment

It is suggested to run the task once per day against the [Winget Update All (Task Create)](<../groups/Winget Update All (Task Create).md>) device group.

- Go to `Automation` > `Tasks`.
- Search for `Scheduled Task Winget Update All (Create) Task`.
- Select the concerned task.
- Click on the `Schedule button` to schedule the task.

![Schedule Task](../../../static/img/Scheduled-Task-Winget-Update-All-(Create)/image_44.png)

This screen will appear.

![Schedule Confirmation](../../../static/img/Scheduled-Task-Winget-Update-All-(Create)/image_45.png)

Click the `Does not repeat` button.

![Change Schedule](../../../static/img/Scheduled-Task-Winget-Update-All-(Create)/image_46.png)

This pop-up box will appear.

Click the `OK` button to save the schedule. Recurrence will be changed to `Every day`.

![Save Schedule](../../../static/img/Scheduled-Task-Winget-Update-All-(Create)/image_47.png)

Select the `Device Groups` option in the `Targeted Resources` section.

![Select Device Groups](../../../static/img/Scheduled-Task-Winget-Update-All-(Create)/image_48.png)

Search and select the [Winget Update All (Task Create)](<../groups/Winget Update All (Task Create).md>) device group.

![Select Device Group](../../../static/img/Scheduled-Task-Winget-Update-All-(Create)/image_49.png)

Now click the `Run button` to initiate the task.

![Run Task](../../../static/img/Scheduled-Task-Winget-Update-All-(Create)/image_50.png)

The task will start appearing in the Scheduled Tasks.

![Scheduled Tasks](../../../static/img/Scheduled-Task-Winget-Update-All-(Create)/image_51.png)

![Scheduled Tasks 2](../../../static/img/Scheduled-Task-Winget-Update-All-(Create)/image_52.png)

## Output

- Custom Field
- Script Log


