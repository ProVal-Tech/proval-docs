---
id: '87a2b5ad-872c-431c-83a4-618434f03c9a'
slug: /87a2b5ad-872c-431c-83a4-618434f03c9a
title: 'Remove Mcafee Software'
title_meta: 'Remove Mcafee Software'
keywords: ['mcafee', 'uninstall', 'script', 'endpoint', 'software']
description: 'This document provides a detailed guide on removing all McAfee products from an endpoint using a ConnectWise RMM implementation of the agnostic script Remove-McAfeeSoftware. It includes sample runs, dependencies, task creation steps, and the complete script for execution.'
tags: ['application', 'software', 'uninstallation', 'windows']
draft: false
unlisted: false
---

## Summary

This document outlines the process to remove all McAfee products from an endpoint using the ConnectWise RMM implementation of the agnostic script [Remove-McAfeeSoftware](/docs/4c93e57c-0959-4f9e-9557-6f5974866782).

## Sample Run

![Sample Run 1](../../../static/img/docs/87a2b5ad-872c-431c-83a4-618434f03c9a/image_1.webp)  
![Sample Run 2](../../../static/img/docs/87a2b5ad-872c-431c-83a4-618434f03c9a/image_2.webp)  

## Dependencies

[Remove-McAfeeSoftware](/docs/4c93e57c-0959-4f9e-9557-6f5974866782)

## Task Creation

Create a new `Script Editor` style script in the system to implement this task.  
![Task Creation Image 1](../../../static/img/docs/87a2b5ad-872c-431c-83a4-618434f03c9a/image_3.webp)  
![Task Creation Image 2](../../../static/img/docs/87a2b5ad-872c-431c-83a4-618434f03c9a/image_4.webp)  

**Name:** `Remove McAfee Software`  
**Description:** `Removes all McAfee products from an endpoint.`  
**Category:** `Application`  
![Task Creation Image 3](../../../static/img/docs/87a2b5ad-872c-431c-83a4-618434f03c9a/image_5.webp)  

## Task

Navigate to the Script Editor section and start by adding a row. You can do this by clicking the `Add Row` button at the bottom of the script page.  
![Add Row Image](../../../static/img/docs/87a2b5ad-872c-431c-83a4-618434f03c9a/image_6.webp)  

A blank function will appear.  
![Blank Function Image](../../../static/img/docs/87a2b5ad-872c-431c-83a4-618434f03c9a/image_7.webp)  

### Row 1 Function: PowerShell Script

Search and select the `PowerShell Script` function.  
![PowerShell Script Selection 1](../../../static/img/docs/87a2b5ad-872c-431c-83a4-618434f03c9a/image_8.webp)  
![PowerShell Script Selection 2](../../../static/img/docs/87a2b5ad-872c-431c-83a4-618434f03c9a/image_9.webp)  

The following function will pop up on the screen:  
![PowerShell Function Pop Up](../../../static/img/docs/87a2b5ad-872c-431c-83a4-618434f03c9a/image_10.webp)  

Paste in the following PowerShell script and set the `Expected time of script execution in seconds` to `900` seconds. Click the `Save` button.

```PowerShell
#region Setup - Variables
$ProjectName = 'Remove-McAfeeSoftware'
[Net.ServicePointManager]::SecurityProtocol = [enum]::ToObject([Net.SecurityProtocolType], 3072)
$BaseURL = 'https://file.provaltech.com/repo'
$PS1URL = "$BaseURL/script/$ProjectName.ps1"
$WorkingDirectory = "C:\ProgramData\_automation\script\$ProjectName"
$PS1Path = "$WorkingDirectory\$ProjectName.ps1"
$WorkingPath = $WorkingDirectory
$LogPath = "$WorkingDirectory\$ProjectName-log.txt"
$ErrorLogPath = "$WorkingDirectory\$ProjectName-Error.txt"
#endregion
#region Setup - Folder Structure
New-Item -Path $WorkingDirectory -ItemType Directory -ErrorAction SilentlyContinue | Out-Null
$response = Invoke-WebRequest -Uri $PS1URL -UseBasicParsing
if (($response.StatusCode -ne 200) -and (!(Test-Path -Path $PS1Path))) {
    throw "No pre-downloaded script exists and the script '$PS1URL' failed to download. Exiting."
} elseif ($response.StatusCode -eq 200) {
    Remove-Item -Path $PS1Path -ErrorAction SilentlyContinue
    [System.IO.File]::WriteAllLines($PS1Path, $response.Content)
}
if (!(Test-Path -Path $PS1Path)) {
    throw 'An error occurred and the script was unable to be downloaded. Exiting.'
}
#endregion
#region Execution
if ($Parameters) {
    & $PS1Path @Parameters
} else {
    & $PS1Path
}
#endregion
#region log verification
if ( !(Test-Path $LogPath) ) {
    throw 'PowerShell Failure. A Security application seems to have restricted the execution of the PowerShell Script.'
}
if ( Test-Path $ErrorLogPath ) {
    $ErrorContent = ( Get-Content -Path $ErrorLogPath )
    throw $ErrorContent
}
Get-Content -Path $LogPath
#endregion
```

![PowerShell Script Image](../../../static/img/docs/87a2b5ad-872c-431c-83a4-618434f03c9a/image_11.webp)  

### Row 2 Function: Script Log

Add a new row by clicking the `Add Row` button.  
![Add Row Image 2](../../../static/img/docs/87a2b5ad-872c-431c-83a4-618434f03c9a/image_12.webp)  

A blank function will appear.  
![Blank Function Image 2](../../../static/img/docs/87a2b5ad-872c-431c-83a4-618434f03c9a/image_13.webp)  

Search and select the `Script Log` function.  
![Script Log Selection](../../../static/img/docs/87a2b5ad-872c-431c-83a4-618434f03c9a/image_14.webp)  

The following function will pop up on the screen:  
![Script Log Pop Up](../../../static/img/docs/87a2b5ad-872c-431c-83a4-618434f03c9a/image_15.webp)  

In the script log message, simply type `%Output%` and click the `Save` button.  
![Save Script Log](../../../static/img/docs/87a2b5ad-872c-431c-83a4-618434f03c9a/image_16.webp)  

Click the `Save` button at the top-right corner of the screen to save the script.  
![Save Script Button](../../../static/img/docs/87a2b5ad-872c-431c-83a4-618434f03c9a/image_17.webp)  

## Completed Script

![Completed Script](../../../static/img/docs/87a2b5ad-872c-431c-83a4-618434f03c9a/image_18.webp)  

## Output

- Script log