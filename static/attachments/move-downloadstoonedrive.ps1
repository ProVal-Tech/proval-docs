#Redirects the "Downloads" folder to the OneDrive download folder. 
#This always pulls and sync the data from the "Downloads" folder to the OneDrive's Download folder.



#region Parameters
[CmdletBinding()]
param (
    [Parameter(Mandatory = $false, HelpMessage = 'Name of the OneDrive Directory')]
    [string]$OneDriveDirectory
)

#region Globals
$ProgressPreference = 'SilentlyContinue'
$ConfirmPreference = 'None'
#endRegion

#region Variables
$projectName = 'Move-DownloadsToOneDrive'
$workingDirectory = '{0}\_Automation\Script\{1}' -f $env:ProgramData, $projectName
$scriptPath = '{0}\{1}.ps1' -f $workingDirectory, $projectName
$cmdFilePath = '{0}\{1}.cmd' -f $workingDirectory, $projectName
$vbsFilePath = '{0}\{1}.vbs' -f $workingDirectory, $projectName
$logPath = '{0}\{1}.log' -f $workingDirectory, $projectName
$taskName = 'Scheduled_Task_{0}' -f $projectName
#endRegion

#region Working Directory
if (!(Test-Path -Path $workingDirectory)) {
    try {
        New-Item -Path $workingDirectory -ItemType Directory -Force -ErrorAction Stop | Out-Null
    } catch {
        throw 'Failed to Create ''{0}''. Reason: {1}' -f $workingDirectory, $($Error[0].Exception.Message)
    }
}
#endRegion

