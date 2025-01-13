---
id: 'rmm-install-windows-11-upgrade'
title: 'Install Windows 11 Upgrade'
title_meta: 'Install Windows 11 Upgrade'
keywords: ['windows', 'upgrade', 'installation', 'script', 'update']
description: 'This document outlines a PowerShell script designed to facilitate the upgrade of a Windows 10 computer to Windows 11 using the Windows update agent. It includes implementation details, sample runs, and necessary checks for compatibility and system health before proceeding with the upgrade process.'
tags: ['windows', 'upgrade', 'installation', 'script', 'update']
draft: false
unlisted: false
---
## Summary

The purpose of this script is to facilitate the upgrade of a Windows 10 computer to Windows 11. The process will be managed through the [Windows update agent](https://go.microsoft.com/fwlink/?linkid=2171764), which will handle the necessary steps to complete the upgrade. It's important to note that the upgrade may require multiple restarts of the computer. Due to the potential for multiple restarts and the time-consuming nature of the upgrade, it's advisable to avoid scheduling the script during working hours unless scheduled restarts are anticipated. The entire upgrade process is anticipated to take more than 2 hours to complete.

**Note:** The PowerShell script used by the task will only attempt to upgrade the Windows 11 compatible computers. The compatibility check is performed by Microsoft's [Hardware Readiness Check script](https://download.microsoft.com/download/e/1/e/e1e682c2-a2ee-46c7-ad1e-d0e38714a795/HardwareReadiness.ps1).

## Sample Run

![Sample Run 1](..\..\..\static\img\Install-Windows-11\image_24.png)  
![Sample Run 2](..\..\..\static\img\Install-Windows-11\image_25.png)  

## Variables

| Name | Description |
|------|-------------|
| os   | Operating System of the endpoint |

## Implementation

### Create Script

Create a new `Script Editor` style script in the system to implement this Task.

![Create Script](..\..\..\static\img\Install-Windows-11\image_26.png)  
![Script Editor](..\..\..\static\img\Install-Windows-11\image_27.png)  

**Name:** Install Windows 11  
**Description:** This script facilitates a Windows 10 to Windows 11 upgrade utilizing a Windows update agent. The process may involve multiple computer restarts and is estimated to span up to 2 hours.  
**Category:** Patching  

### Script

Start by adding a row. You can do this by clicking the "Add Row" button at the bottom of the script page.

![Add Row](..\..\..\static\img\Install-Windows-11\image_28.png)  

#### Row 1 Function: Set Pre-defined Variable

Select `Set Pre-defined Variable` Function.  
![Set Pre-defined Variable](..\..\..\static\img\Install-Windows-11\image_29.png)  
![Set Variable](..\..\..\static\img\Install-Windows-11\image_30.png)  

Set `os` for both `Variable Name`.  

A dropdown menu will appear after clicking the `System Variable` text box.  
![System Variable Dropdown](..\..\..\static\img\Install-Windows-11\image_31.png)  

Click the dropdown menu and scroll down till you find the `Os` menu.  
![Select Os](..\..\..\static\img\Install-Windows-11\image_32.png)  

Click the `Os` menu dropdown button and scroll down till you find the `Product` option. Select the Product option and click the Save button to save the variable.  
![Select Product](..\..\..\static\img\Install-Windows-11\image_33.png)  
![Save Variable](..\..\..\static\img\Install-Windows-11\image_34.png)  

#### Row 2 Logic: If Then

Add an `If/Then` logic by clicking on the `Add Logic` button.  
![Add Logic](..\..\..\static\img\Install-Windows-11\image_35.png)  
![If Then Logic](..\..\..\static\img\Install-Windows-11\image_36.png)  

##### Row 2a Condition: Value Does Not Contain

Click the dropdown at the `output` button, select `Value` and choose the `Does Not Contain` operator.  
![Value Does Not Contain](..\..\..\static\img\Install-Windows-11\image_37.png)  

Enter `@os@` in the left box and `Windows 10` in the right box.  
![Input Condition](..\..\..\static\img\Install-Windows-11\image_38.png)  

##### Row 2b Function: Script Exit

Add a new row by clicking on the Add row button.  
![Add Row for Script Exit](..\..\..\static\img\Install-Windows-11\image_39.png)  

Select `Script Exit Function`.  
![Script Exit Function](..\..\..\static\img\Install-Windows-11\image_40.png)  

This `Error Message` field will appear after Selecting the `Script Exit` Function.  
![Error Message Field](..\..\..\static\img\Install-Windows-11\image_41.png)  

Enter the `"The script is only compatible with Windows 10 machines."` message in the `Error Message field` and click on the `Save` button.  
![Save Error Message](..\..\..\static\img\Install-Windows-11\image_42.png)  
![Confirmation](..\..\..\static\img\Install-Windows-11\image_43.png)  

#### Row 3 function: Script Log

Add a new row by clicking on the Add row button.  
![Add Row for Script Log](..\..\..\static\img\Install-Windows-11\image_44.png)  

Select `Script Log Function`.  
![Script Log Function](..\..\..\static\img\Install-Windows-11\image_45.png)  

In the `Script Log Message` field, simply type this message and click on the `Save` button.  
`"Windows 10 computer detected initiating the upgrade. The computer can be restarted multiple times during the upgrade process."`  
![Script Log Message](..\..\..\static\img\Install-Windows-11\image_46.png)  
![Confirmation](..\..\..\static\img\Install-Windows-11\image_47.png)  

#### Row 4 Function: PowerShell Script

Add a new row by clicking on the Add row button.  
![Add Row for PowerShell Script](..\..\..\static\img\Install-Windows-11\image_44.png)  

Select `PowerShell Script Function`.  
![PowerShell Script Function](..\..\..\static\img\Install-Windows-11\image_48.png)  

The `PowerShell Script Editor` will appear on Selecting the `PowerShell Script` Function.  
![PowerShell Script Editor](..\..\..\static\img\Install-Windows-11\image_49.png)  

Paste in the following `PowerShell script`, set the expected time of script execution to `7200` seconds and click on the `Save` button.

```powershell
#requires -RunAsAdministrator
#requires -Version 5

[Net.ServicePointManager]::SecurityProtocol = [enum]::ToObject([Net.SecurityProtocolType], 3072)

#region Constants
$LATEST_INSTALLATION_ASSISTANT_URI = 'https://go.microsoft.com/fwlink/?linkid=2171764'
$SETUP_DIAG_URI = 'https://go.microsoft.com/fwlink/?linkid=870142'
$UPDATER_ARGUMENTS = @('/QuietInstall', '/SkipEULA', '/NoRestartUI', '/AlwaysOverride', '/SkipCompatCheck')
$UPDATER_STARTUP_WAIT_SECONDS = 120
#endregion

Write-Information "`nUPGRADE_ASSISTANT_URI: $LATEST_INSTALLATION_ASSISTANT_URI" -InformationAction Continue
Write-Information "`nUPDATER_ARGUMENTS: $UPDATER_ARGUMENTS" -InformationAction Continue
Write-Information "`nUPDATER_STARTUP_WAIT_SECONDS: $UPDATER_STARTUP_WAIT_SECONDS" -InformationAction Continue
Write-Information @"
`nIf any errors are detected the following Microsoft article can be used for general troubleshooting:
https://learn.microsoft.com/en-us/windows/deployment/upgrade/resolve-windows-10-upgrade-errors
"@ -InformationAction Continue

Write-Information "`nBeginning pre-install validations." -InformationAction Continue

Function CompatibilityCheck {
    $DownloadUrl = 'https://download.microsoft.com/download/e/1/e/e1e682c2-a2ee-46c7-ad1e-d0e38714a795/HardwareReadiness.ps1'
    $ScriptPath = "$Env:Temp\HardwareReadiness.ps1"
    Invoke-WebRequest -Uri $DownloadUrl -UseBasicParsing -OutFile $ScriptPath
    if (!(Test-Path -Path $ScriptPath)) {
        return "`nAn error occurred and the script was unable to be downloaded. Exiting."
    }
    $ReadinessCheck = & $ScriptPath
    return $ReadinessCheck
}

$majorVersion = [System.Environment]::OSVersion.Version.Major
$buildVersion = [System.Environment]::OSVersion.Version.Build
Write-Information "`nBuild version: $buildVersion" -InformationAction Continue

$ReadinessCheck = CompatibilityCheck
if ($ReadinessCheck -match 'NOT CAPABLE') {
    return @"
`n $Env:ComputerName is incompatible with windows 11 upgrade.
Result returned by Compatibility check script:
$ReadinessCheck
Minimum system requirements: https://www.microsoft.com/en-in/windows/windows-11-specifications
"@
}

# Check volume health
$volumeHealth = Repair-Volume -DriveLetter $env:SystemDrive[0] -Scan
if ($volumeHealth -ne 'NoErrorsFound') {
    return @"
`nThe volume health check returned a negative result: $volumeHealth
Consider scheduling a 'chkdsk /f' on the system drive '$env:SystemDrive' before attempting another upgrade.
For more information: https://learn.microsoft.com/en-us/troubleshoot/windows-client/deployment/windows-10-upgrade-quick-fixes?toc=%2Fwindows%2Fdeployment%2Ftoc.json&bc=%2Fwindows%2Fdeployment%2Fbreadcrumb%2Ftoc.json#repair-the-system-drive
"@
}

# Check Windows Update health
$wudTroubleshootingPath = "$env:temp\WUDResult"
Get-TroubleshootingPack -Path "$env:windir\Diagnostics\system\WindowsUpdate" | Invoke-TroubleshootingPack -Unattended -Result $wudTroubleshootingPath
[xml]$wudResult = Get-Content -Path "$wudTroubleshootingPath\ResultReport.xml"
if ($wudResultDetection = $wudResult.ResultReport.Package.Problem.DetectionInformation.DetailedInformation.Detail.Name | Where-Object { $_ -match 'RC_PendingRestart|RC_DataStore|RC_GENWUError|RC_DateTime' }) {
    $wudResultExplanation = ($wudResult.ResultReport.Package.Problem.RootCauseInformation.RootCause | Where-Object { $_.id -match $wudResultDetection }).ResolutionInformation.Resolution.Data.InnerText[0]
    return @"
`nThe Windows Update health check returned a negative result: $wudResultDetection.
Provided explanation: $wudResultExplanation
For a possible fix, consider running 'DISM.exe /Online /Cleanup-image /Restorehealth' before attempting another upgrade, or follow the explanation above, if applicable
For more information: https://learn.microsoft.com/en-us/troubleshoot/windows-client/deployment/windows-10-upgrade-quick-fixes?toc=%2Fwindows%2Fdeployment%2Ftoc.json&bc=%2Fwindows%2Fdeployment%2Fbreadcrumb%2Ftoc.json#windows-update-troubleshooter
"@
}

# Check disk space
$systemVolume = Get-Volume -DriveLetter $env:SystemDrive[0]
if ($systemVolume.SizeRemaining -le 20GB) {
    return @"
`nThe Drive Space health check failed. The drive must have 20GB of free space to perform a Feature Update.
Current available space on $($env:SystemDrive[0]): $([math]::round($systemVolume.SizeRemaining / 1GB, 2))
For more information: https://learn.microsoft.com/en-us/troubleshoot/windows-client/deployment/windows-10-upgrade-quick-fixes?toc=%2Fwindows%2Fdeployment%2Ftoc.json&bc=%2Fwindows%2Fdeployment%2Fbreadcrumb%2Ftoc.json#verify-disk-space
"@
}

Write-Information "`nAll pre-installation checks passed. Beginning installation process." -InformationAction Continue

$targetDownloadUri = $LATEST_INSTALLATION_ASSISTANT_URI
Write-Information "`nWindows $majorVersion build number $buildVersion detected." -InformationAction Continue
Write-Information "`nTarget Download URI: $targetDownloadUri." -InformationAction Continue

$targetAssistantApp = Join-Path -Path $env:TEMP -ChildPath 'WinInstallAssistant.exe'
Write-Information "`nTarget Download Path: $targetAssistantApp." -InformationAction Continue

try {
    Get-WebFile -Uri $targetDownloadUri -Path $targetAssistantApp -Clobber
} catch {
    return "`nFailed to download $targetDownloadUri.Reason: $($Error[0].Exception.Message)"
}

$installAssistantLogPath = Join-Path -Path ${env:ProgramFiles(x86)} -ChildPath 'WindowsInstallationAssistant\Logs'
Write-Information "`nInstall Assistant Log Path: $installAssistantLogPath" -InformationAction Continue
Write-Information "`nRemoving old WUA logs." -InformationAction Continue
Remove-Item -Path $installAssistantLogPath -Recurse -Force -ErrorAction SilentlyContinue
Write-Information "`nStarting Windows $majorVersion upgrade process." -InformationAction Continue

$updaterProcess = Start-Process -FilePath $targetAssistantApp -ArgumentList $UPDATER_ARGUMENTS -PassThru
Start-Sleep -Seconds $UPDATER_STARTUP_WAIT_SECONDS

if ($upgraderProcess = Get-Process -Name 'Windows*UpgraderApp') {
    Write-Information "`n$($upgraderProcess.Name) process detected." -InformationAction Continue
} else {
    Write-Information "`n$($upgraderProcess.Name) process not yet detected." -InformationAction Continue
}

if (!(Test-Path "$installAssistantLogPath\UpdateAssistantDwnldr.001.etl")) {
    Write-Information "`nThe Upgrade Assistant has not progressed within $UPDATER_STARTUP_WAIT_SECONDS seconds. Skipping to running setup diagnostics." -InformationAction Continue
    if (!$updaterProcess.HasExited -or ($upgraderProcess -and !$upgraderProcess.HasExited)) {
        Write-Information "`nThe Upgrade Assistant is still running. Attempting stop." -InformationAction Continue
        $updaterProcess | Stop-Process
        $upgraderProcess | Stop-Process
    }
    if (!$updaterProcess.HasExited -or ($upgraderProcess -and !$upgraderProcess.HasExited)) {
        Write-Information "`nThe Upgrade Assistant is still running. Attempting forced stop." -InformationAction Continue
        $updaterProcess | Stop-Process -Force
        $upgraderProcess | Stop-Process -Force
    }
    if (!$updaterProcess.HasExited -or ($upgraderProcess -and !$upgraderProcess.HasExited)) {
        Write-Information "`nThe Upgrade Assistant is still running after attempting a forced stop. Results may be incomplete or inaccurate." -InformationAction Continue
    }
} else {
    Write-Information "`nThe Upgrade Assistant is now attempting the upgrade process. Awaiting completion." -InformationAction Continue
    Write-Information "`nStarting shutdown cancellation job." -InformationAction Continue
    $cancelShutdownJob = Start-Job -Name CancelShutdown -ScriptBlock {
        # Cancel the shutdown twice in case there is a pending shutdown and then to set the $LASTEXITCODE to a non-zero value.
        & shutdown.exe /a 2>$null
        & shutdown.exe /a 2>$null
        # Attempt to cancel a shutdown every 100ms until successful.
        while ($LASTEXITCODE -ne 0) {
            & shutdown.exe /a 2>$null
            Start-Sleep -Milliseconds 100
        }
    }
    $updaterProcess.WaitForExit()
    Write-Information "`nThe parent updater has exited with code $($updaterProcess.ExitCode). Awaiting child upgrader to complete." -InformationAction Continue
    $upgraderProcess.WaitForExit()
    Write-Information "`nThe child upgrader has exited with code $($upgraderProcess.ExitCode). Awaiting shutdown cancellation." -InformationAction Continue
    if ($cancelShutdownJob.JobStateInfo.State -ne [System.Management.Automation.JobState]::Completed) {
        Start-Sleep -Seconds 60
    }
    if ($cancelShutdownJob.JobStateInfo.State -ne [System.Management.Automation.JobState]::Completed) {
        Write-Information "`nShutdown cancellation job has not exited in a timely manner. The update/upgrade process may have failed. Forcing the shutdown cancellation job to stop." -InformationAction Continue
        $cancelShutdownJob.StopJob()
    }
    $cancelShutdownJob | Receive-Job -Wait | Out-Null
    Write-Information "`nShutdown cancellation complete." -InformationAction Continue
}

Write-Information "`nWaiting for the associated processes to finish." -InformationAction Continue
Start-Sleep -Seconds 300

Write-Information "`nBeginning setup diagnostics." -InformationAction Continue
$setupDiagPath = "$env:SystemDrive\$Windows.~bt\Sources\SetupDiag.exe"
$setupDiagJsonPath = "$env:temp\SetupDiagResult.json"
if (!(Test-Path -Path $setupDiagPath)) {
    $setupDiagPath = "$env:temp\SetupDiag.exe"
    try {
        Get-WebFile -Uri $SETUP_DIAG_URI -Path $setupDiagPath -Clobber
    } catch {
        return "`nUnable to locate a local copy of SetupDiag.exe, and the download failed. Please manually review logs by downloading and running SetupDiag.exe from the following URI: $SETUP_DIAG_URI"
    }
}
Remove-Item -Path $setupDiagJsonPath -ErrorAction SilentlyContinue
$setupDiagOutput = & $setupDiagPath /Format:JSON /Output:$setupDiagJsonPath /ZipLogs:False
Write-Information ($setupDiagOutput -join "`n") -InformationAction Continue -Verbose
if (!(Test-Path -Path $setupDiagJsonPath) -and $Reboot) {
    return @"
`nSetupDiag either failed to execute or found no relevant log files.
This suggests a catastrophic failure of the installation process of the Update/Upgrade, as it was likely prematurely forced to stop.
For a general troubleshooting guide, please see the following article: https://learn.microsoft.com/en-us/windows/deployment/upgrade/resolve-windows-10-upgrade-errors
"@
}

$setupDiagObject = Get-Content -Path $setupDiagJsonPath | ConvertFrom-Json
$setupDiagObject | Write-StoredObject -TableName setupdiag
switch ($setupDiagObject.ProfileName) {
    'No Match Found' {
        Write-Information @"
`nSetupDiag did not find any matching error profiles after the attempted upgrade installation.
This suggests a successful pre-reboot installation of the feature update.
A reboot should be performed as soon as possible to complete the process.
"@ -InformationAction Continue
    }
    'FindSuccessfulUpgrade' {
        Write-Information @"
`nSetupDiag detected that a previous successful upgrade was performed.
This suggests that new logs were not written, and that this upgrade was attempted on an already up-to-date system.
"@ -InformationAction Continue
        return
    }
    Default {
        return @"
`nThe following error profile was detected after the attempted install:
Failure Profile: $($setupDiagObject.ProfileName)
Failure Data: $($setupDiagObject.FailureData.Trim())
Failure Details: $($setupDiagObject.FailureDetails)
Further information about these profiles can be found here: https://learn.microsoft.com/en-us/windows/deployment/upgrade/setupdiag#rules
"@
    }
}

