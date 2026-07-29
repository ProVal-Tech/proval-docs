---
id: '13ac3912-863b-41fe-bb61-dfd681f06fa8'
slug: /13ac3912-863b-41fe-bb61-dfd681f06fa8
title: 'TLS/SSL Security Hardening'
title_meta: 'TLS/SSL Security Hardening'
keywords: ['tls','ssl','security-hardening','tls-1.2','compliance','windows','self-healing']
description: 'Continuously validates and self-heals Windows TLS/SSL configuration to meet the TLS 1.2 mandate so endpoints keep communicating with the platform.'
tags: ['security','tls','windows']
draft: false
unlisted: false
last_update:
  date: 2026-07-28
---

## Purpose

The TLS/SSL Security Hardening solution keeps every managed Windows device configured to the secure‑connection standard the platform requires, and it does so continuously rather than as a one‑off project. As the platform retires the older, insecure connection protocols, a device that is left on the old settings can quietly lose the ability to talk to our data centres after the regional rollout dates. This solution is the supported, hands‑off way to bring devices into compliance and to keep them there: it watches the fleet, finds the devices that have drifted out of step, and fixes them automatically, without anyone having to remember to look.

The solution is built from four moving parts that work together as a closed loop. Think of the monitor as the eyes, the task as the hands, the custom field as the shared memory, and the compliance group as the dashboard:

- **The compliance monitor** looks at each Windows device on a schedule (every 24 hours by default) and compares its current secure‑connection settings against the required standard, without changing anything. If everything matches, it records the device as compliant; if something is missing or wrong, it reports that work is needed and the platform automatically launches the hardening task against that device.
- **The hardening task (the auto‑fix)** is what actually changes the settings. It switches off the old, insecure protocols (SSL 3.0, TLS 1.0 and TLS 1.1), switches on the modern, supported ones (TLS 1.2, and TLS 1.3 on devices that support them), tightens the underlying Windows and .NET security options, and removes a small set of weak encryption methods. It only touches settings that are not already correct, and when it finishes it writes the list of protocols that are now enabled on the device into the shared custom field.
- **The shared custom field** (`TLS_SSL_Enabled_Protocols`) is the pivot the whole solution turns on. The task writes it, the compliance group reads it, and it is the single source of truth for which protocols each device currently has enabled.
- **The compliance group** (`TLS 1.2 Not Enabled`) is a live view of the fleet. Because it is defined by the custom field, it automatically contains exactly the Windows devices whose enabled‑protocol list does not yet include TLS 1.2, so you can see rollout progress at a glance and target any stragglers by hand if you want to.

The loop runs like this: the monitor checks a device; a non‑compliant device triggers the task; the task hardens the device and updates the custom field; on the next check the device reports as compliant and the loop rests; and all the while the compliance group shrinks as devices come into line. The result is a fleet that stays compliant on its own, with a clear, always‑current picture of the few devices that still need attention.

## Key Capabilities

- **Continuous Compliance Checking:** The monitor inspects every Windows device on a recurring schedule, so compliance is verified automatically over time instead of only when someone runs a manual audit. Drift caused by rebuilds, manual changes or new machines joining the fleet is caught on the next check.
- **Automatic Self‑Healing:** When the monitor finds a device out of compliance it launches the hardening task on its own. There is no ticket to triage and no manual run to schedule for the routine case; the gap is closed without human effort.
- **Idempotent, Change‑Only Hardening:** The task writes a setting only when the current value differs from the required value. Re‑running it on an already‑compliant device changes nothing and causes no disruption, which also means a routine re‑run never restarts a machine by surprise.
- **OS‑Aware Protocol Enablement:** TLS 1.2 and TLS 1.3 are enabled only on operating systems that actually support them, while the legacy protocols are disabled on every system. This keeps supported devices connected and avoids asking an old operating system to do something it cannot.
- **Live Compliance Dashboard:** The `TLS 1.2 Not Enabled` group reflects the custom field in real time, giving you an always‑current list of the Windows devices that are not yet TLS 1.2 compliant, useful both for tracking the rollout and for targeting the task manually.
- **Shared State Through One Field:** A single endpoint custom field carries the enabled‑protocol list between the task and the group, so the value you see, the value the monitor reasons about, and the value the group filters on all come from the same place and never disagree.
- **Quiet, Non‑Disruptive Operation:** The monitor is read‑only and generates no tickets by default; it fixes problems silently. The task is safe to leave wired as the auto‑fix because it is repeatable and only acts where there is real work to do.
- **Broad Compatibility:** Both scripts run on Windows PowerShell 3.0 and later, so the solution covers the older fleet where enabling TLS 1.2 matters most, including Windows Server 2012, Windows Server 2012 R2, Windows 8 and Windows 8.1.

