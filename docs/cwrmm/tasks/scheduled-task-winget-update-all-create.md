---
id: 'a898b5ac-23d0-4e0d-89e5-79bca2277a6e'
slug: /a898b5ac-23d0-4e0d-89e5-79bca2277a6e
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

The task can only be executed against the companies where the company-level custom field [WingetUpdateAll_Task_Create](/docs/40e64c1d-ca29-4c85-9a72-a48b1082b8e1) is marked.

## Sample Run

![Sample Run 1](../../../static/img/docs/a898b5ac-23d0-4e0d-89e5-79bca2277a6e/image_1.webp)

![Sample Run 2](../../../static/img/docs/a898b5ac-23d0-4e0d-89e5-79bca2277a6e/image_2.webp)

## Dependencies

- [CW RMM - Custom Field - Company - WingetUpdateAll_Task_Create](/docs/40e64c1d-ca29-4c85-9a72-a48b1082b8e1)
- [CW RMM - Custom Field - Company - WingetUpdateAll_Task_Delete](/docs/a398be5b-5709-4ab5-ac33-7feca8fbc00a)
- [CW RMM - Custom Field - Company - WingetUpdateAll_UserTask_Disable](/docs/8c8bc8b0-817e-4903-bd09-90df4c25ab9e)
- [CW RMM - Custom Field - Site - WingetUpdateAll_Task_Exclude](/docs/0c299d28-5fcb-4a1e-a341-1c5e78f74cfb)
- [CW RMM - Custom Field - Site - WingetUpdateAll_UserTask_Disable](/docs/280aafc8-9ab0-4cca-b499-d107b47de432)
- [CW RMM - Custom Field - EndPoint - WingetUpdateAll_Task_Exclude](/docs/91965ea0-f912-4f5d-8e42-c9ee546293a9)
- [CW RMM - Custom Field - EndPoint - WingetUpdateAll_Task_Result](/docs/a6ff85ad-b8e9-4e0f-9e2f-db964d483e5f)
- [CW RMM - Custom Field - EndPoint - WingetUpdateAll_UserTask_Disable](/docs/8022b663-4923-47d5-b8c7-7ba24aae305d)
- [CW RMM - Device Group - Winget Update All (Task Create)](/docs/22ee8d54-e19d-4b47-9ccd-c45c259f8fb7)

## Variables

| Name      | Description                                |
|-----------|--------------------------------------------|
| UserTask  | Whether the user task is disabled or not.  |
| Output    | Output of the PowerShell script.           |

## Task Creation

Create a new `Script Editor` style script in the system to implement this task.

![Task Creation 1](../../../static/img/docs/a898b5ac-23d0-4e0d-89e5-79bca2277a6e/image_3.webp)

![Task Creation 2](../../../static/img/docs/a898b5ac-23d0-4e0d-89e5-79bca2277a6e/image_4.webp)

**Name:** Scheduled Task Winget Update All (Create)

**Description:** The ultimate objective of the task is to establish and oversee two scheduled tasks (Winget Update All [System] and Winget Update All [Logged on User]) designed to update installed applications utilizing Winget on Windows 10 and 11.

**Category:** Patching

![Task Creation 3](../../../static/img/docs/a898b5ac-23d0-4e0d-89e5-79bca2277a6e/image_5.webp)

## Task

Start by adding a row. You can do this by clicking the `Add Row` button at the bottom of the script page.

![Add Row](../../../static/img/docs/a898b5ac-23d0-4e0d-89e5-79bca2277a6e/image_6.webp)

This function will appear.

![Function Appears](../../../static/img/docs/a898b5ac-23d0-4e0d-89e5-79bca2277a6e/image_7.webp)

### Row 1 Function: PowerShell Script

Search and select the `PowerShell Script` function.

![PowerShell Script Selection](../../../static/img/docs/a898b5ac-23d0-4e0d-89e5-79bca2277a6e/image_8.webp)

![PowerShell Script Selected](../../../static/img/docs/a898b5ac-23d0-4e0d-89e5-79bca2277a6e/image_9.webp)

Paste in the following PowerShell script and set the expected time of script execution to `300` seconds. Click the `Save` button.

```powershell
if ( (get-ciminstance -classname Win32_OperatingSystem).caption -match 'Windows 1[01]' ) { 'Supported' } else { 'Unsupported' }
```