#region Script Content
$scriptContent = @'
# Parameters
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
    $projectName = 'Move-DownloadsToOneDrive'
    $workingDirectory = '{0}\_Automation\Script\{1}' -f $env:ProgramData, $projectName
    $logPath = '{0}\{1}.log' -f $workingDirectory, $projectName
    $taskName = 'Scheduled_Task_{0}' -f $projectName

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
        $logEntry = '{0} [{1}] {2}' -f $timestamp, $Level, $Text
        Add-Content -Path $LogFilePath -Value $logEntry -Encoding UTF8
    }

    # Detect OneDrive path dynamically
    $userProfile = $env:USERPROFILE
    function Get-OneDrivePath {
        # Parameter
        [CmdletBinding()]
        param (
            [Parameter(Mandatory = $false, HelpMessage = 'Name of the OneDrive Directory')]
            [string]$OneDriveDirectory
        )

        # Try user provided path
        if ($OneDriveDirectory) {
            $oneDrivePath = '{0}\{1}' -f $userProfile, $OneDriveDirectory
            if (Test-Path -Path $oneDrivePath) {
                return $oneDrivePath
            }
        }
        # Try environment variables first
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
        # Fallback to common OneDrive locations
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

    $oneDrivePath = if ($OneDriveDirectory) {
        Get-OneDrivePath -OneDriveDirectory $OneDriveDirectory
    } else {
        Get-OneDrivePath
    }
} process {
    # Validate OneDrive Path
    if (!$oneDrivePath) {
        Write-LogFile -Text 'One Drive path not found' -LogFilePath $logPath -Level Error
        throw 'One Drive path not found'
    }

    if (!(Test-Path -Path $oneDrivePath)) {
        Write-LogFile -Text ('One Drive path ''{0}'' not found' -f $oneDrivePath) -LogFilePath $logPath -Level Error
        throw ('One Drive path ''{0}'' not found' -f $oneDrivePath)
    }

    $originalDownloads = '{0}\Downloads' -f $userProfile
    $oneDriveDownloads = '{0}\Downloads' -f $oneDrivePath

    Write-LogFile -Text ('One Drive Path: {0}' -f $oneDrivePath) -LogFilePath $logPath -Level Information
    Write-LogFile -Text ('Original Download Path: {0}' -f $originalDownloads) -LogFilePath $logPath -Level Information
    Write-LogFile -Text ('One Drive Downloads Path: {0}' -f $oneDriveDownloads) -LogFilePath $logPath -Level Information

    # Create Downloads folder in OneDrive if it doesn't exist
    if (-not (Test-Path -Path $oneDriveDownloads)) {
        New-Item -Path $oneDriveDownloads -ItemType Directory -Force | Out-Null
        Write-LogFile -Text ('Created Downloads folder in OneDrive: {0}' -f $oneDriveDownloads) -LogFilePath $logPath -Level Information
    }

    # Copy files from current Downloads Folder to OneDrive's Download Folder
    if (Test-Path -Path $originalDownloads) {
        $itemsToMove = Get-ChildItem -Path $originalDownloads -Force -ErrorAction SilentlyContinue
        if ($itemsToMove) {
            Write-LogFile -Text 'Copying existing files from Downloads to OneDrive...' -LogFilePath $logPath -Level Information

            foreach ($item in $itemsToMove) {
                try {
                    $destinationPath = '{0}\{1}' -f $oneDriveDownloads, $item.Name
                    if ($item.PSIsContainer) {
                        # Copy directory
                        Copy-Item -Path $item.FullName -Destination $destinationPath -Recurse -Force -ErrorAction Stop
                    } else {
                        # Copy file
                        Copy-Item -Path $item.FullName -Destination $destinationPath -Force -ErrorAction Stop
                    }
                    Write-LogFile -Text ('  Copied: {0}' -f $($item.Name)) -LogFilePath $logPath -Level Information
                } catch {
                    Write-LogFile -Text ('Failed to copy: {0}. Reason: {1}' -f $($item.Name), $($Error[0].Exception.Message)) -LogFilePath $logPath -Level Error
                }
            }
            Write-LogFile -Text 'File movement completed.' -LogFilePath $logPath -Level Information
        } else {
            Write-LogFile -Text 'No files found in original Downloads folder.' -LogFilePath $logPath -Level Information
        }
    }

    # Ensure the registry path for User Shell Folders exists before modifying it
    try {
        $UserRegistryPath = 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders'

        # Create the path if it doesn't exist
        if (-not (Test-Path -Path $UserRegistryPath)) {
            New-Item -Path $UserRegistryPath -Force -ErrorAction Stop | Out-Null
            Write-LogFile -Text ('Created registry path for User Shell Folders: {0}' -f $UserRegistryPath) -LogFilePath $logPath -Level Information
        }

        # Modify the Downloads folder registry entry
        Set-ItemProperty -Path $UserRegistryPath -Name '{374DE290-123F-4565-9164-39C4925E467B}' -Value $oneDriveDownloads -ErrorAction Stop
        Write-LogFile -Text ('Downloads folder redirected to: {0}' -f $oneDriveDownloads) -LogFilePath $logPath -Level Information

        # Restart Explorer to apply changes
        Write-LogFile -Text 'Restarting Explorer to apply changes...' -LogFilePath $logPath -Level Information
        try {
            Stop-Process -Name 'Explorer' -Force -ErrorAction Stop
            Start-Sleep -Seconds 2
            Start-Process -FilePath 'C:\Windows\Explorer.exe' -ErrorAction Stop
            Write-LogFile -Text 'Explorer restarted successfully.' -LogFilePath $logPath -Level Information
        } catch {
            Write-LogFile -Text ('Failed to restart Explorer. Reason: {0}' -f $($Error[0].Exception.Message)) -LogFilePath $logPath -Level Error
            Write-LogFile -Text 'Please restart Explorer manually or log off/on for changes to take effect.' -LogFilePath $logPath -Level Error
        }

        Write-LogFile -Text 'OneDrive Downloads redirection completed successfully!' -LogFilePath $logPath -Level Information
        Write-LogFile -Text ('New Downloads location: {0}' -f $OneDriveDownloads) -LogFilePath $logPath -Level Information
    } catch {
        Write-LogFile -Text ('Failed to redirect Downloads folder: Reason: {0}' -f $($Error[0].Exception.Message)) -LogFilePath $logPath -Level Error
    }

    # Exclude specific file types from OneDrive sync (using Registry modification)
    $extensionsToExclude = @('exe', 'dll', 'tmp', 'iso', 'msi')

    # Ensure that the OneDrive sync exclusions registry path exists
    $oneDriveExclusionRegistryPaths = @(
        'HKLM:\SOFTWARE\Policies\Microsoft\OneDrive\EnableODIgnoreListFromGPO',
        'HKCU:\SOFTWARE\Policies\Microsoft\OneDrive\EnableODIgnoreListFromGPO'
    )

    foreach ($oneDriveExclusionRegistryPath in $oneDriveExclusionRegistryPaths) {
        if (-not (Test-Path -Path $oneDriveExclusionRegistryPath)) {
            # Create the path if it doesn't exist
            try {
                New-Item -Path $oneDriveExclusionRegistryPath -Force | Out-Null
                Write-LogFile -Text ('Created registry path for OneDrive exclusions at: {0}' -f $oneDriveExclusionRegistryPath) -LogFilePath $logPath -Level Information
            } catch {
                Write-LogFile -Text ('Failed to create the registry path for OneDrive exclusions at: {0}' -f $oneDriveExclusionRegistryPath) -LogFilePath $logPath -Level Error
            }
        }

        # Set registry property to exclude extensions
        foreach ($ext in $extensionsToExclude) {
            try {
                $extPattern = "*.$ext"
                $check = (Get-ItemProperty -Path $oneDriveExclusionRegistryPath -Name "$extPattern" -ErrorAction SilentlyContinue)."$extPattern"
                if ($check -ne "$extPattern") {
                    Set-ItemProperty -Path $oneDriveExclusionRegistryPath -Name "$extPattern" -Value "$extPattern" -Force -ErrorAction Stop
                    Write-LogFile -Text ('Added exclusion for ''{0}''' -f $ext) -LogFilePath $logPath -Level Information
                }
            } catch {
                Write-LogFile -Text ('Failed to add {0} to OneDrive exclusions: Reason: {1}' -f $ext, $($Error[0].Exception.Message)) -LogFilePath $logPath -Level Error
            }
        }
    }
} end {
    (Get-ScheduledTask -TaskName $taskName -ErrorAction SilentlyContinue) | Unregister-ScheduledTask -Confirm:$false -ErrorAction SilentlyContinue | Out-Null
}
'@
#endRegion

