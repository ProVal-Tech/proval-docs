---
id: 'a1d8f066-b016-4654-b855-891518d1f1da'
slug: /a1d8f066-b016-4654-b855-891518d1f1da
title: 'Soji (Disk Cleanup Utility)'
title_meta: 'Soji (Disk Cleanup Utility)'
keywords: ['disk', 'cleanup', 'utility', 'windows', 'rmm']
description: 'This document provides a comprehensive guide on creating the Soji disk cleanup Task in ConnectWise RMM. Soji is a smart disk cleanup utility designed to enhance system cleanliness on Windows, utilizing native System.IO file and directory management along with COM references to the deprecated cleanmgr tool.'
tags: ['cleanup', 'software', 'windows']
draft: false
unlisted: false
---

## Summary

Soji is a smart yet straightforward disk cleanup utility designed to enhance system cleanliness on Windows. It utilizes both native System.IO file and directory management along with COM references to the deprecated cleanmgr tool.

This document provides a guide on creating the Soji disk cleanup Task in CW RMM. The task is versatile and can serve as an Autofix/Automation Task alongside `Monitors` or `Intelligent Alerts`. When employed as an Autofix, the task executes the tool with the `--All` argument.

Please reference [Soji](/docs/c762e174-5262-44b9-a3e9-97ca9ff94afc) for argument usage.

## Sample Run

![Sample Run 1](../../../static/img/docs/a1d8f066-b016-4654-b855-891518d1f1da/image_1.webp)

![Sample Run 2](../../../static/img/docs/a1d8f066-b016-4654-b855-891518d1f1da/image_2.webp)

![Sample Run 3](../../../static/img/docs/a1d8f066-b016-4654-b855-891518d1f1da/image_3.webp)

## Dependencies

- [Soji](/docs/c762e174-5262-44b9-a3e9-97ca9ff94afc)

## Variables

| Name               | Description                             |
|--------------------|-----------------------------------------|
| ProjectName        | Soji                                    |
| WorkingDirectory    | C:/ProgramData/_automation/app/Soji    |

### User Parameters

| Name       | Example  | Required | Description                                                                 |
|------------|----------|----------|-----------------------------------------------------------------------------|
| Arguments  | --all    | False    | Please reference [Soji](/docs/c762e174-5262-44b9-a3e9-97ca9ff94afc) for argument usage. |

**Note:** Arguments are case sensitive.

## Create Script

Create a new `Script Editor` style script in the system to implement this Task.

![Create Script](../../../static/img/docs/a1d8f066-b016-4654-b855-891518d1f1da/image_4.webp)

![Create Script 2](../../../static/img/docs/a1d8f066-b016-4654-b855-891518d1f1da/image_5.webp)

**Name:** `Soji (Disk Cleanup Utility)`

**Description:** `Soji is an intelligent yet simple disk cleanup utility that uses both native System.IO file and directory management and COM references to the deprecated cleanmgr tool to tidy up one or more volumes on a Windows system.`

**Category:** `Maintenance`

![Parameters](../../../static/img/docs/a1d8f066-b016-4654-b855-891518d1f1da/image_6.webp)

Click the `Add Parameter` button.

![Add Parameter](../../../static/img/docs/a1d8f066-b016-4654-b855-891518d1f1da/image_7.webp)

The `Add New Script Parameter` box will appear.

![New Script Parameter](../../../static/img/docs/a1d8f066-b016-4654-b855-891518d1f1da/image_8.webp)

In the box, fill in the following details and select `Save` to create the `Arguments` parameter.

**Parameter Name:** `Arguments`

**Required Field:** `True`

**Parameter Type:** `Text String`

**Default Value:** `True`

**Value:** `--All`

![Parameter Details](../../../static/img/docs/a1d8f066-b016-4654-b855-891518d1f1da/image_9.webp)

### Script

Start by adding a row. You can do this by clicking the `Add Row` button at the bottom of the script page.

![Add Row](../../../static/img/docs/a1d8f066-b016-4654-b855-891518d1f1da/image_10.webp)

#### Row 1 Function: Set User variable

Select `Set User Variable` function.

![Set User Variable](../../../static/img/docs/a1d8f066-b016-4654-b855-891518d1f1da/image_11.webp)  
![Set User Variable 2](../../../static/img/docs/a1d8f066-b016-4654-b855-891518d1f1da/image_12.webp)

![Set User Variable 3](../../../static/img/docs/a1d8f066-b016-4654-b855-891518d1f1da/image_13.webp)

Type `ProjectName` in the `Variable Name` field and `Soji` in the `Value` field. Click the `Save` button to create the variable.

![User Variable 1](../../../static/img/docs/a1d8f066-b016-4654-b855-891518d1f1da/image_14.webp)  
![User Variable 2](../../../static/img/docs/a1d8f066-b016-4654-b855-891518d1f1da/image_15.webp)

