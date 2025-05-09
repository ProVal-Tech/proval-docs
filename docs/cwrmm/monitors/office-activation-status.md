---
id: 'a4b90ce5-21c6-40c4-9158-ff60bd08a53f'
slug: /a4b90ce5-21c6-40c4-9158-ff60bd08a53f
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
   ![Navigate to Monitors](../../../static/img/docs/a4b90ce5-21c6-40c4-9158-ff60bd08a53f/image_1.webp)

2. Click the `Create Monitor` button.  
   ![Create Monitor Button](../../../static/img/docs/a4b90ce5-21c6-40c4-9158-ff60bd08a53f/image_2.webp)

3. This screen will appear.  
   ![Monitor Screen](../../../static/img/docs/a4b90ce5-21c6-40c4-9158-ff60bd08a53f/image_3.webp)

4. **Name:** Office Activation Status  
   **Description:** Generates an alert for any unlicensed Office products on the endpoint  
   **Type:** Script  
   **Family:** Desktop Operating System  
   **Severity:** Others  
   ![Monitor Details](../../../static/img/docs/a4b90ce5-21c6-40c4-9158-ff60bd08a53f/image_4.webp)

5. The `Conditions` tab will start looking like this:  
   ![Conditions Tab](../../../static/img/docs/a4b90ce5-21c6-40c4-9158-ff60bd08a53f/image_5.webp)

6. Set the `Repeat every` to `24` Hours:  
   ![Repeat Every](../../../static/img/docs/a4b90ce5-21c6-40c4-9158-ff60bd08a53f/image_6.webp)

7. Disable the `Ticket Resolution` section by clicking the `Automatically resolve` button.  
   ![Disable Ticket Resolution](../../../static/img/docs/a4b90ce5-21c6-40c4-9158-ff60bd08a53f/image_7.webp)

8. Paste this PowerShell script in the `Script` box.  

   ```powershell
   $ErrorActionPreference = 'SilentlyContinue'
   #region Setup - Variables
   $ProjectName = 'Get-OfficeActivationStatus'
   [Net.ServicePointManager]::SecurityProtocol = [enum]::ToObject([Net.SecurityProtocolType], 3072)
   $BaseURL = 'https://file.provaltech.com/repo'
   $PS1URL = "$BaseURL/script/$ProjectName.ps1"
   $WorkingDirectory = "C:\ProgramData\_automation\script\$ProjectName"
   $PS1Path = "$WorkingDirectory\$ProjectName.ps1"
   $Workingpath = $WorkingDirectory
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
   $licenseInfo = & $PS1Path
   return $licenseInfo.LicenseStatus
   ```
   ![PowerShell Script](../../../static/img/docs/a4b90ce5-21c6-40c4-9158-ff60bd08a53f/image_8.webp)

9. Set `Unlicensed`, `Non_Genuine_Grace_Period`, and `Out_Of_Tolerance_Grace_Period` to the `Script Output` box.  
   ![Script Output](../../../static/img/docs/a4b90ce5-21c6-40c4-9158-ff60bd08a53f/image_9.webp)

10. Enable the `Escalate ticket on script failure` option.  
    ![Escalate Ticket](../../../static/img/docs/a4b90ce5-21c6-40c4-9158-ff60bd08a53f/image_10.webp)

11. Select the required client or group to target from the `Select Targets` button.  
    ![Select Targets](../../../static/img/docs/a4b90ce5-21c6-40c4-9158-ff60bd08a53f/image_11.webp)  
    ![Target Selection](../../../static/img/docs/a4b90ce5-21c6-40c4-9158-ff60bd08a53f/image_12.webp)

12. ![Target Selection Screen](../../../static/img/docs/a4b90ce5-21c6-40c4-9158-ff60bd08a53f/image_13.webp)

13. Click the `Save` button to save the monitor set.  
    ![Save Monitor Set](../../../static/img/docs/a4b90ce5-21c6-40c4-9158-ff60bd08a53f/image_14.webp)