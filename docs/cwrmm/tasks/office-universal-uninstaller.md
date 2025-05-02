---
id: '88ebc856-6e02-41d2-a6b5-af8cbd37e2c6'
slug: /88ebc856-6e02-41d2-a6b5-af8cbd37e2c6
title: 'Office Universal Uninstaller'
title_meta: 'Office Universal Uninstaller'
keywords: ['office', 'uninstaller', 'microsoft', 'corruption', 'script']
description: 'This document provides a comprehensive guide on using the Office Universal Uninstaller script, which downloads offscrub files and uninstalls all versions of Microsoft Office from 2007 to 2016 & O365, handling machine or software corruption and removing app shortcuts.'
tags: ['setup', 'software', 'uninstallation', 'windows']
draft: false
unlisted: false
---

## Summary

This script downloads the offscrub files from the repository and then attempts to uninstall all versions of Microsoft Office from 2007 to 2016 & O365. It can handle machine or software corruption and completely removes Office app shortcuts for the version.

## Sample Run

![Sample Run](../../../static/img/CW-RMM---Office-Universal-Uninstaller/image_1.png)

## Dependencies

[Invoke-OfficeScrub](/docs/e9253255-9a1f-4392-8ec6-9f7fb6e401ed)

### User Parameters

| Name       | Example    | Required | Description                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     |
|------------|------------|----------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Arguments  | -office16  | True     | The user parameter values are: -office03, -office07, -office10, -office13, -office16, -officec2r, -All. You can use combinations of the -officexx values. For example: -office03 -office13 -officec2r. Alternatively, you can use -All to uninstall any Office applications. By default, the value is set to -All, which means you can directly schedule this script, and it will uninstall any Office applications. |

## Implementation

To implement this script, please create a new "PowerShell" style script in the system.

![Implementation](../../../static/img/CW-RMM---Office-Universal-Uninstaller/image_2.png)

**Name:** Office Universal Uninstaller  
**Description:** This task will download the offscrub files from the repository and then attempt to uninstall all versions of Microsoft Office from 2007 to 2016 & O365. It can handle machine or software corruption and completely removes Office app shortcuts for the version.  
**Category:** Custom  

![Implementation Category](../../../static/img/CW-RMM---Office-Universal-Uninstaller/image_3.png)

### Parameter

![Parameter](../../../static/img/CW-RMM---Office-Universal-Uninstaller/image_4.png)

**Parameter Names:** `Arguments`  
**Required Field:** `Selected`  
**Parameter Type:** `Text String`  
**Default Value:** `-All`  

### Script

#### Row 1 Function: Script Log

![Row 1 Function](../../../static/img/CW-RMM---Office-Universal-Uninstaller/image_5.png)

Input the following:

![Input](../../../static/img/CW-RMM---Office-Universal-Uninstaller/image_6.png)

#### Row 2 Function: PowerShell Script

![Row 2 Function](../../../static/img/CW-RMM---Office-Universal-Uninstaller/image_7.png)

Paste in the following PowerShell script and set the expected time of script execution to 900 seconds.

```PowerShell
#region Setup - Variables
$ProjectName = 'Invoke-OffScrub'
[Net.ServicePointManager]::SecurityProtocol = [enum]::ToObject([Net.SecurityProtocolType], 3072)
$BaseURL = 'https://file.provaltech.com/repo'
$PS1URL = "$BaseURL/script/$ProjectName.ps1"
$WorkingDirectory = "C:\ProgramData\_automation\script\$ProjectName"
$PS1Path = "$WorkingDirectory\$ProjectName.ps1"
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
& $PS1Path @Arguments@
#endregion
```

![Row 2 Function Output](../../../static/img/CW-RMM---Office-Universal-Uninstaller/image_8.png)

#### Row 3 Function: Script Log

![Row 3 Function](../../../static/img/CW-RMM---Office-Universal-Uninstaller/image_9.png)

In the script log message, simply type `%output%` so that the script will send the results of the PowerShell script above to the output on the Automation tab for the target device.

![Row 3 Function Output](../../../static/img/CW-RMM---Office-Universal-Uninstaller/image_10.png)

The final task should look like the screenshot below.

![Final Task Screenshot](../../../static/img/CW-RMM---Office-Universal-Uninstaller/image_11.png)

### Script Deployment

The script is intended to run manually at this time.

Go to **Automations > Tasks.**  
Search for **Office Universal Uninstaller.**  
Then click on **Schedule** and provide the parameter details as necessary for the script completion.

![Script Deployment](../../../static/img/CW-RMM---Office-Universal-Uninstaller/image_12.png)

## Output

- Script log
