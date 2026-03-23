---
id: 'c762e174-5262-44b9-a3e9-97ca9ff94afc'
slug: /c762e174-5262-44b9-a3e9-97ca9ff94afc
title: 'Soji'
title_meta: 'Soji'
keywords: ['soji', 'cleanmgr', 'disk-cleanup']
description: 'Soji is an intelligent yet simple disk cleanup utility that uses both native `System.IO` file and directory management and `COM` references to the deprecated cleanmgr tool to tidy up one or more volumes on a Windows system.'
tags: ['disk', 'disk-cleanup']
draft: false
unlisted: false
last_update:
  date: 2026-03-23
---

<br />
<div align="center">
    <a href="https://content.provaltech.com/docs/c762e174-5262-44b9-a3e9-97ca9ff94afc">
        <img src="https://raw.githubusercontent.com/ProVal-Tech/proval-docs/refs/heads/main/static/img/docs/c762e174-5262-44b9-a3e9-97ca9ff94afc/soji.webp" alt="Logo" width="150" height="150" />
    </a>
    <h3 align="center">掃除 (Sōji)</h3>
    <p align="center">A Windows drive cleaner.</p>
</div>

## About

Soji is an intelligent yet simple disk cleanup utility that uses both native `System.IO` file and directory management and `COM` references to the deprecated [cleanmgr](https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/cleanmgr) tool to tidy up one or more volumes on a Windows system.

### Built With

