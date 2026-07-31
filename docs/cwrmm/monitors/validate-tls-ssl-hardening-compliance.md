---
id: 'a304b2ff-557f-4715-81cf-7becc125b350'
slug: /a304b2ff-557f-4715-81cf-7becc125b350
title: 'Validate TLS/SSL Hardening Compliance'
title_meta: 'Validate TLS/SSL Hardening Compliance'
keywords: ['tls','ssl','disable','enable','security-hardening','tls-1.2']
description: 'Read-only monitor check that reports whether the TLS/SSL hardening autofix must run.'
tags: ['tls','windows']
draft: false
unlisted: false
last_update:
  date: 2026-07-28
---

## Summary

This monitor is the watchful half of the TLS/SSL hardening pair. On a regular schedule it looks at each targeted Windows device and checks whether its secure-connection settings match the standard the platform requires, without changing anything on the device. If a device is already set up correctly the monitor simply records it as compliant; if something is missing or wrong - an old protocol still switched on, a modern protocol not switched on, a security option not set, or a weak encryption method still in use - the monitor reports that work is needed and the platform automatically runs the paired hardening task, [Enforce TLS/SSL Hardening (TLS 1.2 Upgrade)](/docs/79112007-ac74-4fde-97f5-59d56dbe0282), to bring the device back in line. In that sense the monitor is the eyes and the hardening task is the hands: the monitor finds the devices that need attention, and the task does the actual fixing.

We provide this monitor so compliance is checked continuously rather than only when someone remembers to look. As the platform retires the older protocols, devices can fall out of step over time - for example after a rebuild, a manual change, or a new machine joining the fleet - and this monitor catches that drift and triggers the fix on its own, so devices do not quietly lose the ability to talk to our services. It is read-only and safe to leave running: it never edits settings, never disables anything, and never restarts a device, so it causes no disruption by itself.

A few things to keep in mind:

- It runs on a schedule (every 24 hours by default), so there can be up to about a day between a device going out of compliance and the monitor noticing it and launching the fix. For an urgent, fleet-wide rollout you can run the hardening task directly instead of waiting for the next check.
- A device that has never been hardened will be reported as needing work on the first check. That is expected and is exactly how the monitor kicks off the initial fix; after the hardening task runs once, the device should report as compliant on the following check.
- This monitor is set up to fix problems quietly rather than raise support tickets: when it finds a device out of compliance it launches the hardening task automatically and does not open a ticket, and it does not escalate when a check fails. If you would rather be notified by ticket when a device is non-compliant, that is a separate setting to switch on in the monitor configuration.
- The monitor reads the settings as they are saved on the device, not the settings currently active in memory. Because the hardening task's changes only become active after a reboot (see that task's notes), a device can show as compliant here before it has actually been rebooted. That is normal; the reboot is still required for the new protocol and encryption settings to take effect. The monitor also does not flag a pending reboot on its own, because re-running the hardening task cannot perform a reboot the device does not need, so a reboot-only situation is left to the task and to your maintenance schedule.
- The same operating-system limitation as the hardening task applies here. On the oldest systems (Windows Server 2008, Windows Server 2008 R2 and earlier) the modern TLS 1.2 protocol cannot be enabled because the operating system does not support it. On those systems, once the old protocols are switched off the monitor will report the device as compliant with everything it is able to check - but that does not mean the device can connect, because no supported protocol remains after a reboot. For those machines the required step is still an operating-system upgrade, so a green result on this monitor should not be read as proof of connectivity there.

In short: leave this monitor running on your Windows devices so compliance is checked automatically and any gap is fixed without manual effort; expect up to a 24-hour detection window, expect the first check on a new or un-hardened device to trigger the fix, and remember that on the oldest operating systems a compliant result still requires an upgrade to restore full connectivity.

## Dependencies