## Important Caveats & Behavior

- **Reboot Required for Changes to Take Effect:** The hardening task saves the new protocol, cipher and .NET settings to the device immediately, but Windows only loads them at start‑up. Until the device is rebooted it keeps using the previous connection settings, so the hardening is not yet active in the running system. Use the task's `ForceReboot` option to reboot automatically, or plan a reboot during a maintenance window.
- **ForceReboot Only Reboots When Something Changed:** `ForceReboot` schedules a forced reboot about 60 seconds after a run, and only when that run actually changed at least one setting. A re‑run against an already‑compliant device therefore never reboots, even with `ForceReboot` enabled. When `ForceReboot` is left disabled the task never reboots, and the changes stay saved but inactive until the next reboot.
- **Up to a 24‑Hour Detection Window:** Because the monitor runs on a schedule, there can be up to about a day between a device drifting out of compliance and the monitor noticing it and launching the fix. For an urgent, fleet‑wide rollout you can run the hardening task directly instead of waiting for the next check.
- **First Check on an Un‑Hardened Device Triggers the Fix:** A device that has never been hardened will report as needing work on its first check. That is expected and is exactly how the solution kicks off the initial fix; after the task runs once, the device should report as compliant on the following check.
- **Compliant on Disk Before the Reboot:** The monitor reads the settings as they are saved on the device, not the settings currently active in memory. A device can therefore show as compliant before it has actually been rebooted. That is normal; the reboot is still required for the new protocol and encryption settings to be in use. The monitor also does not flag a pending reboot on its own, because re‑running the task cannot perform a reboot a compliant device does not need.
- **Oldest Operating Systems Cannot Enable TLS 1.2:** On Windows Server 2008, Windows Server 2008 R2 and earlier the operating system does not support TLS 1.2, so the task cannot switch it on there. The task still switches the old protocols off (the right thing for security), but after a reboot such a device may have no supported protocol left and could lose connectivity. For those machines the required step is an operating‑system upgrade, not this solution, and a compliant result on the monitor should not be read as proof of connectivity on them.
- **No Tickets by Default:** The monitor is configured to fix problems quietly rather than raise support tickets: a non‑compliant device launches the task automatically and opens no ticket, and a failed check does not escalate. If you would rather be notified by ticket when a device is non‑compliant, that is a separate setting to switch on in the monitor configuration.
- **The Scope Group Is Shared:** The `Windows Machines` group that the monitor runs against is also used by the Windows Secure Boot Audit solution. It is shared infrastructure, so changes to that group's criteria affect both solutions; treat it accordingly when editing it.

## Associated Content

### Group

| Name | Purpose |
| --- | --- |
| [Windows Machines](/docs/b0c8b058-2cac-4922-a6a7-1c4275c4be15) | Dynamic group of all Windows endpoints; this is the scope the compliance monitor runs against. Shared with the Windows Secure Boot Audit solution. |
| [TLS 1.2 Not Enabled](/docs/c95f3d6d-f045-4f44-86ae-d7e7e5a3db3e) | Dynamic group that acts as the live compliance view: it automatically contains the Windows devices whose `TLS_SSL_Enabled_Protocols` value does not include TLS 1.2, so you can track rollout progress and target stragglers by hand. |

### Task

| Name | Purpose |
| --- | --- |
| [Enforce TLS/SSL Hardening (TLS 1.2 Upgrade)](/docs/79112007-ac74-4fde-97f5-59d56dbe0282) | The auto‑fix. Hardens the TLS/SSL settings (disables legacy protocols, enables TLS 1.2 and 1.3 where supported, sets .NET strong crypto, removes weak ciphers), writes only what has changed, and stores the resulting enabled‑protocol list into the custom field. Accepts the `ForceReboot` parameter to reboot after a change. |

### Monitor

