---
id: '1aae141d-3854-4dde-b35f-69db58204fed'
title: 'Reboot Prompter (Deprecated)'
title_meta: 'Reboot Prompter (Deprecated)'
keywords: ['reboot', 'prompter', 'notification', 'windows', 'script']
description: 'This document provides a detailed guide on implementing a PowerShell script that prompts users to reboot their systems. It includes instructions for creating tasks, logging actions, and handling the installation of necessary components, ensuring a smooth user experience during system reboots.'
tags: ['security', 'setup', 'software', 'windows']
draft: false
unlisted: false
---

## Summary

The script prompts the user to reboot with a simple yes or no prompt. It also forces a reboot after the `PromptRebootCount` is exceeded.

## Sample Run

![Sample Run 1](../../../static/img/Reboot-Prompter-(Deprecated)/image_1.png)

![Sample Run 2](../../../static/img/Reboot-Prompter-(Deprecated)/image_2.png)

## Implementation

### Create Task

To implement this script, please create a new "PowerShell" style script in the system.

![Create Task](../../../static/img/Reboot-Prompter-(Deprecated)/image_3.png)

**Name:** Reboot Prompter  
**Description:** Shows a Popup on the user's screen  
**OS Supported:** Windows  
**Category:** Custom

![Task Details](../../../static/img/Reboot-Prompter-(Deprecated)/image_4.png)

## Script

Start by making three separate rows. You can do this by clicking the "Add Row" button at the bottom of the script page.

![Add Row](../../../static/img/Reboot-Prompter-(Deprecated)/image_5.png)

### Row 1: Function: Script Log

![Script Log](../../../static/img/Reboot-Prompter-(Deprecated)/image_6.png)

In the script log message, simply type `Creating the working directory for the prompter script`.

![Script Log Message](../../../static/img/Reboot-Prompter-(Deprecated)/image_7.png)

### Row 2: Function: PowerShell Script

![PowerShell Script](../../../static/img/Reboot-Prompter-(Deprecated)/image_8.png)

![PowerShell Script Details](../../../static/img/Reboot-Prompter-(Deprecated)/image_9.png)

Paste in the following PowerShell script and set the expected time of script execution to 300 seconds.

```powershell
$ProjectName = 'Prompter'
$WorkingDirectory = "C:/ProgramData/_automation/app/$ProjectName"

if (!(Test-Path $WorkingDirectory)) {
    try {
        New-Item -Path $WorkingDirectory -ItemType Directory -Force -ErrorAction Stop | Out-Null
    } catch {
        throw "Failed to Create $WorkingDirectory. Reason: $($Error[0].Exception.Message)"
    }
}

if (-not (((Get-Acl $WorkingDirectory).Access | Where-Object { $_.IdentityReference -Match 'Everyone' }).FileSystemRights -Match 'FullControl')) {
    $Acl = Get-Acl $WorkingDirectory
    $AccessRule = New-Object System.Security.AccessControl.FileSystemAccessRule('Everyone', 'FullControl', 'ContainerInherit, ObjectInherit', 'none', 'Allow')
    $Acl.AddAccessRule($AccessRule)
    Set-Acl $WorkingDirectory $Acl
}
```

### Row 3: Function: Script Log

![Script Log](../../../static/img/Reboot-Prompter-(Deprecated)/image_6.png)

In the script log message, simply type `Installing the supported .NET version`.

![Installation Log](../../../static/img/Reboot-Prompter-(Deprecated)/image_10.png)

### Row 4: Function: PowerShell Script

![PowerShell Script](../../../static/img/Reboot-Prompter-(Deprecated)/image_8.png)

![PowerShell Script Details](../../../static/img/Reboot-Prompter-(Deprecated)/image_11.png)

Paste in the following PowerShell script and set the expected time of script execution to 900 seconds.

