---
id: '8d171849-b417-4ce7-a75f-c9294aca045b'
title: 'Reboot Prompter'
title_meta: 'Reboot Prompter'
keywords: ['reboot', 'prompter', 'windows', 'script', 'automation']
description: 'This document provides a comprehensive guide on implementing a Reboot Prompter script that prompts users to reboot their systems. It includes step-by-step instructions for setting up the script, managing dependencies, and scheduling tasks in ConnectWise RMM to ensure timely prompts for system reboots.'
tags: ['setup', 'windows']
draft: false
unlisted: false
---

## Summary

The script prompts the user to reboot with a simple yes or no prompt. It also forces a reboot after the `PromptRebootCount` is crossed.

## Dependencies

- [CW RMM - Custom Fields - Reboot Prompter](https://proval.itglue.com/DOC-5078775-15298950)  
- [CW RMM - Dynamic Group - Reboot Pending Deployment](<../groups/Reboot Prompter Deployment - Manual.md>)  

## Sample Run

![Sample Run 1](../../../static/img/Reboot-Prompter/image_7.png)  
![Sample Run 2](../../../static/img/Reboot-Prompter/image_8.png)  

## Implementation

### Create Task

To implement this script, please create a new "PowerShell" style script in the system.

![Create Task](../../../static/img/Reboot-Prompter/image_9.png)  

- **Name:** Reboot Prompter  
- **Description:** Shows a Popup on the user's screen  
- **OS Supported:** Windows  
- **Category:** Custom  

![Task Details](../../../static/img/Reboot-Prompter/image_10.png)  

### Script

Start by making three separate rows. You can do this by clicking the "Add Row" button at the bottom of the script page.

![Add Row](../../../static/img/Reboot-Prompter/image_11.png)  

### Row 1: Function: Script Log

![Script Log](../../../static/img/Reboot-Prompter/image_12.png)  

In the script log message, simply type `Creating the working directory for the prompter script`  

![Log Message](../../../static/img/Reboot-Prompter/image_13.png)  

### Row 2: Function: PowerShell script

![PowerShell Script](../../../static/img/Reboot-Prompter/image_14.png)  
![PowerShell Script](../../../static/img/Reboot-Prompter/image_15.png)  

Paste in the following PowerShell script and set the expected time of script execution to `300` seconds.

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

![Script Log](../../../static/img/Reboot-Prompter/image_12.png)  

In the script log message, simply type `Installing the supported .NET version`  

![Log Message](../../../static/img/Reboot-Prompter/image_16.png)  

### Row 4: Function: PowerShell script

![PowerShell Script](../../../static/img/Reboot-Prompter/image_14.png)  
![PowerShell Script](../../../static/img/Reboot-Prompter/image_17.png)  

Paste in the following PowerShell script and set the expected time of script execution to `900` seconds.

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

### Row 5: Function: Script Log

![Script Log](../../../static/img/Reboot-Prompter/image_12.png)  

In the script log message, simply type `%Output%`  

![Log Message](../../../static/img/Reboot-Prompter/image_18.png)  

### Row 6: Logic: If/Then

![Logic If/Then](../../../static/img/Reboot-Prompter/image_19.png)  
![Logic If/Then](../../../static/img/Reboot-Prompter/image_20.png)  

### Row 6a: Condition: Output Contains

In the IF part, enter `Installation failed` in the right box of the "Output Contains" part.  

![Condition](../../../static/img/Reboot-Prompter/image_21.png)  

### Row 6b: Function: Script Exit

Add a new row by clicking on the Add row button.  

![Add Row](../../../static/img/Reboot-Prompter/image_22.png)  

In the script exit message, simply type `The supported .NET version has failed to install.`  

![Exit Message](../../../static/img/Reboot-Prompter/image_23.png)  

### Row 7: Function: PowerShell Script

![PowerShell Script](../../../static/img/Reboot-Prompter/image_14.png)  
![PowerShell Script](../../../static/img/Reboot-Prompter/image_24.png)  

Paste in the following PowerShell script and set the expected time of script execution to `300` seconds.

```powershell
$Result = Get-Content -Path 'C:/ProgramData/_Automation/app/Prompter/Prompter_UserAction.txt' -Force -ErrorAction SilentlyContinue
if ($Result) {
    return $Result
} else {
    Write-Output 'No Data Found'
}
```

### Row 8: Function: Set Custom Field

Select Function 'Set Custom Field'. When you select `set custom field`, it will open up a new window.

In this window, search for the `Prompter_UserAction` field.  

**Custom Field:** `Prompter_UserAction`  
**Value:** `%output%`  

![Set Custom Field](../../../static/img/Reboot-Prompter/image_25.png)  

### Row 9: Function: PowerShell Script

![PowerShell Script](../../../static/img/Reboot-Prompter/image_14.png)  
![PowerShell Script](../../../static/img/Reboot-Prompter/image_26.png)  

Paste in the following PowerShell script and set the expected time of script execution to `300` seconds.

```powershell
$Result = Get-Content -Path 'C:/ProgramData/_Automation/app/Prompter/Prompter_Logging.txt' -Force -ErrorAction SilentlyContinue
if ($Result) {
    return $Result
} else {
    Write-Output 'No Data Found'
}
```

Select Function 'Set Custom Field'. When you select `set custom field`, it will open up a new window.

In this window, search for the `Prompter_Logging` field.  

**Custom Field:** `Prompter_Logging`  
**Value:** `%output%`  

![Set Custom Field](../../../static/img/Reboot-Prompter/image_25.png)  

### Row 10: Function: PowerShell Script

![PowerShell Script](../../../static/img/Reboot-Prompter/image_14.png)  
![PowerShell Script](../../../static/img/Reboot-Prompter/image_27.png)  

Paste in the following PowerShell script and set the expected time of script execution to `300` seconds.

```powershell
$Result = Get-Content -Path 'C:/ProgramData/_Automation/app/Prompter/Prompter_Counter.txt' -Force -ErrorAction SilentlyContinue
if ($Result) {
    return $Result
} else {
    Write-Output 'No Data Found'
}
```

Select Function 'Set Custom Field'. When you select `set custom field`, it will open up a new window.

In this window, search for the `Prompter_Counter` field.  

**Custom Field:** `Prompter_Counter`  
**Value:** `%output%`  

![Set Custom Field](../../../static/img/Reboot-Prompter/image_25.png)  

### Row 11: Logic: If/Then

![Logic If/Then](../../../static/img/Reboot-Prompter/image_19.png)  
![Logic If/Then](../../../static/img/Reboot-Prompter/image_20.png)  

### Row 11a: Condition: Custom Field

In the IF part, enter `0` in the right box of the "Custom Field" part where the custom field is 'Prompter_Counter'.  

![Condition](../../../static/img/Reboot-Prompter/image_28.png)  

### Row 11b: Function: Set Custom Field

Select Function 'Set Custom Field'. When you select `set custom field`, it will open up a new window.

In this window, search for the `Prompter_RebootPending` field.  

**Custom Field:** `Prompter_RebootPending`  
**Value:** `False`  

![Set Custom Field](../../../static/img/Reboot-Prompter/image_29.png)  

### Row 11c: Function: Set Custom Field

Select Function 'Set Custom Field'. When you select `set custom field`, it will open up a new window.

In this window, search for the `Auto_RebootPendingCheck` field.  

**Custom Field:** `Auto_RebootPendingCheck`  
**Value:** `False`  

![Set Custom Field](../../../static/img/Reboot-Prompter/image_30.png)  

### Row 11e: Function: PowerShell Script

![PowerShell Script](../../../static/img/Reboot-Prompter/image_14.png)  
![PowerShell Script](../../../static/img/Reboot-Prompter/image_31.png)  

Paste in the following PowerShell script and set the expected time of script execution to `300` seconds.

```powershell
$TaskName = 'Reboot Prompter'
$ProjectName = 'Prompter'
$WorkingDirectory = "C:/ProgramData/_automation/app/$ProjectName"
$File = "$workingDirectory/Prompter_Counter.txt"
$TaskCheck = Get-ScheduledTask -TaskName $TaskName -ErrorAction SilentlyContinue

if ($TaskCheck) {
    # Unregister the task
    Unregister-ScheduledTask -TaskName $TaskName -Confirm:$false
}
if (Test-Path -Path "$File") {
    Remove-Item -Path "$File" -Force -Recurse
}
```

### Row 11e: Function: Script Log

![Script Log](../../../static/img/Reboot-Prompter/image_12.png)  

In the script log message, paste `Removed the Task, Counter checker and the machine from the Dynamic group because the agent was restarted during the last attempt. Refer to the custom fields Prompter_UserAction and Prompter_Logging on the endpoint for more details.`  

![Log Message](../../../static/img/Reboot-Prompter/image_32.png)  

### Row 11f: Function: Script Exit

![Script Exit](../../../static/img/Reboot-Prompter/image_33.png)  
![Script Exit](../../../static/img/Reboot-Prompter/image_34.png)  

Leave it blank so that the script exits normally.

### Row 12: Function: Set Pre Defined Variable

![Set Pre Defined Variable](../../../static/img/Reboot-Prompter/image_35.png)  

Click on Custom Field > Choose `RebootForceTimeDelayMinutes`. Then set the variable name as 'RebootForceTimeDelayMinutes'.

![Set Variable](../../../static/img/Reboot-Prompter/image_36.png)  

### Row 13: Function: Set Pre-Defined Variable

![Set Pre Defined Variable](../../../static/img/Reboot-Prompter/image_37.png)  

Click on Custom Field > Choose `RebootPromptCount`. Then set the variable name as 'RebootPromptCount'.

![Set Variable](../../../static/img/Reboot-Prompter/image_38.png)  

### Row 14: Function: Set Pre-Defined Variable

![Set Pre Defined Variable](../../../static/img/Reboot-Prompter/image_39.png)  

Click on Custom Field > Choose `Prompter_Title`. Then set the variable name as 'Prompter_Title'.

![Set Variable](../../../static/img/Reboot-Prompter/image_40.png)  

### Row 15: Function: Set Pre-Defined Variable

![Set Pre Defined Variable](../../../static/img/Reboot-Prompter/image_41.png)  

Click on Custom Field > Choose `Prompter_Timeout`. Then set the variable name as 'Prompter_Timeout'.

![Set Variable](../../../static/img/Reboot-Prompter/image_42.png)  

### Row 16: Function: Set Pre-Defined Variable

![Set Pre Defined Variable](../../../static/img/Reboot-Prompter/image_43.png)  

Click on Custom Field > Choose `Prompter_HeaderImage`. Then set the variable name as 'Prompter_HeaderImage'.

![Set Variable](../../../static/img/Reboot-Prompter/image_44.png)  

### Row 17: Function: Set Pre-Defined Variable

![Set Pre Defined Variable](../../../static/img/Reboot-Prompter/image_45.png)  

Click on Custom Field > Choose `Prompter_Icon`. Then set the variable name as 'Prompter_Icon'.

![Set Variable](../../../static/img/Reboot-Prompter/image_46.png)  

### Row 18: Function: Script Log

![Script Log](../../../static/img/Reboot-Prompter/image_12.png)  

In the script log message, simply type `Creating the Prompter.ps1 file in the working directory for the Prompter exe execution using Task Scheduler.`  

![Log Message](../../../static/img/Reboot-Prompter/image_47.png)  

### Row 19: Function: Create File

![Create File](../../../static/img/Reboot-Prompter/image_48.png)  

Create a file.  
**Path:** `C:/ProgramData/_Automation/app/Prompter/Prompter.ps1`  

![File Path](../../../static/img/Reboot-Prompter/image_49.png)  

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
    $PromptMessage = "Would you like to restart now? If you choose to not reboot at this time you will be prompted $TimePrompted more times before being forced to reboot."
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
    $Message = "Your system has reached its reboot prompt deadline and will now reboot in $proval_RebootForceTimeDelaySeconds Seconds. A reboot is necessary to keep things running smoothly and to fix potential vulnerabilities. Please save all your work to ensure nothing is lost during the reboot. Thank you!"
    $Param = "-m `"$PromptMessage`" -i `"$Icon`" -h `"$HeaderImage`" -t `"$Title`" -b $ButtonType -e $Theme -o $Timeout"
    $Result = cmd.exe /c "$EXEPath $Param"
    $CurrentDate = Get-Date -Format "yyyy-MM-dd hh:mm:ss"
    $Output = "User Action: " + $Result + "`r`n" + "User Action Date Time: " + $CurrentDate
    $Output | Out-File "C:/ProgramData/_Automation/app/Prompter/Prompter_UserAction.txt" -Append
    if ($Result -contains 'Yes') {
        Write-Output "The end user has authorized Restarting computer" | Out-File 'C:/ProgramData/_Automation/app/Prompter/Prompter_Logging.txt' -Append
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

### Row 20: Function: Script Log

![Script Log](../../../static/img/Reboot-Prompter/image_12.png)  

In the script log message, simply type `Checking the status of Prompter file creation in the working directory`

![Log Message](../../../static/img/Reboot-Prompter/image_50.png)  

### Row 21: Function: PowerShell Script

![PowerShell Script](../../../static/img/Reboot-Prompter/image_14.png)  
![PowerShell Script](../../../static/img/Reboot-Prompter/image_51.png)  

Paste in the following PowerShell script and set the expected time of script execution to `300` seconds.

```powershell
$ProjectName = 'Prompter'
$file = "C:/ProgramData/_automation/app/$ProjectName/Prompter.ps1"
if ((Test-Path -Path $file) -eq 'True') {
    Write-Output "$file file created successfully"
} else {
    Write-Output "$file file failed to create"
}
```

### Row 22: Function: Script Log

![Script Log](../../../static/img/Reboot-Prompter/image_12.png)  

In the script log message, simply type `%output%`  

![Log Message](../../../static/img/Reboot-Prompter/image_18.png)  

### Row 23: Logic: If/Then

![Logic If/Then](../../../static/img/Reboot-Prompter/image_19.png)  
![Logic If/Then](../../../static/img/Reboot-Prompter/image_20.png)  

### Row 23a: Condition: Output Contains

In the IF part, enter `file failed to create` in the right box of the "Output Contains" part.

![Condition](../../../static/img/Reboot-Prompter/image_52.png)  

### Row 23b: Function: Script Exit

Add a new row by clicking on the Add row button.

![Add Row](../../../static/img/Reboot-Prompter/image_22.png)  

In the script exit message, simply type `%output%`  

![Exit Message](../../../static/img/Reboot-Prompter/image_53.png)  

### Row 24: Function: PowerShell Script

![PowerShell Script](../../../static/img/Reboot-Prompter/image_14.png)  
![PowerShell Script](../../../static/img/Reboot-Prompter/image_54.png)  

Paste in the following PowerShell script and set the expected time of script execution to `900` seconds.

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

$Action = New-ScheduledTaskAction -Execute 'cmd.exe' -WorkingDirectory $WorkingDirectory -Argument ('/c start /min "" Powershell' + ' -NoLogo -ExecutionPolicy Bypass -NoProfile -NonInteractive -Windowstyle Hidden' + " -File ""$($TaskFile)""")
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

### Row 25: Function: Script Log

In the script log message, simply type `%output%`  

![Log Message](../../../static/img/Reboot-Prompter/image_18.png)  

### Row 26: Logic: If/Then/Else

![Logic If/Then/Else](../../../static/img/Reboot-Prompter/image_55.png)  
![Logic If/Then/Else](../../../static/img/Reboot-Prompter/image_56.png)  

### Row 26a: Condition: Output Contains

In the IF part, enter `Task created successfully` in the right box of the "Output Contains" part.  

![Condition](../../../static/img/Reboot-Prompter/image_57.png)  

### Row 26b: Function: Script Log

Add a new row by clicking on the Add row button.

In the script log message, simply type `%output%`.  

### Row 26c: Function: Script Exit

Add a new row in the else section.  

In the script exit message, simply type `%output%`.  

### Row 27: Complete

Once all items are added, please save the task. The final task should look like the below screenshot.

![Final Task](../../../static/img/Reboot-Prompter/image_58.png)  
![Final Task](../../../static/img/Reboot-Prompter/image_59.png)  
![Final Task](../../../static/img/Reboot-Prompter/image_60.png)  

## Deployment

It is suggested to schedule the Task to the groups [CW RMM - Dynamic Group - Reboot Prompter Deployment - Manual](<../groups/Reboot Prompter Deployment - Manual.md>) and [CW RMM - Dynamic Group - Reboot Prompter Deployment - Auto](<../groups/Reboot Prompter Deployment - Auto.md>) at certain intervals as per client requirements to send prompts at regular intervals.

1. Go to `Automation` > `Tasks`.
2. Search for `Reboot Prompter` Task.
3. Select the concerned task.
4. Click on the `Schedule` button to schedule the task/script.

![Schedule Task](../../../static/img/Reboot-Prompter/image_61.png)  

5. This screen will appear.

![Schedule Screen](../../../static/img/Reboot-Prompter/image_62.png)  

6. Select the relevant time to run the script and click the `Do not repeat` button.

![Select Time](../../../static/img/Reboot-Prompter/image_63.png)  

7. A pop-up box will appear.
8. Suppose the client asked to set the reboot prompt for every 2 hours.
9. Change the number of hours to `2` and click `OK`.

![Set Time](../../../static/img/Reboot-Prompter/image_64.png)  
![Set Time](../../../static/img/Reboot-Prompter/image_65.png)  

10. Search for `Reboot Prompter` in the `Resources*` and select it. You can search and select any relevant group you would like to schedule the task against. If the site doesn't have a device group that includes all Windows agents, then create one and schedule the task on it.

![Search Group](../../../static/img/Reboot-Prompter/image_66.png)  

11. Now click the `Run` button to initiate the task.

![Run Task](../../../static/img/Reboot-Prompter/image_67.png)  

12. The task will start appearing in the Scheduled Tasks.

## Output

Task Log  
Custom Field  



