---
id: 'a8465449-afa0-47a2-8190-5783ce02d713'
slug: /a8465449-afa0-47a2-8190-5783ce02d713
title: 'Uninstall-LenovoVantage'
title_meta: 'Uninstall-LenovoVantage'
keywords: ['lenovo', 'lenovo-vantage', 'commercial-vantage', 'vantage-service', 'imcontroller', 'system-interface-foundation', 'suhelper', 'uninstall']
description: 'Completely removes Lenovo Vantage and Lenovo Commercial Vantage, including Lenovo Vantage Service, its add-ins, ImController, and SUHelper.'
tags: ['windows', 'uninstallation', 'lenovo']
draft: false
unlisted: false
last_update:
  date: 2026-10-21
---

## What It Does

Completely removes Lenovo Vantage and Lenovo Commercial Vantage from Windows 10 and Windows 11 devices, together with the components Lenovo installs alongside them: Lenovo Vantage Service and its add-ins, Lenovo System Interface Foundation (ImController), Lenovo Dependency Package, and SUHelper.

Uninstalling the Vantage app on its own leaves the background service, scheduled tasks, and other components behind. This script removes all of them in one run and then checks that nothing is left.

The script never restarts the device. If part of the removal needs a restart to finish, the log says so.

---

## When to Use It

- You want Lenovo Vantage or Commercial Vantage removed from your Lenovo devices, including the parts that run in the background.
- Lenovo Vantage components are still running on devices where the app was already uninstalled.
- You need one removal that covers both the consumer and the commercial edition, and that you can deploy from Datto RMM or another RMM platform.

---

## What You Need

- A Lenovo device
- Windows 10 or Windows 11, 64-bit
- The script running as SYSTEM or a local administrator through your RMM platform, in 64-bit PowerShell
- Internet access to download the Strapper PowerShell module

---

## How the Removal Works

1. **Checks the device.** Confirms the device is made by Lenovo and runs Windows 10 or Windows 11, then looks for every Lenovo Vantage component. Devices that fail a check, or have nothing to remove, stop here with no changes.
2. **Stops Lenovo Vantage.** Stops the Lenovo Vantage services and closes any Vantage programs that are running.
3. **Runs Lenovo's uninstallers.** Each uninstaller runs in the background and gets up to 180 seconds to finish. One that takes longer is stopped, and the script removes that component itself in the cleanup step.
4. **Removes the Vantage apps.** Removes the app for every user and from the Windows image, so new users on the device do not get it.
5. **Cleans up what is left.** Removes leftover scheduled tasks, services, the ImController driver, folders, settings, and uninstall entries.
6. **Checks the result.** Confirms that nothing is left and reports success or failure.

**You'll know it worked when** Lenovo Vantage, Lenovo Commercial Vantage, and Lenovo Vantage Service no longer appear in Settings > Apps > Installed apps, and the log ends with a line that starts with `Success:`.

---

## What Gets Removed

| Component | What is removed |
|-----------|-----------------|
| Lenovo Vantage and Lenovo Commercial Vantage | The app, for every user and from the Windows image |
| Lenovo Vantage Service | The program, its add-ins, service, scheduled tasks, folders, and settings, including the Commercial Vantage Lite mode setting |
| Lenovo System Interface Foundation (ImController) | The program, service, driver, scheduled tasks, and folders |
| Lenovo Dependency Package and SUHelper | The programs and their folders |

These stay on the device:

- Commercial Vantage policies set through Group Policy, Intune, or a `.reg` file. They have no effect once Vantage is gone.
- Other Lenovo tools, such as Lenovo System Update, Update Retriever, Lenovo Service Bridge, and Dock Manager.

:::note  
Removing ImController also stops any Lenovo feature that runs through it. The script does not prevent Lenovo Vantage from coming back: users can reinstall it from the Microsoft Store, and Windows Update can install the ImController driver again.  
:::

---

## Restarts

The script never restarts the device, and most removals finish without one. When an item can only be removed fully during a restart, the run still succeeds and the log says `A reboot is required to complete the removal`. Restart the device whenever it suits the user. There is no need to run the script again.

---

## Parameters

| Parameter | Default | Type | Description |
|-----------|---------|------|-------------|
| `TimeoutSeconds` | `180` | Int | Seconds to wait for each Lenovo uninstaller, from 30 to 1800. An uninstaller that takes longer is stopped, and the script removes that component itself. |

With no parameters, the script removes every Lenovo Vantage component it finds and gives each uninstaller up to 180 seconds.

---

## Results by Device

| Device | Result |
|--------|--------|
| No Lenovo Vantage components found | Succeeds. No changes. |
| Lenovo Vantage removed | Returns `Success:`. |
| Lenovo Vantage removed, restart needed to finish | Returns `Success:` and states that a reboot is required. |
| A component could not be removed | Returns `Failure:`. Restart the device and run again. |
| Script started in 32-bit PowerShell | Returns `Failure:`. No changes. Run the script in 64-bit PowerShell. |
| Not a Lenovo device | Returns `Failure:`. No changes. |
| Windows version other than Windows 10 or Windows 11 | Returns `Failure:`. No changes. |

Failures stop the script with an error, so your RMM platform reports the run as failed.

---

## Usage Examples

### Example 1: Remove Lenovo Vantage

```powershell
.\Uninstall-LenovoVantage.ps1
```

**What happens:**

- Every Lenovo Vantage component on the device is removed.
- Each Lenovo uninstaller gets up to 180 seconds to finish.
- Devices without Lenovo Vantage are left unchanged, so the script is safe to run on every Lenovo device.

### Example 2: Give slower devices more time

```powershell
.\Uninstall-LenovoVantage.ps1 -TimeoutSeconds 300
```

**What happens:**

- Each Lenovo uninstaller gets up to 5 minutes before it is stopped.

---

## Troubleshooting

| Problem | Cause | Solution |
|---------|-------|----------|
| The run takes several minutes | A Lenovo uninstaller is waiting for a confirmation that nobody can answer while the script runs as SYSTEM. | No action needed. The script stops the uninstaller after `TimeoutSeconds` and removes the component itself. |
| The run fails and the log lists a remaining folder | A file in the folder is locked or protected. | Restart the device and run again. |
| The run fails with a 64-bit PowerShell message | The RMM platform started the script in 32-bit PowerShell. | Run the script in 64-bit PowerShell. |
| The log says a reboot is required | Windows removes some items only during a restart. | Restart the device when convenient. |
| Lenovo Vantage is back after a successful run | It was reinstalled from the Microsoft Store, or Windows Update installed the ImController driver again. | Run the script again, and block Lenovo Vantage in your app management policy if it must stay off. |

---

## Files and Logs

| File | Location |
|------|----------|
| Script log | `.\Uninstall-LenovoVantage-log.txt` |
| Error log | `.\Uninstall-LenovoVantage-error.txt` |

---

## Changelog

### 2026-10-21

- Initial version of the document.
