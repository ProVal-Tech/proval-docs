<#
.SYNOPSIS
    Installs the SIG anyconnect client and selected modules.
.EXAMPLE
    PS C:\>Install-AnyConnect.ps1 -ClientName 'ProVal' -OrgName 'Development' -Dart -Nvm -Posture
    PS C:\>Install-AnyConnect.ps1 -ClientName 'ProVal' -OrgName 'Development' -Umbrella -Dart -Nvm -ClientID 1234567 -Fingerprint oash098ashuiue -OrgId 394058
    PS C:\>Install-AnyConnect.ps1 -ClientName 'ProVal' -OrgName 'Development' -All -ClientId 1234567 -Fingerprint oash098ashuiue -OrgId 394058
    PS C:\>Install-AnyConnect.ps1 -ClientName 'ProVal' -OrgName 'Development' -Core
.PARAMETER ClientId
    Used to Generate the JSON on the endpoint needed by Umbrella. Required by -Umbrella and -All switches. Provided by the end-user from their Cisco dashboard, or their JSON.
.PARAMETER Fingerprint
    Used to Generate the JSON on the endpoint needed by Umbrella. Required by -Umbrella and -All switches. Provided by the end-user from their Cisco dashboard, or their JSON.
.PARAMETER OrgId
    Used to Generate the JSON on the endpoint needed by Umbrella. Required by -Umbrella and -All switches. Provided by the end-user from their Cisco dashboard, or their JSON.
.PARAMETER Core
    Installs only the Core VPN Module. Cannot combine with other modules. Passing no parameters will select this option automatically
.PARAMETER All
    Installs all modules. Cannot be combined with specific module elections or Core-Only installation. Requires Client ID, Org ID, and Fingerprint
.PARAMETER <ModuleName>
    Installs the core VPN Module, along with specified module names. 
    The allowed parameter names are:
        Amp
        Dart
        Gina
        Nam
        Nvm
        IsePosture
        Posture
        Umbrella (Requires Client ID, Org ID, and Fingerprint)
.OUTPUTS
    Install-AnyConnect-log.txt
    Install-AnyConnect-Error.txt
    Install-AnyConnect-Data.txt
.NOTES
    As of right now, SIG downloads are behind a paywall. Binaries must be manually uploaded to 
    Repo/Install/Cisco/Anyconnect and placed within the wininstall.zip archive. Current version is 4.10.04071.
