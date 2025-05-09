---
id: '88d3ea21-446e-47ad-9cc8-047df5a70a77'
slug: /88d3ea21-446e-47ad-9cc8-047df5a70a77
title: 'Uninstall Microsoft VCRedist'
title_meta: 'Uninstall Microsoft VCRedist'
keywords: ['uninstall', 'vcredist', 'microsoft', 'redistributable', 'script']
description: 'This document provides a comprehensive guide on implementing a CW RMM script to uninstall Microsoft Visual C++ Redistributable. It includes details on user parameters, task creation, and sample runs, along with necessary dependencies and execution steps.'
tags: ['application', 'setup', 'windows']
draft: false
unlisted: false
---

## Summary

A CW RMM implementation of the [Invoke-VcRedistModule](https://proval.itglue.com/DOC-5078775) agnostic script to uninstall Microsoft Visual C++ Redistributable. By default, the script will uninstall the unsupported redistributable unless a user parameter is set.

## Sample Run

![Sample Run 1](../../../static/img/docs/88d3ea21-446e-47ad-9cc8-047df5a70a77/image_1.webp)  
![Sample Run 2](../../../static/img/docs/88d3ea21-446e-47ad-9cc8-047df5a70a77/image_2.webp)  
![Sample Run 3](../../../static/img/docs/88d3ea21-446e-47ad-9cc8-047df5a70a77/image_3.webp)  

## Dependencies

This should be a list of ITGlue documents listed in the Related Items sidebar on which this script depends.

- Agnostic Content Doc Link
- Custom Field Doc Link
- etc.

## User Parameters

| Name    | Example                   | Required | Description                                             |
|---------|---------------------------|----------|---------------------------------------------------------|
| Release | 20072007,2008,2012       | False    | Set the release id(s) of the Redistributable to remove. |
| All     | 1                         | False    | Setting this parameter to 1 will remove all installed Redistributables from the computer. |

![User Parameters](../../../static/img/docs/88d3ea21-446e-47ad-9cc8-047df5a70a77/image_4.webp)  

## Task Creation

Create a new `Script Editor` style script in the system to implement this Task.

![Task Creation 1](../../../static/img/docs/88d3ea21-446e-47ad-9cc8-047df5a70a77/image_5.webp)  
![Task Creation 2](../../../static/img/docs/88d3ea21-446e-47ad-9cc8-047df5a70a77/image_6.webp)  

**Name:** Uninstall Microsoft VCRedist  
**Description:** Uninstall Microsoft Visual C++ Redistributable  
**Category:** Application  

![Task Creation 3](../../../static/img/docs/88d3ea21-446e-47ad-9cc8-047df5a70a77/image_7.webp)  

### Parameters

Add a new parameter by clicking the `Add Parameter` button present at the top-right corner of the screen.

![Add Parameter](../../../static/img/docs/88d3ea21-446e-47ad-9cc8-047df5a70a77/image_8.webp)  

This screen will appear.  
![Parameter Screen](../../../static/img/docs/88d3ea21-446e-47ad-9cc8-047df5a70a77/image_9.webp)  

- Set `All` in the `Parameter Name` field.
- Select `Flag` from the `Parameter Type` dropdown menu.
- Enable the `Default Value` option.
- Select `False` from the `Value` dropdown menu.
- Click the `Save` button.  
![Save Parameter](../../../static/img/docs/88d3ea21-446e-47ad-9cc8-047df5a70a77/image_10.webp)  

It will ask for confirmation to proceed. Click the `Confirm` button to create the parameter.  
![Confirm Parameter](../../../static/img/docs/88d3ea21-446e-47ad-9cc8-047df5a70a77/image_11.webp)  

Add another parameter by clicking the `Add Parameter` button present at the top-right corner of the screen.

![Add Parameter](../../../static/img/docs/88d3ea21-446e-47ad-9cc8-047df5a70a77/image_8.webp)  

This screen will appear.  
![Parameter Screen](../../../static/img/docs/88d3ea21-446e-47ad-9cc8-047df5a70a77/image_9.webp)  

- Set `Release` in the `Parameter Name` field.
- Select `Text String` from the `Parameter Type` dropdown menu.
- Click the `Save` button.  
![Save Parameter](../../../static/img/docs/88d3ea21-446e-47ad-9cc8-047df5a70a77/image_12.webp)  

It will ask for confirmation to proceed. Click the `Confirm` button to create the parameter.  
![Confirm Parameter](../../../static/img/docs/88d3ea21-446e-47ad-9cc8-047df5a70a77/image_11.webp)  

### Task

Navigate to the Script Editor Section and start by adding a row. You can do this by clicking the `Add Row` button at the bottom of the script page.

![Add Row](../../../static/img/docs/88d3ea21-446e-47ad-9cc8-047df5a70a77/image_13.webp)  

A blank function will appear.  
![Blank Function](../../../static/img/docs/88d3ea21-446e-47ad-9cc8-047df5a70a77/image_14.webp)  

#### Row 1 Function: PowerShell Script

Search and select the `PowerShell Script` function.  

![Select PowerShell Script](../../../static/img/docs/88d3ea21-446e-47ad-9cc8-047df5a70a77/image_15.webp)  
![PowerShell Script Selected](../../../static/img/docs/88d3ea21-446e-47ad-9cc8-047df5a70a77/image_16.webp)  

The following function will pop up on the screen:  
![PowerShell Function](../../../static/img/docs/88d3ea21-446e-47ad-9cc8-047df5a70a77/image_17.webp)  

Paste in the following PowerShell script and set the expected time of script execution to `900` seconds. Click the `Save` button.

```powershell
#region Setup - Variables
$ProjectName = '@ProjectName@'
[Net.ServicePointManager]::SecurityProtocol = [enum]::ToObject([Net.SecurityProtocolType], 3072)
$BaseURL = 'https://file.provaltech.com/repo'
$PS1URL = "$BaseURL/script/$ProjectName.ps1"
$WorkingDirectory = "C:\ProgramData\_automation\script\Uninstall-VCRedist"
$PS1Path = "$WorkingDirectory\$ProjectName.ps1"
$Workingpath = $WorkingDirectory
$All = '@All@'
$Release = '@Release@'
#endregion
#region Setup - Folder Structure
mkdir -Path $WorkingDirectory -ErrorAction SilentlyContinue | Out-Null
$response = Invoke-WebRequest -Uri $PS1URL -UseBasicParsing
if (($response.StatusCode -ne 200) -and (!(Test-Path -Path $PS1Path))) {
    Write-Error -Message "No pre-downloaded script exists and the script '$PS1URL' failed to download. Exiting."
    return
} elseif ($response.StatusCode -eq 200) {
    Remove-Item -Path $PS1Path -ErrorAction SilentlyContinue
    [System.IO.File]::WriteAllLines($PS1Path, $response.Content)
}
if (!(Test-Path -Path $PS1Path)) {
    Write-Error -Message 'An error occurred and the script was unable to be downloaded. Exiting.'
    return
}
#endregion
#region Execution
if ( $All -and $All -NotMatch 'All' -and $All -Match '1|(Yes)|(True)' ) {
      & $PS1Path -Uninstall -All
} elseif ( $Release -and $Release -NotMatch 'Release' -and $Release -match '[0-9]' ) {
      & $PS1Path -Uninstall -Release @Release@
} else {
      & $PS1Path -Uninstall -Unsupported
}
#endregion
```

![PowerShell Script](../../../static/img/docs/88d3ea21-446e-47ad-9cc8-047df5a70a77/image_18.webp)  

Click the `Save` button at the top-right corner of the screen to save the script.  
![Save Script](../../../static/img/docs/88d3ea21-446e-47ad-9cc8-047df5a70a77/image_19.webp)  

## Completed Task

![Completed Task](../../../static/img/docs/88d3ea21-446e-47ad-9cc8-047df5a70a77/image_20.webp)  

## Output

- Script Log
