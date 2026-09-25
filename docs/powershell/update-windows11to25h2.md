---
id: 'aa9612e1-f474-47b8-b71f-7d0e803beb36'
slug: /aa9612e1-f474-47b8-b71f-7d0e803beb36
title: 'Update-Windows11To25H2'
title_meta: 'Update-Windows11To25H2'
keywords: ['windows-11', '25h2', '24h2', 'feature-update', 'enablement-package', 'kb5054156', 'upgrade', 'safeguard-hold']
description: 'Upgrades Windows 11 version 24H2 devices to version 25H2 with a small Microsoft enablement package and a single restart.'
tags: ['update', 'windows', 'automation']
draft: false
unlisted: false
last_update:
  date: 2026-09-25
---

## What It Does

Upgrades Windows 11 version 24H2 devices to version 25H2 with a single restart. Apps, files, and settings stay in place.

The upgrade uses Microsoft's enablement package (KB5054156). An enablement package is a small update, about 170 KB, that switches on 25H2 features already delivered to the device by monthly updates. There is no full Windows reinstall.

Each run ends with one result line that starts with `Success:` or `Failure:`. Devices that fail a check are never changed.

---

## When to Use It

- Your devices run Windows 11 version 24H2 and you want them on version 25H2.
- You need to keep devices supported. Windows 11 version 24H2 Home and Pro stop receiving updates on **October 13, 2026**. Enterprise and Education follow on **October 12, 2027**.
- You want a fast, low-disruption upgrade that you can deploy from NinjaOne, Datto RMM, or another RMM platform.

---

## What You Need

- Windows 11 version 24H2: Home, Pro, Enterprise, Education, Enterprise multi-session, or IoT Enterprise
- The August 29, 2025 update (KB5064081) or any later monthly update installed
- An Intel or AMD (x64) or Arm64 processor
- The script running as SYSTEM or a local administrator through your RMM platform
- Internet access to Microsoft's download servers

Windows 11 LTSC editions, Windows Server, and Windows 11 version 23H2 or earlier are not supported. See [Results by Device](#results-by-device).

---

## How the Upgrade Works

1. **Checks the device.** Confirms the Windows version, edition, required update, and processor type. Devices that do not qualify stop here with no changes.
2. **Checks for a safeguard hold.** A safeguard hold is Microsoft blocking an update on devices with a known problem, such as an incompatible driver. Held devices stop here unless you override the hold.
3. **Downloads and verifies the package.** The package comes directly from Microsoft and is checked for tampering before it is installed.
4. **Installs the package silently.** Users see no installer windows.
5. **Restarts the device.** Signed-in users get a restart warning five minutes in advance. The upgrade completes during the restart.

**You'll know it worked when** Settings > System > About shows **Version 25H2** and the OS build starts with **26200**.

---

## Parameters

| Parameter | Default | Type | Description |
|-----------|---------|------|-------------|
| `NoReboot` | `False` | Switch | Installs the upgrade without restarting. The upgrade completes on the next restart. |
| `RebootDelaySeconds` | `300` | Int | Seconds to wait before restarting, from 60 to 86400. Ignored when `NoReboot` is used. |
| `IgnoreSafeguardHold` | `False` | Switch | Installs the upgrade even when Microsoft has placed a safeguard hold on the device. Use only on tested devices. |

With no parameters, the script upgrades eligible devices and restarts them after five minutes.

---

## Results by Device

| Device | Result |
|--------|--------|
| Windows 11 24H2, all requirements met | Upgraded to 25H2. Returns `Success:`. |
| Windows 11 25H2 or newer | Returns `Success:`. No changes. |
| Windows 11 24H2 without the required update | Returns `Failure:`. No changes. Install the latest monthly update and run again. |
| Windows 11 23H2 or earlier, or Windows 10 | Returns `Failure:`. No changes. These versions need a full feature update instead. |
| Windows 11 LTSC edition or Windows Server | Returns `Failure:`. No changes. Not eligible for this upgrade. |
| Device under a safeguard hold | Returns `Failure:`. No changes, unless `IgnoreSafeguardHold` is used. |
| Package download fails | Returns `Failure:`. No changes. |

Failures stop the script with an error, so your RMM platform reports the run as failed.

---

## Usage Examples

### Example 1: Upgrade and restart

```powershell
.\Update-Windows11To25H2.ps1
```

**What happens:**

- Eligible devices are upgraded and restart five minutes later.
- Signed-in users see a warning to save their work.
- To cancel a scheduled restart, run `shutdown /a` on the device before the delay ends.

### Example 2: Give users more time before the restart

```powershell
.\Update-Windows11To25H2.ps1 -RebootDelaySeconds 900
```

**What happens:**

- Eligible devices are upgraded and restart 15 minutes later.

### Example 3: Upgrade without restarting

```powershell
.\Update-Windows11To25H2.ps1 -NoReboot
```

**What happens:**

- The upgrade is installed, and the device stays on 24H2 until its next restart.
- `NoReboot` only stops this script from restarting the device. A restart from Windows Update, a patch policy, or a user also completes the upgrade.

> **Note:** If restart timing matters, run the script inside a maintenance window instead of relying on `NoReboot`.

### Example 4: Upgrade a tested device that has a safeguard hold

```powershell
.\Update-Windows11To25H2.ps1 -IgnoreSafeguardHold
```

**What happens:**

- The upgrade installs despite the hold, and the log records the safeguard ID.
- Use this only after testing the device, or after Microsoft marks the issue as resolved.

---

## Troubleshooting

| Problem | Cause | Solution |
|---------|-------|----------|
| The required update is missing | The device is older than build 26100.5074. | Install the latest monthly update, restart, and run again. |
| A safeguard hold is reported | Microsoft found a known issue on this device's configuration. | Search the safeguard ID on the [Windows release health dashboard](https://learn.microsoft.com/windows/release-health/). Wait for the hold to be released, or test the device and use `IgnoreSafeguardHold`. |
| A hold is reported, but Microsoft lists the issue as resolved | SSL inspection is blocking the device from refreshing its compatibility data. | Exclude `adl.windows.com` and `settings.data.microsoft.com` from SSL inspection. |
| No compatibility data was found | Windows diagnostic data is off, or Windows has not checked the device yet. | No action needed. The upgrade continues, but the hold status is unknown. |
| The download fails | The device cannot reach Microsoft's download servers. | Allow HTTPS to `catalog.sf.dl.delivery.mp.microsoft.com` and run again. |
| The device still shows 24H2 after `Success:` | The device has not restarted yet. | Restart the device. |
| The install fails with an error code | A pending restart or a Windows servicing problem. | Restart the device and run again. See the logs below for details. |

---

## Files and Logs

| File | Location |
|------|----------|
| Script log | `.\Update-Windows11To25H2-log.txt` |
| Error log | `.\Update-Windows11To25H2-error.txt` |
| Installer log | `C:\ProgramData\_automation\Script\Update-Windows11To25H2\KB5054156-<timestamp>.evtx` (kept for troubleshooting) |
| Downloaded package | `C:\ProgramData\_automation\Script\Update-Windows11To25H2\KB5054156-<x64 or arm64>.msu` (removed after the install) |

---

## About Windows 11 Version 26H2

This script installs version 25H2 only. Microsoft has announced version 26H2 as a separate enablement package, expected later in 2026. Devices on 25H2 or 24H2 can move to 26H2 with that package once it is released.

---

## Changelog

### 2026-09-25

- Initial version of the document.
