---
id: '63c35c04-4327-45d0-a249-202cf6c67088'
slug: /63c35c04-4327-45d0-a249-202cf6c67088
title: 'CPUTempMon'
title_meta: 'CPUTempMon'
keywords: ['cpu', 'cpu-temperature', 'cpu-temp-mon', 'temperature-monitoring', 'libre', 'libre-hardware-monitor']
description: 'CpuTempMonitor is a simple utility that retrieves CPU temperature data and outputs it as structured JSON. It utilizes a two-tier approach to maximize hardware compatibility across different manufacturer BIOS implementations.'
tags: ['cpu', 'monitoring', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-03-30
---

<br />
<div align="center">
    <a href="https://github.com/ProVal-Tech/CpuTempMonitor">
        <img src="https://raw.githubusercontent.com/ProVal-Tech/proval-docs/refs/heads/main/static/img/docs/63c35c04-4327-45d0-a249-202cf6c67088/image1.webp" alt="Logo" width="150" height="150">
    </a>
    <h3 align="center">CpuTempMonitor</h3>
    <p align="center">
      A lightweight Windows CPU temperature retrieval utility.
    </p>
</div>

## About

CpuTempMonitor is a simple utility that retrieves CPU temperature data and outputs it as structured JSON. It utilizes a two-tier approach to maximize hardware compatibility across different manufacturer BIOS implementations.

The primary method uses `LibreHardwareMonitor` for highly accurate, per-core direct hardware access. If the system's firmware blocks this (common on enterprise laptops like Lenovo ThinkPads or Dell Latitudes), the application gracefully falls back to querying Windows Management Instrumentation (`MSAcpi_ThermalZoneTemperature`).

### Built With

- [.NET 10.0](https://dotnet.microsoft.com/en-us/download/dotnet/10.0)

### Important Note

Reading hardware sensors and WMI thermal data **requires the application to be run with Administrator privileges**. If run as a standard user, the output will return empty sensor arrays.

## Getting Started

Install the .NET 10.0 runtime, ensure you run your terminal as an Administrator, and start querying temperatures!

### Prerequisites

**.NET 10.0 Desktop Runtime:**

```shell
winget install Microsoft.DotNet.DesktopRuntime.10
```

***Or***

```powershell
# PowerShell installation of .NET Desktop Runtime 10.x.xx (latest version)
<#
.SYNOPSIS
    Installs the latest available .NET Desktop Runtime 10 version if it is not already installed.

.DESCRIPTION
    Checks the local endpoint for installed Microsoft Windows Desktop Runtime versions by calling
    Get-InstalledDotNetDesktopRuntime. If major version 10 is already installed, the script exits
    without changes.

    If not installed, the script:
    - Creates a working directory under ProgramData.
    - Ensures required ACL permissions on that directory.
    - Enforces TLS 1.2/1.3 for outbound web requests.
    - Detects OS architecture and maps it to the appropriate RID.
    - Retrieves the latest .NET 10 Windows Desktop Runtime installer URL from Microsoft's
      official release metadata feed.
    - Downloads and silently installs the runtime.
    - Verifies installation and cleans up the installer binary.

    This script is intended for automated execution in RMM/automation workflows.

.EXAMPLE
    .\Install-dotNet10DesktopRuntime.ps1

    Runs the full detection-and-install workflow. If .NET Desktop Runtime 10 is already installed,
    the script returns a no-action message.

.OUTPUTS
    System.String

    Returns:
    - '.NET Desktop Runtime 10 is already installed. No action is required.' when no install is needed.

    Writes informational progress messages during install path execution and throws terminating
    errors when download, install, or verification fails.

.NOTES
    - Requires Windows with PowerShell 5.1+.
    - Requires administrative privileges for install and ProgramData operations.
    - Uses BITS for download and Start-Process for silent installer execution.
    - Release metadata source: https://builds.dotnet.microsoft.com/dotnet/release-metadata/10.0/releases.json
#>
begin {
    #region globals
    $ProgressPreference = 'SilentlyContinue'
    $WarningPreference = 'SilentlyContinue'
    $InformationPreference = 'Continue'
    $ConfirmPreference = 'None'
    #endRegion

    #region variables
    $appName = 'dotNet10DesktopRuntime'
    $workingDirectory = '{0}\_Automation\Script\{1}' -f $env:ProgramData, $appName
    $appPath = '{0}\{1}.exe' -f $workingDirectory, $appName
    $url = 'https://builds.dotnet.microsoft.com/dotnet/release-metadata/10.0/releases.json'
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
            - Name          : Friendly display name (for example, Microsoft Windows Desktop Runtime - 10.0.1)
            - MajorVersion  : Major version number as Int32
            - Version       : Full semantic version string
            - InstalledPath : Runtime install path reported by dotnet

        .EXAMPLE
            $installedRuntimes = Get-InstalledDotNetDesktopRuntime

            Returns all installed Windows Desktop Runtime versions.

        .EXAMPLE
            Get-InstalledDotNetDesktopRuntime | Where-Object { $_.MajorVersion -eq 10 }

            Returns only .NET 10 Windows Desktop Runtime entries.

        .NOTES
            Used by this script to verify whether .NET Desktop Runtime 10 is already present
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
    #region check if .net desktop runtime 10 is installed
    $installedRuntimes = Get-InstalledDotNetDesktopRuntime
    $runtime10Installed = $installedRuntimes | Where-Object { $_.MajorVersion -eq 10 }
    if ($runtime10Installed) {
        return '.NET Desktop Runtime 10 is already installed. No action is required.'
    } else {
        Write-Information -MessageData '.NET Desktop Runtime 10 is not installed. Proceeding with installation.'
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

    #region fetch latest download url for .net desktop runtime 10
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
        throw ('Failed to find a suitable .NET Desktop Runtime 10 download for RID {0} from {1}' -f $rid, $url)
    } else {
        Write-Information -MessageData ('Latest .NET Desktop Runtime 10 installer URL: {0}' -f $downloadUrl)
    }
    #endRegion

    #region download installer
    try {
        Write-Information -MessageData ('Downloading .NET Desktop Runtime 10 installer from {0}' -f $downloadUrl)
        Start-BitsTransfer -Source $downloadUrl -Destination $appPath -ErrorAction Stop
    } catch {
        throw ('Failed to download .NET Desktop Runtime 10 installer from {0}. Reason: {1}' -f $downloadUrl, $Error[0].Exception.Message)
    }
    Unblock-File -Path $appPath -ErrorAction SilentlyContinue
    #endRegion

    #region install .net desktop runtime 10
    try {
        $installCommand = '{0} {1}' -f $appPath, ($installerArguments -join ' ')
        Write-Information -MessageData ('Executing installer command: {0}' -f $installCommand)
        Start-Process -FilePath $appPath -ArgumentList $installerArguments -Wait -NoNewWindow
    } catch {
        throw ('Failed to execute .NET Desktop Runtime 10 installer. Reason: {0}' -f $Error[0].Exception.Message)
    }
    #endRegion

    #region verify installation
    $installedRuntimes = Get-InstalledDotNetDesktopRuntime
    $runtime10Installed = $installedRuntimes | Where-Object { $_.MajorVersion -eq 10 }
    if ($runtime10Installed) {
        Write-Information -MessageData '.NET Desktop Runtime 10 installation verified successfully.'
    } else {
        throw 'Error: .NET Desktop Runtime 10 installation failed or could not be verified.'
    }
    #endRegion
} end {
    #region cleanup installer
    Remove-Item -Path $appPath -Force -ErrorAction SilentlyContinue
    #endRegion
}
```

## Usage

CpuTempMonitor does not require any command-line arguments. Simply execute the binary from an elevated terminal and it will output structured JSON to the standard output (STDOUT).

### Examples

*Run directly in the console:*

```shell
CpuTempMonitor.exe
```

*Capture the JSON output and parse the CPU Package temperature in PowerShell:*

```powershell
$cpuData = CpuTempMonitor.exe | ConvertFrom-Json
$packageTemp = $cpuData.Sensors | Where-Object { $_.Sensor -eq 'CPU Package' }
return "Current CPU Package Temp: $($packageTemp.Current)°C"
```

*Pipe the output directly into a JSON file for logging:*

```powershell
CpuTempMonitor.exe > cpu-temp-$(Get-Date -Format 'yyyyMMdd-hhmmss').json
```

## Outputs

Because hardware access varies drastically depending on OEM BIOS implementations, CpuTempMonitor handles three primary scenarios gracefully:

### Scenario 1: Successful Direct Hardware Access (Ideal)

When the BIOS allows direct access (common on custom desktops and standard consumer laptops), you get highly accurate, per-core temperatures with historical maximums.

```json
[
  {
    "Hardware": "12th Gen Intel Core i7-1270P",
    "Sensors": [
      {
        "Sensor": "Core #1",
        "Current": 45.0,
        "Maximum": 78.0
      },
      {
        "Sensor": "Core #2",
        "Current": 42.0,
        "Maximum": 75.0
      },
      {
        "Sensor": "CPU Package",
        "Current": 46.0,
        "Maximum": 80.0
      }
    ]
  }
]
```

### Scenario 2: WMI Fallback Triggered

If direct hardware reading is blocked by the manufacturer but Windows ACPI interfaces are exposed, the program falls back to WMI. Note that WMI returns generic ACPI Thermal Zone names instead of specific core names, and `Maximum` is usually `null` unless the BIOS reports a Critical Trip Point.

```json
[
  {
    "Hardware": "12th Gen Intel Core i7-1270P",
    "Sensors": [
      {
        "Sensor": "ACPI\\ThermalZone\\THM0",
        "Current": 52.5,
        "Maximum": null
      },
      {
        "Sensor": "ACPI\\ThermalZone\\THM1",
        "Current": 48.0,
        "Maximum": 105.0
      }
    ]
  }
]
```

### Scenario 3: Completely Blocked

On highly restricted systems where both direct hardware registers and WMI interfaces are locked down at the firmware level, the application will safely return an empty sensors array without crashing.

```json
[
  {
    "Hardware": "12th Gen Intel Core i7-1270P",
    "Sensors": []
  }
]
```

## Acknowledgments

- [LibreHardwareMonitor](https://github.com/LibreHardwareMonitor/LibreHardwareMonitor) - Primary direct hardware telemetry
- [System.Management](https://learn.microsoft.com/en-us/dotnet/api/system.management) - WMI fallback queries for restricted hardware

## Changelog

### 2026-03-31

- Initial version of the document
