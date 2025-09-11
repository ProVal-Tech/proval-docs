# Restore-DownloadsFromOneDrive.ps1
# Restores the Downloads folder from OneDrive to its default location and removes changes made by Move-DownloadsToOneDrive.ps1
# Creates a scheduled task to run the restore operation in the user's context for HKCU modifications
# Logs to C:\ProgramData\_Automation\Script\Restore-DownloadsFromOneDrive\Restore-DownloadsFromOneDrive.log

[CmdletBinding()]
param (
    [Parameter(Mandatory = $false, HelpMessage = 'Name of the OneDrive Directory')]
    [string]$OneDriveDirectory
)

#region Global Preferences
$ProgressPreference = 'SilentlyContinue'
$ConfirmPreference = 'None'
#endregion

#region Variables
$projectName = 'Restore-DownloadsFromOneDrive'
$workingDirectory = '{0}\_Automation\Script\{1}' -f $env:ProgramData, $projectName
$scriptPath = '{0}\{1}.ps1' -f $workingDirectory, $projectName
$cmdFilePath = '{0}\{1}.cmd' -f $workingDirectory, $projectName
$vbsFilePath = '{0}\{1}.vbs' -f $workingDirectory, $projectName
$logPath = '{0}\{1}.log' -f $workingDirectory, $projectName
$taskName = 'Scheduled_Task_{0}' -f $projectName
$originalTaskName = 'Scheduled_Task_Move-DownloadsToOneDrive' # Task name from original script
#endregion

#region Working Directory
if (!(Test-Path -Path $workingDirectory)) {
    try {
        New-Item -Path $workingDirectory -ItemType Directory -Force -ErrorAction Stop | Out-Null
    } catch {
        throw "Failed to create working directory '$workingDirectory'. Reason: $($_.Exception.Message)"
    }
}
#endregion