![PowerShell Script Pasted](../../../static/img/docs/a898b5ac-23d0-4e0d-89e5-79bca2277a6e/image_10.webp)

### Row 2 Logic: If Then

![Row 2 Logic](../../../static/img/docs/a898b5ac-23d0-4e0d-89e5-79bca2277a6e/image_11.webp)

![Row 2 Logic 2](../../../static/img/docs/a898b5ac-23d0-4e0d-89e5-79bca2277a6e/image_12.webp)

### Row 2a Condition: Output Contains

Type `Unsupported` in the `Input Value or Variable` field and press `Enter`.

![Row 2a Condition](../../../static/img/docs/a898b5ac-23d0-4e0d-89e5-79bca2277a6e/image_13.webp)

### Row 2b Function: Script Log

Add a new row by clicking on the `Add Row` button.

![Add Row for Script Log](../../../static/img/docs/a898b5ac-23d0-4e0d-89e5-79bca2277a6e/image_14.webp)

Search and select the `Script Log` function.

![Script Log Selection](../../../static/img/docs/a898b5ac-23d0-4e0d-89e5-79bca2277a6e/image_15.webp)

![Script Log Selected](../../../static/img/docs/a898b5ac-23d0-4e0d-89e5-79bca2277a6e/image_16.webp)

Add the following log in the `Script Log Message` field and click the `Save` button:

```plaintext
Unsupported Operating System.
```

```plaintext
Supported OS are Windows 10 and Windows 11
```

### Row 2c Function: Script Exit

Add a new row by clicking on the `Add Row` button.

![Add Row for Script Exit](../../../static/img/docs/a898b5ac-23d0-4e0d-89e5-79bca2277a6e/image_14.webp)

Search and select the `Script Exit` function.

![Script Exit Selection](../../../static/img/docs/a898b5ac-23d0-4e0d-89e5-79bca2277a6e/image_17.webp)

**Note:** Do not add any message or words in the `Error Message` field. Leave it blank and click the `Save` button.

### Row 3 Logic: If Then

![Row 3 Logic](../../../static/img/docs/a898b5ac-23d0-4e0d-89e5-79bca2277a6e/image_11.webp)

![Row 3 Logic 2](../../../static/img/docs/a898b5ac-23d0-4e0d-89e5-79bca2277a6e/image_12.webp)

### Row 3a Condition: Custom Field Equals

Select the `Custom Field` option from the dropdown.

![Row 3a Condition](../../../static/img/docs/a898b5ac-23d0-4e0d-89e5-79bca2277a6e/image_18.webp)

![Row 3a Condition 2](../../../static/img/docs/a898b5ac-23d0-4e0d-89e5-79bca2277a6e/image_19.webp)

Search and select the `WingetUpdateAll_Task_Result` custom field in the `Search` field.

![Row 3a Condition 3](../../../static/img/docs/a898b5ac-23d0-4e0d-89e5-79bca2277a6e/image_20.webp)

![Row 3a Condition 4](../../../static/img/docs/a898b5ac-23d0-4e0d-89e5-79bca2277a6e/image_21.webp)

Change the operator to `Equals` from `Contains`.

![Row 3a Condition 5](../../../static/img/docs/a898b5ac-23d0-4e0d-89e5-79bca2277a6e/image_22.webp)

Type `Task Created` in the comparator field and press `Enter`.

![Row 3a Condition 6](../../../static/img/docs/a898b5ac-23d0-4e0d-89e5-79bca2277a6e/image_23.webp)

### Row 3b Function: Script Log

Add a new row by clicking on the `Add Row` button.

![Add Row for Script Log](../../../static/img/docs/a898b5ac-23d0-4e0d-89e5-79bca2277a6e/image_14.webp)

Search and select the `Script Log` function.

![Script Log Selection](../../../static/img/docs/a898b5ac-23d0-4e0d-89e5-79bca2277a6e/image_15.webp)

![Script Log Selected](../../../static/img/docs/a898b5ac-23d0-4e0d-89e5-79bca2277a6e/image_16.webp)

Add the following log in the `Script Log Message` field and click the `Save` button:

```plaintext
Task is already created on the computer.
```

### Row 3c Function: Script Exit

Add a new row by clicking on the `Add Row` button.