#region CMD File content
$cmdFileContent = if ($OneDriveDirectory) {
    'C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -ExecutionPolicy Bypass -Command "& {0} -OneDriveDirectory ''{1}''"' -f $scriptPath, $OneDriveDirectory
} else {
    'C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -ExecutionPolicy Bypass -Command "& {0}"' -f $scriptPath
}
#endRegion

#region Vbs File Content
$vbsFileContent = 'CreateObject("Wscript.Shell").Run """" & WScript.Arguments(0) & """", 0, False'
#endRegion

#region Write Script Files
$utf8NoBomEncoding = New-Object System.Text.UTF8Encoding $false
try {
    [System.IO.File]::WriteAllText($scriptPath, $scriptContent, $utf8NoBomEncoding)
    [System.IO.File]::WriteAllText($cmdFilePath, $cmdFileContent, $utf8NoBomEncoding)
    [System.IO.File]::WriteAllText($vbsFilePath, $vbsFileContent, $utf8NoBomEncoding)
} catch {
    throw ('Failed to write script file. Reason: {0}' -f $($Error[0].Exception.Message))
}
#endRegion

#region Scheduled Task Creation
(Get-ScheduledTask -TaskName $taskName -ErrorAction SilentlyContinue) | Unregister-ScheduledTask -Confirm:$false -ErrorAction SilentlyContinue | Out-Null
$action = New-ScheduledTaskAction -Execute 'wscript.exe' -WorkingDirectory $workingDirectory -Argument "$vbsFilePath $cmdFilePath"
$trigger = New-ScheduledTaskTrigger -Once -At (Get-Date).AddSeconds(15)
$setting = New-ScheduledTaskSettingsSet -AllowStartIfOnBatteries
$principal = New-ScheduledTaskPrincipal -GroupId ((New-Object System.Security.Principal.SecurityIdentifier('S-1-5-32-545')).Translate([System.Security.Principal.NTAccount]).Value) -RunLevel Highest
$scheduledTask = New-ScheduledTask -Action $action -Trigger $trigger -Settings $setting -Principal $principal
try {
    Register-ScheduledTask -TaskName $taskName -InputObject $scheduledTask -ErrorAction Stop | Out-Null
    Write-Information ('Successfully created the scheduled task ''{0}''' -f $taskName) -InformationAction Continue
} catch {
    throw ('Failed to Schedule the task. Reason: {0}' -f $($Error[0].Exception.Message))
}
#endRegion

#region confirm scheduled task execution
Start-Sleep -Seconds 20
$taskRunTime = (Get-ScheduledTask -TaskName $taskName -ErrorAction SilentlyContinue | Get-ScheduledTaskInfo -ErrorAction SilentlyContinue).LastRunTime
if ($taskRunTime) {
    Write-Information ('Task Initiated at: {0}' -f $taskRunTime) -InformationAction Continue
} else {
    Write-Information 'Initiating the task' -InformationAction Continue
    Start-ScheduledTask -TaskName $taskName -ErrorAction SilentlyContinue
}
#endRegion

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
#endRegion