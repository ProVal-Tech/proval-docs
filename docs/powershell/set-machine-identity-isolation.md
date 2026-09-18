---
id: 'f7f4c39a-b3d8-4b27-bf56-9d3a5e891d4a'
slug: /f7f4c39a-b3d8-4b27-bf56-9d3a5e891d4a
title: 'Set Machine Identity Isolation'
title_meta: 'Set Machine Identity Isolation'
keywords:
  - Machine Identity Isolation
  - MII
  - domain trust
  - Credential Guard
description: 'Identify and remediate Windows 11 domain trust failures caused by Machine Identity Isolation enforcement.'
tags: [windows]
draft: false
unlisted: false
last_update:
  date: 2026-09-18
---

## Description

Use this script to identify and remediate domain trust failures caused by Machine Identity Isolation (MII) enforcement after the September 2026 Windows 11 updates. It never restarts the device.

Affected devices can show: `The trust relationship between this workstation and the primary domain failed`.

## Requirements

- The device must be joined to an on-premises Active Directory domain (on-premises AD joined or hybrid joined).
- Run on Windows 11 with administrative privileges.
- Use PowerShell 5.1 or later.
- Allow internet access to install or update the `Strapper` module.
- For repair, provide a domain credential that can reset the computer account password.

The script reports other Windows versions as not affected. The issue affects Windows 11 24H2, 25H2, and 26H1 after the applicable September 2026 updates.

## Domain Join Check

MII only applies to devices joined to an on-premises Active Directory domain. Every action starts by checking the join type. If the device does not qualify, the script exits without gathering further state or making changes, whatever `-Action` was requested.

| Join type | Result |
| --- | --- |
| On-premises AD joined | Continues. |
| Hybrid joined (on-premises AD and Entra ID) | Continues. |
| Entra ID joined only | Logs not applicable and exits without changes. |
| Workgroup | Logs not applicable and exits without changes. |
| Membership could not be determined | Logs an error and exits without changes. |

## Usage

Run the following sequence when MII enforcement is configured.

1. Check the current state.
2. Disable enforcement.
3. Restart the device using your normal restart method.
4. Repair the domain secure channel.

Check the current state:

```powershell
.\Set-MachineIdentityIsolation.ps1
```

Disable MII enforcement before restarting:

```powershell
.\Set-MachineIdentityIsolation.ps1 -Action Disable
```

Preview the changes without modifying the registry:

```powershell
.\Set-MachineIdentityIsolation.ps1 -Action Disable -WhatIf
```

After the restart, repair the domain secure channel:

```powershell
$Credential = [PSCredential]::new('CONTOSO\admin', (ConvertTo-SecureString -String $password -AsPlainText -Force))
.\Set-MachineIdentityIsolation.ps1 -Action Repair -Credential $Credential
```

## Actions

| Action | Result |
| --- | --- |
| `Status` | Reports MII settings, domain status, secure channel health, pending restart state, and a recommended next step. This is the default. |
| `Disable` | Changes MII enforcement (`2`) to disabled (`0`) in each configured registry location. Audit mode (`1`) remains unchanged. A restart is required. |
| `Repair` | Repairs the domain secure channel after restart. The action requires `-Credential` and will not run while enforcement remains configured. |

## Parameters

| Parameter | Required | Default | Type | Description |
| --- | --- | --- | --- | --- |
| `Action` | No | `Status` | String | Choose `Status`, `Disable`, or `Repair`. |
| `Credential` | For `Repair` |  | PSCredential | Domain credential used to reset the computer account secure channel. |

## Policy Follow-Up

The script can change a policy-delivered setting, but Group Policy or Intune can apply it again. Update the source policy before the next policy refresh.

- **Group Policy:** Under `Computer Configuration\Administrative Templates\System\Device Guard\Turn On Virtualization Based Security`, set **Machine Identity Isolation Configuration** to **Disabled** or **Not Configured**.
- **Intune:** Set the `DeviceGuard/MachineIdentityIsolation` policy CSP to `0`, or remove the policy.

## Output

The script returns the device state, verdict, join type, MII values, domain and secure channel status, reboot requirement, changed locations, and repair result.

When the script exits at the domain join check, it does not return an object. The join type and the reason for exiting are written to the log file only.

It also writes these files beside the script:

```text
Set-MachineIdentityIsolation-log.txt
Set-MachineIdentityIsolation-error.txt
```

## Troubleshooting

If repair fails after disabling enforcement and restarting, unjoin and rejoin the device to the domain using a local administrator account.

The September 14, 2026 out-of-band update KB5129194 does not resolve this issue.

## References

- [Windows 11, version 26H1 known issues](https://learn.microsoft.com/en-us/windows/release-health/status-windows-11-26h1)
- [Machine Identity Isolation](https://learn.microsoft.com/en-us/windows-server/identity/ad-ds/manage/delegated-managed-service-accounts/credential-guard-protected-machine-accounts#machine-identity-isolation)
- [DeviceGuard Policy CSP](https://learn.microsoft.com/en-us/windows/client-management/mdm/policy-csp-deviceguard#machineidentityisolation)

## Changelog

### 2026-09-18

Initial release.