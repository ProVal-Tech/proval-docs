---
id: 'd7759df0-48d0-45c4-a1ca-958fe849ad79'
slug: /d7759df0-48d0-45c4-a1ca-958fe849ad79
title: 'CHKDSK All Drives - NinjaOne'
title_meta: 'CHKDSK All Drives - NinjaOnee'
keywords: ['chkdsk', 'all', 'drives', 'disk-space']
description: 'This solution automates CHKDSK checks across drives on Windows devices managed through NinjaOne and supports configurable repair behavior through custom fields.'
tags: ['disk', 'diskspace', 'storage', 'auditing', 'report', 'custom-fields']
draft: false
unlisted: false
last_update:
  date: 2026-10-19
---

## Purpose

This solution automates CHKDSK checks across drives on Windows devices managed through NinjaOne. It uses an automation script, custom fields, and a compound condition to manage disk-check execution on targeted Windows servers. The deployment and autofix custom fields control the solution's behavior according to the configured settings.

## Associated Content

### Compound Conditions

| Content | Type | Function |
| --- | --- | --- |
| [ChkDsk - All Drives - Servers](/docs/5b3e6c68-6d0a-4b1f-b58a-eba8b870b9ad) | Compound Condition | Targets eligible Windows servers for automated CHKDSK execution. |

### Automation

| Content | Type | Function |
| --- | --- | --- |
| [CHKDSK - Run All Drives](/docs/b2cc4bdc-cbb4-46b7-a785-a7bbb9341b55) | Script | Runs CHKDSK checks across drives on the target device according to the script's configured behavior. |

### Custom Fields

| Content | Type | Function |
| --- | --- | --- |
| [cPVAL ChkDsk Autofix](/docs/398e0f9e-6f9c-482d-a977-b278ed79d7df) | Custom Field | Controls the configured autofix behavior for CHKDSK operations. |
| [cPVAL ChkDsk Deployment](/docs/d2bdfde4-73c9-49b9-9a10-4f24ce8f06cc) | Custom Field | Controls deployment eligibility and compound condition execution according to the configured settings. |

## Implementation

### Step 1: Create the Custom Fields

Create the following custom fields in NinjaOne:

- [cPVAL ChkDsk Autofix](/docs/398e0f9e-6f9c-482d-a977-b278ed79d7df)
- [cPVAL ChkDsk Deployment](/docs/d2bdfde4-73c9-49b9-9a10-4f24ce8f06cc)

### Step 2: Import the Automation Script

Import the following automation script:

- [CHKDSK - Run All Drives](/docs/b2cc4bdc-cbb4-46b7-a785-a7bbb9341b55)

### Step 3: Configure the Compound Condition

Create and configure the compound condition for eligible Windows servers:

- [ChkDsk - All Drives - Servers](/docs/5b3e6c68-6d0a-4b1f-b58a-eba8b870b9ad)

Ensure the custom fields are configured appropriately so the solution targets only the intended devices.

## FAQ

**Q: What is the purpose of this solution?**

A: It automates CHKDSK checks across drives on eligible Windows servers managed through NinjaOne.

**Q: Which devices are targeted by the automation?**

A: The `ChkDsk - All Drives - Servers` compound condition targets eligible Windows servers according to its configured criteria.

**Q: What is the purpose of the `cPVAL ChkDsk Deployment` custom field?**

A: It controls deployment eligibility and compound condition execution according to the configured settings.

**Q: What is the purpose of the `cPVAL ChkDsk Autofix` custom field?**

A: It controls the configured autofix behavior for CHKDSK operations.

**Q: Does CHKDSK automatically repair disk issues?**

A: The script first runs a read-only CHKDSK check on all fixed drives. If issues are detected, it checks the `cPVAL Chkdsk Autofix` custom field. When the setting is `Enabled`, the script runs `chkdsk /F` on all fixed drives to schedule repairs, which generally require a reboot to complete. If the setting is not enabled, the script reports the detected issues without initiating repairs.

## Changelog

### 2026-10-19

- Initial version of the document.