#>
[CmdletBinding()]
param (
    [Parameter(Mandatory = $false, ParameterSetName = 'All')][switch]$All,
    [Parameter(Mandatory = $false, ParameterSetName = 'Core')][switch]$Core,
    [Parameter(Mandatory = $false, ParameterSetName = 'Custom')][switch]$Amp,
    [Parameter(Mandatory = $false, ParameterSetName = 'Custom')][switch]$Gina,
    [Parameter(Mandatory = $false, ParameterSetName = 'Custom')][switch]$Dart,
    [Parameter(Mandatory = $false, ParameterSetName = 'Custom')][switch]$Nam,
    [Parameter(Mandatory = $false, ParameterSetName = 'Custom')][switch]$Nvm,
    [Parameter(Mandatory = $false, ParameterSetName = 'Custom')][switch]$Posture,
    [Parameter(Mandatory = $false, ParameterSetName = 'Custom')][switch]$IsePosture,
    [Parameter(Mandatory = $false, ParameterSetName = 'Custom')][switch]$Umbrella
)
DynamicParam {
    $ParamDictionary = New-Object -TypeName System.Management.Automation.RuntimeDefinedParameterDictionary
    $AttributeCollection = New-Object -TypeName System.Collections.ObjectModel.Collection[System.Attribute]
    $Attributes = New-Object -TypeName System.Management.Automation.ParameterAttribute
    $Attributes.Mandatory = ($Umbrella -or $All)
    $AttributeCollection.Add($Attributes)
    $fingerprintParameter = New-Object -TypeName System.Management.Automation.RuntimeDefinedParameter('fingerprint', [string], $AttributeCollection)
    $clientIdParameter = New-Object -TypeName System.Management.Automation.RuntimeDefinedParameter('clientId', [string], $AttributeCollection)
    $orgIdParameter = New-Object -TypeName System.Management.Automation.RuntimeDefinedParameter('orgId', [string], $AttributeCollection)
    $ParamDictionary.Add('fingerprint', $fingerprintParameter)
    $ParamDictionary.Add('clientId', $clientIdParameter)
    $ParamDictionary.Add('orgId', $orgIdParameter)
    return $ParamDictionary
}
Process {
    ### Bootstrap ###
    if (-not $bootstrapLoaded) {
        [Net.ServicePointManager]::SecurityProtocol = [Enum]::ToObject([Net.SecurityProtocolType], 3072)
        Invoke-Expression (New-Object System.Net.WebClient).DownloadString('https://file.provaltech.com/repo/script/Bootstrap.ps1')
        Set-Environment
    } else {
        Write-Log -Text 'Bootstrap already loaded.' -Type INIT
    }
    ### Process ###

    #set vars
    $repoURL = "https://file.provaltech.com/repo/install/Cisco/AnyConnect"
    $appDir = "$env:ProgramData\Cisco\Cisco AnyConnect Secure Mobility Client\"
    #download and unpack files
    Write-Log -Text "Downloading and unpacking installation files" -Type LOG
    New-Item -Type Directory -Path $workingPath -Name "CiscoInstallerFiles" -ErrorAction SilentlyContinue
    Remove-Item "$workingPath\CiscoInstallerFiles\*" -Recurse -Force -Confirm:$false -ErrorAction SilentlyContinue
    (New-Object System.Net.WebClient).DownloadFile("$repoURL/wininstall.zip", "$workingPath\CiscoInstallerFiles\wininstall.zip")
    Expand-Archive "$workingPath\CiscoInstallerFiles\wininstall.zip" -DestinationPath "$workingPath\CiscoInstallerFiles"
    if(Test-Path "$workingPath\CiscoInstallerFiles\anyconnect*" -Type Leaf) {
        Remove-Item "$workingPath\CiscoInstallerFiles\wininstall.zip"
        $installerFiles = Get-Childitem "$workingPath\CiscoInstallerFiles\"
    }
    else {
        Write-Log -Text "Download and unpack operation failed. Contact your ProVal Administrator for assistance." -Type ERROR
        exit
    }

    #Deploy Core
    $coreInstaller = $installerFiles | Where-Object {$_ -match 'core'}
    Write-Log -Text "Installing Core Module..." -Type LOG
    #Start-Process msiexec.exe -Wait -ArgumentList "/package $workingPath\CiscoInstallerFiles\$($coreInstaller.Name) /norestart /quiet"
    if(!(Start-Process msiexec.exe -ArgumentList "/i CiscoInstallerFiles\$($coreInstaller.Name) /norestart /quiet" -Wait -PassThru).exitcode -eq 0){
        Write-Log -Text "MSI Installation failed with exit code $_" -Type ERROR
    }
    else {
        Write-Log -Text "AnyConnect Core Installed."
    }

    #deploy selected modules
    if ($All -or $Umbrella){
        #write JSON based on Client and Organization if Umbrella is being installed.
        $jsonDir = "$env:ProgramData\Cisco\Cisco AnyConnect Secure Mobility Client\Umbrella"
        Write-Log -Text "Umbrella module selected for installation. Creating Directories and JSON file." -Type LOG
        New-Item -Path $appDir -Name "Umbrella" -ItemType Directory -ErrorAction SilentlyContinue
        Remove-Item "$jsonDir\OrgInfo.json" -ErrorAction SilentlyContinue
        @{
            organizationId = "$($orgIdParameter.Value)"
            fingerprint = "$($fingerprintParameter.Value)"
            userId = "$($ClientIdParameter.Value)"
        } | ConvertTo-json | Out-File "$jsonDir\OrgInfo.json"
        $umbrellaInstaller = $installerFiles | Where-Object {$_ -match 'umbrella'}
        Write-Log -Text "Installing Umbrella Module..." -Type LOG
        if(!(Start-Process msiexec.exe -ArgumentList "/i CiscoInstallerFiles\$($umbrellaInstaller.Name) /norestart /quiet" -Wait -PassThru).exitcode -eq 0){
            Write-Log -Text "MSI Installation failed with exit code $_" -Type ERROR
        }
        else {
            Write-Log -Text "Umbrella Installed."
        }
    if ($All -or $Amp){
        $ampInstaller = $installerFiles | Where-Object {$_ -match 'amp'}
        Write-Log -Text "Installing AMP Module..." -Type LOG
        if(!(Start-Process msiexec.exe -ArgumentList "/i CiscoInstallerFiles\$($ampInstaller.Name) /norestart /quiet" -Wait -PassThru).exitcode -eq 0){
            Write-Log -Text "MSI Installation failed with exit code $_" -Type ERROR
        }
        else {
            Write-Log -Text "AMP Installed."
        }
    }
    if ($All -or $Dart){
        $dartInstaller = $installerFiles | Where-Object {$_ -match 'dart'}
        Write-Log -Text "Installing DART Module..." -Type LOG
        if(!(Start-Process msiexec.exe -ArgumentList "/i CiscoInstallerFiles\$($dartInstaller.Name) /norestart /quiet" -Wait -PassThru).exitcode -eq 0){
            Write-Log -Text "MSI Installation failed with exit code $_" -Type ERROR
        }
        else {
            Write-Log -Text "DART Installed."
        }
    }
    if ($All -or $IsePosture){
        $iseInstaller = $installerFiles | Where-Object {$_ -match 'iseposture'}
        Write-Log -Text "Installing ISEPosture Module..." -Type LOG
        if(!(Start-Process msiexec.exe -ArgumentList "/i CiscoInstallerFiles\$($iseInstaller.Name) /norestart /quiet" -Wait -PassThru).exitcode -eq 0){
            Write-Log -Text "MSI Installation failed with exit code $_" -Type ERROR
        }
        else {
            Write-Log -Text "ISE Installed."
        }
    }
    if ($All -or $Nam){
        $namInstaller = $installerFiles | Where-Object {$_ -match 'nam'}
        Write-Log -Text "Installing NAM Module..." -Type LOG
        if(!(Start-Process msiexec.exe -ArgumentList "/i CiscoInstallerFiles\$($namInstaller.Name) /norestart /quiet" -Wait -PassThru).exitcode -eq 0){
            Write-Log -Text "MSI Installation failed with exit code $_" -Type ERROR
        }
        else {
            Write-Log -Text "NAM Installed."
        }
    if ($All -or $Nvm){
        $nvmInstaller = $installerFiles | Where-Object {$_ -match 'nvm'}
        Write-Log -Text "Installing NVM Module..." -Type LOG
        if(!(Start-Process msiexec.exe -ArgumentList "/i CiscoInstallerFiles\$($nvmInstaller.Name) /norestart /quiet" -Wait -PassThru).exitcode -eq 0){
            Write-Log -Text "MSI Installation failed with exit code $_" -Type ERROR
        }
        else {
            Write-Log -Text "NVM Installed."
        }
    }
    if ($All -or $Gina){
        $ampInstaller = $installerFiles | Where-Object {$_ -match 'gina'}
        Write-Log -Text "Installing GINA Module..." -Type LOG
        if(!(Start-Process msiexec.exe -ArgumentList "/i CiscoInstallerFiles\$($ginaInstaller.Name) /norestart /quiet" -Wait -PassThru).exitcode -eq 0){
            Write-Log -Text "MSI Installation failed with exit code $_" -Type ERROR
        }
        else {
            Write-Log -Text "Gina Installed."
        }
    }
}
    if ($All -or $Posture){
        $postureInstaller = $installerFiles | Where-Object {$_ -match 'posture'}
        Write-Log -Text "Installing Posture Module..." -Type LOG
        if(!(Start-Process msiexec.exe -ArgumentList "/i CiscoInstallerFiles\$($postureInstaller.Name) /norestart /quiet" -Wait -PassThru).exitcode -eq 0){
            Write-Log -Text "MSI Installation failed with exit code $_" -Type ERROR
        }
        else {
            Write-Log -Text "POSTURE Installed."
        }
    }
}
}