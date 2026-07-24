---
id: '6da0235c-ed6e-4a81-b085-411337706b36'
slug: /6da0235c-ed6e-4a81-b085-411337706b36
title: 'Set-VMState'
title_meta: 'Set-VMState'
keywords: ['vm', 'hyper-v', 'reboot', 'restart', 'suspend', 'resume', 'scheduled task', 'maintenance']
description: 'Safely restarts a Hyper-V host while preserving and restoring the running state of all hosted virtual machines.'
tags: ['hyper-v', 'virtualization', 'windows', 'reboot']
draft: false
unlisted: false
last_update:
  date: 2026-07-24
---

## Description

Safely restarts a Windows Hyper-V host while preserving and restoring the running state of all hosted virtual machines (VMs). Before the host reboots, every running VM is gracefully suspended; after the host comes back online, a self-cleaning scheduled task automatically resumes each VM that was running beforehand. This is intended for maintenance and update scenarios where VM uptime and state preservation are critical.

The resume logic runs from a signed, Base64-encoded post-reboot script that is embedded in this script, decoded to disk at runtime, and launched by a startup scheduled task. See [Maintenance](#maintenance) for how to update the embedded script.

---

## How It Works

### Pre-Reboot (main script)

1. **Preferences & TLS:** Configures PowerShell preferences for silent operation and enables TLS 1.2/1.3 for secure communication.
2. **Strapper Module Management:** Ensures the `Strapper` module is installed, up-to-date, and imported, then calls `Set-StrapperEnvironment`.
3. **OS Check:** Verifies the Hyper-V role is enabled. If not, the script aborts.
4. **Hyper-V Service:** Confirms the `vmms` service is running, attempting to start (then restart) it if necessary. Aborts if it cannot be started.
5. **VM State Capture:** Collects all VMs currently in a `Running`, `Starting`, or `Active` state and stores their state in the `VMStateInfo` Strapper table using `Write-StoredObject`.
6. **Working Directory:** Ensures the working directory `C:\ProgramData\_automation\script\Set-VMState` exists.
7. **Post-Reboot Script Deployment:** Decodes the embedded, signed post-reboot script from `$encodedResumeScript` and writes it to `Set-VMState.ps1` in the working directory (UTF-8 without BOM).
8. **Scheduled Task Creation:** Registers a startup scheduled task named `Post Reboot - Set-VMState` that runs the post-reboot script as `NT AUTHORITY\SYSTEM` with highest privileges.
9. **VM Suspension:** Gracefully suspends all running VMs. If any VM fails to suspend, the reboot is aborted and every already-suspended VM is resumed.
10. **Host Restart:** Initiates a forced restart with a 10-second countdown (`shutdown -r -t 10 -f`).

### Post-Reboot (scheduled task)

Performed automatically by the `Post Reboot - Set-VMState` scheduled task after the host restarts:

1. Imports `Strapper` and configures the environment.
2. Retrieves the pre-reboot VM state from the `VMStateInfo` table.
3. Waits (up to 300 seconds) for the `vmms` service to reach a `Running` state, forcing a start if needed.
4. Resumes each VM that was running before the reboot, falling back to `Start-VM` if `Resume-VM` fails.
5. Removes its own scheduled task. This runs in an `End` block, so cleanup is guaranteed even if the resume step fails.

---

## Requirements

- **PowerShell Version:** Requires PowerShell 5.1 or later.
- **Operating System:** Windows Server (or Windows client) with the **Hyper-V role enabled**.
- **Administrative Privileges:** The script must be run as an administrator (`#requires -RunAsAdministrator`).
- **Services:** The Hyper-V Virtual Machine Management service (`vmms`) must be present; the script will start it if it is not running.
- **Internet Access:** Required to install/update the `Strapper` module from the PowerShell Gallery.
- **Modules:** The `Strapper` module is required for cross-reboot state persistence and logging. The script ensures it is installed and up-to-date.

---

## Usage

The script takes no parameters. Run it directly on the Hyper-V host to suspend running VMs, reboot the host, and automatically resume the VMs afterward.

```powershell
.\Set-VMState.ps1
```

---

## Parameters

This script has no parameters. All required values are handled internally.

---

## Output

Logging is handled by `Strapper` (`Write-Log`). Output files are written to the working directory:

```
C:\ProgramData\_automation\script\Set-VMState\Set-VMState-log.txt
C:\ProgramData\_automation\script\Set-VMState\Set-VMState-error.txt
```

---

## Maintenance

The post-reboot resume logic is stored twice in `Set-VMState.ps1`:

- A single-quoted here-string (assigned to `$null`) that is the **authoritative, editable source** of the post-reboot script. Make all changes to the resume logic here.
- `$encodedResumeScript`, a Base64 (Unicode) string containing the **signed** version of that same script, which is what actually runs at reboot.

If you modify the post-reboot logic, you must keep the two in sync:

1. Edit the here-string reference in `Set-VMState.ps1`.
2. Save its content to a `.ps1` file.
3. Sign the file using the ProVal code-signing portal: <https://codesign.provaltech.com/>
4. Encode the signed file and paste the result into `$encodedResumeScript`:

   ```powershell
   $signedScriptPath = 'C:\Path\To\Signed\Set-VMState.ps1'
   $scriptBytes = [System.IO.File]::ReadAllBytes($signedScriptPath)
   $encodedResumeScript = [Convert]::ToBase64String($scriptBytes)
   $encodedResumeScript
   ```

See the `.SIGNED_SCRIPT_PROCESS` section in the script's help block for full details.

---

## Changelog

### 2026-07-24

- Initial version of the document