![Add Row for Script Exit](../../../static/img/docs/a898b5ac-23d0-4e0d-89e5-79bca2277a6e/image_14.webp)

Search and select the `Script Exit` function.

![Script Exit Selection](../../../static/img/docs/a898b5ac-23d0-4e0d-89e5-79bca2277a6e/image_17.webp)

**Note:** Do not add any message or words in the `Error Message` field. Leave it blank and click the `Save` button.

### Row 4 Logic: If Then

![Row 4 Logic](../../../static/img/docs/a898b5ac-23d0-4e0d-89e5-79bca2277a6e/image_11.webp)

![Row 4 Logic 2](../../../static/img/docs/a898b5ac-23d0-4e0d-89e5-79bca2277a6e/image_12.webp)

### Row 4a Condition: Custom Field Equals

Select the `Custom Field` option from the dropdown.

![Row 4a Condition](../../../static/img/docs/a898b5ac-23d0-4e0d-89e5-79bca2277a6e/image_18.webp)

![Row 4a Condition 2](../../../static/img/docs/a898b5ac-23d0-4e0d-89e5-79bca2277a6e/image_19.webp)

Search and select the `WingetUpdateAll_Task_Create` custom field in the `Search` field.

![Row 4a Condition 3](../../../static/img/docs/a898b5ac-23d0-4e0d-89e5-79bca2277a6e/image_24.webp)

![Row 4a Condition 4](../../../static/img/docs/a898b5ac-23d0-4e0d-89e5-79bca2277a6e/image_25.webp)

Change the operator to `Equals` from `Contains`.

![Row 4a Condition 5](../../../static/img/docs/a898b5ac-23d0-4e0d-89e5-79bca2277a6e/image_26.webp)

Keep the comparator to `False`.

![Row 4a Condition 6](../../../static/img/docs/a898b5ac-23d0-4e0d-89e5-79bca2277a6e/image_27.webp)

### Row 4b Function: Script Log

Add a new row by clicking on the `Add Row` button.

![Add Row for Script Log](../../../static/img/docs/a898b5ac-23d0-4e0d-89e5-79bca2277a6e/image_14.webp)

Search and select the `Script Log` function.

![Script Log Selection](../../../static/img/docs/a898b5ac-23d0-4e0d-89e5-79bca2277a6e/image_15.webp)

![Script Log Selected](../../../static/img/docs/a898b5ac-23d0-4e0d-89e5-79bca2277a6e/image_16.webp)

Add the following log in the `Script Log Message` field and click the `Save` button:

```plaintext
Winget Update All scheduled task creation is not enabled for the Company.
```

### Row 4c Function: Script Exit

Add a new row by clicking on the `Add Row` button.

![Add Row for Script Exit](../../../static/img/docs/a898b5ac-23d0-4e0d-89e5-79bca2277a6e/image_14.webp)

Search and select the `Script Exit` function.

![Script Exit Selection](../../../static/img/docs/a898b5ac-23d0-4e0d-89e5-79bca2277a6e/image_17.webp)

**Note:** Do not add any message or words in the `Error Message` field. Leave it blank and click the `Save` button.

### Row 5 Logic: If Then

![Row 5 Logic](../../../static/img/docs/a898b5ac-23d0-4e0d-89e5-79bca2277a6e/image_11.webp)

![Row 5 Logic 2](../../../static/img/docs/a898b5ac-23d0-4e0d-89e5-79bca2277a6e/image_12.webp)

### Row 5a Condition: Custom Field Equals

Select the `Custom Field` option from the dropdown.

![Row 5a Condition](../../../static/img/docs/a898b5ac-23d0-4e0d-89e5-79bca2277a6e/image_18.webp)

![Row 5a Condition 2](../../../static/img/docs/a898b5ac-23d0-4e0d-89e5-79bca2277a6e/image_19.webp)

Search and select the `wingetupdateall_task_Exclude` custom field in the `Search` field.

![Row 5a Condition 3](../../../static/img/docs/a898b5ac-23d0-4e0d-89e5-79bca2277a6e/image_28.webp)

Change the operator to `Equals` from `Contains`.

![Row 5a Condition 4](../../../static/img/docs/a898b5ac-23d0-4e0d-89e5-79bca2277a6e/image_29.webp)

