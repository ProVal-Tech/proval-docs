---
id: '509ed97f-105b-47d7-8a66-f7da58da8138'
slug: /509ed97f-105b-47d7-8a66-f7da58da8138
title: 'Reboot Pending Check Automation'
title_meta: 'Reboot Pending Check Automation'
keywords: ['reboot', 'check', 'automation', 'custom', 'field', 'dynamic', 'group', 'endpoint']
description: 'This document outlines the steps to implement an automation task that detects reboot pending status on endpoints and updates a custom field in ConnectWise RMM. The task ensures that devices are properly categorized for reboot management, enhancing system reliability and performance.'
tags: ['reboot']
draft: false
unlisted: false
---

## Summary

This task is designed to automatically detect the reboot pending status on endpoints and check the custom field `Auto_RebootPendingCheck` so that the agent gets added to the dynamic group [Reboot Prompter Deployment - Auto](/docs/93faad94-8731-4fd5-afd0-0ae2a669fc05).

## Dependencies

- [Custom Fields - Reboot Prompter](/docs/7876f32c-a5ec-4b58-9f7e-b60b710e19d5)
    - Custom field (Endpoint)-  `Auto_RebootPendingCheck` 
- [Dynamic Group - Automatic Reboot Pending Check](/docs/1c798d37-8ff8-4e73-ba39-027e025a3551)
- [Solution - Reboot Prompter](/docs/5b376f62-e977-4feb-b523-b133d2ef5722) 

## Sample Run

![Sample Run 1](../../../static/img/docs/89e1f1cd-9b80-4874-96c6-f1e8b067298e/image_1.webp)

![Sample Run 2](../../../static/img/docs/89e1f1cd-9b80-4874-96c6-f1e8b067298e/image_2.webp)

## Implementation

### Create Task

**Reboot Pending Check Automation**  
To implement this script, please create a new "PowerShell" style script in the system.

![Create Task](../../../static/img/docs/89e1f1cd-9b80-4874-96c6-f1e8b067298e/image_3.webp)

- **Name:** `Reboot Pending Check Automation`
- **Description:** `This script imports the module 'PendingReboot' to detect the pending status on the endpoints. Based on the output, it sets the custom field 'Auto_RebootPendingCheck'.`
- **Category:** `Custom`

![Task Details](../../../static/img/docs/89e1f1cd-9b80-4874-96c6-f1e8b067298e/image_4.webp)

### Script

Start by creating three separate rows. You can do this by clicking the "Add Row" button at the bottom of the script page.

![Add Rows](../../../static/img/docs/89e1f1cd-9b80-4874-96c6-f1e8b067298e/image_5.webp)


### Row 1: Function: PowerShell Script

![Row 1 PowerShell](../../../static/img/docs/89e1f1cd-9b80-4874-96c6-f1e8b067298e/image_8.webp)

![Row 1 PowerShell Continued](../../../static/img/docs/89e1f1cd-9b80-4874-96c6-f1e8b067298e/image9.webp)

Paste in the following PowerShell script and set the expected time of script execution to `900` seconds.

```powershell
#requires -version 5.1

#region Globals
$ProgressPreference = 'SilentlyContinue'
$ConfirmPreference = 'None'
$InformationPreference = 'Continue'
$WarningPreference = 'SilentlyContinue'
#endRegion

#region Set TLS Policy
$supportedTLSversions = [enum]::GetValues('Net.SecurityProtocolType')
if (($supportedTLSversions -contains 'Tls13') -and ($supportedTLSversions -contains 'Tls12')) {
    [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol::Tls13 -bor [System.Net.SecurityProtocolType]::Tls12
} elseif ($supportedTLSversions -contains 'Tls12') {
    [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12
} else {
    Write-Information '[Warn] TLS 1.2 and/or TLS 1.3 are not supported on this system. This download may fail!'
    if ($PSVersionTable.PSVersion.Major -lt 3) {
        Write-Information '[Warn] PowerShell 2 / .NET 2.0 doesn''t support TLS 1.2.'
    }
}
#endRegion

#region PendingReboot Module
if (-not (Get-Module -Name 'PendingReboot' -ListAvailable)) {
    Get-PackageProvider -Name 'NuGet' -ForceBootstrap -ErrorAction SilentlyContinue | Out-Null
    Set-PSRepository -Name 'PSGallery' -InstallationPolicy Trusted -ErrorAction SilentlyContinue | Out-Null
    
    try {
        Update-Module -Name 'PendingReboot' -ErrorAction Stop
    } catch {
        Install-Module -Name 'PendingReboot' -Repository 'PSGallery' -SkipPublisherCheck -Force
        Get-Module -Name 'PendingReboot' -ListAvailable | Where-Object { $_.Version -ne (Get-InstalledModule -Name 'PendingReboot').Version } | ForEach-Object { Uninstall-Module -Name 'PendingReboot' -MaximumVersion $_.Version }
    }
}
(Import-Module -Name 'PendingReboot') 3>&1 2>&1 1>$null
#endRegion

#region Check for Pending Reboot
try {
    $pendingReboot = (Test-PendingReboot -SkipConfigurationManagerClientCheck).IsRebootPending
    if ($pendingReboot) {
        return 'IsRebootPending'
    } else {
        return 'IsNotRebootPending'
    }
} catch {
    throw ('An error occurred when checking for pending reboot: {0}' -f $($Error[0].Exception.Message))
}
#endRegion
```

