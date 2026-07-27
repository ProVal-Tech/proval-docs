---
id: '6da0235c-ed6e-4a81-b085-411337706b36'
slug: /6da0235c-ed6e-4a81-b085-411337706b36
title: 'Restart-HyperVHost'
title_meta: 'Restart-HyperVHost'
keywords: ['vm', 'hyper-v', 'reboot', 'restart', 'suspend', 'resume', 'scheduled task', 'maintenance']
description: 'Safely restarts a Hyper-V host while preserving and restoring the running state of all hosted virtual machines.'
tags: ['hyper-v', 'virtualization', 'windows', 'reboot']
draft: false
unlisted: false
last_update:
  date: 2026-07-24
---

## Overview

This script safely restarts a **Windows Hyper-V host**, ensuring that the running state of all hosted virtual machines (VMs) is preserved. It is designed for environments where VM state preservation is critical during maintenance, patching, or updates, and where live migration to another host is not available or desired.

Before the host reboots, the script:

- **Captures the state** of all currently running VMs.
- **Gracefully suspends (saves the state of)** all running VMs to disk.
- **Registers a secure, code-signed post-reboot script** as a SYSTEM-level startup scheduled task.

After the host reboots, the automated post-reboot step:

- Waits for the Hyper-V Virtual Machine Management service (`vmms`) to be fully running.
- **Resumes all previously running VMs** from their saved state.
- **Self-cleans** by removing the scheduled task to prevent re-execution on subsequent boots.

If any VM fails to suspend *before* the reboot, the script **automatically rolls back** (resuming any VMs it already suspended) and aborts the reboot, ensuring the host is never left in a partially suspended state.

## Quick Start

> **Validate compatibility → Run the script per reboot.**

Unlike cluster-aware live migration, this script relies on the hypervisor's ability to save and restore VM state to disk.

| Phase | When | What you do |
| --- | --- | --- |
| **1. Validate** (One-time) | Before first use | Confirm all running VMs are compatible with suspension (no Discrete Device Assignment, adequate disk space, Integration Services updated). See **Environment Setup**. |
| **2. Run** (Per reboot) | Each maintenance window | Run `Restart-HyperVHost.ps1` as Administrator (or via RMM as SYSTEM). It suspends VMs, reboots the host, and restores everything automatically. |

> **Remember:** This script is designed for standalone hosts or cluster nodes where you explicitly want to save/resume state rather than live-migrate.

## Requirements

**Environment prerequisites:**

- Windows Server with the **Hyper-V role installed and enabled**.
- **PowerShell 5.1** or later.
- Adequate **free disk space** on the volume hosting the VM configuration files to store the `.bin` and `.vsv` state files during suspension.
- Network connectivity to the PowerShell Gallery (to automatically install/update the `Strapper` module if missing).

**Runtime requirements:**

- The script must be run with **Administrative privileges** (it will elevate or run as `SYSTEM` via an RMM).
- The **Strapper** PowerShell module is used for logging and state persistence; the script installs it automatically from the PowerShell Gallery if missing.

## Environment Setup: Enabling Safe VM Suspension & Resume

For a VM to be successfully suspended and resumed without data corruption or failure, certain conditions must be met. Complete these checks **once** before using this script.

### Step 1 — Verify VM Suspension Compatibility

Certain VM configurations **cannot** be suspended. The script will abort if it encounters these. Check your running VMs for:

- **Discrete Device Assignment (DDA)**: VMs with passed-through PCIe devices (e.g., physical GPUs) cannot be saved.
- **Specific Virtual Fibre Channel or NVMe passthrough configurations** that do not support save states.
- **Nested Virtualization**: While often supported, ensure the nested hypervisor is in a state that allows the parent to save the VM.

*Validation Command:*

```powershell
Get-VM | Where-Object State -eq 'Running' | Select-Object Name, @{Name='HasDDA';Expression={(Get-VMAssignableDevice -VMName $_.Name).Count -gt 0}}
```

*(If `HasDDA` is `True`, that VM cannot be suspended. You must shut it down or remove the DDA before running this script.)*

### Step 2 — Configure Automatic Stop Action (Safety Net)

While the script explicitly calls `Suspend-VM`, it is a best practice to ensure the VM's `AutomaticStopAction` is set to `Save` or `SaveIfRunning`. This acts as a safety net in the highly unlikely event the host loses power *during* the script's execution window.

```powershell
Get-VM | Where-Object State -eq 'Running' | Set-VM -AutomaticStopAction SaveIfRunning
```

### Step 3 — Ensure Integration Services are Updated

For the cleanest resume experience (especially for network and filesystem consistency), ensure the VM's Guest Services and Integration Services are up to date and running.

```powershell
Get-VM | Where-Object State -eq 'Running' | Get-VMIntegrationService | Where-Object Enabled -eq $false
```

*(Enable any critical services like `Heartbeat`, `Shutdown`, and `Time Synchronization` if they are disabled.)*

### Step 4 — Verify Storage Capacity

Ensure the drive hosting the VM's configuration and snapshot files has enough free space to write the VM's memory state (`.bin`) and saved state (`.vsv`) files. A good rule of thumb is to have free space equal to at least the maximum RAM assigned to the VM.

## Impact

When you run this script on a host, it:

