---
id: '0df164ca-4ce5-4576-bb9e-68e33b679a88'
slug: /0df164ca-4ce5-4576-bb9e-68e33b679a88
title: 'RDP Enable Check Ninjarmm'
title_meta: 'RDP Enable Check Ninjarmm'
keywords: ['rdp', 'remote-desktop', 'security', 'disable']
description: 'This solution is used to verify whether Remote Desktop Protocol (RDP) access is enabled on the system.'
tags: ['windows', 'security']
draft: false
unlisted: false
last_update:
  date: 2026-07-20
---

## Purpose

This solution checks the current Remote Desktop Protocol (RDP) configuration and determines whether RDP access is enabled or disabled on the device. 

## Associated Content

### Custom Field

| Content | Type | Function |
| ------- | ---- | -------- |
| [cPVAL Exclude RDP Access Check](/docs/98bae338-07b5-482a-81e1-1b19582122c8) | `Text` | This custom field is used to exclude the device from the Remote Desktop Protocol (RDP) access check. Set this value `Excluded` when the RDP status validation should be skipped for a specific device. |

### Automation

| Content | Function |
| ------- | -------- |
| [RDP Access Check](/docs/72c4d38f-e25b-4ebf-b282-55f234a18327) | Identifies Windows machines where RDP is enabled or not completely disabled. |
| [Disable RDP Access](/docs/5886493a-40ca-402a-8c78-aefd05f4b813) | Disabled the RDP access Completely on the machine. |

### Compound Conditions

| Content | Function |
| ------- | -------- |
| [RDP Access Check - servers](/docs/36261bfe-2318-45de-bc24-ffd62a2422a4) | Triggers the [RDP Access Check](/docs/72c4d38f-e25b-4ebf-b282-55f234a18327) automation on Windows machines where the RDP access check is enabled. |
| [RDP Access Check - Workstations](/docs/f7b08fe4-9eb4-4716-a9ea-84bedfa2f838) | Excludes Windows machines from the [Disable RDP Access](/docs/5886493a-40ca-402a-8c78-aefd05f4b813) automation on Windows machines where the RDP access check is enabled. |


## Implementation

### Step 1

Create the following custom fields:

- [cPVAL Exclude RDP Access Check](/docs/98bae338-07b5-482a-81e1-1b19582122c8)

### Step 2

Create the following Automations:

- [RDP Access Check](/docs/72c4d38f-e25b-4ebf-b282-55f234a18327)
- [Disable RDP Access](/docs/5886493a-40ca-402a-8c78-aefd05f4b813)

### Step 3

Create the following Compound Conditions:

[RDP Access Check - servers](/docs/36261bfe-2318-45de-bc24-ffd62a2422a4)
[RDP Access Check - Workstations](/docs/f7b08fe4-9eb4-4716-a9ea-84bedfa2f838)

## FAQ

`Q1` What does the RDP Access Check solution do?

`Ans:` The RDP Access Check solution verifies the current Remote Desktop Protocol (RDP) configuration on Windows devices and identifies whether RDP access is enabled or not completely disabled.

`Q2` Why is RDP access being checked?

`Ans:` RDP is commonly used for remote administration; however, if it is enabled unnecessarily, it can increase the device's security exposure. This solution helps identify devices where RDP access may require review or remediation.

`Q3` What happens when RDP access is detected as enabled?

`Ans:` When the solution identifies that RDP access is enabled, the device can be reviewed and the [Disable RDP Access](/docs/5886493a-40ca-402a-8c78-aefd05f4b813) automation can be used to disable RDP access if required.

`Q4` How can I exclude a device from the RDP Access Check?

`Ans:` To exclude a device from the check, set the [cPVAL Exclude RDP Access Check](/docs/98bae338-07b5-482a-81e1-1b19582122c8) custom field value to `Excluded`. The device will then be skipped during the RDP validation process.

`Q5` Does this solution disable RDP automatically?

`Ans:` No. The RDP Access Check only identifies the current RDP status. The [Disable RDP Access](/docs/5886493a-40ca-402a-8c78-aefd05f4b813) automation is used separately to disable RDP access.

`Q6` Does this solution apply to both servers and workstations?

`Ans:` Yes. The solution supports both Windows servers and workstations through separate compound conditions to perform the RDP access validation.

`Q7` What happens if the RDP Access Check is disabled?

`Ans:` Devices where the RDP Access Check is disabled are excluded from the automation workflow and will not be evaluated for RDP status.

`Q8` Is a reboot required after disabling RDP access?

`Ans:` A reboot is generally not required when disabling RDP access. However, depending on the system state or additional configuration changes, a reboot may be recommended to ensure all settings are applied correctly.

## Changelog

### 2026-07-20

- Initial version of the document