Change the comparator to `True` from `False`.

![Row 5a Condition 5](../../../static/img/docs/a898b5ac-23d0-4e0d-89e5-79bca2277a6e/image_30.webp)

### Row 5b Function: Script Log

Add a new row by clicking on the `Add Row` button.

![Add Row for Script Log](../../../static/img/docs/a898b5ac-23d0-4e0d-89e5-79bca2277a6e/image_14.webp)

Search and select the `Script Log` function.

![Script Log Selection](../../../static/img/docs/a898b5ac-23d0-4e0d-89e5-79bca2277a6e/image_15.webp)

![Script Log Selected](../../../static/img/docs/a898b5ac-23d0-4e0d-89e5-79bca2277a6e/image_16.webp)

Add the following log in the `Script Log Message` field and click the `Save` button:

```plaintext
Computer is excluded from Winget Update All Scheduled Task Creation.
```

### Row 5c Function: Script Exit

Add a new row by clicking on the `Add Row` button.

![Add Row for Script Exit](../../../static/img/docs/a898b5ac-23d0-4e0d-89e5-79bca2277a6e/image_14.webp)

Search and select the `Script Exit` function.

![Script Exit Selection](../../../static/img/docs/a898b5ac-23d0-4e0d-89e5-79bca2277a6e/image_17.webp)

**Note:** Do not add any message or words in the `Error Message` field. Leave it blank and click the `Save` button.

### Row 6 Logic: If Then

![Row 6 Logic](../../../static/img/docs/a898b5ac-23d0-4e0d-89e5-79bca2277a6e/image_11.webp)

![Row 6 Logic 2](../../../static/img/docs/a898b5ac-23d0-4e0d-89e5-79bca2277a6e/image_12.webp)

### Row 6a Condition: Custom Field Equals

Select the `Custom Field` option from the dropdown.

![Row 6a Condition](../../../static/img/docs/a898b5ac-23d0-4e0d-89e5-79bca2277a6e/image_18.webp)

![Row 6a Condition 2](../../../static/img/docs/a898b5ac-23d0-4e0d-89e5-79bca2277a6e/image_19.webp)

Search and select the `wingetupdateall_task_Exclude` custom field in the `Search` field. In this step, select the Site-Level custom field.

Change the operator to `Equals` from `Contains`.

![Row 6a Condition 3](../../../static/img/docs/a898b5ac-23d0-4e0d-89e5-79bca2277a6e/image_31.webp)

Change the comparator to `True` from `False`.

![Row 6a Condition 4](../../../static/img/docs/a898b5ac-23d0-4e0d-89e5-79bca2277a6e/image_30.webp)

### Row 6b Function: Script Log

Add a new row by clicking on the `Add Row` button.

![Add Row for Script Log](../../../static/img/docs/a898b5ac-23d0-4e0d-89e5-79bca2277a6e/image_14.webp)

Search and select the `Script Log` function.

![Script Log Selection](../../../static/img/docs/a898b5ac-23d0-4e0d-89e5-79bca2277a6e/image_15.webp)

![Script Log Selected](../../../static/img/docs/a898b5ac-23d0-4e0d-89e5-79bca2277a6e/image_16.webp)

Add the following log in the `Script Log Message` field and click the `Save` button:

```plaintext
Site is excluded from Winget Update All Scheduled Task Creation.
```

### Row 6c Function: Script Exit

Add a new row by clicking on the `Add Row` button.

![Add Row for Script Exit](../../../static/img/docs/a898b5ac-23d0-4e0d-89e5-79bca2277a6e/image_14.webp)

Search and select the `Script Exit` function.

![Script Exit Selection](../../../static/img/docs/a898b5ac-23d0-4e0d-89e5-79bca2277a6e/image_17.webp)

**Note:** Do not add any message or words in the `Error Message` field. Leave it blank and click the `Save` button.

### Row 7 Logic: If Then Else

![Row 7 Logic](../../../static/img/docs/a898b5ac-23d0-4e0d-89e5-79bca2277a6e/image_32.webp)

![Row 7 Logic 2](../../../static/img/docs/a898b5ac-23d0-4e0d-89e5-79bca2277a6e/image_33.webp)

### Row 7a Condition: Custom Field Equals

Select the `Custom Field` option from the dropdown.

