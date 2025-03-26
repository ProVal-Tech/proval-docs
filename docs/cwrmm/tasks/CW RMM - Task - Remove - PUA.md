---
id: '5f664f90-26b9-4082-9a99-73954de0c840'
slug: /5f664f90-26b9-4082-9a99-73954de0c840
title: 'CW RMM - Task - Remove - PUA'
title_meta: 'CW RMM - Task - Remove - PUA'
keywords: ['PUA', 'bloatware', 'application', 'remove']
description: 'This document outlines the steps to deploy the Cyrisma Censor Application using a custom task in ConnectWise Automate, including script implementation, scheduling, and logging.'
tags: ['PUA', 'bloatware', 'application', 'remove']
draft: false
unlisted: false
---

## Summary

This is a CW RMM implementation of the agnostic script [Remove-PUA](/docs/fda5f79b-3e83-4561-af2b-2533f41c7443). This script removes bloatware from a Windows computer. Use the “ListBloatware” parameter to generate a log of installed bloatware from the supported applications. For a list of supported applications, refer to the “Supported Bloatware” section at the very bottom of this document. 

## Sample Run

![Sample Run 1](<../../../static/img/docs/CW RMM - Task - Remove - PUA/{475F174D-1E13-4097-9B84-E8307E02E101}.png>)

To get the list of installed Bloatware: 
![Sample Run 2](<../../../static/img/docs/CW RMM - Task - Remove - PUA/{CAC8B66A-2258-4389-8823-D9F960D7B465}.png>)

To remove all installed Bloatware supported by the script: 
![Sample Run 3](<../../../static/img/docs/CW RMM - Task - Remove - PUA/{794DF09A-FB9B-44D5-ACD1-D2A46BF6A020}.png>)

To remove all `XboxFeaturesApps` supported by the script: 
![Sample Run 4](<../../../static/img/docs/CW RMM - Task - Remove - PUA/{C1396676-5582-4AAC-89A5-EA0FB32C6795}.png>)

To remove all installed Bloatware except any of `WindowsStoreApps` category apps and `Microsoft.BingNews`,  and `Microsoft.MSPaint`: 
![Sample Run 5](<../../../static/img/docs/CW RMM - Task - Remove - PUA/{7FBBE24B-991F-41E1-B54B-D94D63513FE2}.png>)

To remove individual apps supported by the script like `Microsoft.MicrosoftOfficeHub`, `Microsoft.XboxApp`, `Microsoft.Messaging`, and `Microsoft.People`:
![Sample Run 6](<../../../static/img/docs/CW RMM - Task - Remove - PUA/image.png>)

![Sample Run 7](<../../../static/img/docs/CW RMM - Task - Remove - PUA/image-1.png>)

## Dependencies

[Remove-PUA](/docs/fda5f79b-3e83-4561-af2b-2533f41c7443)

## Implementation

### Create Task

To implement this script, please create a new "PowerShell" style script in the system.

![Create Task](../../../static/img/CRI-Agent-Deployment/image_3.png)

- **Name:** Remove - PUA  
- **Description:** This is a CW RMM implementation of the agnostic script [Remove-PUA](/docs/fda5f79b-3e83-4561-af2b-2533f41c7443). This script removes bloatware from a Windows computer. Use the “ListBloatware” parameter to generate a log of installed bloatware from the supported applications. For a list of supported applications, refer to the “Supported Bloatware” section at the very bottom of this document.   
- **Category:** Application  

![Task Detail](<../../../static/img/docs/CW RMM - Task - Remove - PUA/image-2.png>)

## Parameters

#### ListBloatware:
Add a new parameter by clicking the `Add Parameter` button present at the top-right corner of the screen.
![Add  Parameter 1](<../../../static/img/docs/CW RMM - Task - Remove - PUA/image-3.png>)

This screen will appear.  
![Add Parameter 2](<../../../static/img/docs/CW RMM - Task - Remove - PUA/image-4.png>)

- Set `ListBloatware` in the `Parameter Name` field.
- Select `Flag` from the `Parameter Type` dropdown menu.
- Click the `Save` button.
![Add Parameter 3](<../../../static/img/docs/CW RMM - Task - Remove - PUA/image-5.png>)

#### Remove:
Add a new parameter by clicking the `Add Parameter` button present at the top-right corner of the screen.
![Add  Parameter 4](<../../../static/img/docs/CW RMM - Task - Remove - PUA/image-3.png>)

This screen will appear.  
![Add Parameter 5](<../../../static/img/docs/CW RMM - Task - Remove - PUA/image-4.png>)

