---
id: '6a56eb01-4580-4ee4-8d56-364705bba6c4'
slug: /6a56eb01-4580-4ee4-8d56-364705bba6c4
title: 'Remove-NebulaAgent'
title_meta: 'Remove-NebulaAgent'
keywords: ['remove', 'malwarebytes', 'nebula', 'oneview', 'threatdown', 'mb-clean', 'tamper protection', 'uninstall', 'deepclean']
description: 'Documentation for the Remove-NebulaAgent script, which removes the Malwarebytes Nebula/OneView endpoint agent using the vendor ThreatDown Business Support Tool.'
tags: ['antivirus', 'malwarebytes', 'security']
draft: false
unlisted: false
last_update:
  date: 2026-08-24
---

## Overview

Removes the Malwarebytes Nebula/OneView endpoint agent (Malwarebytes Endpoint Agent) from a Windows endpoint using Malwarebytes' own ThreatDown Business Support Tool (`mb-clean.exe`).

The standard uninstall is blocked whenever Tamper Protection is enabled, and a plain `msiexec`/`Uninstall-Package` run leaves behind services, files, and registry entries that prevent a clean reinstall. This script drives the vendor removal tool with the Tamper Protection password, then verifies that the agent is actually gone rather than trusting the tool's exit code.

## Requirements

- Windows PowerShell 5.1 or later
- Administrative privileges (SYSTEM when run from an RMM)
- Outbound HTTPS to `downloads.malwarebytes.com` and `cdn.mwbsys.com` for the removal tool, plus `contentrepo.net` and `www.powershellgallery.com` for the Strapper module bootstrap
- The Tamper Protection password from the Nebula or OneView policy, unless Tamper Protection is disabled
- Tamper Protection must not be blocking process creation for `mb-clean.exe` (see [Troubleshooting](#troubleshooting))

The script bootstraps logging by downloading `Install-PSGalleryModule.ps1` from `contentrepo.net` and running it to install `Strapper`. If that bootstrap is unreachable and Strapper is not already installed, the script falls back to an internal `Write-Log` that writes to the console, so the removal still runs.

## Process

1. Detects whether the agent is present, by checking all three of:
   - an `Uninstall` registry entry with a `DisplayName` like `*Malwarebytes*` (native and Wow6432Node)
   - files under `Malwarebytes Endpoint Agent` / `Malwarebytes` in `Program Files` and `ProgramData`
   - a running or registered `*Malwarebytes*`, `*MBAM*`, or `*EPPService*` service

   If nothing is found, the script exits without downloading anything. `-DeepClean` overrides this and proceeds anyway, since its whole purpose is mopping up remnants after the agent is already gone.
2. Downloads `mb-clean.exe` to `$env:TEMP`, trying `curl.exe`, then BITS, then `Invoke-RestMethod`, so that a single blocked transport (typically an SSL-inspecting proxy) does not fail the run.
3. Validates the download is a real PE image by checking for an `MZ` header, which catches proxy block pages and captive-portal HTML served with a `200`.
4. Runs the removal tool with `/y /cleanup /noreboot`, plus either `/epatamperpw "<password>"` or `/deepclean`, and waits for it to exit.
5. Removes any leftover *empty* remnant folders. The support tool writes its own logs to `C:\ProgramData\Malwarebytes` while running, so that folder frequently survives as an empty directory and would otherwise register as a failed removal.
6. Re-checks the registry and remnant paths and logs an explicit verified/not-verified verdict, recommending a reboot and/or a `-DeepClean` pass when anything remains.

Note that folder checks test for *contents*, not mere existence — an empty leftover directory is not treated as evidence that the agent is still installed.

## Payload Usage

Remove the agent on an endpoint with Tamper Protection enabled. This is the normal first pass.

```powershell
.\Remove-NebulaAgent.ps1 -TamperProtectionPassword 'MyPassword'
```

Remove the agent when Tamper Protection is disabled in the policy. Omitting the parameter entirely is equivalent, as the script defaults to `NoTamperProtection`.

```powershell
.\Remove-NebulaAgent.ps1 -TamperProtectionPassword 'NoTamperProtection'
```

Clear all remaining registry items. Run this after rebooting from the first pass.

```powershell
.\Remove-NebulaAgent.ps1 -DeepClean
```

For a complete removal, run with `-TamperProtectionPassword`, reboot, then run again with `-DeepClean`. The two modes are mutually exclusive in a single run: when `-DeepClean` is specified, `/deepclean` replaces `/epatamperpw`, so any password passed alongside it is ignored.

## Parameters

| Parameter                  | Alias | Required | Default                | Type   | Description                                                                                                                            |
| -------------------------- | ----- | -------- | ---------------------- | ------ | -------------------------------------------------------------------------------------------------------------------------------------- |
| `TamperProtectionPassword` |       | False    | `'NoTamperProtection'` | String | The Tamper Protection password from the Nebula/OneView policy. If the password contains a quotation mark, double it (`"` becomes `""`). |
| `DeepClean`                |       | False    | `False`                | Switch | Removes all remaining registry items associated with the agent. Intended for a second pass after a reboot.                              |

`TamperProtectionPassword` is deliberately a plaintext `[string]` rather than a `SecureString`, because RMM platforms pass script arguments as text and cannot construct a `SecureString`. The value is written to the endpoint's command line for the duration of the `mb-clean.exe` process.

## Output

Location of output for log, result, and error files.

    .\Remove-NebulaAgent-log.txt
    .\Remove-NebulaAgent-error.txt

The downloaded `mb-clean.exe` is removed from `$env:TEMP` at the end of a successful run.

## Troubleshooting

### `Failed to launch mb-clean.exe: Access is denied (Win32 error 5)`

Something is blocking process creation at the kernel level. The script identifies the likely culprit by looking for installed services and names it in the error message:

- **Malwarebytes Tamper Protection** — disable Tamper Protection for the endpoint in the Nebula/OneView console, then re-run.
- **ThreatLocker** or similar application control — permit `mb-clean.exe` by hash or publisher certificate, or approve the denial from Unified Audit, then re-run.

If neither is detected, check any other installed EDR/AV console for a denied-execution event on `mb-clean.exe`.

### `Can't load config info` when testing manually

`mb-clean.exe` is a 32-bit 7-Zip self-extracting archive that reads its own image on disk to find its config block. Run it from anywhere under `C:\Windows\System32\` and the WOW64 file system redirector rewrites that path to `C:\Windows\SysWOW64\`, where the file does not exist, producing this error on a perfectly intact download.

This affects manual testing in ScreenConnect Backstage, whose default working directory is `C:\Windows\System32\config\systemprofile\Documents`. Copy the tool to `C:\Windows\Temp` and run it there. The script itself is unaffected, since it stages to `$env:TEMP` (`C:\Windows\Temp` under SYSTEM).

### `Downloaded file is not a valid executable`

All three download methods returned something that is not a PE image, which almost always means an SSL-inspecting proxy or web filter served a block page. Allow `downloads.malwarebytes.com` and `cdn.mwbsys.com`, or stage `mb-clean.exe` to the endpoint out of band.

### The agent still appears in the registry after a run

Expected when the removal tool needs a reboot to finish. Reboot, then run again with `-DeepClean`.

## Changelog

### 2026-08-24

- Initial version of the document