```powershell
$ProjectName = 'Prompter'
$WorkingDirectory = "C:/ProgramData/_automation/app/$ProjectName"
try {
    $dotNetVersions = (. "$env:ProgramFiles/dotnet/dotnet.exe" --list-runtimes) -join " "
} catch {}

if (!($dotNetVersions -match "WindowsDesktop/.App 6")) {
    [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
    (New-Object System.Net.WebClient).DownloadFile("https://dotnetcli.azureedge.net/dotnet/WindowsDesktop/6.0.6/windowsdesktop-runtime-6.0.6-win-x64.exe", "$WorkingDirectory/windowsdesktop-runtime-6.0.6-win-x64.exe")
    Start-Process -FilePath "$WorkingDirectory/windowsdesktop-runtime-6.0.6-win-x64.exe" -ArgumentList "/quiet", "/norestart" -NoNewWindow -Wait
    try {
        $dotNetVersions = (. "$env:ProgramFiles/dotnet/dotnet.exe" --list-runtimes) -join " "
    } catch {}
    if (($dotNetVersions -match "WindowsDesktop/.App 6")) {
        return "Successfully installed."
    } else {
        return "Installation failed."
    }
} else {
    return "Already installed."
}
```

### Row 5: Logic: If/Then

![If/Then Logic](../../../static/img/Reboot-Prompter-(Deprecated)/image_12.png)

![If/Then Logic](../../../static/img/Reboot-Prompter-(Deprecated)/image_13.png)

### Row 5a: Condition: Output Contains

In the IF part, enter `Installation failed` in the right box of the "Output Contains" part.

![Output Contains](../../../static/img/Reboot-Prompter-(Deprecated)/image_14.png)

### Row 5b: Condition: Script Exit

Add a new row by clicking on the Add row button.

![Add Row](../../../static/img/Reboot-Prompter-(Deprecated)/image_15.png)

In the script exit message, simply type `The supported .NET version has failed to install.`

![Script Exit Message](../../../static/img/Reboot-Prompter-(Deprecated)/image_16.png)

### Row 6: Function: Script Log

![Script Log](../../../static/img/Reboot-Prompter-(Deprecated)/image_6.png)

In the script log message, simply type `%Output% Creating the Prompter.ps1 file in the working directory for the Prompter exe execution using Task Scheduler.`

![Log Message](../../../static/img/Reboot-Prompter-(Deprecated)/image_17.png)

### Row 7: Function: Set Pre-Defined Variable

![Set Pre-Defined Variable](../../../static/img/Reboot-Prompter-(Deprecated)/image_18.png)

Click on Custom Field > Choose `RebootForceTimeDelaySeconds`. Then set the variable name as `RebootForceTimeDelaySeconds`.

![Variable Name](../../../static/img/Reboot-Prompter-(Deprecated)/image_19.png)

### Row 8: Function: Set Pre-Defined Variable

![Set Pre-Defined Variable](../../../static/img/Reboot-Prompter-(Deprecated)/image_20.png)

Click on Custom Field > Choose `RebootPromptCount`. Then set the variable name as `RebootPromptCount`.

![Variable Name](../../../static/img/Reboot-Prompter-(Deprecated)/image_21.png)

### Row 9: Function: Set Pre-Defined Variable

![Set Pre-Defined Variable](../../../static/img/Reboot-Prompter-(Deprecated)/image_22.png)

Click on Custom Field > Choose `Prompter_Title`. Then set the variable name as `Prompter_Title`.

![Variable Name](../../../static/img/Reboot-Prompter-(Deprecated)/image_23.png)

### Row 10: Function: Set Pre-Defined Variable

![Set Pre-Defined Variable](../../../static/img/Reboot-Prompter-(Deprecated)/image_24.png)

Click on Custom Field > Choose `Prompter_Timeout`. Then set the variable name as `Prompter_Timeout`.

![Variable Name](../../../static/img/Reboot-Prompter-(Deprecated)/image_25.png)

### Row 11: Function: Set Pre-Defined Variable

![Set Pre-Defined Variable](../../../static/img/Reboot-Prompter-(Deprecated)/image_26.png)

Click on Custom Field > Choose `Prompter_HeaderImage`. Then set the variable name as `Prompter_HeaderImage`.

![Variable Name](../../../static/img/Reboot-Prompter-(Deprecated)/image_27.png)

### Row 12: Function: Set Pre-Defined Variable

![Set Pre-Defined Variable](../../../static/img/Reboot-Prompter-(Deprecated)/image_28.png)

Click on Custom Field > Choose `Prompter_Icon`. Then set the variable name as `Prompter_Icon`.

![Variable Name](../../../static/img/Reboot-Prompter-(Deprecated)/image_29.png)

### Row 13: Function: Create File

![Create File](../../../static/img/Reboot-Prompter-(Deprecated)/image_30.png)