- [Group: Windows Machines](/docs/b0c8b058-2cac-4922-a6a7-1c4275c4be15)
- [Task: Enforce TLS/SSL Hardening (TLS 1.2 Upgrade)](/docs/79112007-ac74-4fde-97f5-59d56dbe0282)
- [Solution: TLS/SSL Security Hardening](/docs/13ac3912-863b-41fe-bb61-dfd681f06fa8)

## Monitor Setup Location

**Monitors Path:** `ENDPOINTS` ➞ `Alerts` ➞ `Monitors`  

## Monitor Summary

- **Name:** `Validate TLS/SSL Hardening Compliance`  
- **Description:** `Read-only check that decides if the TLS/SSL hardening auto-fix must run. It compares the SCHANNEL, .NET strong-crypto and cipher state to the required config: legacy protocols disabled, TLS 1.2 and 1.3 enabled where supported, weak ciphers off. A missing key or value is non-compliant. Output is one line: Autofix Not Required if compliant, else Autofix Required: <reasons>. In the monitor set, match the failed state to Autofix Required and the healthy state to Autofix Not Required.`  
- **Type:** `Script`  
- **Severity:** `Others`  
- **Family:** `Security`

![Image1](../../../static/img/docs/a304b2ff-557f-4715-81cf-7becc125b350/image1.webp)

## Targeted Resources

- **Target Type:**  `Device Groups`  
- **Group Name:** `Windows Machines`

![Image2](../../../static/img/docs/a304b2ff-557f-4715-81cf-7becc125b350/image2.webp)

## Conditions

- **Run script on:** `Schedule`  
- **Repeat every:** `24` `Hour(s)`  
- **Script Language:** `PowerShell`  
- **Use Generative AI Assist for script creation:** `False`  

- **PowerShell Script Editor:**  

