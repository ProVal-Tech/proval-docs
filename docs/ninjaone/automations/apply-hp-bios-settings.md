---
id: 'c338d928-7659-4ade-862c-7f8cebc3472d'
slug: /c338d928-7659-4ade-862c-7f8cebc3472d
title: 'Apply HP BIOS Settings'
title_meta: 'Apply HP BIOS Settings'
keywords: ['bios', 'bios-configuration', 'hp', 'hp-bcu', 'wake-on-lan', 'power-on', 'device-standards']
description: 'Applies the HP BIOS settings from the cPVAL HP BIOS Settings custom field that differ on the device and flags the device for a restart in cPVAL HP BIOS Settings Status.'
tags: ['windows', 'setup', 'bios', 'hp']
draft: false
unlisted: false
last_update:
  date: 2026-10-16
---

## Overview

This script applies the expected BIOS settings to a HP workstation and flags the device for a restart. It runs automatically from the [Enforce HP BIOS Settings](/docs/20215141-015b-4108-b40b-26070194acc1) compound condition when settings differ.

**When to use:**

- Bring HP BIOS settings in line with the standard, for example a daily power-on time and Wake on LAN.
- Re-apply the settings when they were changed on a device.

**How it works:**

- Runs only when [cPVAL Enforce HP BIOS Settings](/docs/d6023b8f-c04c-4453-89ce-bc729be9fb79) is set to Enforce.
- Only the settings that differ are changed. Each value is checked against the options this model offers before anything is changed.
- Settings this model does not have are skipped and listed.
- The status is set to Applied - Reboot Pending. The script does not restart the device.
- After the device restarts, [Check HP BIOS Settings](/docs/d04025b0-cb2a-4f49-b211-4e13c181d2f3) verifies the settings and sets the status to Compliant.

**Requirements:**

- HP workstation running Windows 10 or Windows 11.
- Runs elevated (System context).
- No BIOS setup password on the device. With a password set, the change fails and the status shows the reason.
- The custom fields listed in Dependencies.

## Sample Run

![SampleRun1](../../../static/img/docs/c338d928-7659-4ade-862c-7f8cebc3472d/image1.webp)

## Scenarios

### Example 1: Running the script on a device with different settings

Some settings on the device differ from [cPVAL HP BIOS Settings](/docs/91f31a3a-5d44-4a05-a1fd-5eba010aa03a). Only those settings are changed, and the device is not restarted. Restart the device to complete the change. The next check after the restart verifies the settings and sets the status to Compliant.

**Status:** `Applied - Reboot Pending | 2026-10-16 21:05:12 | Changed: Wake On LAN, Sunday`

### Example 2: Running the script on a model that does not have every setting

The model does not have one of the expected settings, such as After Power Loss on many laptops. That setting is skipped, and the rest are applied.

**Status:** `Applied - Reboot Pending | 2026-10-16 21:05:12 | Changed: Wake On LAN, Sunday; Not supported: After Power Loss`

### Example 3: Running the script with a value the model does not offer

An expected value is not one of the options this model offers, for example `Wake On LAN=Enable` on a model whose options are Disable, Boot to Network and Boot to Hard Drive. Nothing is changed on the device, and the status lists the valid options.

**Status:** `Failed | 2026-10-16 21:05:12 | Invalid value: Wake On LAN=Enable (valid: Disable, Boot to Network, Boot to Hard Drive)`

### Example 4: Running the script when every setting already matches

The settings already match, for example because they were changed by hand after the last check. Nothing is changed on the device.

**Status:** `Compliant | 2026-10-16 21:05:12`

### Example 5: Running the script when the solution is not set to Enforce

[cPVAL Enforce HP BIOS Settings](/docs/d6023b8f-c04c-4453-89ce-bc729be9fb79) is set to Audit or None, or is left blank, for example when the script is run by hand. No settings are applied, and the status is not changed.

## Dependencies

- [Solution: Enforce HP BIOS Settings](/docs/ec68a35d-7884-4e39-bebb-6f2b37d77eca)
- [Compound Condition: Enforce HP BIOS Settings](/docs/20215141-015b-4108-b40b-26070194acc1)
- [Custom Field: cPVAL Enforce HP BIOS Settings](/docs/d6023b8f-c04c-4453-89ce-bc729be9fb79)
- [Custom Field: cPVAL HP BIOS Settings](/docs/91f31a3a-5d44-4a05-a1fd-5eba010aa03a)
- [Custom Field: cPVAL HP BIOS Settings Status](/docs/dae68716-9ea4-4f05-a0d4-4c2899fd22b7)
- [Script: Initialize-HPBiosConfigUtility](/docs/b5d53223-2755-48da-b4f5-a1cd5fa9f58f) (the underlying agnostic script)

## Custom Fields

| Field Name | Type | Mandatory | Scope | Description |
| ---------- | ---- | --------- | ----- | ----------- |
| [cPVAL Enforce HP BIOS Settings](/docs/d6023b8f-c04c-4453-89ce-bc729be9fb79) | Drop-down | Yes | Organization, Location, Device | Audit or Enforce turns the solution on. None or blank skips the device. |
| [cPVAL HP BIOS Settings](/docs/91f31a3a-5d44-4a05-a1fd-5eba010aa03a) | Multi-line | Yes | Organization, Location, Device | The expected settings, one `Setting Name=Value` pair per line. |
| [cPVAL HP BIOS Settings Status](/docs/dae68716-9ea4-4f05-a0d4-4c2899fd22b7) | Text | Yes | Device | Stores the result. Read-only for technicians. |

## Automation Setup/Import

[Automation Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/scripts/apply-hp-bios-settings.ps1)

## Output

- **Activity Details:** Each expected setting with PASS or FAIL, the settings that were applied, and the result.
- **Custom Field:** [cPVAL HP BIOS Settings Status](/docs/dae68716-9ea4-4f05-a0d4-4c2899fd22b7) is set to Applied - Reboot Pending, Compliant or Failed.
- **Restart:** The settings take effect after the next restart. The device is not restarted automatically.

## Changelog

### 2026-10-16

- Initial version of the document