Create a file.  
**Path:** `C:/ProgramData/_Automation/app/Prompter/Prompter.ps1`

![Create File Path](../../../static/img/Reboot-Prompter-(Deprecated)/image_31.png)

```powershell
$ProjectName = 'Prompter'
$BaseURL = 'https://file.provaltech.com/repo'
$EXEURL = "$BaseURL/app/$ProjectName.exe"
$WorkingDirectory = "C:/ProgramData/_automation/app/$ProjectName"
$EXEPath = "$WorkingDirectory/$ProjectName.exe"
New-Item -Path $WorkingDirectory -ItemType Directory -Force | Out-Null
$os = Get-CimInstance -Class Win32_OperatingSystem
if ($os.Caption -match 'Windows 10|Windows 11') {
    $proval_RebootForceTimeDelaySeconds = @RebootForceTimeDelaySeconds@
    $proval_RebootPromptCount = @RebootPromptCount@
    $file = "$WorkingDirectory/Prompter_Counter.txt"
    $TimesPrompted = Get-Content -Path "$file" -ErrorAction SilentlyContinue
    if ([string]::IsNullOrEmpty($TimesPrompted)) { $TimesPrompted = 0 } else { $TimesPrompted = [int]$TimesPrompted }
    if ($TimesPrompted -eq 0) {
        $files = @(
            "C:/ProgramData/_Automation/app/Prompter/Prompter_Counter.txt",
            "C:/ProgramData/_Automation/app/Prompter/Prompter_Logging.txt",
            "C:/ProgramData/_Automation/app/Prompter/Prompter_UserAction.txt"
        )
        foreach ($file in $files) {
            if (Test-Path $file) {
                Remove-Item $file -ErrorAction SilentlyContinue -Force
            }
        }
    }
    $PromptMessage = "Would you like to restart now? If you choose not to reboot at this time, you will be prompted $TimesPrompted more times before being forced to reboot."
    $loggedUsers = Get-CimInstance -Class Win32_ComputerSystem | Select-Object -ExpandProperty UserName
    if ($null -eq $loggedUsers) {
        Write-Output "No user logged in"
        Exit
    }
    Invoke-WebRequest -Uri $EXEURL -UseBasicParsing -OutFile $EXEPath
    if (!(Test-Path -Path $EXEPath)) {
        Write-Output "No pre-downloaded app exists and the script $EXEURL failed to download. Exiting."
        return 1
    }
    if ($LASTEXITCODE -eq 1) {
        Write-Output "$ExePath is missing"
        Exit
    }
    $HeaderImage = "@Prompter_HeaderImage@"
    $Icon = "@Prompter_Icon@"
    $Timeout = @Prompter_Timeout@
    $Title = "@Prompter_Title@"
    $Theme = 'dark'
    $ButtonType = 'Yes No'
    $Message = "Your system has reached its reboot prompt deadline and will now reboot in $proval_RebootForceTimeDelaySeconds seconds. A reboot is necessary to keep things running smoothly and to fix potential vulnerabilities. Please save all your work to ensure nothing is lost during the reboot. Thank you!"
    $Param = "-m `"$PromptMessage`" -i `"$Icon`" -h `"$HeaderImage`" -t `"$Title`" -b $ButtonType -e $Theme -o $Timeout"
    $Result = cmd.exe /c "$EXEPath $Param"
    $CurrentDate = Get-Date -Format "yyyy-MM-dd hh:mm:ss"
    $Output = "User Action: " + $Result + "`r`n" + "User Action Date Time: " + $CurrentDate
    $Output | Out-File "C:/ProgramData/_Automation/app/Prompter/Prompter_UserAction.txt" -Append
    if ($Result -contains 'Yes') {
        Write-Output "The end user has authorized restarting the computer" | Out-File 'C:/ProgramData/_Automation/app/Prompter/Prompter_Logging.txt' -Append
    }
    if ($Result -notcontains 'Yes') {
        if ($TimesPrompted -eq $proval_RebootPromptCount) {
            Write-Output "The threshold met. Sending force reboot prompt" | Out-File 'C:/ProgramData/_Automation/app/Prompter/Prompter_Logging.txt' -Append
            $ButtonType = 'OK'
            $Param = "-m `"$Message`" -i `"$Icon`" -h `"$HeaderImage`" -t `"$Title`" -b $ButtonType -e $Theme -o $Timeout"
            $Result = cmd.exe /c "$EXEPath $Param"
            $TimesPrompted = 0
            $TimesPrompted | Out-File 'C:/ProgramData/_Automation/app/Prompter/Prompter_Counter.txt'
        } else {
            $TimesPrompted++
            Write-Output "Denial count: $TimesPrompted. Threshold: $proval_RebootPromptCount" | Out-File 'C:/ProgramData/_Automation/app/Prompter/Prompter_Logging.txt' -Append
            $TimesPrompted | Out-File 'C:/ProgramData/_Automation/app/Prompter/Prompter_Counter.txt'
        }
    }
} else {
    Write-Output "The operating system is not Windows 10 or 11." | Out-File 'C:/ProgramData/_Automation/app/Prompter/Prompter_Logging.txt' -Append
}
```

### Row 14: Function: Script Log

![Script Log](../../../static/img/Reboot-Prompter-(Deprecated)/image_6.png)

In the script log message, simply type `Checking the status of Prompter file creation in the working directory`.

![Log Message](../../../static/img/Reboot-Prompter-(Deprecated)/image_32.png)

### Row 15: Function: PowerShell Script

![PowerShell Script](../../../static/img/Reboot-Prompter-(Deprecated)/image_8.png)

![PowerShell Script Details](../../../static/img/Reboot-Prompter-(Deprecated)/image_33.png)

Paste in the following PowerShell script and set the expected time of script execution to 300 seconds.

```powershell
$ProjectName = 'Prompter'
$file = "C:/ProgramData/_automation/app/$ProjectName/Prompter.ps1"
if ((Test-Path -Path $file) -eq 'True') {
    Write-Output "$file file created successfully"
} else {
    Write-Output "$file file failed to create"
}
```

### Row 16: Function: Script Log

![Script Log](../../../static/img/Reboot-Prompter-(Deprecated)/image_6.png)

In the script log message, simply type `%output%`.

![Log Message](../../../static/img/Reboot-Prompter-(Deprecated)/image_34.png)

### Row 17: Logic: If/Then

![If/Then Logic](../../../static/img/Reboot-Prompter-(Deprecated)/image_12.png)

![If/Then Logic](../../../static/img/Reboot-Prompter-(Deprecated)/image_13.png)

### Row 17a: Condition: Output Contains

In the IF part, enter `file failed to create` in the right box of the "Output Contains" part.

![Output Contains](../../../static/img/Reboot-Prompter-(Deprecated)/image_35.png)

### Row 17b: Condition: Script Exit

Add a new row by clicking on the Add row button.

![Add Row](../../../static/img/Reboot-Prompter-(Deprecated)/image_15.png)

In the script exit message, simply type `%output%`.

![Script Exit Message](../../../static/img/Reboot-Prompter-(Deprecated)/image_36.png)

### Row 18: Function: PowerShell Script

![PowerShell Script](../../../static/img/Reboot-Prompter-(Deprecated)/image_8.png)

![PowerShell Script Details](../../../static/img/Reboot-Prompter-(Deprecated)/image_37.png)

Paste in the following PowerShell script and set the expected time of script execution to 900 seconds.

```powershell
$TaskName = 'Reboot Prompter'
$Description = 'Running Reboot prompter to send the prompt'
$ProjectName = 'Prompter'
$WorkingDirectory = "C:/ProgramData/_automation/app/$ProjectName"
$TaskFile = "$WorkingDirectory/$ProjectName.ps1"
$TaskCheck = Get-ScheduledTask -TaskName $TaskName -ErrorAction SilentlyContinue

if ($TaskCheck) {
    # Unregister the task
    Unregister-ScheduledTask -TaskName $TaskName -Confirm:$false
}

$Action = New-ScheduledTaskAction -Execute 'cmd.exe' -WorkingDirectory $WorkingDirectory -Argument ('/c start /min "" Powershell -NoLogo -ExecutionPolicy Bypass -NoProfile -NonInteractive -Windowstyle Hidden -File ""$($TaskFile)""')
$TriggerTime = (Get-Date).AddMinutes(1)
$Trigger = New-ScheduledTaskTrigger -Once -At $TriggerTime
$Settings = New-ScheduledTaskSettingsSet
$Principal = New-ScheduledTaskPrincipal -GroupId ((New-Object System.Security.Principal.SecurityIdentifier('S-1-5-32-545')).Translate([System.Security.Principal.NTAccount]).Value)

try {
    Register-ScheduledTask -Action $Action -Trigger $Trigger -TaskName $TaskName -Description $Description -Settings $Settings -Principal $Principal
    Write-Output "Task created successfully"
} catch {
    Write-Output "Failed to create task"
}
```

### Row 19: Function: Script Log

![Script Log](../../../static/img/Reboot-Prompter-(Deprecated)/image_6.png)

In the script log message, simply type `%output%`.

![Log Message](../../../static/img/Reboot-Prompter-(Deprecated)/image_34.png)

### Row 20: Logic: If/Then

![If/Then Logic](../../../static/img/Reboot-Prompter-(Deprecated)/image_12.png)

![If/Then Logic](../../../static/img/Reboot-Prompter-(Deprecated)/image_13.png)

### Row 20a: Condition: Custom Field

In the IF part, enter `@RebootPromptCount@` in the right box of the "Custom Field" part where the custom field is `Prompter_Counter`.

![Custom Field](../../../static/img/Reboot-Prompter-(Deprecated)/image_38.png)

### Row 20b: Condition: Script Exit

Add a new row by clicking on the Add row button.

![Add Row](../../../static/img/Reboot-Prompter-(Deprecated)/image_8.png)

Paste in the following PowerShell script and set the expected time of script execution to 1200 seconds.

```powershell
start-sleep -Seconds 900
```

### Row 21: Function: PowerShell Script

Add a new row by clicking on the Add row button.

![Add Row](../../../static/img/Reboot-Prompter-(Deprecated)/image_8.png)

Paste in the following PowerShell script and set the expected time of script execution to 300 seconds.

```powershell
$Result = Get-Content -Path 'C:/ProgramData/_Automation/app/Prompter/Prompter_Counter.txt' -Force -ErrorAction SilentlyContinue
if ($Result) {
    return $Result
} else {
    Write-Output 'No Data Found'
}
```

### Row 22: Function: Set Custom Field

Select Function 'Set Custom Field'. When you select `set custom field`, it will open up a new window.

In this window, search for the `Prompter_Counter` field.

**Custom Field:** `Prompter_Counter`  
**Value:** `%output%`

![Set Custom Field](../../../static/img/Reboot-Prompter-(Deprecated)/image_39.png)

### Row 23: Logic: If/Then

![If/Then Logic](../../../static/img/Reboot-Prompter-(Deprecated)/image_12.png)

![If/Then Logic](../../../static/img/Reboot-Prompter-(Deprecated)/image_13.png)

### Row 23a: Condition: Output Contains

In the IF part, enter `Task created successfully` in the right box of the "Output Contains" part.

![Output Contains](../../../static/img/Reboot-Prompter-(Deprecated)/image_40.png)

### Row 23b: Logic: If/Then

![If/Then Logic](../../../static/img/Reboot-Prompter-(Deprecated)/image_12.png)

![If/Then Logic](../../../static/img/Reboot-Prompter-(Deprecated)/image_13.png)

### Row 23b.1: Condition: Custom Field

In the IF part, enter `0` in the right box of the "Custom Field" part where the custom field is `Prompter_Counter`.

![Custom Field](../../../static/img/Reboot-Prompter-(Deprecated)/image_41.png)

### Row 23b.2: Condition: Script Log

Add a new row by clicking on the Add row button.

![Add Row](../../../static/img/Reboot-Prompter-(Deprecated)/image_42.png)

In the script exit message, simply type `The system will be rebooting in @RebootForceTimeDelaySeconds@.`

![Script Exit Message](../../../static/img/Reboot-Prompter-(Deprecated)/image_43.png)

### Row 23b.3: Condition: PowerShell Script

Add a new row by clicking on the Add row button.

![Add Row](../../../static/img/Reboot-Prompter-(Deprecated)/image_8.png)

Paste in the following PowerShell script and set the expected time of script execution to 300 seconds.

```powershell
$Result = Get-Content -Path 'C:/ProgramData/_Automation/app/Prompter/Prompter_Logging.txt' -Force -ErrorAction SilentlyContinue
if ($Result) {
    return $Result
} else {
    Write-Output 'No Data Found'
}
```

### Row 23b.4: Condition: Set Custom Field

Add a new row by clicking on the Add row button.

Select Function 'Set Custom Field'. When you select `set custom field`, it will open up a new window.

In this window, search for the `Prompter_Logging` field.

**Custom Field:** `Prompter_Logging`  
**Value:** `%output%`

![Set Custom Field](../../../static/img/Reboot-Prompter-(Deprecated)/image_44.png)

### Row 23b.5: Condition: PowerShell Script

Add a new row by clicking on the Add row button.

![Add Row](../../../static/img/Reboot-Prompter-(Deprecated)/image_8.png)

Paste in the following PowerShell script and set the expected time of script execution to 300 seconds.

```powershell
$Result = Get-Content -Path 'C:/ProgramData/_Automation/app/Prompter/Prompter_UserAction.txt' -Force -ErrorAction SilentlyContinue
if ($Result) {
    return $Result
} else {
    Write-Output 'No Data Found'
}
```

### Row 23b.6: Condition: Set Custom Field

Add a new row by clicking on the Add row button.

Select Function 'Set Custom Field'. When you select `set custom field`, it will open up a new window.

In this window, search for the `Prompter_UserAction` field.

**Custom Field:** `Prompter_UserAction`  
**Value:** `%output%`

![Set Custom Field](../../../static/img/Reboot-Prompter-(Deprecated)/image_44.png)

### Row 23b.7: Condition: PowerShell Script

Add a new row by clicking on the Add row button. Set Function to command prompt.

![Add Row](../../../static/img/Reboot-Prompter-(Deprecated)/image_45.png)

Paste in the following Command Prompt script and set the expected time of script execution to 1800 seconds.

```bash
shutdown -r -t @RebootForceTimeDelaySeconds@
```

### Row 23b.8: Conditions: Set Custom Field

Select Function 'Set Custom Field'. When you select `set custom field`, it will open up a new window.

In this window, search for the `Prompter_RebootPending` field.

**Custom Field:** `Prompter_RebootPending`  
**Value:** `False`

![Set Custom Field](../../../static/img/Reboot-Prompter-(Deprecated)/image_46.png)

### Row 23b.9: Conditions: Script Exit

Add a new row by clicking on the Add row button.

Set Function Script Exit and keep it empty so that the script exits normally.

![Script Exit](../../../static/img/Reboot-Prompter-(Deprecated)/image_47.png)

### Row 23c: Function: PowerShell Script

![PowerShell Script](../../../static/img/Reboot-Prompter-(Deprecated)/image_8.png)

![PowerShell Script Details](../../../static/img/Reboot-Prompter-(Deprecated)/image_48.png)

Paste in the following PowerShell script and set the expected time of script execution to 3600 seconds.

```powershell
$ErrorActionPreference = 'SilentlyContinue'
$TaskName = 'Reboot Prompter'
$ProjectName = 'Prompter'
$WorkingDirectory = "C:/ProgramData/_automation/app/$ProjectName"
$file = "$WorkingDirectory/Prompter_Counter.txt"
Start-Sleep -Seconds 300
for ($j = 0; $j -lt 3; $j++) {
    # Get the last write time of the file
    $lastWriteTime = (Get-ItemProperty -Path $file -Name LastWriteTime).LastWriteTime
    # Check if the file was written in the last 10 minutes
    if ((Get-Date) - $lastWriteTime -lt (New-TimeSpan -Minutes 10)) {
        # Check if the task exists
        $Task = Get-ScheduledTask -TaskName $TaskName -ErrorAction SilentlyContinue
        if ($null -eq $Task) {
            Write-Output "No task found with the name $TaskName"
            exit
        }
        # If the task exists, start it
        for ($i = 0; $i -lt 3; $i++) {
            $TaskState = (Get-ScheduledTask -TaskName $TaskName -ErrorAction SilentlyContinue).State
            if ($TaskState -eq "Ready") {
                Unregister-ScheduledTask -TaskName $TaskName -Confirm:$false
                Write-Output "Task $TaskName is not running and has been deleted."
                break
            } elseif ($TaskState -eq "Running") {
                Write-Output "Task $TaskName is currently running. Waiting for 10 minutes before checking again."
                Start-Sleep -Seconds 600
            }
            if ($i -eq 2) {
                Write-Output "The Task $TaskName will automatically recreate during the next run."
            }
        }
    } else {
        Write-Output "The file $file was not written in the last 10 minutes. Waiting for 10 minutes before checking again."
        Start-Sleep -Seconds 600
    }
    if ($j -eq 2) {
        Write-Output "The Task $TaskName will automatically recreate during the next run."
    }
}
```

### Row 23d: Function: Script Log

![Script Log](../../../static/img/Reboot-Prompter-(Deprecated)/image_6.png)

In the script log message, simply type `%output%`.

![Log Message](../../../static/img/Reboot-Prompter-(Deprecated)/image_34.png)

### Row 23e: Logic: If/Then

![If/Then Logic](../../../static/img/Reboot-Prompter-(Deprecated)/image_12.png)

![If/Then Logic](../../../static/img/Reboot-Prompter-(Deprecated)/image_13.png)

### Row 23e.1: Condition: Output Contains

In the IF part, enter `is not running and has been deleted` in the right box of the "Output Contains" part.

![Output Contains](../../../static/img/Reboot-Prompter-(Deprecated)/image_49.png)

### Row 23e.2: Condition: PowerShell Script

![PowerShell Script](../../../static/img/Reboot-Prompter-(Deprecated)/image_8.png)

![PowerShell Script Details](../../../static/img/Reboot-Prompter-(Deprecated)/image_50.png)

Paste in the following PowerShell script and set the expected time of script execution to 300 seconds.

```powershell
$Result = Get-Content -Path 'C:/ProgramData/_Automation/app/Prompter/Prompter_Counter.txt' -Force -ErrorAction SilentlyContinue
if ($Result) {
    return $Result
} else {
    Write-Output 'No Data Found'
}
```

### Row 23e.3: Condition: Set Custom Field

Select Function 'Set Custom Field'. When you select `set custom field`, it will open up a new window.

In this window, search for the `Prompter_Counter` field.

**Custom Field:** `Prompter_Counter`  
**Value:** `%output%`

![Set Custom Field](../../../static/img/Reboot-Prompter-(Deprecated)/image_44.png)

### Row 23e.4: Condition: PowerShell Script

![PowerShell Script](../../../static/img/Reboot-Prompter-(Deprecated)/image_8.png)

![PowerShell Script Details](../../../static/img/Reboot-Prompter-(Deprecated)/image_51.png)

Paste in the following PowerShell script and set the expected time of script execution to 300 seconds.

```powershell
$Result = Get-Content -Path 'C:/ProgramData/_Automation/app/Prompter/Prompter_Logging.txt' -Force -ErrorAction SilentlyContinue
if ($Result) {
    return $Result
} else {
    Write-Output 'No Data Found'
}
```

### Row 23e.5: Condition: Set Custom Field

Select Function 'Set Custom Field'. When you select `set custom field`, it will open up a new window.

In this window, search for the `Prompter_Logging` field.

**Custom Field:** `Prompter_Logging`  
**Value:** `%output%`

![Set Custom Field](../../../static/img/Reboot-Prompter-(Deprecated)/image_44.png)

### Row 23e.6: Condition: PowerShell Script

![PowerShell Script](../../../static/img/Reboot-Prompter-(Deprecated)/image_8.png)

![PowerShell Script Details](../../../static/img/Reboot-Prompter-(Deprecated)/image_52.png)

Paste in the following PowerShell script and set the expected time of script execution to 300 seconds.

```powershell
$Result = Get-Content -Path 'C:/ProgramData/_Automation/app/Prompter/Prompter_UserAction.txt' -Force -ErrorAction SilentlyContinue
if ($Result) {
    return $Result
} else {
    Write-Output 'No Data Found'
}
```

### Row 23e.7: Condition: Set Custom Field

Select Function 'Set Custom Field'. When you select `set custom field`, it will open up a new window.

In this window, search for the `Prompter_UserAction` field.

**Custom Field:** `Prompter_UserAction`  
**Value:** `%output%`

![Set Custom Field](../../../static/img/Reboot-Prompter-(Deprecated)/image_44.png)

### Row 24: Complete

Once all items are added, please save the task. The final task should look like the below screenshots.

![Final Task 1](../../../static/img/Reboot-Prompter-(Deprecated)/image_53.png)

![Final Task 2](../../../static/img/Reboot-Prompter-(Deprecated)/image_54.png)

![Final Task 3](../../../static/img/Reboot-Prompter-(Deprecated)/image_55.png)