![Row 7a Condition](../../../static/img/docs/a898b5ac-23d0-4e0d-89e5-79bca2277a6e/image_18.webp)

![Row 7a Condition 2](../../../static/img/docs/a898b5ac-23d0-4e0d-89e5-79bca2277a6e/image_19.webp)

Search and select the `WingetUpdateAll_UserTask_Disable` custom field in the `Search` field. Select the `Company-Level Boolean` field.

![Row 7a Condition 3](../../../static/img/docs/a898b5ac-23d0-4e0d-89e5-79bca2277a6e/image_34.webp)

Change the operator to `Equals` from `Contains`.

![Row 7a Condition 4](../../../static/img/docs/a898b5ac-23d0-4e0d-89e5-79bca2277a6e/image_35.webp)

Change the comparator to `True` from `False`.

![Row 7a Condition 5](../../../static/img/docs/a898b5ac-23d0-4e0d-89e5-79bca2277a6e/image_36.webp)

Add another condition by clicking the `Add Condition` button.

![Add Condition](../../../static/img/docs/a898b5ac-23d0-4e0d-89e5-79bca2277a6e/image_37.webp)

Change the logical operator to `Or` from `And`.

![Change Logical Operator](../../../static/img/docs/a898b5ac-23d0-4e0d-89e5-79bca2277a6e/image_38.webp)

Select the `Custom Field` option from the dropdown.

![Row 7a Condition 6](../../../static/img/docs/a898b5ac-23d0-4e0d-89e5-79bca2277a6e/image_39.webp)

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

![Completed Script 1](../../../static/img/docs/a898b5ac-23d0-4e0d-89e5-79bca2277a6e/image_40.webp)

![Completed Script 2](../../../static/img/docs/a898b5ac-23d0-4e0d-89e5-79bca2277a6e/image_41.webp)

![Completed Script 3](../../../static/img/docs/a898b5ac-23d0-4e0d-89e5-79bca2277a6e/image_42.webp)

Click the `Save` button at the top right corner of the screen to save the script.

![Save Script](../../../static/img/docs/a898b5ac-23d0-4e0d-89e5-79bca2277a6e/image_43.webp)

## Deployment

It is suggested to run the task once per day against the [Winget Update All (Task Create)](/docs/22ee8d54-e19d-4b47-9ccd-c45c259f8fb7) device group.

- Go to `Automation` > `Tasks`.
- Search for `Scheduled Task Winget Update All (Create) Task`.
- Select the concerned task.
- Click on the `Schedule button` to schedule the task.

![Schedule Task](../../../static/img/docs/a898b5ac-23d0-4e0d-89e5-79bca2277a6e/image_44.webp)

This screen will appear.

![Schedule Confirmation](../../../static/img/docs/a898b5ac-23d0-4e0d-89e5-79bca2277a6e/image_45.webp)

Click the `Does not repeat` button.

![Change Schedule](../../../static/img/docs/a898b5ac-23d0-4e0d-89e5-79bca2277a6e/image_46.webp)

This pop-up box will appear.

Click the `OK` button to save the schedule. Recurrence will be changed to `Every day`.

![Save Schedule](../../../static/img/docs/a898b5ac-23d0-4e0d-89e5-79bca2277a6e/image_47.webp)

Select the `Device Groups` option in the `Targeted Resources` section.

![Select Device Groups](../../../static/img/docs/a898b5ac-23d0-4e0d-89e5-79bca2277a6e/image_48.webp)

Search and select the [Winget Update All (Task Create)](/docs/22ee8d54-e19d-4b47-9ccd-c45c259f8fb7) device group.

![Select Device Group](../../../static/img/docs/a898b5ac-23d0-4e0d-89e5-79bca2277a6e/image_49.webp)

Now click the `Run button` to initiate the task.

![Run Task](../../../static/img/docs/a898b5ac-23d0-4e0d-89e5-79bca2277a6e/image_50.webp)

The task will start appearing in the Scheduled Tasks.

![Scheduled Tasks](../../../static/img/docs/a898b5ac-23d0-4e0d-89e5-79bca2277a6e/image_51.webp)

![Scheduled Tasks 2](../../../static/img/docs/a898b5ac-23d0-4e0d-89e5-79bca2277a6e/image_52.webp)

## Output

- Custom Field
- Script Log