---
id: 'd7759df0-48d0-45c4-a1ca-958fe849ad79'
slug: /d7759df0-48d0-45c4-a1ca-958fe849ad79
title: 'CHKDSK All Drives - NinjaOne'
title_meta: 'CHKDSK All Drives - NinjaOne'
keywords: ['chkdsk', 'all-drives', 'disk-check', 'disk-repair']
description: 'This solution automates CHKDSK checks across fixed drives on Windows devices managed through NinjaOne, with configurable repair behavior controlled by custom fields.'
tags: ['disk', 'diskspace', 'storage', 'auditing', 'report', 'custom-fields']
draft: false
unlisted: false
last_update:
  date: 2026-10-19
---

## Purpose

This solution automates CHKDSK checks across fixed drives on Windows devices managed through NinjaOne. It uses an automation script, custom fields, and compound conditions to control execution on eligible Windows servers and workstations.

The `cPVAL ChkDsk Deployment` custom field controls deployment eligibility, while the `cPVAL ChkDsk Autofix` custom field determines whether the script should attempt to schedule repairs when disk issues are detected.

## Associated Content

### Compound Conditions

| Content | Type | Function |
| --- | --- | --- |
| [ChkDsk - All Drives - Servers](/docs/5b3e6c68-6d0a-4b1f-b58a-eba8b870b9ad) | Compound Condition | Targets eligible Windows servers for automated CHKDSK execution. |
| [ChkDsk - All Drives - Workstations](/docs/96d2cf91-d2ae-4bab-a12c-c61e8997222a) | Compound Condition | Targets eligible Windows workstations for automated CHKDSK execution. |

### Automation

| Content | Type | Function |
| --- | --- | --- |
| [CHKDSK - Run All Drives](/docs/b2cc4bdc-cbb4-46b7-a785-a7bbb9341b55) | Script | Checks all fixed drives and initiates repair scheduling when issues are detected and autofix is enabled. |

### Custom Fields

| Content | Type | Function |
| --- | --- | --- |
| [cPVAL ChkDsk Autofix](/docs/398e0f9e-6f9c-482d-a977-b278ed79d7df) | Custom Field | Controls whether the script attempts to schedule CHKDSK repairs when disk issues are detected. |
| [cPVAL ChkDsk Deployment](/docs/d2bdfde4-73c9-49b9-9a10-4f24ce8f06cc) | Custom Field | Controls deployment eligibility according to the configured settings. |

## Implementation

### Step 1: Create the Custom Fields

Create the following custom fields in NinjaOne:

- [cPVAL ChkDsk Autofix](/docs/398e0f9e-6f9c-482d-a977-b278ed79d7df)
- [cPVAL ChkDsk Deployment](/docs/d2bdfde4-73c9-49b9-9a10-4f24ce8f06cc)

Configure the custom fields according to the intended deployment and repair behavior.

### Step 2: Import the Automation Script

Import the following automation script into NinjaOne:

- [CHKDSK - Run All Drives](/docs/b2cc4bdc-cbb4-46b7-a785-a7bbb9341b55)

Ensure that the script is configured to use the required custom fields.

### Step 3: Configure the Compound Conditions

Create and configure the appropriate compound conditions:

- [ChkDsk - All Drives - Servers](/docs/5b3e6c68-6d0a-4b1f-b58a-eba8b870b9ad)
- [ChkDsk - All Drives - Workstations](/docs/96d2cf91-d2ae-4bab-a12c-c61e8997222a)

Verify that the compound conditions use the intended custom field criteria and target only eligible Windows devices.

### Step 4: Validate the Configuration

Before deploying the solution broadly:

1. Verify that both custom fields are configured correctly.
2. Confirm that the server and workstation compound conditions target the intended devices.
3. Test the automation script on a suitable device.
4. Confirm that the script reports detected disk issues and follows the configured autofix setting.

## FAQ

**Q: What is the purpose of this solution?**

A: It automates CHKDSK checks across fixed drives on eligible Windows servers and workstations managed through NinjaOne.

**Q: Which devices are targeted by the automation?**

A: The solution uses separate compound conditions for Windows servers and workstations. Only devices that meet the configured criteria are targeted.

**Q: What is the purpose of the `cPVAL ChkDsk Deployment` custom field?**

A: It controls deployment eligibility according to the configured settings and compound condition criteria.

**Q: What is the purpose of the `cPVAL ChkDsk Autofix` custom field?**

A: It determines whether the script attempts to schedule CHKDSK repairs when disk issues are detected.

**Q: Does CHKDSK automatically repair disk issues?**

A: The script first performs a read-only CHKDSK check on all fixed drives. If issues are detected, it checks the `cPVAL ChkDsk Autofix` custom field.

- **Enabled:** The script attempts to run `chkdsk /F` on the affected fixed drives to schedule repairs. Depending on the drive and its usage, a reboot may be required to complete the repair.
- **Disabled:** The script reports the detected issues without initiating repairs.

Refer to the automation script's output and logs to determine the results of the check and any repair actions.

## Changelog

### 2026-10-19

- Initial version of the document.
