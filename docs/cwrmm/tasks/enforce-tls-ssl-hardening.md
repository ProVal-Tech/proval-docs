---
id: '79112007-ac74-4fde-97f5-59d56dbe0282'
slug: /79112007-ac74-4fde-97f5-59d56dbe0282
title: 'Enforce TLS/SSL Hardening (TLS 1.2 Upgrade)'
title_meta: 'Enforce TLS/SSL Hardening (TLS 1.2 Upgrade)'
keywords: ['tls','ssl','disable','enable','security-hardening','tls-1.2']
description: 'Enforces Windows TLS/SSL hardening for ConnectWise RMM and emits the enabled protocol list.'
tags: ['tls','windows']
draft: false
unlisted: false
last_update:
  date: 2026-07-28
---

## Summary

This task strengthens the secure-connection settings on a Windows device so it meets the platform's TLS 1.2 requirement and can keep communicating with our services reliably. In plain terms, it switches off the old, insecure ways of connecting (SSL 3.0, TLS 1.0 and TLS 1.1), switches on the modern, supported ways (TLS 1.2, and TLS 1.3 on devices that support it), tightens the underlying Windows and .NET security options, and removes a small set of weak encryption methods. When it finishes, it records the list of protocols that are now enabled on the device in the [TLS_SSL_Enabled_Protocols](/docs/a90fed7d-ec54-429a-a7cf-14a1af8870bb) custom field, so you can see at a glance what each machine is using.

We provide this task because the platform is retiring the older protocols. A device that is not configured for TLS 1.2 may stop talking to our data centres after the regional rollout dates, so this task is the supported way to bring a device into compliance and to keep its connections secure. It is built to be safe and repeatable: it only touches settings that are not already correct, so running it again on a device that is already compliant changes nothing and causes no disruption. It is normally launched automatically by the paired compliance monitor whenever a device is found to need it, but it can also be run on demand.

A few things to keep in mind before it runs:

- It makes real changes to system security settings and runs with system-level rights, so treat it as a maintenance action rather than a read-only check.
- On very old operating systems (Windows Server 2008, Windows Server 2008 R2 and earlier) the modern TLS 1.2 protocol cannot be switched on, because the operating system simply does not support it. On those systems this task will still switch the old protocols off, which is the right thing for security, but it also means that after a reboot the device may have no supported protocol left and could lose connectivity. For those machines the required step is an operating-system upgrade, not this task, so please confirm the upgrade path before running it there.
- On supported systems (Windows Server 2012 and newer, and Windows 8 and newer) the task switches TLS 1.2 on, and TLS 1.3 where available, at the same time, so connectivity is preserved.

About the reboot - please read this carefully, because it controls when the changes actually take effect:

- The new settings are saved to the device straight away, but Windows only loads them at start-up. Until the device is rebooted it keeps using the previous connection settings, so the hardening is not yet active in the running system.
- The task has a `ForceReboot` option. When this option is enabled and the task actually changed at least one setting, it schedules a forced reboot about 60 seconds after it finishes, so the new settings take effect without any further action. If the task changed nothing because the device was already compliant, it will not reboot, even with `ForceReboot` enabled, so a routine re-run will never restart a machine by surprise.
- When `ForceReboot` is left disabled, the task does not reboot the device. The settings stay saved but inactive until the device is rebooted some other way, so you should plan a reboot during a maintenance window to make the hardening live.
- Because the compliance monitor reads the saved settings rather than the in-memory state, a device can appear compliant before it has been rebooted. That is expected; the reboot is still required for the new protocol and encryption settings to actually be in use.

In short: run this task to bring a device into TLS 1.2 compliance, plan for a reboot (either through `ForceReboot` or a scheduled restart) so the changes take effect, and on the oldest operating systems confirm the operating-system upgrade path first, since the task cannot enable TLS 1.2 where the system does not support it.

## Sample Run

![Image1](../../../static/img/docs/79112007-ac74-4fde-97f5-59d56dbe0282/image1.webp)

## Dependencies

