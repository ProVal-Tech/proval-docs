---
id: 'a4b90ce5-21c6-40c4-9158-ff60bd08a53f'
title: 'Office Activation Status'
title_meta: 'Office Activation Status'
keywords: ['office', 'activation', 'alert', 'unlicensed', 'endpoint']
description: 'This document provides a comprehensive guide on creating a monitor that generates alerts for any unlicensed Office products on endpoints. It includes step-by-step instructions for setting up the monitor, configuring the script, and managing alert conditions.'
tags: ['setup', 'windows']
draft: false
unlisted: false
---

## Summary

Generates an alert for any unlicensed Office products on the endpoint.

## Monitor

1. Navigate to `Endpoints` > `Alerts` > `Monitors`  
   ![Navigate to Monitors](../../../static/img/Office-Activation-Status/image_1.png)

2. Click the `Create Monitor` button.  
   ![Create Monitor Button](../../../static/img/Office-Activation-Status/image_2.png)

3. This screen will appear.  
   ![Monitor Screen](../../../static/img/Office-Activation-Status/image_3.png)

4. **Name:** Office Activation Status  
   **Description:** Generates an alert for any unlicensed Office products on the endpoint  
   **Type:** Script  
   **Family:** Desktop Operating System  
   **Severity:** Others  
   ![Monitor Details](../../../static/img/Office-Activation-Status/image_4.png)

5. The `Conditions` tab will start looking like this:  
   ![Conditions Tab](../../../static/img/Office-Activation-Status/image_5.png)

6. Set the `Repeat every` to `24` Hours:  
   ![Repeat Every](../../../static/img/Office-Activation-Status/image_6.png)

7. Disable the `Ticket Resolution` section by clicking the `Automatically resolve` button.  
   ![Disable Ticket Resolution](../../../static/img/Office-Activation-Status/image_7.png)

8. Paste this PowerShell script in the `Script` box.  
   ```powershell
   $ErrorActionPreference = 'SilentlyContinue'
   #region Setup - Variables
   $ProjectName = 'Get-OfficeActivationStatus'
   [Net.ServicePointManager]::SecurityProtocol = [enum]::ToObject([Net.SecurityProtocolType], 3072)
   $BaseURL = 'https://file.provaltech.com/repo'
   $PS1URL = "$BaseURL/script/$ProjectName.ps1"
   $WorkingDirectory = "C:/ProgramData/_automation/script/$ProjectName"
   $PS1Path = "$WorkingDirectory/$ProjectName.ps1"
   $Workingpath = $WorkingDirectory
   $LogPath = "$WorkingDirectory/$ProjectName-log.txt"
   $ErrorLogPath = "$WorkingDirectory/$ProjectName-Error.txt"
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
   $licenseInfo = & $PS1Path
   return $licenseInfo.LicenseStatus
   ```
   ![PowerShell Script](../../../static/img/Office-Activation-Status/image_8.png)

9. Set `Unlicensed`, `Non_Genuine_Grace_Period`, and `Out_Of_Tolerance_Grace_Period` to the `Script Output` box.  
   ![Script Output](../../../static/img/Office-Activation-Status/image_9.png)

10. Enable the `Escalate ticket on script failure` option.  
    ![Escalate Ticket](../../../static/img/Office-Activation-Status/image_10.png)

11. Select the required client or group to target from the `Select Targets` button.  
    ![Select Targets](../../../static/img/Office-Activation-Status/image_11.png)  
    ![Target Selection](../../../static/img/Office-Activation-Status/image_12.png)

12. ![Target Selection Screen](../../../static/img/Office-Activation-Status/image_13.png)

13. Click the `Save` button to save the monitor set.  
    ![Save Monitor Set](../../../static/img/Office-Activation-Status/image_14.png)