- Set `Remove` in the `Parameter Name` field.
- Select `Text String` from the `Parameter Type` dropdown menu.
- Click the `Save` button
![Add Parameter 6](<../../../static/img/docs/CW RMM - Task - Remove - PUA/image-7.png>)

#### RemoveAll:
Add a new parameter by clicking the `Add Parameter` button present at the top-right corner of the screen.
![Add  Parameter 7](<../../../static/img/docs/CW RMM - Task - Remove - PUA/image-3.png>)

This screen will appear.  
![Add Parameter 8](<../../../static/img/docs/CW RMM - Task - Remove - PUA/image-4.png>)

- Set `RemoveAll` in the `Parameter Name` field.
- Select `Flag` from the `Parameter Type` dropdown menu.
- Click the `Save` button
![Add Parameter 9](<../../../static/img/docs/CW RMM - Task - Remove - PUA/image-8.png>)

#### Category:
Add a new parameter by clicking the `Add Parameter` button present at the top-right corner of the screen.
![Add  Parameter 10](<../../../static/img/docs/CW RMM - Task - Remove - PUA/image-3.png>)

This screen will appear.  
![Add Parameter 11](<../../../static/img/docs/CW RMM - Task - Remove - PUA/image-4.png>)

- Set `Category` in the `Parameter Name` field.
- Select `Text String` from the `Parameter Type` dropdown menu.
- Click the `Save` button
![Add Parameter 12](<../../../static/img/docs/CW RMM - Task - Remove - PUA/image-9.png>)

#### Except:
Add a new parameter by clicking the `Add Parameter` button present at the top-right corner of the screen.
![Add  Parameter 13](<../../../static/img/docs/CW RMM - Task - Remove - PUA/image-3.png>)

This screen will appear.  
![Add Parameter 14](<../../../static/img/docs/CW RMM - Task - Remove - PUA/image-4.png>)

- Set `Except` in the `Parameter Name` field.
- Select `Text String` from the `Parameter Type` dropdown menu.
- Click the `Save` button
![Add Parameter 15](<../../../static/img/docs/CW RMM - Task - Remove - PUA/image-10.png>)

### Script

Start by creating three separate rows. You can do this by clicking the "Add Row" button at the bottom of the script page.

![Add Row](../../../static/img/CRI-Agent-Deployment/image_5.png)

A blank function will appear.  
![Add Row continued](<../../../static/img/docs/CW RMM - Task - Remove - PUA/image-12.png>)
### Row 1: Function: PowerShell Script

![Row 1 Image 1](<../../../static/img/docs/CW RMM - Task - Remove - PUA/image-11.png>)

The following function will pop up on the screen: 
![Row 1 Image 2](<../../../static/img/docs/CW RMM - Task - Remove - PUA/image-13.png>)

Paste in the following PowerShell script and set the `Expected time of script execution in seconds` to 3600 seconds. Click the `Save` button.
```
#region user parameters
$ListBloatware = '@ListBloatware@'
$Remove = '@Remove@'
$RemoveAll = '@RemoveAll@'
$Category = '@Category@'
$Except = '@Except@'
if ($ListBloatware -match '1|True|Yes') {
    $ListBloatware = $true
} else {
    $ListBloatware = $false
}
if ($Remove -and $Remove -notmatch 'Remove' -and $Remove -match '[A-z]') {
    $Remove = $Remove -replace ', ', ',' -replace ' ,', ','
    $Remove = $Remove.Trim()
    $Remove = $Remove.Split(',')
}
if ($RemoveAll -match '1|True|Yes') {
    $RemoveAll = $true
} else {
    $RemoveAll = $false
}
if ($RemoveAll -and $Category -and $Category -notmatch 'Category' -and $Category -match '[A-z]') {
    if (!(('MsftBloatApps', 'ThirdPartyBloatApps', 'WindowsStoreApps', 'XboxFeaturesApps', 'NonAppxApps') -contains $Category)) {
        throw 'Invalid category. Supported categories are: MsftBloatApps, ThirdPartyBloatApps, WindowsStoreApps, XboxFeaturesApps, NonAppxApps'
    } else {
        $Category = $Category
    }
} else {
    $Category = $false
}
if ($RemoveAll -and $Except -and $Except -notmatch 'Except' -and $Except -match '[A-z]') {
    $Except = $Except -replace ', ', ',' -replace ' ,', ','
    $Except = $Except.Trim()
    $Except = $Except.Split(',')
} else {
    $Except = $false
}
#endregion
#region parameters hash table
$Parameters = @{}
if ( $ListBloatware ) {
    $Parameters.Add('ListBloatware', $true)
} elseif ( $Remove ) {
    $Parameters.Add('Remove', $Remove)
} elseif ( $RemoveAll ) {
    $Parameters.Add('RemoveAll', $true)
    if ( $Category ) {
        $Parameters.Add('Category', $Category)
    }
    if ( $Except ) {
        $Parameters.Add('Except', $Except)
    }
} else {
    throw 'Invalid parameter set.'
}
#endregion
#region variables
[Net.ServicePointManager]::SecurityProtocol = [enum]::ToObject([Net.SecurityProtocolType], 3072)
$ProjectName = 'Remove-PUA'
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
& $PS1Path @Parameters
#region Execution
if ($Parameters) {
    & $PS1Path @Parameters
} else {
    & $PS1Path
}
#endregion
if ( !(Test-Path $LogPath) ) {
    throw 'PowerShell Failure. A Security application seems to have restricted the execution of the PowerShell Script.'
}
if ( Test-Path $ErrorLogPath ) {
    $ErrorContent = ( Get-Content -Path $ErrorLogPath )
    throw $ErrorContent
}
Get-Content -Path $LogPath
```