| Name | Purpose |
| --- | --- |
| [Validate TLS/SSL Hardening Compliance](/docs/a304b2ff-557f-4715-81cf-7becc125b350) | Read‑only check that runs every 24 hours against the Windows Machines group. Emits a single line: `Autofix Not Required` when compliant, or `Autofix Required` with the reasons when not. On the latter it launches the hardening task as its automation, and generates no ticket. |

### Custom Fields

This single field is the shared state for the whole solution: the task writes it after hardening, the `TLS 1.2 Not Enabled` group reads it to build the compliance view, and it is the source of truth for which protocols each device currently has enabled.

| Name | Level | Type | Purpose |
| --- | --- | --- | --- |
| [TLS_SSL_Enabled_Protocols](/docs/a90fed7d-ec54-429a-a7cf-14a1af8870bb) | Endpoint | Textarea | Comma‑separated list of the TLS/SSL protocol versions currently enabled on the device, read from the live registry after hardening. Written by the task and read by the compliance group; not user‑editable. |

## Implementation

Follow these steps in order so that each component exists before the next one tries to reference it. The custom field must come first because both the task and the compliance group depend on it; the monitor comes last because it references both the scope group and the task.

### Step 1: Create the Custom Field

Create the shared endpoint custom field that the task will write and the compliance group will read.

- [Custom Field: TLS_SSL_Enabled_Protocols](/docs/a90fed7d-ec54-429a-a7cf-14a1af8870bb)

### Step 2: Create or Confirm the Scope Group

Create the dynamic group of Windows endpoints that the monitor will run against. If this group already exists in your environment (it is shared with the Windows Secure Boot Audit solution), you can skip creating it and simply confirm it is present.

- [Group: Windows Machines](/docs/b0c8b058-2cac-4922-a6a7-1c4275c4be15)

### Step 3: Create the Compliance Group

Create the dynamic group that gives you the live view of devices not yet on TLS 1.2. It depends on the custom field from Step 1, which is why it is created after it.

- [Group: TLS 1.2 Not Enabled](/docs/c95f3d6d-f045-4f44-86ae-d7e7e5a3db3e)

### Step 4: Create the Task

Set up the hardening task that the monitor will call as its auto‑fix. Configure the `ForceReboot` parameter according to your reboot policy (see Step 6). The task stores its output into the custom field from Step 1 and records the same value in the script log.

- [Task: Enforce TLS/SSL Hardening (TLS 1.2 Upgrade)](/docs/79112007-ac74-4fde-97f5-59d56dbe0282)

### Step 5: Create the Monitor

Set up the read‑only compliance monitor, point it at the `Windows Machines` group from Step 2, and wire the task from Step 4 as its automation so a non‑compliant result launches the fix automatically. The monitor is set to run on a schedule (every 24 hours by default) and to generate no ticket.

When you configure the monitor set's string condition, set the *Script Output* value to exactly the string the script prints for the work‑needed state, `Autofix Required`. The healthy state the script prints is `Autofix Not Required`, which never contains the phrase `Autofix Required`, so a single *Contains* condition cleanly separates the two states. Make sure the condition value matches the script output exactly; if it does not match, the auto‑fix will never trigger and devices will never register as compliant.

- [Monitor: Validate TLS/SSL Hardening Compliance](/docs/a304b2ff-557f-4715-81cf-7becc125b350)

### Step 6: Track Compliance and Run an Initial Rollout If Needed

Once the monitor is live it will find and fix non‑compliant devices on its own within the 24‑hour window. Watch the `TLS 1.2 Not Enabled` group from Step 3 as your dashboard: it should steadily empty as devices are hardened and rebooted. If you want to harden the whole fleet immediately rather than wait for the monitor to reach every device, run the hardening task directly against the `Windows Machines` group (or against the `TLS 1.2 Not Enabled` group to target only the stragglers); the monitor will then confirm each device as compliant on its next check.

## FAQ

**Q: In plain terms, what does this solution do?**  
> It keeps your Windows devices set up to use the modern, secure connection protocols the platform requires. It checks each device on a schedule, and if a device is not configured correctly it fixes it automatically, so devices do not quietly fall out of compliance and lose the ability to talk to our services.