#region Script Content
$scriptContent = @'
# Restore-DownloadsFromOneDrive.ps1 (Inner Script)
# Runs as a scheduled task to restore the Downloads folder
[CmdletBinding()]
param (
    [Parameter(Mandatory = $false, HelpMessage = 'Name of the OneDrive Directory')]
    [string]$OneDriveDirectory
)
begin {
    # Define Global Preferences
    $ProgressPreference = 'SilentlyContinue'
    $ConfirmPreference = 'None'

    # Define Variables
    $projectName = 'Restore-DownloadsFromOneDrive'
    $workingDirectory = '{0}\_Automation\Script\{1}' -f $env:ProgramData, $projectName
    $logPath = '{0}\{1}.log' -f $workingDirectory, $projectName
    $taskName = 'Scheduled_Task_{0}' -f $projectName
    $originalTaskName = 'Scheduled_Task_Move-DownloadsToOneDrive'
    $userProfile = $env:USERPROFILE
    $defaultDownloads = '{0}\Downloads' -f $userProfile

    # Define Write Log Function
    function Write-LogFile {
        param (
            [Parameter(Mandatory = $true, HelpMessage = 'Path to the log file')]
            [string]$LogFilePath,
            [Parameter(Mandatory = $true, HelpMessage = 'Text to log')]
            [string]$Text,
            [Parameter(Mandatory = $false, HelpMessage = 'Log level')]
            [ValidateSet('Information', 'Warning', 'Error')]
            [string]$Level = 'Information'
        )
        $timestamp = (Get-Date).ToString('yyyy-MM-dd HH:mm:ss')
        $logEntry = "$timestamp [$Level] $Text"
        Add-Content -Path $LogFilePath -Value $logEntry -Encoding UTF8 -ErrorAction SilentlyContinue
    }

    # Function to detect OneDrive path
    function Get-OneDrivePath {
        [CmdletBinding()]
        param (
            [Parameter(Mandatory = $false, HelpMessage = 'Name of the OneDrive Directory')]
            [string]$OneDriveDirectory
        )
        # Try user-provided path
        if ($OneDriveDirectory) {
            $oneDrivePath = '{0}\{1}' -f $userProfile, $OneDriveDirectory
            if (Test-Path -Path $oneDrivePath) {
                return $oneDrivePath
            }
        }
        # Try environment variables
        if ($env:OneDrive -and (Test-Path -Path $env:OneDrive)) {
            return $env:OneDrive
        }
        if ($env:OneDriveCommercial -and (Test-Path -Path $env:OneDriveCommercial)) {
            return $env:OneDriveCommercial
        }
        # Try registry for Business OneDrive
        $businessPath = Get-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\OneDrive\Accounts\Business1' -Name 'UserFolder' -ErrorAction SilentlyContinue
        if ($businessPath -and (Test-Path $businessPath.UserFolder)) {
            return $businessPath.UserFolder
        }
        # Try registry for Personal OneDrive
        $personalPath = Get-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\OneDrive\Accounts\Personal' -Name 'UserFolder' -ErrorAction SilentlyContinue
        if ($personalPath -and (Test-Path $personalPath.UserFolder)) {
            return $personalPath.UserFolder
        }
        # Try common OneDrive locations
        $commonPaths = @(
            ('{0}\OneDrive' -f $userProfile),
            ('{0}\OneDrive - *' -f $userProfile)
        )
        foreach ($path in $commonPaths) {
            if (Test-Path -Path $path) {
                return (Get-Item -Path $path).FullName
            }
        }
        return $null
    }

    Write-LogFile -Text '=== Restore Downloads folder start ===' -LogFilePath $logPath -Level Information

    # Get OneDrive path
    $oneDrivePath = if ($OneDriveDirectory) {
        Get-OneDrivePath -OneDriveDirectory $OneDriveDirectory
    } else {
        Get-OneDrivePath
    }
}
process {
    # Validate OneDrive path
    if (!$oneDrivePath) {
        Write-LogFile -Text 'OneDrive path not found' -LogFilePath $logPath -Level Error
        throw 'OneDrive path not found'
    }
    $oneDriveDownloads = '{0}\Downloads' -f $oneDrivePath
    Write-LogFile -Text "OneDrive Path: $oneDrivePath" -LogFilePath $logPath -Level Information
    Write-LogFile -Text "OneDrive Downloads Path: $oneDriveDownloads" -LogFilePath $logPath -Level Information
    Write-LogFile -Text "Default Downloads Path: $defaultDownloads" -LogFilePath $logPath -Level Information

    # Check if Downloads is currently redirected to OneDrive
    $userShellFolders = 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders'
    $currentDownloadsPath = (Get-ItemProperty -Path $userShellFolders -Name '{374DE290-123F-4565-9164-39C4925E467B}' -ErrorAction SilentlyContinue).'{374DE290-123F-4565-9164-39C4925E467B}'
    if ($currentDownloadsPath -like "*$oneDrivePath*") {
        Write-LogFile -Text "Downloads folder is currently redirected to: $currentDownloadsPath" -LogFilePath $logPath -Level Information
    } else {
        Write-LogFile -Text "Downloads folder is not redirected to OneDrive. Current path: $currentDownloadsPath" -LogFilePath $logPath -Level Warning
    }

    # Move files from OneDrive Downloads to default Downloads
    if (Test-Path -Path $oneDriveDownloads) {
        if (!(Test-Path -Path $defaultDownloads)) {
            try {
                New-Item -Path $defaultDownloads -ItemType Directory -Force -ErrorAction Stop | Out-Null
                Write-LogFile -Text "Created default Downloads folder: $defaultDownloads" -LogFilePath $logPath -Level Information
            } catch {
                Write-LogFile -Text "Failed to create default Downloads folder: $($_.Exception.Message)" -LogFilePath $logPath -Level Error
                throw "Failed to create default Downloads folder: $($_.Exception.Message)"
            }
        }

        $itemsToMove = Get-ChildItem -Path $oneDriveDownloads -Force -ErrorAction SilentlyContinue
        if ($itemsToMove) {
            Write-LogFile -Text 'Moving files from OneDrive Downloads to default Downloads...' -LogFilePath $logPath -Level Information
            foreach ($item in $itemsToMove) {
                try {
                    $destinationPath = '{0}\{1}' -f $defaultDownloads, $item.Name
                    if ($item.PSIsContainer) {
                        Copy-Item -Path $item.FullName -Destination $destinationPath -Recurse -Force -ErrorAction Stop
                    } else {
                        Copy-Item -Path $item.FullName -Destination $destinationPath -Force -ErrorAction Stop
                    }
                    Write-LogFile -Text "Moved: $($item.Name)" -LogFilePath $logPath -Level Information
                } catch {
                    Write-LogFile -Text "Failed to move: $($item.Name). Reason: $($_.Exception.Message)" -LogFilePath $logPath -Level Error
                }
            }
            Write-LogFile -Text 'File movement completed.' -LogFilePath $logPath -Level Information
        } else {
            Write-LogFile -Text 'No files found in OneDrive Downloads folder.' -LogFilePath $logPath -Level Information
        }
    } else {
        Write-LogFile -Text "OneDrive Downloads folder not found: $oneDriveDownloads" -LogFilePath $logPath -Level Warning
    }

    # Restore Downloads folder registry entry
    try {
        if (!(Test-Path -Path $userShellFolders)) {
            New-Item -Path $userShellFolders -Force -ErrorAction Stop | Out-Null
            Write-LogFile -Text "Created registry path for User Shell Folders: $userShellFolders" -LogFilePath $logPath -Level Information
        }
        Set-ItemProperty -Path $userShellFolders -Name '{374DE290-123F-4565-9164-39C4925E467B}' -Value $defaultDownloads -ErrorAction Stop
        Write-LogFile -Text "Downloads folder restored to: $defaultDownloads" -LogFilePath $logPath -Level Information
    } catch {
        Write-LogFile -Text "Failed to restore Downloads folder registry entry. Reason: $($_.Exception.Message)" -LogFilePath $logPath -Level Error
        throw "Failed to restore Downloads folder registry entry: $($_.Exception.Message)"
    }

    # Remove OneDrive sync exclusions
    $extensionsToExclude = @('exe', 'dll', 'tmp', 'iso', 'msi')
    $oneDriveExclusionRegistryPaths = @(
        'HKLM:\SOFTWARE\Policies\Microsoft\OneDrive\EnableODIgnoreListFromGPO',
        'HKCU:\SOFTWARE\Policies\Microsoft\OneDrive\EnableODIgnoreListFromGPO'
    )
    foreach ($registryPath in $oneDriveExclusionRegistryPaths) {
        if (Test-Path -Path $registryPath) {
            foreach ($ext in $extensionsToExclude) {
                $extPattern = "*.$ext"
                try {
                    Remove-ItemProperty -Path $registryPath -Name $extPattern -ErrorAction SilentlyContinue
                    Write-LogFile -Text "Removed OneDrive exclusion for: $extPattern" -LogFilePath $logPath -Level Information
                } catch {
                    Write-LogFile -Text "Failed to remove OneDrive exclusion for: $extPattern. Reason: $($_.Exception.Message)" -LogFilePath $logPath -Level Error
                }
            }
        }
    }

    # Restart Explorer to apply changes
    try {
        Write-LogFile -Text 'Restarting Explorer to apply changes...' -LogFilePath $logPath -Level Information
        Stop-Process -Name 'Explorer' -Force -ErrorAction Stop
        Start-Sleep -Seconds 2
        Start-Process -FilePath 'C:\Windows\Explorer.exe' -ErrorAction Stop
        Write-LogFile -Text 'Explorer restarted successfully.' -LogFilePath $logPath -Level Information
    } catch {
        Write-LogFile -Text "Failed to restart Explorer. Reason: $($_.Exception.Message)" -LogFilePath $logPath -Level Error
        Write-LogFile -Text 'Please restart Explorer manually or log off/on for changes to take effect.' -LogFilePath $logPath -Level Warning
    }
}
end {
    # Remove the original scheduled task
    try {
        $task = Get-ScheduledTask -TaskName $originalTaskName -ErrorAction SilentlyContinue
        if ($task) {
            Unregister-ScheduledTask -TaskName $originalTaskName -Confirm:$false -ErrorAction Stop
            Write-LogFile -Text "Removed original scheduled task: $originalTaskName" -LogFilePath $logPath -Level Information
        } else {
            Write-LogFile -Text "Original scheduled task '$originalTaskName' not found." -LogFilePath $logPath -Level Information
        }
    } catch {
        Write-LogFile -Text "Failed to remove original scheduled task '$originalTaskName'. Reason: $($_.Exception.Message)" -LogFilePath $logPath -Level Error
    }

    # Remove this script's scheduled task
    try {
        $task = Get-ScheduledTask -TaskName $taskName -ErrorAction SilentlyContinue
        if ($task) {
            Unregister-ScheduledTask -TaskName $taskName -Confirm:$false -ErrorAction Stop
            Write-LogFile -Text "Removed scheduled task: $taskName" -LogFilePath $logPath -Level Information
        }
    } catch {
        Write-LogFile -Text "Failed to remove scheduled task '$taskName'. Reason: $($_.Exception.Message)" -LogFilePath $logPath -Level Error
    }

    Write-LogFile -Text '=== Restore Downloads folder end ===' -LogFilePath $logPath -Level Information
}
'@
#endregion