![Row 1 Image 3](<../../../static/img/docs/CW RMM - Task - Remove - PUA/image-14.png>)

### Row 2: Function: Script Log 

Add a new row by clicking the `Add Row` button.  
![Row 2 Image 1](<../../../static/img/docs/CW RMM - Task - Remove - PUA/image-15.png>)

A blank function will appear.  
![Row 2 Image 2](<../../../static/img/docs/CW RMM - Task - Remove - PUA/image-16.png>)

Search and select the `Script Log` function.  
![Row 2 Image 3](<../../../static/img/docs/CW RMM - Task - Remove - PUA/image-17.png>)

![Row 2 Image 4](<../../../static/img/docs/CW RMM - Task - Remove - PUA/image-18.png>)

The following function will pop up on the screen:  
![Row 2 Image 5](<../../../static/img/docs/CW RMM - Task - Remove - PUA/image-19.png>)

In the script log message, simply type %output% and click the `Save` button  
![Row 2 Image 6](<../../../static/img/docs/CW RMM - Task - Remove - PUA/image-20.png>)

In the script log message, simply type `%output%` so that the script will send the results of the PowerShell script above to the output on the Automation tab for the target device.

![Row 2 Image 7](../../../static/img/CRI-Agent-Deployment/image_13.png)

Click the `Save` button at the top-right corner of the screen to save the script.  
![Row 2 Image 8](<../../../static/img/docs/CW RMM - Task - Remove - PUA/image-21.png>)

## Row 3: Completed Script
![Row 3 Image 1](<../../../static/img/docs/CW RMM - Task - Remove - PUA/image-22.png>)

## Output
- Script log

## Supported Bloatware

