---
id: '73342741-22cd-4486-9ef5-d22b714d9105'
slug: /73342741-22cd-4486-9ef5-d22b714d9105
title: 'Universal KB Installer'
title_meta: 'Universal KB Installer'
keywords: ['kb', 'installer', 'windows', 'patch', 'update']
description: 'This document outlines the process for creating a Universal KB Installer task to install patches on Windows machines, including parameter setup and PowerShell script implementation.'
tags: ['update', 'windows']
draft: false
unlisted: false
---

## Summary

The purpose of this task is to install the desired patch on the Windows machines.

## Sample Run

![Sample Run 1](../../../static/img/docs/424dfd5c-377f-461f-a57f-80001d839af8/image_3.webp)

Leave the Reboot parameter unticked to prevent the machine from rebooting.

![Sample Run 2](../../../static/img/docs/424dfd5c-377f-461f-a57f-80001d839af8/image_4.webp)

Tick the Reboot parameter to reboot the machine.

![Sample Run 3](../../../static/img/docs/424dfd5c-377f-461f-a57f-80001d839af8/image_5.webp)

## User Parameters

| Name      | Example   | Accepted Values | Required | Default | Type   | Description                                                  |
|-----------|-----------|-----------------|----------|---------|--------|--------------------------------------------------------------|
| `KBNumber`| 5044285   | KB ID Number    | True     |         | String | KB ID Number of the patch that needs to be installed.       |
| `Reboot`  | Unmarked  |                 | False    | $false  | Flag   | Select it to reboot the machine during task execution.      |

## Task Creation

Create a new `Script Editor` style script in the system to implement this task.

![Task Creation 1](../../../static/img/docs/424dfd5c-377f-461f-a57f-80001d839af8/image_6.webp)

![Task Creation 2](../../../static/img/docs/424dfd5c-377f-461f-a57f-80001d839af8/image_7.webp)

**Name:** Universal KB Installer  
**Description:** The purpose of this task is to install the desired patch on the Windows machines.  
**Category:** Custom  

![Task Creation 3](../../../static/img/docs/424dfd5c-377f-461f-a57f-80001d839af8/image_8.webp)

## Parameters

Add a new parameter by clicking the `Add Parameter` button present at the top-right corner of the screen.

![Parameter Addition 1](../../../static/img/docs/424dfd5c-377f-461f-a57f-80001d839af8/image_9.webp)

This screen will appear.

![Parameter Addition 2](../../../static/img/docs/424dfd5c-377f-461f-a57f-80001d839af8/image_10.webp)

- Set `KBNumber` in the `Parameter Name` field.
- Select `String` from the `Parameter Type` dropdown menu.
- Toggle the Required Field.
- Click the `Save` button.

![Parameter Addition 3](../../../static/img/docs/424dfd5c-377f-461f-a57f-80001d839af8/image_11.webp)

It will ask for confirmation to proceed. Click the `Confirm` button to create the parameter.

![Parameter Confirmation](../../../static/img/docs/424dfd5c-377f-461f-a57f-80001d839af8/image_12.webp)

Add another parameter by clicking the `Add Parameter` button present at the top-right corner of the screen.

![Parameter Addition 4](../../../static/img/docs/424dfd5c-377f-461f-a57f-80001d839af8/image_13.webp)

- Set `Reboot` in the `Parameter Name` field.
- Select `Flag` from the `Parameter Type` dropdown menu.
- Toggle the Default Value.
- Set Default Value as `False`.
- Click the `Save` button.
- Click the `Confirm` button to create the parameter.

![Parameter Confirmation 2](../../../static/img/docs/424dfd5c-377f-461f-a57f-80001d839af8/image_14.webp)

Parameters will look like as shown below:

![Parameters Overview](../../../static/img/docs/424dfd5c-377f-461f-a57f-80001d839af8/image_15.webp)

## Task

Navigate to the Script Editor section and start by adding a row. You can do this by clicking the `Add Row` button at the bottom of the script page.

![Add Row](../../../static/img/docs/424dfd5c-377f-461f-a57f-80001d839af8/image_16.webp)

A blank function will appear.

![Blank Function](../../../static/img/docs/424dfd5c-377f-461f-a57f-80001d839af8/image_17.webp)

### Row 1 Function: PowerShell Script

Search and select the `PowerShell Script` function.

![PowerShell Script Selection](../../../static/img/docs/424dfd5c-377f-461f-a57f-80001d839af8/image_18.webp)

The following function will pop up on the screen:

![PowerShell Script Popup](../../../static/img/docs/424dfd5c-377f-461f-a57f-80001d839af8/image_19.webp)

Paste in the following PowerShell script and set the expected time of script execution to `900` seconds. Click the `Save` button.

```powershell
if ( '@KBNumber@' -notmatch '[0-9]'){
    throw "Valid KB ID is required to install the patch"
} else {
    $KBNumber = '@KBNumber@'
}

if ( '@Reboot@' -match '1|Yes|True|Y') {
    $Reboot  = '1'
} else {
    $Reboot  = '0'
}

$ProgressPreference = 'SilentlyContinue'
[Net.ServicePointManager]::SecurityProtocol = [Enum]::ToObject([Net.SecurityProtocolType], 3072)
Get-PackageProvider -Name NuGet -ForceBootstrap | Out-Null
if ( !( Get-PSrepository -Name 'PSGallery' -ErrorAction SilentlyContinue ) ) {
    Register-PSRepository -Name PSGallery -SourceLocation '
https://www.powershellgallery.com/api/v2'
}
Set-PSRepository -Name PSGallery -InstallationPolicy Trusted
try {
    Update-Module -Name pswindowsupdate -ErrorAction Stop
} catch {
    Install-Module -Name pswindowsupdate -Repository PSGallery -SkipPublisherCheck -Force
    Get-Module -Name pswindowsupdate -ListAvailable | Where-Object { $_.Version -ne (Get-InstalledModule -Name pswindowsupdate).Version } | ForEach-Object { Uninstall-Module -Name pswindowsupdate -MaximumVersion $_.Version }
}
Import-Module -Name 'pswindowsupdate'

$isInstalled = Get-HotFix -Id $KBNumber -ErrorAction SilentlyContinue
if ($isInstalled) {
    return "$KBNumber is already installed."
}

$RebootRequired = (Get-WindowsUpdate -KBArticleID $KBNumber).RebootRequired
if ($Reboot -eq '1' -and $RebootRequired -eq 'True') {
   try {
    Get-WindowsUpdate -KBArticleID $KBNumber -Install -AcceptAll -AutoReboot
}
 catch {
    throw "Failed to install KBArticleID $KBNumber. Error: $_.Exception.Message"
}
}
else {
try {
    Get-WindowsUpdate -KBArticleID $KBNumber -Install -IgnoreReboot -AcceptAll
} catch {
    throw "Failed to install KBArticleID $KBNumber. Error: $_.Exception.Message"
}
}
```

### Row 2 Function: Script Log

In the script log message, simply type `%output%` so that the script will send the results of the PowerShell script above to the output on the Automation tab for the target device.

![Script Log](../../../static/img/docs/424dfd5c-377f-461f-a57f-80001d839af8/image_20.webp)

## Completed Task

![Completed Task](../../../static/img/docs/424dfd5c-377f-461f-a57f-80001d839af8/image_21.webp)

## Output

- Script Log
