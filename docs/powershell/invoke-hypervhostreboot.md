---
id: '8e8f6b86-b431-4176-aad5-797a446a0609'
slug: /8e8f6b86-b431-4176-aad5-797a446a0609
title: 'Invoke-HyperVHostReboot'
title_meta: 'Invoke-HyperVHostReboot'
keywords: ['Hyper-V', 'Reboot', 'Maintenance Mode', 'Save-VM', 'Suspend', 'Resume', 'Virtual Machine', 'Domain Controller']
description: 'Safely reboots a Hyper-V host without generating false-positive monitoring tickets and without losing the running state of its guests.'
tags: ['hyper-v', 'reboot', 'virtualization', 'windows', 'monitoring']
draft: false
unlisted: false
last_update:
  date: 2026-07-21
---

## Overview

`Invoke-HyperVHostReboot.ps1` safely reboots a Hyper-V host without generating false-positive monitoring tickets and without losing the running state of its guests.

Because a host reboot terminates any running script, the work is split into two phases that share state through a state file and a one-time startup scheduled task:

- **Suspend phase** (`-Suspend`, the default — this is what your RMM invokes): puts the host and its guests into maintenance mode, saves (suspends) every running guest so its state survives the reboot, registers the resume task, and reboots the host.
- **Resume phase** (`-Resume`, invoked automatically at startup by the scheduled task): starts the previously saved guests, clears maintenance mode, and cleans itself up.

## Requirements

- Runs on the Hyper-V host itself (the Hyper-V PowerShell module must be present).
- PowerShell 5.0+ and Administrator privileges.
- The `Strapper` module (auto-installed).
- **Maintenance mode is a stub.** `Set-MaintenanceMode` currently only logs the intended action. To actually suppress tickets, drop your ConnectWise call into the marked `TODO` region inside that function (CW RMM/Asio API request, CW Automate agent flag, or an internal helper). Until then, run with `-SkipMaintenanceMode`, or leave it as-is (it is a safe no-op that logs a warning). The suspend/reboot/resume workflow is fully functional without it.

## Process

### Suspend Process (`-Suspend`)

1. Copies itself to a persistent path (`%ProgramData%\_Automation\Invoke-HyperVHostReboot`) so it and its state survive the reboot.
2. Enumerates running guests (healthy heartbeat) and classifies each as a Domain Controller or a standard VM (via guest FQDN + a DNS SRV lookup). If no running guests are found, it aborts without rebooting.
3. Places the host and running guests into maintenance mode (unless `-SkipMaintenanceMode`).
4. Saves each running guest (`Save-VM`) — standard VMs first, Domain Controllers last — waiting up to `LeadTime` seconds each.
5. If any guest fails to save, it rolls back (restarts the guests it already saved), clears maintenance mode, and does **not** reboot.
6. Writes the saved-guest list and settings to `reboot-state.xml` and registers the one-time `\ProVal\Invoke-HyperVHostReboot-Resume` startup task.
7. Waits `RebootDelaySeconds` (to let maintenance mode propagate) and reboots the host. Use `-NoReboot` to skip the actual reboot for testing.

### Resume Process (`-Resume`)

1. Runs automatically at startup via the scheduled task. If no state file is present, it removes the task and exits.
2. Waits for the Hyper-V Virtual Machine Management service (`vmms`) to be running.
3. Starts each saved guest — Domain Controllers first, standard VMs last — waiting up to `LeadTime` seconds each for a healthy heartbeat.
4. Clears maintenance mode for the host and guests (unless it was skipped during suspend).
5. Removes the state file and unregisters its own scheduled task.

The maintenance window (`MaintenanceWindowMinutes`) acts as a safety net: if the resume phase never runs, monitoring resumes automatically once the window expires.

## Payload Usage

### Example 1

Standard use — put host + guests into maintenance, save all running guests, and reboot. Guests are resumed automatically at startup.

```powershell
.\Invoke-HyperVHostReboot.ps1 -Suspend
```

### Example 2

Validate the save/resume flow without touching maintenance mode or rebooting.

```powershell
.\Invoke-HyperVHostReboot.ps1 -Suspend -SkipMaintenanceMode -NoReboot
```

### Example 3

Manually run the resume phase (normally triggered automatically after reboot).

```powershell
.\Invoke-HyperVHostReboot.ps1 -Resume
```

## Parameters

| Parameter                  | Alias | Required    | Default | Type   | Description                                                                                          |
| -------------------------- | ----- | ----------- | ------- | ------ | ---------------------------------------------------------------------------------------------------- |
| `Suspend`                  |       | True (Semi) |         | Switch | Run the suspend phase: maintenance on, save guests, register resume task, reboot. Default action.    |
| `Resume`                   |       | True (Semi) |         | Switch | Run the resume phase: start saved guests and clear maintenance mode. Invoked automatically at boot.  |
| `LeadTime`                 |       | False       | `300`   | Int    | Seconds to wait for each guest to reach its target state (Saved on suspend / healthy on resume).     |
| `RebootDelaySeconds`       |       | False       | `60`    | Int    | Seconds to wait after saving guests before rebooting, to let maintenance mode propagate.             |
| `MaintenanceWindowMinutes` |       | False       | `60`    | Int    | Length of the requested maintenance window, in minutes. Acts as a safety net if resume never runs.   |
| `SkipMaintenanceMode`      |       | False       | `False` | Switch | Skip all maintenance-mode calls (host is not monitored, or the stub is not yet wired up).            |
| `NoReboot`                 |       | False       | `False` | Switch | Run the full suspend workflow but do not reboot the host (for testing).                              |

## Output

- Invoke-HyperVHostReboot-log.txt
- Invoke-HyperVHostReboot-error.txt

During the reboot cycle, the persistent working copy, state file, and logs live under:

```
%ProgramData%\_Automation\Invoke-HyperVHostReboot\
```

## Changelog

### 2026-07-21

- Initial version of the document