| MsftBloatApps                            | ThirdPartyBloatApps                       | WindowsStoreApps                       | XboxFeaturesApps                   | NonAppxApps                                             |
|------------------------------------------|-------------------------------------------|---------------------------------------|-----------------------------------|---------------------------------------------------------|
| Microsoft.3DBuilder                       | 46928bounde.EclipseManager                | Microsoft.DesktopAppInstaller         | Microsoft.Xbox.TCUI               | Clean Your Device                                       |
| Microsoft.AppConnector                    | 4DF9E0F8.Netflix                          | Microsoft.WindowsStore                 | Microsoft.XboxApp                 | Dell Optimizer Service                                  |
| Microsoft.BingFinance                     | 828B5831.HiddenCityMysteryofShadows      |                                       | Microsoft.XboxGameOverlay         | Dell Power Manager Service                               |
| Microsoft.BingNews                        | 89006A2E.AutodeskSketchBook               |                                       | Microsoft.XboxIdentityProvider    | Dell SupportAssist OS Recovery Plugin for Dell Update   |
| Microsoft.BingSports                      | 9E2F88E3.Twitter                          |                                       | Microsoft.XboxSpeechToTextOverlay | HP Notifications                                         |
| Microsoft.BingWeather                     | A278AB0D.DisneyMagicKingdoms             |                                       |  Microsoft.XboxLive                | HP TechPulse                                           |
| Microsoft.CommsPhone                      | A278AB0D.MarchofEmpires                  |                                       | Microsoft.XboxGamingOverlay        | Lenovo Quick Clean                                      |
| Microsoft.ConnectivityStore               | ActiproSoftwareLLC.562882FEEB491         |                                       |  Microsoft.GamingApp               | Lenovo Vantage Service                                   |
| Microsoft.Getstarted                       | AD2F1837.HPPCHardwareDiagnosticsWindows   |                                       |                                   |                                                         |
| Microsoft.Messaging                        | AD2F1837.HPPowerManager                   |                                       |                                   |                                                         |
| Microsoft.Microsoft3DViewer               | AD2F1837.HPPrivacySettings                |                                       |                                   |                                                         |
| Microsoft.MicrosoftOfficeHub               | AD2F1837.HPQuickDrop                      |                                       |                                   |                                                         |
| Microsoft.MicrosoftPowerBIForWindows      | AD2F1837.HPSupportAssistant               |                                       |                                   |                                                         |
| Microsoft.MicrosoftSolitaireCollection     | AD2F1837.HPSystemInformation              |                                       |                                   |                                                         |
| Microsoft.MicrosoftStickyNotes             | AD2F1837.myHP                             |                                       |                                   |                                                         |
| Microsoft.MinecraftUWP                    | AdobeSystemsIncorporated.AdobePhotoshopExpress |                                   |                                   |                                                         |
| Microsoft.MixedReality.Portal              | CAF9E577.Plex                             |                                       |                                   |                                                         |
| Microsoft.MSPaint                         | D52A8D61.FarmVille2CountryEscape          |                                       |                                   |                                                         |
| Microsoft.NetworkSpeedTest                | D5EA27B7.Duolingo-LearnLanguagesforFree  |                                       |                                   |                                                         |
| Microsoft.Office.OneNote                  | Drawboard.DrawboardPDF                    |                                       |                                   |                                                         |
| Microsoft.Office.OneNote                  | E046963F.cameraSettings                   |                                       |                                   |                                                         |
| Microsoft.Office.Sway                     | E046963F.LenovoCompanion                  |                                       |                                   |                                                         |
| Microsoft.OneConnect                       | E046963F.LenovoSettingsforEnterprise      |                                       |                                   |                                                         |
| Microsoft.People                          | Facebook.Facebook                          |                                       |                                   |                                                         |
| Microsoft.Print3D                         | flaregamesGmbH.RoyalRevolt2              |                                       |                                   |                                                         |
| Microsoft.RemoteDesktop                    | GAMELOFTSA.Asphalt8Airborne               |                                       |                                   |                                                         |
| Microsoft.SkypeApp                        | KeeperSecurityInc.Keeper                  |                                       |                                   |                                                         |
| Microsoft.Windows.Photos                  | king.com.BubbleWitch3Saga                 |                                       |                                   |                                                         |
| Microsoft.WindowsAlarms                   | king.com.CandyCrushSodaSaga               |                                       |                                   |                                                         |
| Microsoft.WindowsCamera                   | laregamesGmbH.RoyalRevolt2                |                                       |                                   |                                                         |
| microsoft.windowscommunicationsapps       | WhatsApp.WhatsAppDesktop                  |                                       |                                   |                                                         |
| Microsoft.WindowsFeedbackHub              | Clipchamp.Clipchamp                       |                                       |                                   |                                                         |
| Microsoft.WindowsMaps                     | LinkedIn.LinkedIn                         |                                       |                                   |                                                         |
| Microsoft.WindowsPhone                    | HPInc.MyHP                                |                                       |                                   |                                                         |
| Microsoft.WindowsSoundRecorder            | SpotifyAB.SpotifyMusic                    |                                       |                                   |                                                         |
| Microsoft.ZuneMusic                       |                                           |                                       |                                   |                                                         |
| Microsoft.ZuneVideo                       |                                           |                                       |                                   |                                                         |
| Microsoft.OneDrive                        |                                           |                                       |                                   |                                                         |
| Microsoft.GetHelp                         |                                           |                                       |                                   |                                                         |
| Microsoft.PowerAutomateDesktop            |                                           |                                       |                                   |                                                         |
| Microsoft.QuickAssist                     |                                           |                                       |                                   |                                                         |
| Microsoft.LinkedIn                        |                                            |                                       |                                   |                                                         |
| Microsoft.WindowsCopilot                  |                                           |                                       |                                   |                                                         |
| Microsoft.549981C3F5F10                  |                                           |                                       |                                   |                                                         |
| Microsoft.WhatsAppDesktop                |                                           |                                       |                                   |                                                         |
| Microsoft.Todos                          |                                           |                                       |                                   |                                                         |
| Microsoft.OneDriveSync                   |                                           |                                       |                                   |                                                         |
| Microsoft.Paint3D                        |                                           |                                       |                                   |                                                         |
| MicrosoftCorporationII.QuickAssist       |                                           |                                       |                                   |                                                         |
| Microsoft.SpotifyMusic                   |                                           |                                       |                                   |                                                         |