#### Row 2 Function: Set User variable

Insert a new row by clicking the `Add Row` button.

![Add Row 2](../../../static/img/docs/a1d8f066-b016-4654-b855-891518d1f1da/image_16.webp)

Select `Set User Variable` function.

![Set User Variable 4](../../../static/img/docs/a1d8f066-b016-4654-b855-891518d1f1da/image_11.webp)  
![Set User Variable 5](../../../static/img/docs/a1d8f066-b016-4654-b855-891518d1f1da/image_12.webp)

![Set User Variable 6](../../../static/img/docs/a1d8f066-b016-4654-b855-891518d1f1da/image_13.webp)

Type `WorkingDirectory` in the `Variable Name` field and `C:\ProgramData\_automation\app\@ProjectName@` in the `Value` field. Click the `Save` button to create the variable.
Type `WorkingDirectory` in the `Variable Name` field and `C:\ProgramData\_automation\app\@ProjectName@` in the `Value` field. Click the `Save` button to create the variable.

![User Variable 3](../../../static/img/docs/a1d8f066-b016-4654-b855-891518d1f1da/image_17.webp)  
![User Variable 4](../../../static/img/docs/a1d8f066-b016-4654-b855-891518d1f1da/image_18.webp)

#### Row 3 Function: PowerShell Script

Insert a new row by clicking the `Add Row` button.

![Add Row 3](../../../static/img/docs/a1d8f066-b016-4654-b855-891518d1f1da/image_16.webp)

Select `PowerShell Script` function.

![PowerShell Script 1](../../../static/img/docs/a1d8f066-b016-4654-b855-891518d1f1da/image_19.webp)  
![PowerShell Script 2](../../../static/img/docs/a1d8f066-b016-4654-b855-891518d1f1da/image_20.webp) ![PowerShell Script 3](../../../static/img/docs/a1d8f066-b016-4654-b855-891518d1f1da/image_21.webp)

Paste in the following PowerShell script, set the expected time of script execution to `300` seconds, and click the `Save` button.

```Powershell
$WorkingDirectory = '@WorkingDirectory@\@ProjectName@'

Remove-Item -Path $WorkingDirectory -Recurse -Force -Confirm:$false -ErrorAction SilentlyContinue

if ( !(Test-Path $WorkingDirectory) ) {
    try {
        New-Item -Path $WorkingDirectory -ItemType Directory -Force -Erroraction Stop | Out-Null
    } catch {
        throw "Failed to Create $WorkingDirectory. Reason: $($Error[0].Exception.Message)"
    }
}

if (-not ( ( ( Get-Acl $WorkingDirectory ).Access | Where-Object { $_.IdentityReference -Match 'Everyone' } ).FileSystemRights -Match 'FullControl' ) ) {
    $Acl = Get-ACL $WorkingDirectory 
    $AccessRule = New-Object System.Security.AccessControl.FileSystemAccessRule('Everyone', 'FullControl', 'ContainerInherit, ObjectInherit', 'none', 'Allow')
    $Acl.AddAccessRule($AccessRule)
    Set-Acl  $WorkingDirectory $Acl
}
```

![PowerShell Script 4](../../../static/img/docs/a1d8f066-b016-4654-b855-891518d1f1da/image_22.webp)  
![PowerShell Script 5](../../../static/img/docs/a1d8f066-b016-4654-b855-891518d1f1da/image_23.webp)

#### Row 4 Function: PowerShell Script

Insert a new row by clicking the `Add Row` button.

![Add Row 4](../../../static/img/docs/a1d8f066-b016-4654-b855-891518d1f1da/image_16.webp)

Select `PowerShell Script` function.

![PowerShell Script 6](../../../static/img/docs/a1d8f066-b016-4654-b855-891518d1f1da/image_19.webp)  
![PowerShell Script 7](../../../static/img/docs/a1d8f066-b016-4654-b855-891518d1f1da/image_20.webp)  
![PowerShell Script 8](../../../static/img/docs/a1d8f066-b016-4654-b855-891518d1f1da/image_21.webp)

Paste in the following PowerShell script, set the expected time of script execution to `600` seconds, and click the `Save` button.

