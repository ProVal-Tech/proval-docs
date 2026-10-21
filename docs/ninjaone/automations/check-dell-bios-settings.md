---
id: 'a9117300-d45b-45e8-9cfe-e85859b1931b'
slug: /a9117300-d45b-45e8-9cfe-e85859b1931b
title: 'Check Dell BIOS Settings'
title_meta: 'Check Dell BIOS Settings'
keywords: ['bios', 'bios-configuration', 'dell', 'dell-command-configure', 'wake-on-lan', 'auto-on', 'device-standards']
description: 'Checks Dell BIOS settings against the cPVAL Dell BIOS Settings custom field and stores the result in cPVAL Dell BIOS Settings Status. Triggers Apply Dell BIOS Settings in Enforce mode.'
tags: ['windows', 'setup', 'bios', 'dell']
draft: false
unlisted: false
last_update:
  date: 2026-10-16
---

## Overview

This script checks whether a Dell workstation's BIOS settings match the expected settings, without changing anything. It is the detection script of the [Enforce Dell BIOS Settings](/docs/86f44138-3e57-4c1f-8d7e-c4a0efc70fac) compound condition.

**When to use:**

- Audit BIOS settings across Dell workstations before enforcing them.
- Confirm that applied settings took effect after a restart.
- Trigger [Apply Dell BIOS Settings](/docs/b0c846eb-72d8-48ea-84b5-af87a02aa955) on devices whose settings differ.

**How it works:**

- Runs only on Dell workstations where [cPVAL Enforce Dell BIOS Settings](/docs/eb1c5a88-0933-45e4-96e7-f71422e4ddba) is Audit or Enforce. Other devices are skipped.
- The current BIOS settings are read with Dell Command | Configure, which is installed or updated if needed.
- Each setting in [cPVAL Dell BIOS Settings](/docs/0ca65a80-d1c0-4ef9-b078-cd3e8d9d89db) is compared with the device. Settings this model does not have are skipped and listed.
- The result is stored in [cPVAL Dell BIOS Settings Status](/docs/1ddc8f49-ede2-4d44-871e-b448e8ba61ba).
- Devices waiting for a restart after settings were applied are skipped until they restart.

**Requirements:**

- Dell workstation running Windows 10 or Windows 11.
- Runs elevated (System context).
- The custom fields listed in Dependencies.

:::note  
In Enforce mode, the activity shows as failed (exit code 1) when settings differ. This is expected: it tells the compound condition to run [Apply Dell BIOS Settings](/docs/b0c846eb-72d8-48ea-84b5-af87a02aa955).  
:::

## Sample Run

![SampleRun1](../../../static/img/docs/a9117300-d45b-45e8-9cfe-e85859b1931b/image1.webp)

## Scenarios

### Example 1: Running the script on a device that matches the expected settings

[cPVAL Enforce Dell BIOS Settings](/docs/eb1c5a88-0933-45e4-96e7-f71422e4ddba) is set to Audit or Enforce, and every setting in [cPVAL Dell BIOS Settings](/docs/0ca65a80-d1c0-4ef9-b078-cd3e8d9d89db) matches the device. Each setting is listed with PASS, and the activity completes successfully.

**Status:** `Compliant | 2026-10-16 21:05:12`

### Example 2: Running the script in Audit mode on a device with different settings

[cPVAL Enforce Dell BIOS Settings](/docs/eb1c5a88-0933-45e4-96e7-f71422e4ddba) is set to Audit, and some settings differ from [cPVAL Dell BIOS Settings](/docs/0ca65a80-d1c0-4ef9-b078-cd3e8d9d89db). Each of those settings is listed with FAIL and its current value. Nothing is changed on the device. Switch to Enforce when you are ready to apply the settings.

**Status:** `Non-Compliant | 2026-10-16 21:05:12 | Mismatch: AutoOn, AutoOnHr`

### Example 3: Running the script in Enforce mode on a device with different settings