$setupDiagObject

Write-Information "`nBeginning restart of system." -InformationAction Continue
Restart-Computer -Force
```

![Final Script](..\..\..\static\img\Install-Windows-11\image_50.png)  
![Final Confirmation](..\..\..\static\img\Install-Windows-11\image_51.png)  

### Row 5 function: Script Log

Add a new row by clicking on the Add row button.  
![Add Row for Script Log](..\..\..\static\img\Install-Windows-11\image_44.png)  

Select `Script Log Function`.  
![Script Log Function](..\..\..\static\img\Install-Windows-11\image_45.png)  

In the `Script Log Message` field, simply type '%output%' so that the script will send the results of the PowerShell script above to the output on the Automation tab for the target device and click on the `Save` button.  
![Output Log Message](..\..\..\static\img\Install-Windows-11\image_52.png)  
![Confirmation](..\..\..\static\img\Install-Windows-11\image_47.png)  

### Row 6 Function: PowerShell Script

Add a new row by clicking on the Add row button.  
![Add Row for PowerShell Script](..\..\..\static\img\Install-Windows-11\image_44.png)  

Select `PowerShell Script Function`.  
![PowerShell Script Function](..\..\..\static\img\Install-Windows-11\image_48.png)  

The `PowerShell Script Editor` will appear on Selecting the `PowerShell Script` Function.  
![PowerShell Script Editor](..\..\..\static\img\Install-Windows-11\image_49.png)  

Paste in the following `PowerShell command`, set the expected time of script execution to `305` seconds and click on the `Save` button. We are simply pausing the script here for `5` minutes to give RMM enough time to fetch the computer's information post-reboot.

```powershell
Start-Sleep -Seconds 300
```

![Pause Command](..\..\..\static\img\Install-Windows-11\image_53.png)  
![Confirmation](..\..\..\static\img\Install-Windows-11\image_51.png)  

### Row 7 Function: Set Pre-defined Variable

Add a new row by clicking on the Add row button.  
![Add Row for Pre-defined Variable](..\..\..\static\img\Install-Windows-11\image_44.png)  

Select `Set Pre-defined Variable Function`.  
![Set Pre-defined Variable Function](..\..\..\static\img\Install-Windows-11\image_29.png)  
![Set Variable](..\..\..\static\img\Install-Windows-11\image_30.png)  

Set `os` for both `Variable Name`.  

A dropdown menu will appear after clicking the `System Variable` text box.  
![System Variable Dropdown](..\..\..\static\img\Install-Windows-11\image_31.png)  

Click the dropdown menu and scroll down till you find the `Os` menu.  
![Select Os](..\..\..\static\img\Install-Windows-11\image_32.png)  

Click the `Os` menu dropdown button and scroll down till you find the `Product` option. Select the Product option and click the Save button to save the variable.  
![Select Product](..\..\..\static\img\Install-Windows-11\image_33.png)  
![Save Variable](..\..\..\static\img\Install-Windows-11\image_34.png)  

### Row 8 Logic: If Then

Add an `If/Then` logic by clicking on the `Add Logic` button.  
![Add Logic](..\..\..\static\img\Install-Windows-11\image_35.png)  
![If Then Logic](..\..\..\static\img\Install-Windows-11\image_36.png)  

#### Row 8a Condition: Value Does Not Contain

Click the dropdown at the `output` button, select `Value` and choose the `Does Not Contain` operator.  
![Value Does Not Contain](..\..\..\static\img\Install-Windows-11\image_37.png)  

Enter `@os@` in the left box and `Windows 11` in the right box.  
![Input Condition](..\..\..\static\img\Install-Windows-11\image_54.png)  

#### Row 8b Function: Script Exit

Add a new row by clicking on the Add row button.  
![Add Row for Script Exit](..\..\..\static\img\Install-Windows-11\image_39.png)  

Select `Script Exit Function`.  
![Script Exit Function](..\..\..\static\img\Install-Windows-11\image_40.png)  

This `Error Message` field will appear after Selecting the `Script Exit` Function.  
![Error Message Field](..\..\..\static\img\Install-Windows-11\image_41.png)  

Enter the `"Script failed to upgrade the machine to windows 11."` message in the `Error Message field` and click on the `Save` button.  
![Save Error Message](..\..\..\static\img\Install-Windows-11\image_55.png)  
![Confirmation](..\..\..\static\img\Install-Windows-11\image_56.png)  

### Row 9 function: Script Log

Add a new row by clicking on the Add row button.  
![Add Row for Script Log](..\..\..\static\img\Install-Windows-11\image_44.png)  

Select `Script Log Function`.  
![Script Log Function](..\..\..\static\img\Install-Windows-11\image_45.png)  

In the `Script Log Message` field, simply type this message and click on the `Save` button.  
`"Successfully upgraded the computer to Windows 11."`  
![Script Log Message](..\..\..\static\img\Install-Windows-11\image_57.png)  
![Confirmation](..\..\..\static\img\Install-Windows-11\image_47.png)  

Once all items are added, please `save` the task by clicking the `Save` button.  
![Save Task](..\..\..\static\img\Install-Windows-11\image_58.png)  

The final task should look like the below screenshot.  
![Final Task](..\..\..\static\img\Install-Windows-11\image_59.png)  

## Output

- Script logs  
![Script Logs](..\..\..\static\img\Install-Windows-11\image_60.png)  
(**This output is from an Incompatible Windows 10 computer.)**



