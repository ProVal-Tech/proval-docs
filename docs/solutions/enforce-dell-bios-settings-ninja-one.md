---
id: 'd3ee4598-13c1-4d19-8b6c-d368f2a00ab3'
slug: /d3ee4598-13c1-4d19-8b6c-d368f2a00ab3
title: 'Enforce Dell BIOS Settings'
title_meta: 'Enforce Dell BIOS Settings'
keywords: ['bios', 'bios-configuration', 'dell', 'dell-command-configure', 'wake-on-lan', 'auto-on', 'device-standards']
description: 'Audits and enforces a standard set of BIOS settings on Dell workstations, such as a daily power-on time and Wake on LAN, managed through custom fields with Audit and Enforce modes.'
tags: ['windows', 'setup', 'bios', 'dell']
draft: false
unlisted: false
last_update:
  date: 2026-10-16
---

## Purpose

This solution keeps BIOS settings on Dell workstations in line with a standard you define, for example powering on every day at 9 PM and allowing the device to wake from the network or when power is connected. Start in Audit mode to see which devices differ, then switch to Enforce to apply the settings. Applied settings take effect after the next restart.

## Associated Content

### Custom Fields

| Name | Example | Type | Level | Required | Purpose |
| ---- | ------- | ---- | ----- | -------- | ------- |
| [cPVAL Enforce Dell BIOS Settings](/docs/eb1c5a88-0933-45e4-96e7-f71422e4ddba) | Audit | Drop-down | Organization, Location, Device | Yes | Turns the solution on in Audit or Enforce mode. |
| [cPVAL Dell BIOS Settings](/docs/0ca65a80-d1c0-4ef9-b078-cd3e8d9d89db) | `AutoOnHr=21` | Multi-line | Organization, Location, Device | Yes | The expected BIOS settings, one per line. |
| [cPVAL Dell BIOS Settings Status](/docs/1ddc8f49-ede2-4d44-871e-b448e8ba61ba) | Compliant | Text | Device | Yes | Shows the result on each device. Read-only. |

### Automation Scripts

| Name | Purpose |
| ---- | ------- |
| [Check Dell BIOS Settings](/docs/a9117300-d45b-45e8-9cfe-e85859b1931b) | Checks the BIOS settings and stores the result. Triggers the apply script in Enforce mode. |
| [Apply Dell BIOS Settings](/docs/b0c846eb-72d8-48ea-84b5-af87a02aa955) | Applies the settings that differ and flags the device for a restart. |

### Compound Condition

| Name | Purpose |
| ---- | ------- |
| [Enforce Dell BIOS Settings](/docs/86f44138-3e57-4c1f-8d7e-c4a0efc70fac) | Runs the check once a day on Dell workstations where the solution is set to Audit or Enforce, and runs the apply script when needed. |

## Implementation

### Step 1: Create the custom fields

- [Custom Field: cPVAL Enforce Dell BIOS Settings](/docs/eb1c5a88-0933-45e4-96e7-f71422e4ddba)
- [Custom Field: cPVAL Dell BIOS Settings](/docs/0ca65a80-d1c0-4ef9-b078-cd3e8d9d89db)
- [Custom Field: cPVAL Dell BIOS Settings Status](/docs/1ddc8f49-ede2-4d44-871e-b448e8ba61ba)

### Step 2: Import the automations

- [Automation: Check Dell BIOS Settings](/docs/a9117300-d45b-45e8-9cfe-e85859b1931b)
- [Automation: Apply Dell BIOS Settings](/docs/b0c846eb-72d8-48ea-84b5-af87a02aa955)

### Step 3: Create the compound condition

Create [Compound Condition: Enforce Dell BIOS Settings](/docs/86f44138-3e57-4c1f-8d7e-c4a0efc70fac) in the `Windows Workstation [Default]` policy.

### Step 4: Enter the expected settings

Set [cPVAL Dell BIOS Settings](/docs/0ca65a80-d1c0-4ef9-b078-cd3e8d9d89db) at the organization level. For example, to power on every day at 9 PM and allow Wake on LAN, Wake on AC and Wake on Dock:

```PlainText
AutoOn=Everyday
AutoOnHr=21
AutoOnMn=0
WakeOnAc=Enabled
WakeOnDock=Enabled
WakeOnLan=LanOnly
DeepSleepCtrl=Disabled
```

`DeepSleepCtrl=Disabled` lets models with Deep Sleep Control wake from a powered-off state. Models without a setting skip it. See [cPVAL Dell BIOS Settings](/docs/0ca65a80-d1c0-4ef9-b078-cd3e8d9d89db) for the format rules.

### Step 5: Audit the devices

Set [cPVAL Enforce Dell BIOS Settings](/docs/eb1c5a88-0933-45e4-96e7-f71422e4ddba) to Audit at the organization level. After the next check, [cPVAL Dell BIOS Settings Status](/docs/1ddc8f49-ede2-4d44-871e-b448e8ba61ba) shows Compliant or Non-Compliant on each Dell workstation, with the settings that differ.

### Step 6: Enforce the settings

Set [cPVAL Enforce Dell BIOS Settings](/docs/eb1c5a88-0933-45e4-96e7-f71422e4ddba) to Enforce. Settings that differ are applied, and the status shows Applied - Reboot Pending. Restart the devices to complete the change. After the restart, the status changes to Compliant.

## FAQ

**Q: Do the devices restart automatically?**  
A: No. The solution sets the status to Applied - Reboot Pending. Restart the devices at a convenient time. The settings are verified after the restart.

**Q: How do I exclude a location or device?**  
A: Set [cPVAL Enforce Dell BIOS Settings](/docs/eb1c5a88-0933-45e4-96e7-f71422e4ddba) to None at that location or device.

**Q: What happens on models that do not support a setting?**  
A: The setting is skipped, and the rest are applied. Skipped settings are listed after Not supported in the status.

**Q: Where do I find the option names and values?**  
A: See the [Dell Command | Configure BIOS options reference](https://www.dell.com/support/manuals/en-us/command-configure-v4.2/dcc_cli_4.2/bios-options?guid=guid-44c059be-b76d-4b2f-b8ef-655f736c40ce&lang=en-us). To see a setting's current value on a device, run the [Dell Command | Configure](/docs/af7ff7d0-f398-462a-a896-9ae24920f151) automation with the option name, for example `--WakeOnLan`.

**Q: What if a device has a BIOS setup password?**  
A: The change fails, and the status shows Failed with the reason. Devices with a BIOS password are not supported by this solution.

**Q: Why does the check activity fail in Enforce mode?**  
A: A failed check means settings differ. It tells the compound condition to run the apply script.

**Q: How do I see which devices are compliant?**  
A: Create a device group filtered on [cPVAL Dell BIOS Settings Status](/docs/1ddc8f49-ede2-4d44-871e-b448e8ba61ba), for example status contains Compliant, Reboot Pending or Failed.

**Note:** Changing BIOS settings affects how devices power on. Let users know that devices may turn on by themselves at the scheduled time.

## Changelog

### 2026-10-16

- Initial version of the document
