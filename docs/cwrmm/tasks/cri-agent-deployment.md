---
id: '344a3ab5-d05c-41a5-9303-45fc387ec2e8'
slug: /344a3ab5-d05c-41a5-9303-45fc387ec2e8
title: 'CRI Agent Deployment'
title_meta: 'CRI Agent Deployment'
keywords: ['cyrisma', 'deployment', 'agent', 'installation', 'windows']
description: 'This document outlines the steps to deploy the Cyrisma Censor Application using a custom task in ConnectWise Automate, including script implementation, scheduling, and logging.'
tags: ['deployment', 'installation', 'windows']
draft: false
unlisted: false
---

## Summary

This task is designed to deploy the Cyrisma Censor Application.

## Sample Run

![Sample Run 1](../../../static/img/docs/9df5a58f-f44f-4af8-8620-c5670c9d8524/image_1.webp)

![Sample Run 2](../../../static/img/docs/9df5a58f-f44f-4af8-8620-c5670c9d8524/image_2.webp)

## Implementation

### Create Task

To implement this script, please create a new "PowerShell" style script in the system.

![Create Task](../../../static/img/docs/9df5a58f-f44f-4af8-8620-c5670c9d8524/image_3.webp)

- **Name:** CRI Agent Deployment  
- **Description:** This script installs the CRI Agent on the machines.  
- **OS Supported:** Windows  
- **Category:** Custom  

![Task Details](../../../static/img/docs/9df5a58f-f44f-4af8-8620-c5670c9d8524/image_4.webp)

### Script

Start by creating three separate rows. You can do this by clicking the "Add Row" button at the bottom of the script page.

![Add Row](../../../static/img/docs/9df5a58f-f44f-4af8-8620-c5670c9d8524/image_5.webp)

### Row 1: Function: Set Pre-defined Variable

![Row 1 Image 1](../../../static/img/docs/9df5a58f-f44f-4af8-8620-c5670c9d8524/image_6.webp)

![Row 1 Image 2](../../../static/img/docs/9df5a58f-f44f-4af8-8620-c5670c9d8524/image_7.webp)

This sets the variable `CryismaAgent_URL` with the value of a custom field 'CryismaAgent_URL' [CW RMM - Cyrisma Custom Fields](/docs/2d448750-129b-4cff-aaf1-e73d2a296418).

### Row 2: Function: Set Pre-defined Variable

![Row 2 Image 1](../../../static/img/docs/9df5a58f-f44f-4af8-8620-c5670c9d8524/image_8.webp)

![Row 2 Image 2](../../../static/img/docs/9df5a58f-f44f-4af8-8620-c5670c9d8524/image_9.webp)

This sets the variable `CryismaAgent_Key` with the value of a custom field 'CryismaAgent_Key' [CW RMM - Cyrisma Custom Fields](/docs/2d448750-129b-4cff-aaf1-e73d2a296418).

### Row 3: Function: PowerShell Script

![Row 3 Image 1](../../../static/img/docs/9df5a58f-f44f-4af8-8620-c5670c9d8524/image_10.webp)

![Row 3 Image 2](../../../static/img/docs/9df5a58f-f44f-4af8-8620-c5670c9d8524/image_11.webp)

Paste the following PowerShell script and set the expected time of script execution to `1800` seconds.

```
$InstallerCheck = Get-ChildItem -Path HKLM:/SOFTWARE/Microsoft/Windows/CurrentVersion/Uninstall, HKLM:/SOFTWARE/Wow6432Node/Microsoft/Windows/CurrentVersion/Uninstall | Get-ItemProperty | Where-Object { $_.DisplayName -match 'Cyrisma' } | Select-Object -ExpandProperty DisplayName
if ($InstallerCheck) {
    Write-Output 'The Cyrisma is already installed'
} else {
    $ProjectName = 'Cyrisma_Setup'
    $EXEURL = 'https://dl.cyrisma.com/6167656E7473/Cyrisma_Setup.exe'
    $WorkingDirectory = "C:/ProgramData/_automation/app/$ProjectName"
    $EXEPath = "$WorkingDirectory/$ProjectName.exe"
    if (!(Test-Path $WorkingDirectory)) {
        try {
            New-Item -Path $WorkingDirectory -ItemType Directory -Force -ErrorAction Stop | Out-Null
        } catch {
            throw "Failed to Create $WorkingDirectory. Reason: $($Error[0].Exception.Message)"
        }
    }
    if (-not (((Get-Acl $WorkingDirectory).Access | Where-Object { $_.IdentityReference -Match 'Everyone' }).FileSystemRights -Match 'FullControl')) {
        $ACl = Get-Acl $WorkingDirectory
        $AccessRule = New-Object System.Security.AccessControl.FileSystemAccessRule('Everyone', 'FullControl', 'ContainerInherit, ObjectInherit', 'none', 'Allow')
        $Acl.AddAccessRule($AccessRule)
        Set-Acl $WorkingDirectory $Acl
    }
    Invoke-WebRequest -Uri $EXEURL -UseBasicParsing -OutFile $EXEPath
    if (!(Test-Path -Path $EXEPath)) {
        Write-Output "No pre-downloaded app exists and the script $EXEURL failed to download. Exiting."
        return 1
    }
    cmd.exe /c "$ExePath /verysilent /key=@CRIAgent_Key@ /url=@CRIAgent_URL@"
    Start-Sleep -Seconds 180
    $InstallerCheck = Get-ChildItem -Path HKLM:/SOFTWARE/Microsoft/Windows/CurrentVersion/Uninstall, HKLM:/SOFTWARE/Wow6432Node/Microsoft/Windows/CurrentVersion/Uninstall | Get-ItemProperty | Where-Object { $_.DisplayName -match 'Cyrisma' } | Select-Object -ExpandProperty DisplayName
    if ($InstallerCheck) {
        Write-Output 'The Cyrisma is installed successfully'
    } else {
        Write-Output 'The Cyrisma failed to deploy'
    }
}
```

