<#
.SYNOPSIS
    - Configure Winget to update installed apps on defined interval.
    - Uses https://github.com/Romanitho/Winget-AutoUpdate

.EXAMPLE
    PS C:\> .\Winget-AutoUpdate.ps1 -whitelistedApp 'Ditto.Ditto, Greenshot.Greenshot, HeidiSQL.HeidiSQL,7zip.7zip, GitHub.GitHubDesktop, Intel.IntelDriverAndSupportAssistant, Python.Python.3.12, Mozilla.Firefox*' -NotificationLevel Full -updatesInterval Daily -updatesAtTime '02PM' -installUserContext -updatesAtLogon -Force
    Configure the solution to check and update the installed applications out of the following list daily at 2:00 PM and at user logon:
    - Ditto.Ditto
    - Greenshot.Greenshot
    - HeidiSQL.HeidiSQL
    - 7zip.7zip
    - GitHub.GitHubDesktop
    - Intel.IntelDriverAndSupportAssistant
    - Python.Python.3.12
    - Mozilla.Firefox*
    The user level applications will be updated if any of te whitelisted applications are installed in user's context.
    Force skips checking the current configuration check and executes the installation

    PS C:\> .\Winget-AutoUpdate.ps1 -BlacklistedApp 'Ditto.Ditto, Greenshot.Greenshot, HeidiSQL.HeidiSQL,7zip.7zip, GitHub.GitHubDesktop, Intel.IntelDriverAndSupportAssistant, Python.Python.3.12, Mozilla.Firefox*' -NotificationLevel Full -updatesInterval Daily -updatesAtTime '07:30PM'
    Configure the solution to check and update the installed applications excluding the following list daily at 7:30 PM:
    - Ditto.Ditto
    - Greenshot.Greenshot
    - HeidiSQL.HeidiSQL
    - 7zip.7zip
    - GitHub.GitHubDesktop
    - Intel.IntelDriverAndSupportAssistant
    - Python.Python.3.12
    - Mozilla.Firefox*
    The user level applications will not be updated.
    Installation and configuration will not be performed if the current configuration is same.

     PS C:\> .\Winget-AutoUpdate.ps1 -Uninstall
     Uninstall application and remove it's traces.

.PARAMETER blacklistedApp
    - Comma separated list of the applications to exclude. By default the solution attempt to update all applications unless whitelist is defined.
    - This is a string

.PARAMETER whitelistedApp
    - Comma separated list of the applications to update. By default the solution attempt to update all applications unless whitelist is defined.
    - Providing this list will override the blacklisted applications.
    - Either Whitelisted or blacklisted applications can be set on a computer.
    - Both list cannot be set.
    - This is a string

.PARAMETER InstallUserContext
    - Install WAU with system and user context executions
    - User level applications will be updated as well
    - By default the solution attempt to update system level applications only

.PARAMETER NotificationLevel
    - Specify the Notification level:
        - Full (Default, displays all notification)
        - SuccessOnly (Only displays notification for success)
        - None (Does not show any popup).
    - Default is None

.PARAMETER updatesInterval
    - Specify the frequency for updates:
        - Daily
        - BiDaily
        - Weekly
        - BiWeekly
        - Monthly
        - Never
    - Default is Daily

.PARAMETER updatesAtTime
    - Specify the time for updates in 12 hour format.
    Examples:
        - 06AM (Default Value)
        - 06:30AM
        - 12AM
        - 03:30PM
        - 11:35PM

.PARAMETER updatesAtLogon
    - Set WAU to run at user logon.
    - Both updatesAtTime and updatesAtLogon parameters can be used together.

.PARAMETER doNotRunAfterInstallation
    - Do not run Winget-AutoUpdate after installation.
    - By default, Winget-AutoUpdate is run just after installation.

.PARAMETER uninstall
    - Uninstall application (WAU) and remove it's traces.

.PARAMETER force
    - Force skips checking the current configuration check and executes the installation.
    - By default, the script will not override the current configuration if it's same from the previous execution.