### Row 2: Function: Script Log

![Row 2 Log](../../../static/img/docs/89e1f1cd-9b80-4874-96c6-f1e8b067298e/image_10.webp)

In the script log message, simply type `%output%` so that the script will send the results of the PowerShell script above to the output on the Automation tab for the target device.

![Row 2 Log Continued](../../../static/img/docs/89e1f1cd-9b80-4874-96c6-f1e8b067298e/image_11.webp)

### Row 3 : Logic: If/Then/Else

![Row 3 Logic](../../../static/img/docs/89e1f1cd-9b80-4874-96c6-f1e8b067298e/image_12.webp)

![Row 3 Logic Continued](../../../static/img/docs/89e1f1cd-9b80-4874-96c6-f1e8b067298e/image_13.webp)

### Row 3a.1: Condition: Output Contains

In the IF part, enter `IsRebootPending` in the right box of the "Output Contains" part.

![Row 4a Condition](../../../static/img/docs/89e1f1cd-9b80-4874-96c6-f1e8b067298e/image14.webp)

### Row 3a.2: Function: Set Custom Field

Add a new row by clicking on the `Add row` button.

Select Function `Set Custom Field`. When you select `set custom field`, it will open up a new window.

In this window, search for the `Auto_RebootPendingCheck` field.

- **Custom Field:** Auto_RebootPendingCheck
- **Value:** `True`

![Row 3a.2 Set Custom Field](../../../static/img/docs/89e1f1cd-9b80-4874-96c6-f1e8b067298e/image_20.webp)

### Row 3b.1: Function: Set Custom Field

Add a new row by clicking on the `Add row` button in then section.

Select Function `Set Custom Field`. When you select `set custom field`, it will open up a new window.

In this window, search for the `Auto_RebootPendingCheck` field.

- **Custom Field:** Auto_RebootPendingCheck
- **Value:** `False`

![Row 3b.1 Set Custom Field](../../../static/img/docs/89e1f1cd-9b80-4874-96c6-f1e8b067298e/image31.webp)

### Row 5: Complete

![Row 5 Complete](../../../static/img/docs/89e1f1cd-9b80-4874-96c6-f1e8b067298e/image24.webp)

## Deployment

It is suggested to run the Task every 2 hours against the group [Dynamic Group - Automatic Reboot Pending Check](/docs/1c798d37-8ff8-4e73-ba39-027e025a3551).

- Go to `Automation` > `Tasks.`
- Search for `Reboot Pending Check Automation` Task.
- Select the concerned task.
- Click on the `Schedule` button to schedule the task/script.

![Schedule Task](../../../static/img/docs/reboot-pending-check-automation/image.png)

This screen will appear.

![Schedule Task Continue](../../../static/img/docs/reboot-pending-check-automation/image-1.png)

Select the relevant time to run the script and click the Do not repeat button.

![Schedule Task Time](../../../static/img/docs/reboot-pending-check-automation/image-2.png)

A pop-up box will appear.

Change the number of hours to `2` and click `OK`.

![Change Hours](../../../static/img/docs/89e1f1cd-9b80-4874-96c6-f1e8b067298e/image_28.webp)

Select the target to schedule the 'Force Reboot Server With Reboot Windows Verification'.

![Select Target](../../../static/img/docs/89e1f1cd-9b80-4874-96c6-f1e8b067298e/image_29.webp)

Now click the `Run` button once all customization is set to initiate the task.

![Run Task](../../../static/img/docs/89e1f1cd-9b80-4874-96c6-f1e8b067298e/image_30.webp)

The task will start appearing in the Scheduled Tasks.

## Output

- Task log