### Row 4: Function: Script Log

![Row 4 Image](../../../static/img/docs/9df5a58f-f44f-4af8-8620-c5670c9d8524/image_12.webp)

In the script log message, simply type `%output%` so that the script will send the results of the PowerShell script above to the output on the Automation tab for the target device.

![Log Output](../../../static/img/docs/9df5a58f-f44f-4af8-8620-c5670c9d8524/image_13.webp)

### Row 5: Logic: If/Then/Else

![Row 5 Image 1](../../../static/img/docs/9df5a58f-f44f-4af8-8620-c5670c9d8524/image_14.webp)

![Row 5 Image 2](../../../static/img/docs/9df5a58f-f44f-4af8-8620-c5670c9d8524/image_15.webp)

### Row 4a: Condition: Output Contains

In the IF part, enter `Installation failed` in the right box of the "Output Contains" section.

![Condition Image](../../../static/img/docs/9df5a58f-f44f-4af8-8620-c5670c9d8524/image_16.webp)

### Row 4b: Function: Set Custom Field

Add a new row by clicking on the Add Row button.

Select Function 'Set Custom Field'. When you select `Set Custom Field`, it will open up a new window.

In this window, search for the `Cryisma_Status` field.

- **Custom Field:** Cryisma_Status  
- **Value:** Success  

![Custom Field](../../../static/img/docs/9df5a58f-f44f-4af8-8620-c5670c9d8524/image_17.webp)

### Row 4c: Function: Set Custom Field

Add a new row by clicking on the Add Row button in the ELSE part and select the Script 'Set Custom Field' function again.

In this one, set the Custom Field and Value as shown below.

![Set Custom Field](../../../static/img/docs/9df5a58f-f44f-4af8-8620-c5670c9d8524/image_18.webp)

Once all items are added, please save the task. The final task should look like the screenshot below.

![Final Task Screenshot](../../../static/img/docs/9df5a58f-f44f-4af8-8620-c5670c9d8524/image_19.webp)

## Deployment

It is suggested to run the Task every 2 hours against the group "Cyrisma Sensor Deployment".

- Go to `Automation` > `Tasks.`
- Search for the `CRI Agent Deployment` Task.
- Select the concerned task.
- Click on the `Schedule` button to schedule the task/script.

This screen will appear.

![Schedule Screen](../../../static/img/docs/9df5a58f-f44f-4af8-8620-c5670c9d8524/image_20.webp)

- Select the relevant time to run the script and click the Do not repeat button.

![Select Time](../../../static/img/docs/9df5a58f-f44f-4af8-8620-c5670c9d8524/image_21.webp)

- A pop-up box will appear.
- Change the number of hours to `2` and click `OK`.

![Change Hours](../../../static/img/docs/9df5a58f-f44f-4af8-8620-c5670c9d8524/image_22.webp)

Search for `Cyrisma Sensor Deployment` in the `Resources*` and select it. You can search and select any relevant group you would like to schedule the task against. If the site doesn't have a device group that includes all Windows agents, then create one and schedule the task on it.

![Resources Selection](../../../static/img/docs/9df5a58f-f44f-4af8-8620-c5670c9d8524/image_23.webp)

Now click the `Run` button to initiate the task.

![Run Task](../../../static/img/docs/9df5a58f-f44f-4af8-8620-c5670c9d8524/image_24.webp)

The task will start appearing in the Scheduled Tasks.

## Output

- Script log
- Custom field