.OUTPUTS
    - Scheduled Tasks at \WAU\: 
        -Winget-AutoUpdate
        -Winget-AutoUpdate-Notify
        -Winget-AutoUpdate-Policies
        -Winget-AutoUpdate-UserContext
    - C:\ProgramData\_Automation\Script\Winget-AutoUpdate\Winget-AutoUpdate\Logs\error.log
    - C:\ProgramData\_Automation\Script\Winget-AutoUpdate\Winget-AutoUpdate\Logs\updates.log
    - C:\ProgramData\_Automation\Script\Winget-AutoUpdate\Winget-AutoUpdate\Logs\WAU-Installer.log
.NOTES
    - Only one of whitelistedApp or blacklistedApp can be used at a time.
    - If both whitelistedApp and blacklistedApp are provided, the whitelistedApp will be used.
#>

[Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSAvoidOverwritingBuiltInCmdlets', '')]
#region Parameters
[CmdletBinding()]
param (
    [Parameter()][String]$blacklistedApp,
    [Parameter()][String]$whitelistedApp,
    [Parameter()][Switch]$installUserContext,
    [Parameter()][ValidateSet('Full', 'SuccessOnly', 'None')][String]$NotificationLevel,
    [Parameter()][ValidateSet('Daily', 'BiDaily', 'Weekly', 'BiWeekly', 'Monthly', 'Never')][String]$updatesInterval,
    [Parameter()][String]$updatesAtTime,
    [Parameter()][Switch]$updatesAtLogon,
    [Parameter()][Switch]$doNotRunAfterInstallation,
    [Parameter(ParameterSetName = 'Uninstall')][Switch]$uninstall,
    [Parameter()][Switch]$force
)
#endRegion

#region Strapper
$ProgressPreference = 'SilentlyContinue'
[Net.ServicePointManager]::SecurityProtocol = [Enum]::ToObject([Net.SecurityProtocolType], 3072)
Get-PackageProvider -Name NuGet -ForceBootstrap | Out-Null
try {
    Set-PSRepository -Name PSGallery -InstallationPolicy Trusted -ErrorAction Stop
} catch {
    Remove-Item "$env:localappdata\Microsoft\Windows\PowerShell\PowerShellGet\PSRepositories.xml" -Force -ErrorAction SilentlyContinue
    Register-PSRepository -Default
    Set-PSRepository -Name PSGallery -InstallationPolicy Trusted
}
try {
    Update-Module -Name Strapper -ErrorAction Stop
} catch {
    Install-Module -Name Strapper -Repository PSGallery -SkipPublisherCheck -Force
    Get-Module -Name Strapper -ListAvailable | Where-Object { $_.Version -ne (Get-InstalledModule -Name Strapper).Version } | ForEach-Object { Uninstall-Module -Name Strapper -MaximumVersion $_.Version }
}
(Import-Module -Name 'Strapper') 3>&1 2>&1 1>$null
Set-StrapperEnvironment
#endRegion

#region Variables
$projectName = 'Winget-AutoUpdate'
$workingDirectory = "C:\ProgramData\_automation\Script\$projectName"
$zipPath = "$workingDirectory\WAU.zip"
$extractPath = "$workingDirectory\WAU"
$installScriptPath = "$extractPath\Winget-AutoUpdate-Install.ps1"
$listPath = "$workingDirectory\appList"
$blacklistedAppPath = "$listPath\excluded_apps.txt"
$whitelistedAppPath = "$listPath\included_apps.txt"
$wauInstallPath = "$workingDirectory\$projectName"
$uninstallScriptPath = "$extractPath\$projectName\WAU-Uninstall.ps1"
$tableName = 'windowsAutoUpdateConfig'
$configChanges = 0
#endRegion

#region function
function Uninstall-WAU {
    [CmdletBinding()]
    param (
        [Parameter()][String]$uninstallScriptPath,
        [Parameter()][String]$wauInstallPath
    )
    if ( Get-Process -Name 'ServiceUI' -ErrorAction SilentlyContinue) {
        cmd.exe /c taskkill /f /im ServiceUI.exe 3>&1 2>&1 1>$Null
    }
    if ( Test-Path $uninstallScriptPath ) {
        & $uninstallScriptPath 3>&1 2>&1 1>$Null
    }
    $uninstallString = (Get-ChildItem 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall' -ErrorAction SilentlyContinue | Get-ItemProperty | Where-Object { $_.DisplayName -match 'Winget-AutoUpdate' }).uninstallString
    if ( $uninstallString ) {
        cmd.exe /c $uninstallString /qn /norestart
        Get-ChildItem $wauInstallPath -Recurse -ErrorAction SilentlyContinue | Remove-Item -Force -Recurse -ErrorAction SilentlyContinue
    }
}
#endregion

#region Uninstall
if ( $uninstall ) {
    try {
        Uninstall-WAU -uninstallScriptPath $uninstallScriptPath -wauInstallPath $wauInstallPath
    } catch {
        Write-Log -Text "!ERROR!: Failed to remove WAU from the system. Reason: $($Error[0].Exception.Message)" -Level Error
    }

    Get-ChildItem -Path $workingDirectory -Recurse -ErrorAction SilentlyContinue | Where-Object { $_.Name -ne $MyInvocation.MyCommand.Name } | Remove-Item -Force -Recurse -ErrorAction SilentlyContinue

    $newConfig = @()
    $newConfig | Write-StoredObject -TableName $tableName -Clobber -WarningAction SilentlyContinue -Depth 2

    if ( Get-ScheduledTask -TaskPath '\WAU\' -ErrorAction SilentlyContinue ) {
        Write-Log -Text '!ERROR!: Failed to remove WAU from the system. Reason: Scheduled Task Removal Failure.' -Level Error
    }

    if ( Get-ChildItem 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall' -ErrorAction SilentlyContinue | Get-ItemProperty | Where-Object { $_.DisplayName -match 'Winget-AutoUpdate' } ) {
        Write-Log -Text '!ERROR!: Failed to remove WAU from the system. Reason: Application Removal Failure.' -Level Error
    }
    return
}
#endRegion

#region Configuration Comparison
$existingConfig = try { Get-StoredObject -TableName $tableName -WarningAction SilentlyContinue } catch { $null }

if ($whitelistedApp) {
    $blacklistedApp = $null
}

$newConfig = [PSCustomObject]@{
    blacklistedApp = $blacklistedApp
    whitelistedApp = $whitelistedApp
    installUserContext = $(([Switch]$installUserContext).Ispresent)
    NotificationLevel = $NotificationLevel
    updatesInterval = $updatesInterval
    updatesAtTime = $updatesAtTime
    updatesAtLogon = $(([Switch]$updatesAtLogon).Ispresent)
}

if ($force) {
    Write-Log -Text 'Forced installation. Proceeding with the new configuration' -Level Information
    $configChanges++
    if ( $existingConfig ) {
        $reinstall = $true
    }
} elseif (-not $existingConfig) {
    Write-Log -Text 'Existing Configuration not found. Proceeding with the new installation' -Level Information
    $configChanges++
} else {
    foreach ( $key in ($newConfig | Get-Member | Where-Object { $_.MemberType -eq 'NoteProperty' }).Name ) {
        if ($newConfig.$key -ne $existingConfig.$key) {
            Write-Log -Text "Configuration Change detected. Previous '$($key)' was '$($existingConfig.$key)' and new '$($key)' is '$($newConfig.$key)'" -Level Information
            $configChanges++
            $reinstall = $true
        }
    }
}

$newConfig | Write-StoredObject -TableName $tableName -Clobber -WarningAction SilentlyContinue -Depth 2

if ( $configChanges -eq 0 ) {
    Write-Log -Text 'Winget Auto Update is already configured. No changes required.' -Level Information
    return
}
#endRegion

#region downloadUrl
Write-Log -Text 'Generating download url.' -Level Information

$ProgressPreference = 'SilentlyContinue'
[Net.ServicePointManager]::SecurityProtocol = [enum]::ToObject([Net.SecurityProtocolType], 3072)

$GitHub_Repo = 'Winget-AutoUpdate'
try {
    $WAUurl = "https://api.github.com/repos/Romanitho/$($GitHub_Repo)/releases/latest"
    $latest = ((Invoke-WebRequest $WAUurl -UseBasicParsing | ConvertFrom-Json)[0].tag_name).Replace('v', '')
} catch {
    $url = "https://github.com/Romanitho/$($GitHub_Repo)/releases/latest"
    $link = ((Invoke-WebRequest $url -UseBasicParsing).Links.href -match "/$($GitHub_Repo)/releases/tag/v*")[0]
    $latest = $link.Trim().Split('v')[-1]
}
Write-Log -Text "Latest available version: $($latest)" -Level Information

$downloadUrl = "https://github.com/Romanitho/Winget-AutoUpdate/releases/download/v$($latest)/WAU.zip"
Write-Log -Text "Download url: $($downloadUrl)" -Level Information
#endRegion


#region workingDirectory
Write-Log -Text "Setting working directory: $($workingDirectory)" -Level Information
if (-not (Test-Path $WorkingDirectory)) {
    try {
        New-Item -Path $WorkingDirectory -ItemType Directory -Force -ErrorAction Stop | Out-Null
    } catch {
        Write-Log -Text "!ERROR!: Failed to Create $WorkingDirectory. Reason: $($Error[0].Exception.Message)" -Level Error -ErrorAction Stop
    }
}

if (-not (Test-Path $extractPath)) {
    New-Item -ItemType Directory -Path $extractPath -ErrorAction SilentlyContinue | Out-Null
}

if (-not (Test-Path $listPath)) {
    New-Item -ItemType Directory -Path "$listPath" -ErrorAction SilentlyContinue | Out-Null
}


if (-not ( ( ( Get-Acl $WorkingDirectory ).Access | Where-Object { $_.IdentityReference -Match 'EveryOne' } ).FileSystemRights -Match 'FullControl' ) ) {
    $Acl = Get-Acl $WorkingDirectory
    $AccessRule = New-Object System.Security.AccessControl.FileSystemAccessRule('Everyone', 'FullControl', 'ContainerInherit, ObjectInherit', 'none', 'Allow')
    $Acl.AddAccessRule($AccessRule)
    Set-Acl  $WorkingDirectory $Acl -ErrorAction SilentlyContinue
}
#endRegion

#region Download
Write-Log -Text 'Downloading WAU.zip' -Level Information
try {
    Invoke-WebRequest $downloadUrl -UseBasicParsing -OutFile $zipPath -ErrorAction Stop
} catch {
    Write-Log -Text "!ERROR!: Failed to download Winget Auto Update installer. Reason: $($Error[0].Exception.Message)" -Level Error -ErrorAction Stop
}
#endRegion

#region Extract
Write-Log -Text 'Extracting archive' -Level Information
Get-ChildItem $extractPath -Recurse -ErrorAction SilentlyContinue | Remove-Item -Force -Recurse -ErrorAction SilentlyContinue

try {
    Expand-Archive -Path $zipPath -DestinationPath $extractPath -Force
} catch {
    Write-Log -Text "!ERROR!: Failed to extract Winget Auto Update installer. Reason: $($Error[0].Exception.Message)" -Level Error -ErrorAction Stop
}
#endRegion

#region App list
if ($whitelistedApp) {
    Write-Log -Text "Whitelisted app: $whitelistedApp" -Level Information
    if ( Test-Path $blacklistedAppPath ) {
        Remove-Item $blacklistedAppPath -Force -ErrorAction SilentlyContinue
    }
    $whitelist = ($whitelistedApp -split ',').trim()
    try {
        $Utf8NoBomEncoding = New-Object System.Text.UTF8Encoding $False
        [System.IO.File]::WriteAllLines($whitelistedAppPath, $whitelist, $Utf8NoBomEncoding)
    } catch {
        Write-Log -Text "!ERROR!: Failed to write whitelisted application to '$whitelistedAppPath'. Reason: $($Error[0].Exception.Message)" -Level Error -ErrorAction Stop
    }
} elseif ($blacklistedAppPath) {
    Write-Log -Text "Blacklisted app: $blacklistedApp" -Level Information
    if ( Test-Path $whitelistedAppPath ) {
        Remove-Item $whitelistedAppPath -Force -ErrorAction SilentlyContinue
    }
    $blacklist = ($blacklistedApp -split ',').trim()
    try {
        $Utf8NoBomEncoding = New-Object System.Text.UTF8Encoding $False
        [System.IO.File]::WriteAllLines($blacklistedAppPath, $blacklist, $Utf8NoBomEncoding)
    } catch {
        Write-Log -Text "!ERROR!: Failed to write blacklisted application to '$blacklistedAppPath'. Reason: $($Error[0].Exception.Message)" -Level Error -ErrorAction Stop
    }
} else {
    Write-Log -Text 'No app list provided. Using default configuration.' -Level Information
    if ( Test-Path $whitelistedAppPath ) {
        Remove-Item $whitelistedAppPath -Force -ErrorAction SilentlyContinue
    }
    if ( Test-Path $blacklistedAppPath ) {
        Remove-Item $blacklistedAppPath -Force -ErrorAction SilentlyContinue
    }
}
#endRegion

#region Parameter block
$parameters = @{
    'Silent' = $true
    'WAUinstallPath' = $WAUinstallPath
}
if ( Test-Path $whitelistedAppPath ) {
    $parameters.Add('ListPath', $ListPath )
    $parameters.Add('UseWhiteList', $true )
} elseif ( Test-Path $blacklistedAppPath ) {
    $parameters.Add('ListPath', $ListPath )
}
if ( $NotificationLevel ) {
    $parameters.Add('NotificationLevel', $NotificationLevel)
} else {
    $parameters.Add('NotificationLevel', 'None')
}
if ( $updatesInterval ) {
    $parameters.Add('UpdatesInterval', $updatesInterval)
} else {
    $parameters.Add('UpdatesInterval', 'Daily')
}
if ( $updatesAtTime ) {
    $parameters.Add('UpdatesAtTime', $updatesAtTime)
} else {
    $parameters.Add('UpdatesAtTime', '06AM')
}
if ( $installUserContext ) {
    $parameters.Add('InstallUserContext', $true)
}
if ( $UpdatesAtLogon ) {
    $parameters.Add('UpdatesAtLogon', $true)
}
if ( $doNotRunAfterInstallation ) {
    $parameters.Add('DoNotUpdate', $true)
}
#endregion

#region Install
function Write-Host {}

Write-Log -Text 'Installing WAU' -Level Information
try {
    if ( $reinstall ) {
        Uninstall-WAU -uninstallScriptPath $uninstallScriptPath -wauInstallPath $wauInstallPath
        Start-Sleep -Seconds 10
    }
    & $installScriptPath @parameters
} catch {
    Write-Log -Text "$($Error[0].Exception.Message)" -Level Error
}
#endRegion

#region Validation
if ( -not (Get-ScheduledTask -TaskPath '\WAU\' -ErrorAction SilentlyContinue) ) {
    Write-Log -Text '!ERROR!: Failed to configure Winget Auto Update. Reason: Scheduled tasks not created.' -Level Error
}

if ( -not ( Get-ChildItem 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall' -ErrorAction SilentlyContinue | Get-ItemProperty | Where-Object { $_.DisplayName -match 'Winget-AutoUpdate' }) ) {
    Write-Log -Text '!ERROR!: Failed to configure Winget Auto Update. Reason: Application installation failure.' -Level Error
}
#endRegion

return 'Process Completed'