**Q: How does a device actually get fixed?**  
> You usually do not have to do anything. The compliance monitor checks the device, sees that something is wrong, and launches the hardening task against it as its automatic action. The task then changes only the settings that are not already correct and records the result.

**Q: Do I ever need to run the hardening task myself?**  
> Not for the routine case; the monitor handles it. You would run the task by hand when you want an immediate, fleet‑wide hardening instead of waiting up to 24 hours for the monitor to reach every device, or when you want to target a specific set of machines (for example the `TLS 1.2 Not Enabled` group).

**Q: When do the changes take effect?**  
> The new settings are saved to the device straight away, but Windows only loads them at start‑up, so they are not active until the device is rebooted. Enable `ForceReboot` on the task to reboot automatically after a change, or reboot the device yourself during a maintenance window.

**Q: Will this reboot my machines unexpectedly?**  
> Only if `ForceReboot` is enabled and the task actually changed at least one setting on that run. A re‑run on a device that is already compliant changes nothing and therefore never reboots, even with `ForceReboot` on. With `ForceReboot` disabled the task never reboots at all.

**Q: A device shows as compliant, but I have not rebooted it yet. Is it really fixed?**  
> It is correctly configured on disk, which is what the monitor reads, so the monitor reports it as compliant. However, the new protocol and encryption settings are not active in the running system until the device reboots, so the reboot is still required for the hardening to be in use.

**Q: How quickly will a non‑compliant device be fixed?**  
> The monitor runs on a schedule, every 24 hours by default, so in the worst case it can take about a day from the moment a device drifts out of compliance to the moment the monitor notices and launches the fix. Run the hardening task directly if you cannot wait for the next check.

**Q: What happens on Windows Server 2008 and 2008 R2?**  
> Those operating systems do not support TLS 1.2, so the task cannot switch it on there. It will still switch the old, insecure protocols off, but after a reboot such a device may have no supported protocol left and could lose connectivity. For those machines the right step is an operating‑system upgrade, and a compliant result on the monitor should not be taken as proof that the device can connect.

**Q: Does the solution create support tickets?**  
> Not by default. The monitor is set up to fix problems quietly: a non‑compliant device launches the hardening task and opens no ticket, and a failed check does not escalate. If you would rather receive a ticket when a device is non‑compliant, that is a separate setting you can switch on in the monitor configuration.

**Q: What does the `TLS 1.2 Not Enabled` group show me?**  
> It is a live list of the Windows devices whose enabled‑protocol list does not yet include TLS 1.2. It updates automatically as the custom field changes, so it works as a rollout dashboard (it should shrink toward empty) and as a convenient target if you want to run the hardening task on just the devices that still need it.

**Q: What is stored in the `TLS_SSL_Enabled_Protocols` field?**  
> A comma‑separated list of the protocol versions that are enabled on the device, read from the live settings after hardening (for example `TLS 1.2, TLS 1.3`). An empty value means no protocol is currently enabled on that device, which on the oldest operating systems is the expected result after the legacy protocols are switched off.

**Q: Is it safe to run the hardening task many times?**  
> Yes. The task is repeatable by design: it writes a setting only when the current value differs from the required value, so running it again on a compliant device changes nothing, causes no disruption and triggers no reboot.

**Q: Why would the monitor say work is needed on a brand‑new device?**  
> A device that has never been hardened does not yet have the explicit settings laid down, so the monitor correctly reports that work is needed on the first check. That is the intended first‑run trigger; once the task runs, the following check should report the device as compliant.

**Q: How does the monitor decide whether a device needs fixing?**  
> The monitor's script prints exactly one line, and the monitor set compares that line with a *Contains* condition. The work‑needed line begins with `Autofix Required` (followed by the specific reasons) and the healthy line is `Autofix Not Required`. Set the monitor set's *Script Output* condition to exactly `Autofix Required`; because the healthy line never contains that phrase, the two states stay cleanly separated and the auto‑fix only runs when there is real work to do.

**Q: The monitor and the task seem to do similar things. Why are there two?**  
> They have different jobs. The monitor only looks and decides; it never changes anything, so it is safe to run on a schedule across the whole fleet. The task only changes things; it is the action the monitor calls when it finds a problem. Keeping the read‑only check separate from the change‑making action is what lets the solution watch continuously and act only where needed.

## Changelog

### 2026-07-28

- Initial version of the document