- [Custom Field: TLS_SSL_Enabled_Protocols](/docs/a90fed7d-ec54-429a-a7cf-14a1af8870bb)
- [Solution: TLS/SSL Security Hardening](/docs/13ac3912-863b-41fe-bb61-dfd681f06fa8)

## Custom Fields

| Name | Example | Level | Type | Default Value | Description |
| --- | --- | --- | --- | --- | --- |
| [TLS_SSL_Enabled_Protocols](/docs/a90fed7d-ec54-429a-a7cf-14a1af8870bb) | `TLS 1.2, TLS 1.3` | `Endpoint` | `Text Box` | | Comma-separated list of TLS/SSL protocol versions currently enabled on the device |

## User Parameters

| Name | Required | Type | Default Value | Description |
| ---- | -------- | ---- | ------------- | ----------- |
| ForceReboot | No | Flag | | If set and a change was made, forces reboot 60s after run, else none. Changes apply only after the next reboot, so enable ForceReboot or reboot manually. |

## Task Setup Path

- **Tasks Path:** `AUTOMATION` ➞ `Tasks`  
- **Task Type:** `Script Editor`  

## Task Creation

### **Description**

- **Name:** `Enforce TLS/SSL Hardening (TLS 1.2 Upgrade)`  
- **Description:**

```PlainText
Enforces TLS/SSL hardening for the TLS 1.2 mandate. Disables SSL 3.0, 1.0, 1.1; enables TLS 1.2 and 1.3 where supported on Server and Client; sets .NET strong-crypto in both hives; disables weak ciphers. Only changed values are written. 
ForceReboot: if set and a change was made, forces reboot 60s after run, else none. Changes apply only after the next reboot, so enable ForceReboot or reboot manually.
```

- **Category:** `Security`

![Image2](../../../static/img/docs/79112007-ac74-4fde-97f5-59d56dbe0282/image2.webp)

### **Parameters**

| Parameter Name | Required Field | Parameter Type | Default Value |
| -------------- | -------------- | -------------- | ------------- |
| ForceReboot | Disabled | Flag | Disabled |

**ForceReboot:**  
    ![Image3](../../../static/img/docs/79112007-ac74-4fde-97f5-59d56dbe0282/image3.webp)

![Image4](../../../static/img/docs/79112007-ac74-4fde-97f5-59d56dbe0282/image4.webp)

### **Script Editor**

#### Row 1 Function: PowerShell script

- **Notes:** `<Leave it Blank>`  
- **Use Generative AI Assist for script creation:** `False`  
- **Expected time of script execution in seconds:** `300`  
- **Continue on Failure:** `False`  
- **Run As:** `System`  
- **Operating System:** `Windows`  
- **PowerShell Script Editor:**