#region CMD File Content
$cmdFileContent = if ($OneDriveDirectory) {
    'C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -ExecutionPolicy Bypass -Command "& {0} -OneDriveDirectory ''{1}''"' -f $scriptPath, $OneDriveDirectory
} else {
    'C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -ExecutionPolicy Bypass -Command "& {0}"' -f $scriptPath
}
#endregion

#region VBS File Content
$vbsFileContent = 'CreateObject("Wscript.Shell").Run """" & WScript.Arguments(0) & """", 0, False'
#endregion

#region Write Script Files
$utf8NoBomEncoding = New-Object System.Text.UTF8Encoding $false
try {
    [System.IO.File]::WriteAllText($scriptPath, $scriptContent, $utf8NoBomEncoding)
    [System.IO.File]::WriteAllText($cmdFilePath, $cmdFileContent, $utf8NoBomEncoding)
    [System.IO.File]::WriteAllText($vbsFilePath, $vbsFileContent, $utf8NoBomEncoding)
} catch {
    throw "Failed to write script file. Reason: $($_.Exception.Message)"
}
#endregion

#region Scheduled Task Creation
try {
    $action = New-ScheduledTaskAction -Execute 'wscript.exe' -WorkingDirectory $workingDirectory -Argument "$vbsFilePath $cmdFilePath"
    $trigger = New-ScheduledTaskTrigger -Once -At (Get-Date).AddSeconds(15)
    $setting = New-ScheduledTaskSettingsSet -AllowStartIfOnBatteries
    $principal = New-ScheduledTaskPrincipal -GroupId ((New-Object System.Security.Principal.SecurityIdentifier('S-1-5-32-545')).Translate([System.Security.Principal.NTAccount]).Value) -RunLevel Highest
    $scheduledTask = New-ScheduledTask -Action $action -Trigger $trigger -Settings $setting -Principal $principal
    Register-ScheduledTask -TaskName $taskName -InputObject $scheduledTask -ErrorAction Stop | Out-Null
    Write-Information "Successfully created the scheduled task '$taskName'" -InformationAction Continue
} catch {
    throw "Failed to schedule the task. Reason: $($_.Exception.Message)"
}
#endregion

