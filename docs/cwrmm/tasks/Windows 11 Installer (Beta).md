---
id: 'rmm-windows-11-installer-beta'
title: 'Windows 11 Installer (Beta)'
title_meta: 'Windows 11 Installer (Beta)'
keywords: ['windows', 'upgrade', 'installer', 'script', 'deployment']
description: 'This document provides a comprehensive guide on installing Windows 11 on compatible Windows 10 computers using a script that includes options for reboot suppression. It covers requirements, dependencies, task creation, and detailed parameters for execution.'
tags: ['windows', 'upgrade', 'installation', 'setup', 'script']
draft: false
unlisted: false
---
## Summary

Install Windows 11 on a compatible Windows 10 computer. The default nature of the script is to restart the computer to complete the upgrade. Although, the `NoReboot` parameter provides an option to suppress the reboot. However, the computer should be rebooted at the earliest convenience to complete the upgrade.  

The OS Drive should have 20 GB of free space to install the upgrade.  

This task can be executed manually against the computers present in the [Windows 11 Compatible Machines](https://proval.itglue.com/DOC-5078775-15835387) group.

## Sample Run

![Sample Run 1](..\..\..\static\img\Windows-11-Installer-(Beta)\image_3.png)  
![Sample Run 2](..\..\..\static\img\Windows-11-Installer-(Beta)\image_4.png)  
![Sample Run 3](..\..\..\static\img\Windows-11-Installer-(Beta)\image_5.png)  

## Dependencies

- [CW RMM - Custom Field - Windows 11 Upgrade RunTime](https://proval.itglue.com/DOC-5078775-15835393)
- [CW RMM - Device Group - Windows 11 Compatible Machines](https://proval.itglue.com/DOC-5078775-15835387)

## Variables

| Name   | Description                                       |
|--------|---------------------------------------------------|
| Output | Output of the previously executed PowerShell script. |

#### User Parameters

| Name      | Type  | Required | Description                                                 | Default Value |
|-----------|-------|----------|-------------------------------------------------------------|---------------|
| NoReboot  | Flag  | No       | Provides an option to suppress the reboot while running the script. | False         |

## Task Creation

Create a new `Script Editor` style script in the system to implement this Task.

![Task Creation 1](..\..\..\static\img\Windows-11-Installer-(Beta)\image_6.png)  
![Task Creation 2](..\..\..\static\img\Windows-11-Installer-(Beta)\image_7.png)  

**Name:** Windows 11 Installer (Beta)  
**Description:** Install Windows 11 on a compatible Windows 10 computer.  
**Category:** Patching  

![Task Creation 3](..\..\..\static\img\Windows-11-Installer-(Beta)\image_8.png)  

### Parameters

Add a new parameter by clicking the `Add Parameter` button present at the top-right corner of the screen.

![Add Parameter](..\..\..\static\img\Windows-11-Installer-(Beta)\image_9.png)  

This screen will appear.  
![Parameter Screen](..\..\..\static\img\Windows-11-Installer-(Beta)\image_10.png)  

- Set `NoReboot` in the `Parameter Name` field.
- Select `Flag` from the `Parameter Type` dropdown menu.
- Enable the `Default Value` option.
- Select `False` from the `Value` dropdown menu.
- Click the `Save` button.  
![Save Parameter](..\..\..\static\img\Windows-11-Installer-(Beta)\image_11.png)  
- It will ask for the confirmation to proceed. Click the `Confirm` button to create the parameter.  
![Confirm Parameter](..\..\..\static\img\Windows-11-Installer-(Beta)\image_12.png)  

### Task

Navigate to the Script Editor Section and start by adding a row. You can do this by clicking the `Add Row` button at the bottom of the script page.  
![Add Row](..\..\..\static\img\Windows-11-Installer-(Beta)\image_13.png)  

A blank function will appear.  
![Blank Function](..\..\..\static\img\Windows-11-Installer-(Beta)\image_14.png)  

#### Row 1 Function: PowerShell Script

Search and select the `PowerShell Script` function.  
![Select PowerShell Script](..\..\..\static\img\Windows-11-Installer-(Beta)\image_15.png)  
![PowerShell Script Selected](..\..\..\static\img\Windows-11-Installer-(Beta)\image_16.png)  

The following function will pop up on the screen:  
![PowerShell Function](..\..\..\static\img\Windows-11-Installer-(Beta)\image_17.png)  

Paste in the following PowerShell script and leave the expected time of script execution to `300` seconds. Click the `Save` button.  

```powershell
( Get-Date ).ToString('yyyy-MM-dd HH:mm:ss')
```
![PowerShell Script Save](..\..\..\static\img\Windows-11-Installer-(Beta)\image_18.png)  

#### Row 2 Function: Set Custom Field

Add a new row by clicking the `Add Row` button.  
![Add Row](..\..\..\static\img\Windows-11-Installer-(Beta)\image_19.png)  

A blank function will appear.  
![Blank Function](..\..\..\static\img\Windows-11-Installer-(Beta)\image_14.png)  

Search and select the `Set Custom Field` function.  
![Select Set Custom Field](..\..\..\static\img\Windows-11-Installer-(Beta)\image_20.png)  

Search and select `Windows 11 Upgrade RunTime` in the `Search Custom Field` field and set `%Output%` in the `Value` field and click the `Save` button.  
![Set Custom Field](..\..\..\static\img\Windows-11-Installer-(Beta)\image_21.png)  
![Set Custom Field 2](..\..\..\static\img\Windows-11-Installer-(Beta)\image_22.png)  

#### Row 3 Function: PowerShell Script

Add a new row by clicking the `Add Row` button.  
![Add Row](..\..\..\static\img\Windows-11-Installer-(Beta)\image_19.png)  

A blank function will appear.  
![Blank Function](..\..\..\static\img\Windows-11-Installer-(Beta)\image_14.png)  

Search and select the `PowerShell Script` function.  
![Select PowerShell Script](..\..\..\static\img\Windows-11-Installer-(Beta)\image_15.png)  
![PowerShell Script Selected](..\..\..\static\img\Windows-11-Installer-(Beta)\image_16.png)  

The following function will pop up on the screen:  
![PowerShell Function](..\..\..\static\img\Windows-11-Installer-(Beta)\image_17.png)  

Paste in the following PowerShell script and set the expected time of script execution to `7200` seconds. Click the `Save` button.

```powershell
[Net.ServicePointManager]::SecurityProtocol = [Enum]::ToObject([Net.SecurityProtocolType], 3072)
if ( ( Get-Volume -DriveLetter $env:SystemDrive[0] ).SizeRemaining -le 20GB ) {
    throw @"
The Drive Space health check failed. The drive must have 20GB of free space to perform a Feature Update.
Current available space on $($env:SystemDrive[0]): $([math]::round($systemVolume.SizeRemaining / 1GB, 2))
For more information: https://learn.microsoft.com/en-us/troubleshoot/windows-client/deployment/windows-10-upgrade-quick-fixes?toc=%2Fwindows%2Fdeployment%2Ftoc.json&bc=%2Fwindows%2Fdeployment%2Fbreadcrumb%2Ftoc.json#verify-disk-space
"@
}
$appName = 'windows-upgrader'
$workingDirectory = "C:\ProgramData\_Automation\App\$appName"
$filePath = "$workingDirectory\$appName.exe"
$url = 'https://file.provaltech.com/repo/app/windows-upgrader.exe'
New-Item -Path $workingDirectory -Force -ItemType Directory -Confirm:$false -ErrorAction SilentlyContinue | Out-Null
try {
    $webClient = [System.Net.WebClient]::new()
    $WebClient.DownloadFile( $url, $filePath )
    Unblock-File -Path $filePath -Confirm:$false -ErrorAction SilentlyContinue
} catch {
    throw "Failed to download the installer. Reason: $($Error[0].exception.Message)"
}
if ( '@NoReboot@' -match '1|Yes|True' ) {
    & $filepath --noreboot
} else {
    & $filepath
}
```

![PowerShell Script Save](..\..\..\static\img\Windows-11-Installer-(Beta)\image_23.png)  

Click the `Save` button at the top right corner of the screen to save the task.

## Completed Task

![Completed Task](..\..\..\static\img\Windows-11-Installer-(Beta)\image_24.png)  

## Deployment

It is suggested to run this task manually for the time being.  

## Output

- Script Log
- Custom Field