```PowerShell
#requires -Version 3.0

<#
.SYNOPSIS
    Enforces Windows TLS/SSL hardening for ConnectWise RMM and emits the enabled protocol list.

.DESCRIPTION
    This script makes changes to the system; it is not read-only. It hardens the TLS/SSL stack on
    Windows by disabling the legacy protocols SSL 3.0, TLS 1.0 and TLS 1.1, enabling the modern
    protocols TLS 1.2 and TLS 1.3 where the operating system supports them, setting the .NET
    Framework strong-cryptography values (SchUseStrongCrypto and SystemDefaultTlsVersions) for both
    the 64-bit and 32-bit framework hives, and disabling a fixed list of weak TLS 1.2 cipher suites.

    Every registry value and cipher change is applied only when the current state differs from the
    desired state, and each actual change is tracked. The tracked change flag drives the reboot
    decision: the machine reboots only when the ForceReboot parameter is enabled and at least one
    setting was changed during the run.

    After all changes are applied the script reads the live SCHANNEL registry state for SSL 3.0,
    TLS 1.0, TLS 1.1, TLS 1.2 and TLS 1.3 on both the Server and the Client endpoints and returns
    only the protocols that are currently enabled. A protocol is enabled when it is enabled on both
    endpoints. When a protocol registry key is absent the operating system default for that protocol
    is used, so default-enabled protocols are included in the result; any protocol whose key
    forcefully disables it (Enabled = 0) is excluded. The returned enabled list is the only value the
    script emits.

    The script is written for ConnectWise RMM (ConnectWise Platform). It never writes to a
    custom field itself; it emits exactly one line to standard output (the comma-separated list of
    enabled protocols), and ConnectWise RMM stores that output directly into the custom field
    documented in the mapping table below. By design the script produces no informational, warning,
    progress or host console output; any failure is raised as a terminating error so ConnectWise RMM
    records the execution as failed.

    Authored for Windows and compatible with Windows PowerShell 3.0 and later so it runs on the older
    systems where enabling TLS 1.2 is most needed, including Windows Server 2012, Windows Server 2012
    R2, Windows 8 and Windows 8.1. The script verifies at start that it is running elevated
    (Administrator or SYSTEM) and throws immediately if it is not.

    TLS 1.2 is enabled only on operating systems that support it (Windows Server 2012 / Windows 8,
    NT 6.2, and later). Windows Server 2008, Windows Server 2008 R2 and earlier are intentionally
    left without a forced TLS 1.2 enablement, in line with the TLS 1.2 rollout notice; the legacy
    protocols are still disabled on those systems. Cipher suite management is skipped automatically,
    and not treated as a failure, on systems where the TLS cipher suite cmdlets do not exist (before
    Windows 10 / Windows Server 2016).

    The SCHANNEL protocol settings, the cipher-suite changes and the .NET strong-cryptography values
    are loaded by Windows at start-up, so they do not take effect in the running system until the
    device is rebooted. The ForceReboot parameter controls whether the script performs that reboot
    itself; when it is disabled the changes remain pending on disk until the next reboot.

.PARAMETER ForceReboot
    Controls whether the device is rebooted after hardening changes are applied. Flag to enable a
    forced reboot; any other value, including an empty value, leaves rebooting disabled. A reboot is
    performed only when this parameter is enabled and the current run actually changed at least one
    setting, so a re-run against an already compliant machine never reboots. ConnectWise RMM supplies
    the value through the script variable at execution time; configure it in the script settings on
    the platform.
    When a reboot is triggered it is a forced reboot scheduled 60 seconds after the script finishes,
    giving ConnectWise RMM time to capture the emitted protocol list; the reboot only fires when the
    run changed at least one setting.

.EXAMPLE
    .\Invoke-TlsSslHardeningCWRMM.ps1

    Runs under ConnectWise RMM with the ForceReboot parameter set in the platform script settings. The
    script hardens the TLS/SSL settings, reads back the live enabled protocol list and emits it as its
    only output, and reboots only when ForceReboot is enabled and a setting actually changed.

.NOTES
    - Requires Administrator or System privileges. The script checks elevation at start and throws
      immediately if it is not running elevated; it does not rely on the #requires -RunAsAdministrator
      directive because that directive is not recognized on Windows PowerShell 3.0.
    - Requires Windows PowerShell 3.0 or later. This covers Windows Server 2012 (PowerShell 3.0),
      Windows Server 2012 R2 and Windows 8.1 (PowerShell 4.0) and all later systems. Hosts running
      PowerShell 2.0 (for example Windows Server 2008 R2 or Windows 7 without Windows Management
      Framework 3 or later) are below the supported floor and the script will not start on them.
    - Designed for ConnectWise RMM (ConnectWise Platform); the ForceReboot value is provided by
      the platform at execution time through the @ForceReboot@ script variable token.
    - TLS 1.2 is enabled only where the operating system supports it (Windows Server 2012 / Windows 8
      and later). Windows Server 2008, Windows Server 2008 R2 and earlier are intentionally not forced
      to TLS 1.2, consistent with the TLS 1.2 rollout notice; legacy protocols are still disabled there.
    - Cipher suite enumeration and disabling use the Get-TlsCipherSuite and Disable-TlsCipherSuite
      cmdlets, which exist only on Windows 10 / Windows Server 2016 and later; on earlier systems that
      step is skipped automatically and is not treated as a failure.
    - The returned value reflects the live enabled state read after the changes, not the list of
      protocols the script wrote. Because the script always disables the three legacy protocols, they
      never appear in the returned list; an empty string means no protocol is enabled on the device.
    - The script emits exactly one line to standard output; ConnectWise RMM stores that line in the
      custom field listed in the mapping table. The script itself never writes to a custom field.
    - The script produces no console or log output by design; failures are raised as terminating
      errors so the ConnectWise RMM run is recorded as failed.
    - When run locally outside ConnectWise RMM the @ForceReboot@ token is not substituted, so the
      script behaves as if ForceReboot is disabled and never reboots.

.OUTPUTS
    System.String

    A single comma-separated string of the TLS/SSL protocol versions currently enabled on the device,
    read from the live SCHANNEL registry state after hardening, for example TLS 1.2, TLS 1.3 on a
    current server, TLS 1.2 on Windows Server 2012 or Windows Server 2016, or an empty string when no
    protocol is enabled (for example Windows Server 2008 R2 after the legacy protocols are disabled).

    Custom Field Mapping Table:

    | Custom Field Name            | Data Type | Description                                                                                                                                                                                                                                                                ...... |
    |------------------------------|-----------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------......|
    | TLS_SSL_Enabled_Protocols    | String    | Comma-separated list of TLS/SSL protocol versions currently enabled on the device, read from the live SCHANNEL registry state after hardening. OS default-enabled protocols are included when their key is absent; any protocol whose key forcefully disables it is excluded.        |
#>

[CmdletBinding()]
param()

#region globals
$ProgressPreference = 'SilentlyContinue'
$ErrorActionPreference = 'Stop'
$WarningPreference = 'SilentlyContinue'
#endregion

#region variables
$forceReboot = '@ForceReboot@' -match '1|Yes|True'
$schannelProtocolRoot = 'HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols'
$legacyProtocols = @('SSL 3.0', 'TLS 1.0', 'TLS 1.1')
$weakCiphers = @(
    'TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384',
    'TLS_RSA_WITH_AES_256_CBC_SHA256',
    'TLS_RSA_WITH_AES_256_GCM_SHA384',
    'TLS_RSA_WITH_AES_128_CBC_SHA256',
    'TLS_RSA_WITH_AES_128_GCM_SHA256',
    'TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256'
)
$disableProtocolValues = @{
    Enabled           = 0
    DisabledByDefault = 1
}
$enableProtocolValues = @{
    Enabled           = 1
    DisabledByDefault = 0
}
$dotNetStrongCryptoValues = @{
    SchUseStrongCrypto       = 1
    SystemDefaultTlsVersions = 1
}
$dotNetFrameworkPaths = @(
    'HKLM:\SOFTWARE\Microsoft\.NETFramework\v4.0.30319',
    'HKLM:\SOFTWARE\WOW6432Node\Microsoft\.NETFramework\v4.0.30319'
)
$changesMade = $false
$shutdownPath = 'C:\Windows\System32\shutdown.exe'
#endregion

#region functions
function Get-OsDefaultTlsVersion {
    <#
    .SYNOPSIS
        Returns the TLS and SSL protocol versions the current operating system supports by default.
    .DESCRIPTION
        Queries Win32_OperatingSystem and maps the OS version and build number to the set of protocol
        versions the platform enables by default, expressed as the strings 1.0, 1.1, 1.2, 1.3 and
        SSL 3.0. The result drives which modern protocols the hardening logic enables and which
        protocols the enabled-state read treats as on when their registry key is absent. Throws when
        the operating system version cannot be determined.

        TLS 1.2 is reported as enabled by default on Windows Server 2012 / Windows 8 (NT 6.2) and
        later, and TLS 1.3 only on Windows Server 2022 (build 20348) and later.
    .EXAMPLE
        Get-OsDefaultTlsVersion

        Returns an array such as 1.0, 1.1, 1.2 on Windows Server 2016.
    #>
    [CmdletBinding()]
    [OutputType([System.Object[]])]
    param()

    #region main
    $osInfo = Get-CimInstance -ClassName 'Win32_OperatingSystem' -ErrorAction SilentlyContinue
    if ($null -eq $osInfo) {
        throw 'Unable to determine the operating system version from Win32_OperatingSystem.'
    }

    $version = [version]$osInfo.Version
    $build = [int]$osInfo.BuildNumber

    if ($version -lt [version]'6.2') {
        return @('SSL 3.0', '1.0')
    } elseif ($version -lt [version]'10.0') {
        return @('SSL 3.0', '1.0', '1.1', '1.2')
    } elseif ($build -ge 20348) {
        return @('1.0', '1.1', '1.2', '1.3')
    } else {
        return @('1.0', '1.1', '1.2')
    }
    #endregion
}

function Set-RegistryValue {
    <#
    .SYNOPSIS
        Ensures a registry key exists and that the supplied DWORD values match the desired state.
    .DESCRIPTION
        Creates the registry key at the given path when it is missing and writes each name and value
        pair from the Values hashtable only when the current value differs from the desired value.
        Returns True when at least one key or value was created or modified, otherwise False, so the
        caller can track whether a change that requires a reboot was made. State changes honour
        ShouldProcess so the function supports -WhatIf.
    .PARAMETER Path
        Full registry path, for example HKLM:\SOFTWARE\Microsoft\.NETFramework\v4.0.30319.
    .PARAMETER Values
        Hashtable of DWORD value names to the integer each must hold.
    .EXAMPLE
        Set-RegistryValue -Path 'HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.2\Server' -Values @{ Enabled = 1; DisabledByDefault = 0 }

        Enables TLS 1.2 on the server side, writing only the values that are not already correct.
    #>
    [CmdletBinding(SupportsShouldProcess = $true)]
    [OutputType([System.Boolean])]
    param(
        [Parameter(Mandatory = $true, HelpMessage = 'Full registry path to configure.')]
        [System.String]$Path,

        [Parameter(Mandatory = $true, HelpMessage = 'Hashtable of DWORD value names and their required integer values.')]
        [System.Collections.Hashtable]$Values
    )

    #region main
    $changed = $false

    if (-not (Test-Path -Path $Path)) {
        if ($PSCmdlet.ShouldProcess($Path, 'Create registry key')) {
            New-Item -Path $Path -Force -ErrorAction Stop | Out-Null
            $changed = $true
        }
    }

    foreach ($name in $Values.Keys) {
        $desired = $Values[$name]
        $current = (Get-ItemProperty -Path $Path -Name $name -ErrorAction SilentlyContinue).$name
        if ($current -ne $desired) {
            if ($PSCmdlet.ShouldProcess($Path, ('Set {0} to {1}' -f $name, $desired))) {
                New-ItemProperty -Path $Path -Name $name -Value $desired -PropertyType DWord -Force -ErrorAction Stop | Out-Null
                $changed = $true
            }
        }
    }

    $changed
    #endregion
}

function Get-EnabledTlsProtocol {
    <#
    .SYNOPSIS
        Returns the TLS and SSL protocols that are currently enabled on the device.
    .DESCRIPTION
        Reads the live SCHANNEL registry state under the supplied protocol root for every name in
        ProtocolNames, evaluating both the Server and the Client endpoints. A protocol is included
        only when it is enabled on both endpoints. When a protocol endpoint key is absent the
        operating-system default supplied through DefaultEnabledProtocols is used, so default-enabled
        protocols are reported as enabled; a key whose Enabled value is 0 (forcefully disabled) is
        never reported as enabled. The names are returned in the same order they are passed in.
    .PARAMETER SchannelProtocolRoot
        Registry root that holds the per-protocol Server and Client subkeys, for example
        HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols.
    .PARAMETER ProtocolNames
        Display names of the protocols to evaluate, for example TLS 1.2 and SSL 3.0.
    .PARAMETER DefaultEnabledProtocols
        Display names of the protocols the operating system enables by default, used when a protocol
        endpoint key does not exist.
    .EXAMPLE
        Get-EnabledTlsProtocol -SchannelProtocolRoot $root -ProtocolNames @('TLS 1.2', 'TLS 1.3') -DefaultEnabledProtocols @('TLS 1.2')

        Returns the subset of TLS 1.2 and TLS 1.3 that is enabled on the device right now.
    #>
    [CmdletBinding()]
    [OutputType([System.String[]])]
    param(
        [Parameter(Mandatory = $true, HelpMessage = 'Registry root holding the per-protocol Server and Client subkeys.')]
        [System.String]$SchannelProtocolRoot,

        [Parameter(Mandatory = $true, HelpMessage = 'Display names of the protocols to evaluate.')]
        [System.String[]]$ProtocolNames,

        [Parameter(Mandatory = $true, HelpMessage = 'Display names of the protocols enabled by the operating system default.')]
        [System.String[]]$DefaultEnabledProtocols
    )

    #region main
    $enabled = @()

    foreach ($protocol in $ProtocolNames) {
        $defaultOn = $DefaultEnabledProtocols -contains $protocol
        $endpointEnabled = @()

        foreach ($endpoint in @('Server', 'Client')) {
            $keyPath = '{0}\{1}\{2}' -f $SchannelProtocolRoot, $protocol, $endpoint
            if (Test-Path -Path $keyPath) {
                $props = Get-ItemProperty -Path $keyPath -ErrorAction SilentlyContinue
                $enabledValue = $props.Enabled
                $disabledByDefaultValue = $props.DisabledByDefault
                if ($enabledValue -eq 1) {
                    $on = $true
                } elseif ($enabledValue -eq 0) {
                    $on = $false
                } elseif ($disabledByDefaultValue -eq 1) {
                    $on = $false
                } elseif ($disabledByDefaultValue -eq 0) {
                    $on = $true
                } else {
                    $on = $defaultOn
                }
            } else {
                $on = $defaultOn
            }

            $endpointEnabled += $on
        }

        if ($endpointEnabled[0] -and $endpointEnabled[1]) {
            $enabled += $protocol
        }
    }

    $enabled
    #endregion
}
#endregion

#region elevation check
$currentIdentity = [System.Security.Principal.WindowsIdentity]::GetCurrent()
$currentPrincipal = New-Object -TypeName 'System.Security.Principal.WindowsPrincipal' -ArgumentList $currentIdentity
$administratorRole = [System.Security.Principal.WindowsBuiltInRole]::Administrator
if (-not $currentPrincipal.IsInRole($administratorRole)) {
    throw 'This script must run with elevated privileges (Administrator or SYSTEM) to modify TLS/SSL registry settings and reboot the device.'
}
#endregion

#region resolve supported tls versions
$supportedTlsVersions = Get-OsDefaultTlsVersion
$enableTls12 = $supportedTlsVersions -contains '1.2'
$enableTls13 = $supportedTlsVersions -contains '1.3'
#endregion

#region disable legacy protocols
foreach ($protocol in $legacyProtocols) {
    foreach ($endpoint in @('Server', 'Client')) {
        $path = '{0}\{1}\{2}' -f $schannelProtocolRoot, $protocol, $endpoint
        try {
            if (Set-RegistryValue -Path $path -Values $disableProtocolValues) {
                $changesMade = $true
            }
        } catch {
            throw ('Failed to disable legacy protocol {0} at {1}. Reason: {2}' -f $protocol, $path, $Error[0].Exception.Message)
        }
    }
}
#endregion

#region enable modern tls protocols
$modernProtocols = @()
if ($enableTls12) {
    $modernProtocols += 'TLS 1.2'
}
if ($enableTls13) {
    $modernProtocols += 'TLS 1.3'
}
foreach ($protocol in $modernProtocols) {
    foreach ($endpoint in @('Server', 'Client')) {
        $path = '{0}\{1}\{2}' -f $schannelProtocolRoot, $protocol, $endpoint
        try {
            if (Set-RegistryValue -Path $path -Values $enableProtocolValues) {
                $changesMade = $true
            }
        } catch {
            throw ('Failed to enable protocol {0} at {1}. Reason: {2}' -f $protocol, $path, $Error[0].Exception.Message)
        }
    }
}
#endregion

#region configure dotnet framework
foreach ($path in $dotNetFrameworkPaths) {
    try {
        if (Set-RegistryValue -Path $path -Values $dotNetStrongCryptoValues) {
            $changesMade = $true
        }
    } catch {
        throw ('Failed to configure .NET strong cryptography at {0}. Reason: {1}' -f $path, $Error[0].Exception.Message)
    }
}
#endregion

#region disable weak cipher suites
$cipherData = $null
$activeCiphers = @()
try {
    $cipherData = Get-TlsCipherSuite -ErrorAction Stop
    if ($cipherData -and $cipherData[0].PSObject.Properties.Name -contains 'Name') {
        $activeCiphers = @($cipherData | Select-Object -ExpandProperty Name)
    } else {
        $activeCiphers = @($cipherData | ForEach-Object -Process { $_.CipherSuite })
    }
} catch {
    $cipherData = $null
}

if ($null -ne $cipherData) {
    foreach ($cipher in $weakCiphers) {
        if ($activeCiphers -contains $cipher) {
            try {
                Disable-TlsCipherSuite -Name $cipher -ErrorAction Stop | Out-Null
                $changesMade = $true
            } catch {
                throw ('Failed to disable weak cipher suite {0}. Reason: {1}' -f $cipher, $Error[0].Exception.Message)
            }
        }
    }
}
#endregion

#region determine enabled protocols and emit result
$shortToDisplayName = @{
    'SSL 3.0' = 'SSL 3.0'
    '1.0'     = 'TLS 1.0'
    '1.1'     = 'TLS 1.1'
    '1.2'     = 'TLS 1.2'
    '1.3'     = 'TLS 1.3'
}
$defaultEnabledProtocols = @()
foreach ($short in $supportedTlsVersions) {
    if ($shortToDisplayName.ContainsKey($short)) {
        $defaultEnabledProtocols += $shortToDisplayName[$short]
    }
}

$allProtocolsOrdered = @('TLS 1.0', 'TLS 1.1', 'TLS 1.2', 'TLS 1.3', 'SSL 3.0')
$enabledProtocols = Get-EnabledTlsProtocol -SchannelProtocolRoot $schannelProtocolRoot -ProtocolNames $allProtocolsOrdered -DefaultEnabledProtocols $defaultEnabledProtocols
$enabledTlsVersions = $enabledProtocols -join ', '

$rebootCheck = $changesMade
if ($forceReboot -and $rebootCheck) {
    & $shutdownPath /r /t 60 /f
}

return $enabledTlsVersions
#endregion
```

![Image5](../../../static/img/docs/79112007-ac74-4fde-97f5-59d56dbe0282/image5.webp)

#### Row 2 Function: Set Custom Field ( TLS_SSL_Enabled_Protocols = %Output% )

- **Notes:** `<Leave it Blank>`  
- **Continue on Failure:** `False`  
- **Operating System:** `Windows`  
- **Custom Field:** `TLS_SSL_Enabled_Protocols`  
- **Value:** `%Output%`

![Image6](../../../static/img/docs/79112007-ac74-4fde-97f5-59d56dbe0282/image6.webp)

#### Row 3 Function: Script Log

- **Notes:** `<Leave it Blank>`  
- **Continue on Failure:** `False`  
- **Operating System:** `Windows`  
- **Script Log Message:** `%Output%`  

![Image7](../../../static/img/docs/79112007-ac74-4fde-97f5-59d56dbe0282/image7.webp)

## Completed Task

![Image8](../../../static/img/docs/79112007-ac74-4fde-97f5-59d56dbe0282/image8.webp)

## Output

- Script Log
- Custom Field

## Changelog

### 2026-07-28

- Initial version of the document