[cPVAL Enforce Dell BIOS Settings](/docs/eb1c5a88-0933-45e4-96e7-f71422e4ddba) is set to Enforce, and some settings differ. The script lists them and ends with exit code 1, so the activity shows as failed. The compound condition then runs [Apply Dell BIOS Settings](/docs/b0c846eb-72d8-48ea-84b5-af87a02aa955), which changes the settings and updates the status.

**Output:** `Detected: 2 setting(s) differ from the expected values: AutoOn, AutoOnHr.`

### Example 4: Running the script on a model that does not have every setting

The model does not have one of the expected settings, such as WakeOnDock on many desktops. That setting is skipped and listed in the status. The remaining settings are checked as usual.

**Status:** `Compliant | 2026-10-16 21:05:12 | Not supported: WakeOnDock`

### Example 5: Running the script on a device waiting for a restart

The settings were applied, but the device has not restarted since. The check is skipped, and the status stays unchanged. After the restart, the next check verifies the settings and sets the status to Compliant.

**Status:** `Applied - Reboot Pending | 2026-10-16 21:05:12 | Changed: AutoOn, AutoOnHr`

### Example 6: Running the script with incorrectly formatted expected settings

[cPVAL Dell BIOS Settings](/docs/0ca65a80-d1c0-4ef9-b078-cd3e8d9d89db) contains a line that does not follow the required format, for example `--AutoOnHr=21` (option names must not start with dashes). The check stops with exit code 2, and nothing else runs. Correct the line, and the next check runs normally.

**Status:** `Failed | 2026-10-16 21:05:12 | Invalid expected settings: line 2 (--AutoOnHr=21)`

## Dependencies

- [Solution: Enforce Dell BIOS Settings](/docs/d3ee4598-13c1-4d19-8b6c-d368f2a00ab3)
- [Compound Condition: Enforce Dell BIOS Settings](/docs/86f44138-3e57-4c1f-8d7e-c4a0efc70fac)
- [Custom Field: cPVAL Enforce Dell BIOS Settings](/docs/eb1c5a88-0933-45e4-96e7-f71422e4ddba)
- [Custom Field: cPVAL Dell BIOS Settings](/docs/0ca65a80-d1c0-4ef9-b078-cd3e8d9d89db)
- [Custom Field: cPVAL Dell BIOS Settings Status](/docs/1ddc8f49-ede2-4d44-871e-b448e8ba61ba)
- [Script: Initialize-DellCommandConfigure](/docs/a0f958c9-7364-4bde-af18-01e6232620cc) (the underlying agnostic script)

## Custom Fields

| Field Name | Type | Mandatory | Scope | Description |
| ---------- | ---- | --------- | ----- | ----------- |
| [cPVAL Enforce Dell BIOS Settings](/docs/eb1c5a88-0933-45e4-96e7-f71422e4ddba) | Drop-down | Yes | Organization, Location, Device | Audit or Enforce turns the solution on. None or blank skips the device. |
| [cPVAL Dell BIOS Settings](/docs/0ca65a80-d1c0-4ef9-b078-cd3e8d9d89db) | Multi-line | Yes | Organization, Location, Device | The expected settings, one `Option=Value` pair per line. |
| [cPVAL Dell BIOS Settings Status](/docs/1ddc8f49-ede2-4d44-871e-b448e8ba61ba) | Text | Yes | Device | Stores the result. Read-only for technicians. |

## Automation Setup/Import

[Automation Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/scripts/check-dell-bios-settings.ps1)

## Output

- **Activity Details:** Each expected setting with PASS or FAIL and the current value. Settings this model does not have are listed as skipped.
- **Custom Field:** [cPVAL Dell BIOS Settings Status](/docs/1ddc8f49-ede2-4d44-871e-b448e8ba61ba) is updated when the result changes.
- **Export File:** The current BIOS configuration is saved to C:\ProgramData\_Automation\Script\Initialize-DellCommandConfigure\CurrentBiosSettings.ini.
- **Exit Code:** 0 when the check completes, including Audit mode results. 1 when settings differ in Enforce mode. 2 when the check could not complete; the reason is in the activity details and, where possible, in the status.

## Changelog

### 2026-10-16

- Initial version of the document