```PowerShell
#requires -Version 3.0

<#
.SYNOPSIS
    Read-only monitor check that reports whether the TLS/SSL hardening autofix must run.

.DESCRIPTION
    This script is read-only and makes no changes to the system. It is the monitor-set companion to
    the Invoke-TlsSslHardeningCWRMM.ps1 autofix script for ConnectWise RMM on the ConnectWise Platform.
    It inspects the live TLS/SSL configuration and emits exactly one line that a ConnectWise RMM
    monitor set evaluates with a string check to decide whether the autofix action should run.

    The check reproduces, without writing anything, the same desired-state comparisons the autofix
    performs: legacy protocols SSL 3.0, TLS 1.0 and TLS 1.1 must be disabled (Enabled 0 and
    DisabledByDefault 1) on both the Server and the Client SCHANNEL endpoints; the modern protocols
    TLS 1.2 and TLS 1.3 must be enabled (Enabled 1 and DisabledByDefault 0) on both endpoints, but
    only for the versions the operating system supports; the .NET Framework strong-cryptography values
    SchUseStrongCrypto and SystemDefaultTlsVersions must be 1 in both the 64-bit and the 32-bit
    framework hives; and none of the fixed weak TLS 1.2 cipher suites may remain active. A missing
    registry key or value counts as not compliant, exactly as it would prompt the autofix to write it,
    so the monitor and the autofix always agree on whether work is pending.

    When every comparison passes the script emits Autofix Not Required. When any comparison fails the
    script emits Autofix Required: followed by a semicolon-separated list of the specific reasons, for
    example a missing key, a value mismatch or a weak cipher that is still active. If the current
    state cannot be read at all the script also reports Autofix Required so that the autofix is
    attempted and surfaces the underlying error.

    Authored for Windows and compatible with Windows PowerShell 3.0 and later so it runs on the same
    older fleet as the autofix, including Windows Server 2012, Windows Server 2012 R2, Windows 8 and
    Windows 8.1. The script is read-only and does not require elevation; it reads HKLM and the active
    cipher list without Administrator rights. Cipher suite inspection is skipped automatically, and not
    treated as a discrepancy, on systems where Get-TlsCipherSuite does not exist (before Windows 10 or
    Windows Server 2016), matching the autofix behaviour.

    A pending reboot is intentionally not reported as a reason: re-running the autofix on an already
    hardened machine makes no registry changes and therefore would not reboot, so a reboot-only
    condition is not something the autofix can remediate.

.EXAMPLE
    .\Test-TlsSslHardeningCWRMM.ps1

    Runs under a ConnectWise RMM monitor set. The single emitted line is string-checked by the monitor
    set; a line beginning with Autofix Required triggers the paired autofix action, while
    Autofix Not Required is the healthy state.

.NOTES
    - Read-only: this script never writes to the registry, never disables ciphers and never reboots.
      It does not require Administrator or System privileges.
    - Requires Windows PowerShell 3.0 or later, matching the autofix floor.
    - Designed for ConnectWise RMM (ConnectWise Platform) as the monitor-set half of a pair with
      the Invoke-TlsSslHardeningCWRMM.ps1 autofix script; the monitor set runs this script and uses a
      string check on its output to decide whether to launch the autofix.
    - Monitor set string-check guidance: the two possible outputs are mutually exclusive. Configure the
      alerting or failed condition to match the substring Autofix Required and the healthy condition to
      match Autofix Not Required. The healthy line never contains the substring Autofix Required.
    - The monitor reports a discrepancy for any registry key or value the autofix would create or
      rewrite, so a never-hardened machine reports Autofix Required until the autofix lays down the
      explicit keys once; this is the intended first-run trigger.
    - The script emits exactly one line to standard output and produces no other console, information,
      warning or host output, so the monitor set string check sees a single clean line.

.OUTPUTS
    System.String

    A single line, either Autofix Not Required or Autofix Required: followed by a semicolon-separated
    list of the discrepancies found, for example
    Autofix Required: TLS 1.0 Server registry key missing at HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.0\Server; Weak cipher suite still active: TLS_RSA_WITH_AES_128_GCM_SHA256
#>

[CmdletBinding()]
param()

#region globals
$ProgressPreference = 'SilentlyContinue'
$ErrorActionPreference = 'Stop'
$WarningPreference = 'SilentlyContinue'
#endregion

#region variables
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
$reasons = @()
#endregion

#region functions
function Get-OsDefaultTlsVersion {
    <#
    .SYNOPSIS
        Returns the TLS and SSL protocol versions the current operating system supports by default.
    .DESCRIPTION
        Queries Win32_OperatingSystem and maps the OS version and build number to the set of protocol
        versions the platform enables by default, expressed as the strings 1.0, 1.1, 1.2, 1.3 and
        SSL 3.0. The monitor uses this to decide which modern protocols to check, mirroring the
        autofix so the two never disagree on support. Throws when the operating system version cannot
        be determined.

        TLS 1.2 is reported as supported on Windows Server 2012 / Windows 8 (NT 6.2) and later, and
        TLS 1.3 only on Windows Server 2022 (build 20348) and later.
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

function Test-RegistryState {
    <#
    .SYNOPSIS
        Reports how a registry key and its DWORD values differ from a desired state, without changing anything.
    .DESCRIPTION
        Reads the registry key at Path and compares each name in the Values hashtable against its
        required integer value. Returns a human-readable reason string for every discrepancy found:
        the key being absent, a value being absent, or a value holding the wrong number. Returns
        nothing when the key and every value already match the desired state. The Label prefixes each
        reason so the aggregated monitor output identifies the protocol or setting at fault.
    .PARAMETER Label
        Short name shown at the start of each reason, for example TLS 1.2 Server.
    .PARAMETER Path
        Full registry path to inspect.
    .PARAMETER Values
        Hashtable of DWORD value names to the integer each must hold.
    .EXAMPLE
        Test-RegistryState -Label 'TLS 1.2 Server' -Path 'HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.2\Server' -Values @{ Enabled = 1; DisabledByDefault = 0 }

        Returns a reason if TLS 1.2 is not enabled on the server endpoint, otherwise nothing.
    #>
    [CmdletBinding()]
    [OutputType([System.String[]])]
    param(
        [Parameter(Mandatory = $true, HelpMessage = 'Short name shown at the start of each reason.')]
        [System.String]$Label,

        [Parameter(Mandatory = $true, HelpMessage = 'Full registry path to inspect.')]
        [System.String]$Path,

        [Parameter(Mandatory = $true, HelpMessage = 'Hashtable of DWORD value names and their required integer values.')]
        [System.Collections.Hashtable]$Values
    )

    #region main
    $discrepancies = @()
    $props = Get-ItemProperty -Path $Path -ErrorAction SilentlyContinue

    if ($null -eq $props) {
        $discrepancies += ('{0} registry key missing at {1}' -f $Label, $Path)
        return $discrepancies
    }

    foreach ($name in $Values.Keys) {
        $desired = $Values[$name]
        if ($props.PSObject.Properties.Name -notcontains $name) {
            $discrepancies += ('{0} value {1} not present at {2}' -f $Label, $name, $Path)
        } else {
            $current = $props.$name
            if ($current -ne $desired) {
                $discrepancies += ('{0} value {1} expected {2} but found {3} at {4}' -f $Label, $name, $desired, $current, $Path)
            }
        }
    }

    $discrepancies
    #endregion
}
#endregion

#region evaluate tls/ssl state
try {
    $supportedTlsVersions = Get-OsDefaultTlsVersion
    $enableTls12 = $supportedTlsVersions -contains '1.2'
    $enableTls13 = $supportedTlsVersions -contains '1.3'

    foreach ($protocol in $legacyProtocols) {
        foreach ($endpoint in @('Server', 'Client')) {
            $path = '{0}\{1}\{2}' -f $schannelProtocolRoot, $protocol, $endpoint
            $label = '{0} {1}' -f $protocol, $endpoint
            $delta = @(Test-RegistryState -Label $label -Path $path -Values $disableProtocolValues)
            if ($delta.Count -gt 0) {
                $reasons += $delta
            }
        }
    }

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
            $label = '{0} {1}' -f $protocol, $endpoint
            $delta = @(Test-RegistryState -Label $label -Path $path -Values $enableProtocolValues)
            if ($delta.Count -gt 0) {
                $reasons += $delta
            }
        }
    }

    foreach ($path in $dotNetFrameworkPaths) {
        if ($path -like '*WOW6432Node*') {
            $bitness = '32-bit'
        } else {
            $bitness = '64-bit'
        }
        $label = '.NET Framework {0}' -f $bitness
        $delta = @(Test-RegistryState -Label $label -Path $path -Values $dotNetStrongCryptoValues)
        if ($delta.Count -gt 0) {
            $reasons += $delta
        }
    }

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
                $reasons += ('Weak cipher suite still active: {0}' -f $cipher)
            }
        }
    }
} catch {
    $reasons = @('Unable to evaluate TLS/SSL state: {0}' -f $Error[0].Exception.Message)
}
#endregion

#region emit result
if ($reasons.Count -gt 0) {
    $result = 'Autofix Required: {0}' -f ($reasons -join '; ')
} else {
    $result = 'Autofix Not Required'
}

return $result
#endregion
```

- **Criteria:**  `Contains`  
- **Operator:** `AND`  
- **Script Output:**  `Autofix Required`  
- **Escalate ticket on script failure:** `Disabled`  
- **Add Automation:**  `Enforce TLS/SSL Hardening (TLS 1.2 Upgrade)`

![Image3](../../../static/img/docs/a304b2ff-557f-4715-81cf-7becc125b350/image3.webp)

## Ticket Resolution

- **Automatically Resolve:** `Disabled`

![Image4](../../../static/img/docs/a304b2ff-557f-4715-81cf-7becc125b350/image4.webp)

## Monitor Output

**Output:** `Do not Generate Ticket`

![Image5](../../../static/img/docs/a304b2ff-557f-4715-81cf-7becc125b350/image5.webp)

## Completed Monitor

![Image6](../../../static/img/docs/a304b2ff-557f-4715-81cf-7becc125b350/image6.webp)

## Changelog

### 2026-07-28

- Initial version of the document