1. Verifies the Hyper-V role is enabled and the `vmms` service is running.
2. Captures the names and states of all running VMs and stores them securely via the `Strapper` module.
3. Writes a code-signed post-reboot restore script to `C:\ProgramData\_Automation\Script\Set-VMState\` and registers it as a startup scheduled task running as `SYSTEM`.
4. Iterates through all running VMs and executes `Suspend-VM`.
5. **Rollback Check:** If *any* VM fails to suspend, the script immediately stops, resumes any VMs it already suspended, deletes the scheduled task, and aborts the reboot.
6. If all VMs suspend successfully, it forces a host restart with a 10-second countdown.
7. After reboot, the scheduled task waits for `vmms`, resumes all saved VMs, and removes itself.

The script makes **no permanent changes** to VM configurations. Its own artifacts (the scheduled task and the post-reboot script) are removed automatically after the restore completes, or immediately upon rollback.

## What This Script Does Not Do

- Does **not** live-migrate VMs to another host. (Use `Restart-ClusterNode.ps1` for cluster-aware live migration).
- Does **not** gracefully shut down guest operating systems. It performs a hypervisor-level state save (equivalent to clicking "Save" in Hyper-V Manager).
- Does **not** support VMs with incompatible hardware passthrough (e.g., DDA). These must be powered off manually before running.
- Does **not** reboot more than one host at a time.

## Process

1. **OS & Service Checks**: Confirms the Hyper-V role is enabled and `vmms` is running (attempts to start/restart if not).
2. **State Capture**: Queries running VMs and persists the list using `Strapper`'s `Write-StoredObject`.
3. **Artifact Creation**: Decodes the embedded, signed post-reboot payload and writes it to disk. Registers the `SYSTEM`-level startup scheduled task. *(Done before disruptive actions for crash safety).*
4. **Suspension (with Rollback)**: Loops through running VMs, calling `Suspend-VM`. If a failure occurs, it triggers an automatic rollback loop (`Resume-VM`), cleans up artifacts, and throws a terminating error.
5. **Host Restart**: Executes `shutdown.exe -r -t 10 -f`.
6. **Post-Reboot Restore**: The scheduled task wakes up, waits up to 300 seconds for `vmms` to reach `Running`, iterates through the saved VM list, and calls `Resume-VM` (falling back to `Start-VM` if the VM is no longer in a `Saved` state). Finally, the `End` block unregisters the scheduled task.

## Payload Usage

This script takes **no parameters**. It discovers the running VMs automatically at runtime.

Run directly as Administrator:

```powershell
.\Restart-HyperVHost.ps1
```

> **Note on the Embedded Payload:** The script contains an embedded, code-signed post-reboot script (`Set-VMState.ps1`) encoded in Base64. If you ever modify the here-string source of that payload, you **must** re-sign it via the ProVal portal and re-encode it into the `$encodedResumeScript` variable. See the `.SIGNED_SCRIPT_PROCESS` section in the script's comment-based help for exact instructions.

## Parameters

This script takes **no parameters**. All required values (running VMs, paths, task names) are discovered or defined internally.

## Output

The main script and the post-reboot restore script both log via the `Strapper` module:

```text
.\Restart-HyperVHost-log.txt
.\Restart-HyperVHost-error.txt
C:\ProgramData\_Automation\Script\Set-VMState\Set-VMState-log.txt
C:\ProgramData\_Automation\Script\Set-VMState\Set-VMState-error.txt
```

## Troubleshooting

When the script stops, read the message it logged or threw. The script always rolls back before aborting, so a failed run leaves the host in its pre-run state.

| Symptom / Message | Likely Cause | What to Do |
| --- | --- | --- |
| `This computer does not have the Hyper-V role enabled. Aborting.` | The script is running on a non-Hyper-V machine. | Verify the OS and role installation. |
| `Failed to suspend VM <Name>. Aborting reboot...` | The VM has incompatible hardware (e.g., DDA), lacks disk space for the state file, or has a corrupted checkpoint. | Check the VM configuration. Remove DDA, free up disk space, or merge checkpoints. The script will have already resumed any other VMs. |
| `The encoded resume script is empty.` | The `$encodedResumeScript` variable was cleared or not populated. | Re-sign and re-encode the post-reboot script payload as described in `.SIGNED_SCRIPT_PROCESS`. |
| `Failed to start service vmms.` | The Hyper-V management service is disabled or corrupted. | Investigate Windows Event Viewer for Hyper-V-VMMS errors. Repair the role if necessary. |
| A VM did not resume after reboot. | The VM state file was corrupted, or the VM was manually altered during the reboot window. | Check the post-reboot log. Manually run `Start-VM -Name '<VM>'` or `Resume-VM -Name '<VM>'`. |
| The scheduled task is still present after reboot. | The post-reboot script encountered a fatal error before reaching the `End` block. | Review `Set-VMState-log.txt`. Complete any remaining recovery manually, then run: `Unregister-ScheduledTask -TaskName 'Post Reboot - Set-VMState' -Confirm:$false`. |

## Rollback and Undo

### If the script aborts before the reboot (Automatic Rollback)

If *any* VM fails to suspend, the script immediately halts. It then iterates through any VMs it successfully suspended up to that point and executes `Resume-VM`. Finally, it deletes the scheduled task and the post-reboot script file. **No manual cleanup is required**; fix the underlying VM issue and re-run.

### Manual Recovery After a Reboot

If the host rebooted but the post-reboot restore did not complete successfully:

1. **Resume or Start VMs manually:**

   ```powershell
   # If the VM is in a 'Saved' state:
   Resume-VM -Name '<VMName>'
   
   # If the VM is 'Off' (state was lost or it was stopped):
   Start-VM -Name '<VMName>'
   ```

2. **Remove the leftover scheduled task:**

   ```powershell
   Unregister-ScheduledTask -TaskName 'Post Reboot - Set-VMState' -Confirm:$false
   ```

3. **Review the logs** at `C:\ProgramData\_Automation\Script\Set-VMState\Set-VMState-log.txt` to identify why the automated resume failed.

## Changelog

### 2026-07-24

- Initial version of the document