#region Confirm Scheduled Task Execution
Start-Sleep -Seconds 20
$taskRunTime = (Get-ScheduledTask -TaskName $taskName -ErrorAction SilentlyContinue | Get-ScheduledTaskInfo -ErrorAction SilentlyContinue).LastRunTime
if ($taskRunTime) {
    Write-Information "Task initiated at: $taskRunTime" -InformationAction Continue
} else {
    Write-Information 'Initiating the task' -InformationAction Continue
    Start-ScheduledTask -TaskName $taskName -ErrorAction SilentlyContinue
}
#endregion

#region Validation
$timeout = 1800
$slept = 0
$taskInfo = Get-ScheduledTask -TaskName $taskName -ErrorAction SilentlyContinue
do {
    $taskInfo = Get-ScheduledTask -TaskName $taskName -ErrorAction SilentlyContinue
    $slept += 5
    Start-Sleep -Seconds 5
} until (!$taskInfo -or $slept -ge $timeout)
$logContent = Get-Content -Path $logPath -ErrorAction SilentlyContinue
if ($slept -ge $timeout) {
    return @"
Script is running for more than 30 minutes.
Log file path: $logPath
Current log file content: $($logContent | Out-String)
"@
} else {
    return @"
Script Completed.
Log File Path: $logPath
Log file content: $($logContent | Out-String)
"@
}
#endregion