- [.NET Desktop Runtime 8.0](https://dotnet.microsoft.com/en-us/download/dotnet/8.0)

### Important Note

Soji is a destructive application by nature in that it deletes files and folders. **Take great care when using the `--days`, `--systempaths`, and `--userpaths` arguments.**

## Getting Started

Install the .NET 8.0 runtime, read the documentation on using the various switches, and start running Soji! 🧹

### Prerequisites

.NET 8.0:

```powershell
winget install Microsoft.DotNet.DesktopRuntime.8
```

Or

```powershell
# PowerShell installation of .NET Desktop Runtime 8.x.xx (latest version)
<#
.SYNOPSIS
    Installs the latest available .NET Desktop Runtime 8 version if it is not already installed.

.DESCRIPTION
    Checks the local endpoint for installed Microsoft Windows Desktop Runtime versions by calling
    Get-InstalledDotNetDesktopRuntime. If major version 8 is already installed, the script exits
    without changes.

    If not installed, the script:
    - Creates a working directory under ProgramData.
    - Ensures required ACL permissions on that directory.
    - Enforces TLS 1.2/1.3 for outbound web requests.
    - Detects OS architecture and maps it to the appropriate RID.
    - Retrieves the latest .NET 8 Windows Desktop Runtime installer URL from Microsoft's
      official release metadata feed.
    - Downloads and silently installs the runtime.
    - Verifies installation and cleans up the installer binary.

    This script is intended for automated execution in RMM/automation workflows.

.EXAMPLE
    .\Install-dotNet8DesktopRuntime.ps1

    Runs the full detection-and-install workflow. If .NET Desktop Runtime 8 is already installed,
    the script returns a no-action message.

.OUTPUTS
    System.String

    Returns:
    - '.NET Desktop Runtime 8 is already installed. No action is required.' when no install is needed.

    Writes informational progress messages during install path execution and throws terminating
    errors when download, install, or verification fails.

.NOTES
    - Requires Windows with PowerShell 5.1+.
    - Requires administrative privileges for install and ProgramData operations.
    - Uses BITS for download and Start-Process for silent installer execution.
    - Release metadata source: https://builds.dotnet.microsoft.com/dotnet/release-metadata/8.0/releases.json
#>
begin {
    #region globals
    $ProgressPreference = 'SilentlyContinue'
    $WarningPreference = 'SilentlyContinue'
    $InformationPreference = 'Continue'
    $ConfirmPreference = 'None'
    #endRegion

    #region variables
    $appName = 'dotNet8DesktopRuntime'
    $workingDirectory = '{0}\_Automation\Script\{1}' -f $env:ProgramData, $appName
    $appPath = '{0}\{1}.exe' -f $workingDirectory, $appName
    $url = 'https://builds.dotnet.microsoft.com/dotnet/release-metadata/8.0/releases.json'
    $installerArguments = @(
        '/install',
        '/quiet',
        '/norestart'
    )
    #endRegion

    #region function
    function Get-InstalledDotNetDesktopRuntime {
        <#
        .SYNOPSIS
            Gets installed .NET Windows Desktop Runtime versions from the local endpoint.

        .DESCRIPTION
            Resolves the path to `dotnet.exe` and executes `dotnet --list-runtimes`, then parses
            the output and returns only Windows Desktop Runtime entries (Microsoft.WindowsDesktop.App).

            The function returns one object per detected runtime version with friendly name,
            major version, full version, and installed path.

        .PARAMETER None
            This function does not accept parameters.

        .OUTPUTS
            System.Object[]

            Each object contains:
            - Name          : Friendly display name (for example, Microsoft Windows Desktop Runtime - 8.0.25)
            - MajorVersion  : Major version number as Int32
            - Version       : Full semantic version string
            - InstalledPath : Runtime install path reported by dotnet

        .EXAMPLE
            $installedRuntimes = Get-InstalledDotNetDesktopRuntime

            Returns all installed Windows Desktop Runtime versions.

        .EXAMPLE
            Get-InstalledDotNetDesktopRuntime | Where-Object { $_.MajorVersion -eq 8 }

            Returns only .NET 8 Windows Desktop Runtime entries.

        .NOTES
            Used by this script to verify whether .NET Desktop Runtime 8 is already present
            before installation and to confirm installation success afterward.
        #>
        [CmdletBinding()]
        [OutputType([System.Object[]])]
        param()

        #region dotnet path
        $dotnetCommand = Get-Command 'dotnet' -ErrorAction SilentlyContinue
        if ($dotnetCommand) {
            $dotNetExePath = $dotnetCommand.Source
        } else {
            $dotNetExePath = '{0}\dotnet\dotnet.exe' -f $env:ProgramFiles
        }
        #endRegion

        #region variables
        $listRuntimesCommand = '{0}{1}{0} --list-runtimes' -f [char]34, $dotNetExePath
        $installed = @()
        #endRegion

        #region retrieve installed .net info
        $runtimes = cmd.exe /c $listRuntimesCommand
        #endRegion

        #region create installed versions object
        foreach ($line in $runtimes) {
            if ($line -match '^((?<Name>.+?)\s+)?(?<Version>\d+\.\d+\.\d+)\s\[(?<Path>[^\]]+)\]$') {
                $name = $matches['Name']
                $version = $matches['Version']
                $path = $matches['Path']

                if ($path -notmatch 'Microsoft.WindowsDesktop.App') {
                    continue
                }
                $name = 'Microsoft Windows Desktop Runtime - {0}' -f $version

                $obj = [PSCustomObject]@{
                    Name          = $name
                    MajorVersion  = ([Version]$version).Major
                    Version       = $version
                    InstalledPath = $path
                }
                $installed += $obj
            }
        }
        #endRegion
        return $installed
    }
    #endRegion
} process {
    #region check if .net desktop runtime 8 is installed
    $installedRuntimes = Get-InstalledDotNetDesktopRuntime
    $runtime8Installed = $installedRuntimes | Where-Object { $_.MajorVersion -eq 8 }
    if ($runtime8Installed) {
        return '.NET Desktop Runtime 8 is already installed. No action is required.'
    } else {
        Write-Information -MessageData '.NET Desktop Runtime 8 is not installed. Proceeding with installation.'
    }

    #region working directory
    if (-not (Test-Path -Path $workingDirectory)) {
        try {
            New-Item -Path $workingDirectory -ItemType Directory -Force -ErrorAction Stop | Out-Null
        } catch {
            throw ('Failed to Create working directory {0}. Reason: {1}' -f $workingDirectory, $Error[0].Exception.Message)
        }
    }

    $acl = Get-Acl -Path $workingDirectory
    $hasFullControl = $acl.Access | Where-Object {
        $_.IdentityReference -match 'Everyone' -and $_.FileSystemRights -match 'FullControl'
    }
    if (-not $hasFullControl) {
        $accessRule = New-Object -TypeName System.Security.AccessControl.FileSystemAccessRule(
            'Everyone', 'FullControl', 'ContainerInherit, ObjectInherit', 'None', 'Allow'
        )
        $acl.AddAccessRule($accessRule)
        Set-Acl -Path $workingDirectory -AclObject $acl -ErrorAction SilentlyContinue
    }
    #endRegion

    #region set tls policy
    $supportedTLSversions = [enum]::GetValues('Net.SecurityProtocolType')
    if (($supportedTLSversions -contains 'Tls13') -and ($supportedTLSversions -contains 'Tls12')) {
        [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol::Tls13 -bor [System.Net.SecurityProtocolType]::Tls12
    } elseif ($supportedTLSversions -contains 'Tls12') {
        [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12
    } else {
        Write-Information -MessageData 'TLS 1.2 and/or TLS 1.3 are not supported on this system. This download may fail!'
        if ($PSVersionTable.PSVersion.Major -lt 3) {
            Write-Information -MessageData 'PowerShell 2 / .NET 2.0 doesn''t support TLS 1.2.'
        }
    }
    #endRegion

    #region get os architecture
    try {
        $osArchitecture = (Get-CimInstance -ClassName 'Win32_OperatingSystem' -ErrorAction Stop).OSArchitecture
    } catch {
        Write-Information -MessageData 'Failed to determine OS architecture. Defaulting to win-x64.'
        $osArchitecture = '64-bit'
    }
    $rid = if ($osArchitecture -eq '64-bit') {
        'win-x64'
    } elseif ($osArchitecture -eq '32-bit') {
        'win-x86'
    } else {
        'win-arm64'
    }
    #endRegion

    #region fetch latest download url for .net desktop runtime 8
    try {
        $downloadUrl = (Invoke-RestMethod -Uri $url -UseBasicParsing -ErrorAction Stop).releases |
            Sort-Object -Property 'release-date' -Descending |
            Select-Object -First 1 |
            Select-Object -ExpandProperty 'windowsdesktop' |
            Select-Object -ExpandProperty 'files' |
            Where-Object { $_.rid -eq $rid -and $_.url -match '\.exe$' } |
            Select-Object -ExpandProperty 'url'
    } catch {
        throw ('Failed to retrieve .NET release information from {0}. Reason: {1}' -f $url, $Error[0].Exception.Message)
    }
    if (-not $downloadUrl) {
        throw ('Failed to find a suitable .NET Desktop Runtime 8 download for RID {0} from {1}' -f $rid, $url)
    } else {
        Write-Information -MessageData ('Latest .NET Desktop Runtime 8 installer URL: {0}' -f $downloadUrl)
    }
    #endRegion

    #region download installer
    try {
        Write-Information -MessageData ('Downloading .NET Desktop Runtime 8 installer from {0}' -f $downloadUrl)
        Start-BitsTransfer -Source $downloadUrl -Destination $appPath -ErrorAction Stop
    } catch {
        throw ('Failed to download .NET Desktop Runtime 8 installer from {0}. Reason: {1}' -f $downloadUrl, $Error[0].Exception.Message)
    }
    Unblock-File -Path $appPath -ErrorAction SilentlyContinue
    #endRegion

    #region install .net desktop runtime 8
    try {
        $installCommand = '{0} {1}' -f $appPath, ($installerArguments -join ' ')
        Write-Information -MessageData ('Executing installer command: {0}' -f $installCommand)
        Start-Process -FilePath $appPath -ArgumentList $installerArguments -Wait -NoNewWindow
    } catch {
        throw ('Failed to execute .NET Desktop Runtime 8 installer. Reason: {0}' -f $Error[0].Exception.Message)
    }
    #endRegion

    #region verify installation
    $installedRuntimes = Get-InstalledDotNetDesktopRuntime
    $runtime8Installed = $installedRuntimes | Where-Object { $_.MajorVersion -eq 8 }
    if ($runtime8Installed) {
        Write-Information -MessageData '.NET Desktop Runtime 8 installation verified successfully.'
    } else {
        throw 'Error: .NET Desktop Runtime 8 installation failed or could not be verified.'
    }
    #endRegion
} end {
    #region cleanup installer
    Remove-Item -Path $appPath -Force -ErrorAction SilentlyContinue
    #endRegion
}
```

## Usage

Soji will run just fine without any command-line options passed, but you may want to read up on the options below to see if you have a use-case for them.

### Arguments

| Long Name            | Short Name | Example                                                  | Description                                                                                                                  |
| -------------------- | ---------- | -------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------- |
| `--drives`           | `-d`       | C,D                                                      | (Default: All fixed drives) A comma-separated list of volume letters to process.                                             |
| `--days`             | `-y`       | 10.1                                                     | (Default: 7.0) The maximum number of days between now and the last write time of files to keep.                              |
| `--json`             | `-j`       |                                                          | (Default: false) Include JSON file output.                                                                                   |
| `--csv`              | `-c`       |                                                          | (Default: false) Include CSV file output.                                                                                    |
| `--systempaths`      | `-p`       | "Temp\|\\.txt$","system32\Temp"                          | (Default: null) An optional comma separated list of additional paths to scan for files to clean with regex file filtering.   |
| `--userpaths`        | `-u`       | "AppData\Local\Adobe\|\\.log$","AppData\Local\Microsoft" | (Default: null) An optional comma separated list of additional user paths to scan with regex file filtering.                 |
| `--purge-downloads`  |            |                                                          | (Default: false) Purge all user Downloads folders.                                                                           |
| `--clean-winsxs`     |            |                                                          | (Default: false) Enable WinSxS component cleanup.                                                                            |
| `--run-cleanmgr`     |            |                                                          | (Default: false) Enable legacy cleanmgr execution.                                                                           |
| `--empty-recyclebin` |            |                                                          | (Default: false) Empty the recycle bin. May still occur when running the legacy cleanmgr.                                    |
| `--winsxs-seconds`   |            |                                                          | (Default: 300) The number of seconds to wait for WinSxS processing when --clean-winsxs or --all is passed.                   |
| `--all`              |            |                                                          | (Default: false) Enable all possible cleaning tools (--purge-downloads, --clean-winsxs, --run-cleanmgr, --empty-recyclebin). |
| `--debug`            |            |                                                          | (Default: false) Set this flag to enable debug output in the console.                                                        |

### Examples

*Clean all fixed drives with all available cleaners:*

```shell
Soji.exe --all
```

*Clean the C and F drives:*

```shell
Soji.exe --drives C,F
```

*Clean the C drive including all user Download directories in PowerShell:*

```powershell
Start-Process -FilePath "Soji.exe" `
              -ArgumentList "--drives C", "--purge-downloads" `
              -Wait
```

*Clean all fixed drives and read back the file JSON report in PowerShell:*

```powershell
Start-Process -FilePath "$pwd\Soji.exe" `
              -ArgumentList "--json" `
              -Wait
$sojiFileReport = (ConvertFrom-Json -InputObject (Get-Content -Path "$pwd\SojiLogs\Soji-files.json")).Files
```

*Clean all fixed drives with all available cleaners including the following:*

*1. All `.txt` files that start with "Arigatou" under `?:\MyFolder\MySubfolder`*

*2. All `.log` files under the user paths `?:\Users\<Username>\AppData\MyAppPath\Logs`*

*Any target files must have a last write time greater than 21.5 days.*

*Read back the file CSV report in PowerShell.*

```powershell
Start-Process -FilePath "$pwd\Soji.exe" `
              -ArgumentList `
                '--csv', `
                '-p "MyFolder\MySubfolder|^Arigatou.*\.txt$"', `
                '-u "AppData\MyAppPath\Logs|\.log$"', `
                '--days 21.5' `
                '--all' `
              -Wait
$sojiFileReport = Import-CSV -Path "$pwd\SojiLogs\Soji-files.csv"
```

## Outputs

Soji outputs logs in a folder under the current working directory called `SojiLogs`. If `--csv` and/or `--json` are passed, the requested types of reports will be generated in the same `SojiLogs` folder. Historical logs and reports will be prepended with their last write time in the format `_yyyyMMdd_hhmmss`.

Log and Report Files:

```plainText
.\SojiLogs\soji.log                 # General purpose log file

.\SojiLogs\soji-files.csv           # CSV report of files that were processed
.\SojiLogs\soji-directories.csv     # CSV report of directories that were processed
.\SojiLogs\soji-volumecaches.csv    # CSV report of volume caches that were processed
.\SojiLogs\soji-summary.csv         # CSV summary report of drives that were processed

.\SojiLogs\soji-files.json          # JSON report of files that were processed
.\SojiLogs\soji-directories.json    # JSON report of directories that were processed
.\SojiLogs\soji-volumecaches.json   # JSON report of volume caches that were processed
.\SojiLogs\soji-summary.json        # JSON summary report of drives that were processed
```

## Acknowledgments

- [Serilog](https://github.com/serilog/serilog) - General logging and JSON report output
- [CommandlineParser](https://github.com/commandlineparser/commandline) - Parsing arguments
- [CSVHelper](https://github.com/JoshClose/CsvHelper) - CSV Report output
- [BurnBytes](https://github.com/builtbybel/burnbytes) - Base logic for cleanmgr hooks

## Changelog

### 2026-03-23

- Document modification

### 2025-05-06

- Initial version of the document
