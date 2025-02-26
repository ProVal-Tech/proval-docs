---
id: 'a1d8f066-b016-4654-b855-891518d1f1da'
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

Check out Soji on GitHub: [https://github.com/ProVal-Tech/Soji](https://github.com/ProVal-Tech/Soji)

This document provides a guide on creating the Soji disk cleanup Task in CW RMM. The task is versatile and can serve as an Autofix/Automation Task alongside `Monitors` or `Intelligent Alerts`. When employed as an Autofix, the task executes the tool with the `--All` argument.

Please reference [Soji](https://proval.itglue.com/DOC-5078775-10338558) for argument usage.

## Sample Run

![Sample Run 1](../../../static/img/Soji-(Disk-Cleanup-Utility)/image_1.png)

![Sample Run 2](../../../static/img/Soji-(Disk-Cleanup-Utility)/image_2.png)

![Sample Run 3](../../../static/img/Soji-(Disk-Cleanup-Utility)/image_3.png)

## Dependencies

[Soji](https://proval.itglue.com/DOC-5078775-10338558)

## Variables

| Name               | Description                             |
|--------------------|-----------------------------------------|
| ProjectName        | Soji                                    |
| WorkingDirectory    | C:/ProgramData/_automation/app/Soji    |

### User Parameters

| Name       | Example  | Required | Description                                                                 |
|------------|----------|----------|-----------------------------------------------------------------------------|
| Arguments  | --all    | False    | Please reference [Soji](https://proval.itglue.com/DOC-5078775-10338558) for argument usage. |

**Note:** Arguments are case sensitive.

## Create Script

Create a new `Script Editor` style script in the system to implement this Task.

![Create Script](../../../static/img/Soji-(Disk-Cleanup-Utility)/image_4.png)

![Create Script 2](../../../static/img/Soji-(Disk-Cleanup-Utility)/image_5.png)

**Name:** `Soji (Disk Cleanup Utility)`

**Description:** `Soji is an intelligent yet simple disk cleanup utility that uses both native System.IO file and directory management and COM references to the deprecated cleanmgr tool to tidy up one or more volumes on a Windows system.`

[https://github.com/ProVal-Tech/Soji](https://github.com/ProVal-Tech/Soji)

**Category:** `Maintenance`

![Parameters](../../../static/img/Soji-(Disk-Cleanup-Utility)/image_6.png)

Click the `Add Parameter` button.

![Add Parameter](../../../static/img/Soji-(Disk-Cleanup-Utility)/image_7.png)

The `Add New Script Parameter` box will appear.

![New Script Parameter](../../../static/img/Soji-(Disk-Cleanup-Utility)/image_8.png)

In the box, fill in the following details and select `Save` to create the `Arguments` parameter.

**Parameter Name:** `Arguments`

**Required Field:** `True`

**Parameter Type:** `Text String`

**Default Value:** `True`

**Value:** `--All`

![Parameter Details](../../../static/img/Soji-(Disk-Cleanup-Utility)/image_9.png)

### Script

Start by adding a row. You can do this by clicking the `Add Row` button at the bottom of the script page.

![Add Row](../../../static/img/Soji-(Disk-Cleanup-Utility)/image_10.png)

#### Row 1 Function: Set User variable

Select `Set User Variable` function.

![Set User Variable](../../../static/img/Soji-(Disk-Cleanup-Utility)/image_11.png) ![Set User Variable 2](../../../static/img/Soji-(Disk-Cleanup-Utility)/image_12.png)

![Set User Variable 3](../../../static/img/Soji-(Disk-Cleanup-Utility)/image_13.png)

Type `ProjectName` in the `Variable Name` field and `Soji` in the `Value` field. Click the `Save` button to create the variable.

![User Variable 1](../../../static/img/Soji-(Disk-Cleanup-Utility)/image_14.png) ![User Variable 2](../../../static/img/Soji-(Disk-Cleanup-Utility)/image_15.png)

#### Row 2 Function: Set User variable

Insert a new row by clicking the `Add Row` button.

![Add Row 2](../../../static/img/Soji-(Disk-Cleanup-Utility)/image_16.png)

Select `Set User Variable` function.

![Set User Variable 4](../../../static/img/Soji-(Disk-Cleanup-Utility)/image_11.png) ![Set User Variable 5](../../../static/img/Soji-(Disk-Cleanup-Utility)/image_12.png)

![Set User Variable 6](../../../static/img/Soji-(Disk-Cleanup-Utility)/image_13.png)

Type `WorkingDirectory` in the `Variable Name` field and `C:/ProgramData/_automation/app/@ProjectName@` in the `Value` field. Click the `Save` button to create the variable.

![User Variable 3](../../../static/img/Soji-(Disk-Cleanup-Utility)/image_17.png) ![User Variable 4](../../../static/img/Soji-(Disk-Cleanup-Utility)/image_18.png)

#### Row 3 Function: PowerShell Script

Insert a new row by clicking the `Add Row` button.

![Add Row 3](../../../static/img/Soji-(Disk-Cleanup-Utility)/image_16.png)

Select `PowerShell Script` function.

![PowerShell Script 1](../../../static/img/Soji-(Disk-Cleanup-Utility)/image_19.png) ![PowerShell Script 2](../../../static/img/Soji-(Disk-Cleanup-Utility)/image_20.png) ![PowerShell Script 3](../../../static/img/Soji-(Disk-Cleanup-Utility)/image_21.png)

Paste in the following PowerShell script, set the expected time of script execution to `300` seconds, and click the `Save` button.

```
$WorkingDirectory = '@WorkingDirectory@/@ProjectName@'

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

![PowerShell Script 4](../../../static/img/Soji-(Disk-Cleanup-Utility)/image_22.png) ![PowerShell Script 5](../../../static/img/Soji-(Disk-Cleanup-Utility)/image_23.png)

#### Row 4 Function: PowerShell Script

Insert a new row by clicking the `Add Row` button.

![Add Row 4](../../../static/img/Soji-(Disk-Cleanup-Utility)/image_16.png)

Select `PowerShell Script` function.

![PowerShell Script 6](../../../static/img/Soji-(Disk-Cleanup-Utility)/image_19.png) ![PowerShell Script 7](../../../static/img/Soji-(Disk-Cleanup-Utility)/image_20.png) ![PowerShell Script 8](../../../static/img/Soji-(Disk-Cleanup-Utility)/image_21.png)

Paste in the following PowerShell script, set the expected time of script execution to `600` seconds, and click the `Save` button.

```
$ErrorActionPreference = 'silentlycontinue'
try {$dotNetVersions = (. "$env:ProgramFiles/dotnet/dotnet.exe" --list-runtimes) -join ' '} catch {}

if(!($dotNetVersions -match '(WindowsDesktop/.App 6)|(Microsoft/.NetCore/.App 6)')) {
    [Net.ServicePointManager]::SecurityProtocol = [enum]::ToObject([Net.SecurityProtocolType], 3072)
    (New-Object System.Net.WebClient).DownloadFile('https://download.visualstudio.microsoft.com/download/pr/62bf9f50-dcd9-4e4c-ac02-4d355efb914d/a56b37b98cb07899cd8c44fa7d50dff3/dotnet-runtime-6.0.24-win-x64.exe','@WorkingDirectory@/windowsdesktop-runtime-6.0.24-win-x64.exe')
    Start-Process -FilePath '@WorkingDirectory@/windowsdesktop-runtime-6.0.24-win-x64.exe' -ArgumentList '/quiet','/norestart' -NoNewWindow -Wait
    try {$dotNetVersions = (. "$env:ProgramFiles/dotnet/dotnet.exe" --list-runtimes) -join ' '} catch {}
    if(($dotNetVersions -match '(WindowsDesktop/.App 6)|(Microsoft/.NetCore/.App 6)')) {
        return 'Successfully installed.'
    } else {
        throw 'Installation failed.'
    }
} else {
    return 'Already installed.'
}
```

![PowerShell Script 9](../../../static/img/Soji-(Disk-Cleanup-Utility)/image_24.png) ![PowerShell Script 10](../../../static/img/Soji-(Disk-Cleanup-Utility)/image_23.png)

#### Row 5 Function: PowerShell Script

Insert a new row by clicking the `Add Row` button.

![Add Row 5](../../../static/img/Soji-(Disk-Cleanup-Utility)/image_16.png)

Select `PowerShell Script` function.

![PowerShell Script 11](../../../static/img/Soji-(Disk-Cleanup-Utility)/image_19.png) ![PowerShell Script 12](../../../static/img/Soji-(Disk-Cleanup-Utility)/image_20.png) ![PowerShell Script 13](../../../static/img/Soji-(Disk-Cleanup-Utility)/image_21.png)

Paste in the following PowerShell script, set the expected time of script execution to `1800` seconds, and click the `Save` button.

```
#region Setup - Variables
$ProjectName = '@ProjectName@'
$BaseURL = 'https://file.provaltech.com/repo'
$EXEURL = "$BaseURL/app/$ProjectName.exe"
$WorkingDirectory = '@WorkingDirectory@'
$EXEPath = "$WorkingDirectory/$ProjectName.exe"
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

![PowerShell Script 14](../../../static/img/Soji-(Disk-Cleanup-Utility)/image_25.png) ![PowerShell Script 15](../../../static/img/Soji-(Disk-Cleanup-Utility)/image_23.png)

#### Row 6 Function: Script Log

Insert a new row by clicking the `Add Row` button.

![Add Row 6](../../../static/img/Soji-(Disk-Cleanup-Utility)/image_16.png)

Select `Script Log` function.

![Script Log 1](../../../static/img/Soji-(Disk-Cleanup-Utility)/image_26.png) ![Script Log 2](../../../static/img/Soji-(Disk-Cleanup-Utility)/image_27.png)

Paste this line in the `Script Log Message` box and click the `Save` button.  
`%output%`

![Script Log Message](../../../static/img/Soji-(Disk-Cleanup-Utility)/image_28.png) ![Script Log Message 2](../../../static/img/Soji-(Disk-Cleanup-Utility)/image_29.png)

Click the `Save` button to save the Task.

![Save Task](../../../static/img/Soji-(Disk-Cleanup-Utility)/image_30.png)

## Completed Script

![Completed Script](../../../static/img/Soji-(Disk-Cleanup-Utility)/image_31.png)

## Output

- Script Log

![Script Log Output](../../../static/img/Soji-(Disk-Cleanup-Utility)/image_32.png)