```PowerShell
$ProgressPreference = 'SilentlyContinue'
$appName = 'dotNet8DesktopRuntime'
$workingDirectory = 'C:\ProgramData\_automation\app\Prompter'
$dotnet8path = 'C:\ProgramData\_automation\app\Prompter\dotNet8DesktopRuntime.exe'

Function Install-Check {
    try {
        $dotNetVersions = (. "$env:ProgramFiles\dotnet\dotnet.exe" --list-runtimes) -join ' '
    } catch {}
    
    if (!($dotNetVersions -match 'WindowsDesktop\.App 8')) {
        return $true
    } else {
        return $false
    }
}

$dotnet8url = if ([Environment]::Is64BitOperatingSystem) {
    'https://download.visualstudio.microsoft.com/download/pr/27bcdd70-ce64-4049-ba24-2b14f9267729/d4a435e55182ce5424a7204c2cf2b3ea/windowsdesktop-runtime-8.0.11-win-x64.exe'
} else {
    'https://download.visualstudio.microsoft.com/download/pr/6e1f5faf-ee7d-4db0-9111-9e270a458342/4cdcd1af2d6914134308630f048fbdfc/windowsdesktop-runtime-8.0.11-win-x86.exe'
}

if (!(Test-Path -Path $workingDirectory)) {
    New-Item -ItemType Directory -Path $workingDirectory -Force -ErrorAction SilentlyContinue | Out-Null
}

if (Install-Check) {
    [Net.ServicePointManager]::SecurityProtocol = [Enum]::ToObject([Net.SecurityProtocolType], 3072)
    Start-BitsTransfer -Source $dotnet8url -Destination $dotnet8path
    cmd.exe /c $dotnet8path /install /quiet /norestart
    Start-Sleep -Seconds 5
    
    if (Install-Check) {
        throw 'Error: .Net Desktop Runtime 8.0 installation failed.'
    } else {
        return 'Success: .Net Desktop Runtime 8.0 installed'
    }
} else {
    return 'Success: .Net Desktop Runtime 8.0 is already installed.'
}
```

![PowerShell Script 9](../../../static/img/docs/a1d8f066-b016-4654-b855-891518d1f1da/image_24.webp)  
![PowerShell Script 10](../../../static/img/docs/a1d8f066-b016-4654-b855-891518d1f1da/image_23.webp)

#### Row 5 Function: PowerShell Script

Insert a new row by clicking the `Add Row` button.

![Add Row 5](../../../static/img/docs/a1d8f066-b016-4654-b855-891518d1f1da/image_16.webp)

Select `PowerShell Script` function.

![PowerShell Script 11](../../../static/img/docs/a1d8f066-b016-4654-b855-891518d1f1da/image_19.webp)  
![PowerShell Script 12](../../../static/img/docs/a1d8f066-b016-4654-b855-891518d1f1da/image_20.webp)  
![PowerShell Script 13](../../../static/img/docs/a1d8f066-b016-4654-b855-891518d1f1da/image_21.webp)

Paste in the following PowerShell script, set the expected time of script execution to `1800` seconds, and click the `Save` button.

```powershell
#region Setup - Variables
$ProjectName = '@ProjectName@'
$BaseURL = 'https://file.provaltech.com/repo'
$EXEURL = "$BaseURL/app/$ProjectName.exe"
$WorkingDirectory = '@WorkingDirectory@'
$EXEPath = "$WorkingDirectory\$ProjectName.exe"
#endregion

#region Download - soji
if (! (Test-Path $ExePath)) {
  [Net.ServicePointManager]::SecurityProtocol = [enum]::ToObject([Net.SecurityProtocolType], 3072)
  Invoke-WebRequest -Uri $EXEURL -UseBasicParsing -OutFile $EXEPath
  if (!(Test-Path -Path $EXEPath)) {
      Throw "No pre-downloaded app exists and the application '$EXEURL' failed to download. Exiting."
  }
}
#endregion
cmd.exe /c $EXEPath @Arguments@
```

![PowerShell Script 14](../../../static/img/docs/a1d8f066-b016-4654-b855-891518d1f1da/image_25.webp)  
![PowerShell Script 15](../../../static/img/docs/a1d8f066-b016-4654-b855-891518d1f1da/image_23.webp)

#### Row 6 Function: Script Log

Insert a new row by clicking the `Add Row` button.

![Add Row 6](../../../static/img/docs/a1d8f066-b016-4654-b855-891518d1f1da/image_16.webp)

Select `Script Log` function.

![Script Log 1](../../../static/img/docs/a1d8f066-b016-4654-b855-891518d1f1da/image_26.webp)  
![Script Log 2](../../../static/img/docs/a1d8f066-b016-4654-b855-891518d1f1da/image_27.webp)

Paste this line in the `Script Log Message` box and click the `Save` button.  
`%output%`

![Script Log Message](../../../static/img/docs/a1d8f066-b016-4654-b855-891518d1f1da/image_28.webp)  
![Script Log Message 2](../../../static/img/docs/a1d8f066-b016-4654-b855-891518d1f1da/image_29.webp)

Click the `Save` button to save the Task.

![Save Task](../../../static/img/docs/a1d8f066-b016-4654-b855-891518d1f1da/image_30.webp)

## Completed Script

![Completed Script](../../../static/img/docs/a1d8f066-b016-4654-b855-891518d1f1da/image_31.webp)

## Output

![Script Log Output](../../../static/img/docs/a1d8f066-b016-4654-b855-891518d1f1da/image_32.webp)
