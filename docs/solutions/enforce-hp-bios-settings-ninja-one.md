---
id: 'ec68a35d-7884-4e39-bebb-6f2b37d77eca'
slug: /ec68a35d-7884-4e39-bebb-6f2b37d77eca
title: 'Enforce HP BIOS Settings'
title_meta: 'Enforce HP BIOS Settings'
keywords: ['bios', 'bios-configuration', 'hp', 'hp-bcu', 'wake-on-lan', 'power-on', 'device-standards']
description: 'Audits and enforces a standard set of BIOS settings on HP workstations, such as a daily power-on time and Wake on LAN, managed through custom fields with Audit and Enforce modes.'
tags: ['windows', 'setup', 'bios', 'hp']
draft: false
unlisted: false
last_update:
  date: 2026-10-16
---

## Purpose

This solution keeps BIOS settings on HP workstations in line with a standard you define, for example powering on every day at 9 PM and allowing the device to wake from the network or when power is connected. Start in Audit mode to see which devices differ, then switch to Enforce to apply the settings. Applied settings take effect after the next restart.

## Associated Content

### Custom Fields

| Name | Example | Type | Level | Required | Purpose |
| ---- | ------- | ---- | ----- | -------- | ------- |
| [cPVAL Enforce HP BIOS Settings](/docs/d6023b8f-c04c-4453-89ce-bc729be9fb79) | Audit | Drop-down | Organization, Location, Device | Yes | Turns the solution on in Audit or Enforce mode. |
| [cPVAL HP BIOS Settings](/docs/91f31a3a-5d44-4a05-a1fd-5eba010aa03a) | `Wake On LAN=Boot to Hard Drive` | Multi-line | Organization, Location, Device | Yes | The expected BIOS settings, one per line. |
| [cPVAL HP BIOS Settings Status](/docs/dae68716-9ea4-4f05-a0d4-4c2899fd22b7) | Compliant | Text | Device | Yes | Shows the result on each device. Read-only. |

### Automation Scripts

| Name | Purpose |
| ---- | ------- |
| [Check HP BIOS Settings](/docs/d04025b0-cb2a-4f49-b211-4e13c181d2f3) | Checks the BIOS settings and stores the result. Triggers the apply script in Enforce mode. |
| [Apply HP BIOS Settings](/docs/c338d928-7659-4ade-862c-7f8cebc3472d) | Applies the settings that differ and flags the device for a restart. |

### Compound Condition

| Name | Purpose |
| ---- | ------- |
| [Enforce HP BIOS Settings](/docs/20215141-015b-4108-b40b-26070194acc1) | Runs the check once a day on HP workstations where the solution is set to Audit or Enforce, and runs the apply script when needed. |

## Implementation

### Step 1: Create the custom fields

- [Custom Field: cPVAL Enforce HP BIOS Settings](/docs/d6023b8f-c04c-4453-89ce-bc729be9fb79)
- [Custom Field: cPVAL HP BIOS Settings](/docs/91f31a3a-5d44-4a05-a1fd-5eba010aa03a)
- [Custom Field: cPVAL HP BIOS Settings Status](/docs/dae68716-9ea4-4f05-a0d4-4c2899fd22b7)

### Step 2: Import the automations

- [Automation: Check HP BIOS Settings](/docs/d04025b0-cb2a-4f49-b211-4e13c181d2f3)
- [Automation: Apply HP BIOS Settings](/docs/c338d928-7659-4ade-862c-7f8cebc3472d)

### Step 3: Create the compound condition

Create [Compound Condition: Enforce HP BIOS Settings](/docs/20215141-015b-4108-b40b-26070194acc1) in the `Windows Workstation [Default]` policy.

### Step 4: Enter the expected settings

Set [cPVAL HP BIOS Settings](/docs/91f31a3a-5d44-4a05-a1fd-5eba010aa03a) at the organization level. For example, to power on every day at 9 PM, allow Wake on LAN, and power on when AC power is connected:

```PlainText
BIOS Power-On Time (hh:mm)=21:00
Sunday=Enable
Monday=Enable
Tuesday=Enable
Wednesday=Enable
Thursday=Enable
Friday=Enable
Saturday=Enable
Wake On LAN=Boot to Hard Drive
Power On When AC Detected=Enable
After Power Loss=Power On
```

:::important  
Setting names may differ between HP models. Run the [HP Bios Configuration Utility](/docs/f7456518-5258-490c-b2f8-40ebef1c4007) automation with no argument on one device of each model and use the names it lists. Models without a setting skip it. See [cPVAL HP BIOS Settings](/docs/91f31a3a-5d44-4a05-a1fd-5eba010aa03a) for the format rules.  
:::

### Step 5: Audit the devices

Set [cPVAL Enforce HP BIOS Settings](/docs/d6023b8f-c04c-4453-89ce-bc729be9fb79) to Audit at the organization level. After the next check, [cPVAL HP BIOS Settings Status](/docs/dae68716-9ea4-4f05-a0d4-4c2899fd22b7) shows Compliant or Non-Compliant on each HP workstation, with the settings that differ.

### Step 6: Enforce the settings

Set [cPVAL Enforce HP BIOS Settings](/docs/d6023b8f-c04c-4453-89ce-bc729be9fb79) to Enforce. Settings that differ are applied, and the status shows Applied - Reboot Pending. Restart the devices to complete the change. After the restart, the status changes to Compliant.

## FAQ

**Q: Do the devices restart automatically?**  
A: No. The solution sets the status to Applied - Reboot Pending. Restart the devices at a convenient time. The settings are verified after the restart.

**Q: How do I exclude a location or device?**  
A: Set [cPVAL Enforce HP BIOS Settings](/docs/d6023b8f-c04c-4453-89ce-bc729be9fb79) to None at that location or device.

**Q: What happens on models that do not support a setting?**  
A: The setting is skipped, and the rest are applied. Skipped settings are listed after Not supported in the status.

**Q: Where do I find the setting names and values?**  
A: Run the [HP Bios Configuration Utility](/docs/f7456518-5258-490c-b2f8-40ebef1c4007) automation with no argument on one device of each model. It lists every setting with its options. Names differ between HP models and BIOS generations, so check each model you manage.

**Q: What if a device has a BIOS setup password?**  
A: The change fails, and the status shows Failed with the reason. Devices with a BIOS password are not supported by this solution.

**Q: Why does the check activity fail in Enforce mode?**  
A: A failed check means settings differ. It tells the compound condition to run the apply script.

**Q: How do I see which devices are compliant?**  
A: Create a device group filtered on [cPVAL HP BIOS Settings Status](/docs/dae68716-9ea4-4f05-a0d4-4c2899fd22b7), for example status contains Compliant, Reboot Pending or Failed.

**Note:** Changing BIOS settings affects how devices power on. Let users know that devices may turn on by themselves at the scheduled time.

## Changelog

### 2026-10-16

- Initial version of the document
