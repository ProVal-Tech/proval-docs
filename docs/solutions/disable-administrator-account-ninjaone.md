---
id: 'c3553e8f-bacf-4b6c-a53f-87cd615d0260'
slug: /c3553e8f-bacf-4b6c-a53f-87cd615d0260
title: 'Disable Administrator Account'
title_meta: 'Disable Administrator Account'
keywords: ['disable', 'administrator', 'windows']
description: 'This solution disables the built-in Administrator account on Windows devices when the account is enabled and the organization setting requires it to be disabled.'
tags: ['accounts', 'auditing', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-10-01
---

## Purpose

This solution is designed to identify and disable the built-in `Administrator` account on supported Windows devices through NinjaOne automation. It uses an organization-level custom field to determine whether the Administrator account should be disabled and applies the appropriate automation based on whether the device is a Windows Server or Windows Workstation.

The solution helps maintain a consistent security configuration across managed Windows devices by automatically remediating devices where the `Administrator` account is enabled and the organization setting requires it to be disabled.

## Associated Content

**Custom Field**

| Content                                                                         | Type         | Function                                                                                                                                   |
| ------------------------------------------------------------------------------- | ------------ | ------------------------------------------------------------------------------------------------------------------------------------------ |
| [cPVAL Disable Administrator Account](/docs/17eca8b1-0d43-4a31-8a1a-c0686f399372) | Custom Field | Controls whether the built-in Administrator account should be disabled for the organization and is used during compound condition evaluation. |

**Automation**

| Content                                                                                       | Type   | Function                                                                                                     |
| --------------------------------------------------------------------------------------------- | ------ | ------------------------------------------------------------------------------------------------------------ |
| [Disable Administrator Account](/docs/f28fbe84-8c67-4442-afb9-e06d7e9ec15b) | Script | Disables the built-in Administrator account on Windows devices when the solution requirements are met. |

**Compound Conditions**

| Content                                                                                  | Type               | Function                                                                                                                              |
| ---------------------------------------------------------------------------------------- | ------------------ | ------------------------------------------------------------------------------------------------------------------------------------- |
| [Disable Administrator Account - Servers](/docs/b28a134a-2ae3-4de5-b444-932c1367008b)      | Compound Condition | Targets supported Windows Server devices where the organization setting requires the built-in Administrator account to be disabled.      |
| [Disable Administrator Account - Workstations](/docs/bb1e5b89-09c4-4c74-806e-e1b10a3a09b0) | Compound Condition | Targets supported Windows Workstation devices where the organization setting requires the built-in Administrator account to be disabled. |

## Implementation

**Step 1: Create the following Custom Field**

Create the following custom field in NinjaOne:

* [cPVAL Disable Administrator Account](/docs/17eca8b1-0d43-4a31-8a1a-c0686f399372)

Configure the custom field at the organization level to indicate whether the Administrator account should be disabled.

**Step 2: Import the Automation Script**

Import the following automation script:

* [Disable Administrator Account](/docs/f28fbe84-8c67-4442-afb9-e06d7e9ec15b)

Verify that the automation script is available and configured to run with the required permissions on the target Windows devices.

**Step 3: Configure the Compound Conditions**

Configure the following compound conditions and associate them with the appropriate device policies:

* [Disable Administrator Account - Servers](/docs/b28a134a-2ae3-4de5-b444-932c1367008b)
* [Disable Administrator Account- Workstations](/docs/bb1e5b89-09c4-4c74-806e-e1b10a3a09b0)

The compound conditions evaluate the organization-level custom field and device type to determine whether the automation should be executed.

**Step 4: Configure the Organization Setting**

For each organization where the Administrator account should be disabled, enable the appropriate value in the **cPVAL Disable Administrator Account** custom field.

## FAQ

**Q: Which devices are supported by this solution?**

A: This solution is designed for supported Windows Server and Windows Workstation devices managed through NinjaOne.

**Q: How does the solution determine whether the Administrator account should be disabled?**

A: The solution uses the **cPVAL Disable Administrator Account** custom field to determine whether the organization has enabled the requirement to disable the built-in Administrator account.

**Q: What happens if the built-in Administrator account is already disabled?**

A: The automation will not need to perform the disable action when the account is already disabled.

**Q: Does this solution disable other administrator accounts?**

A: No. The solution is intended to disable the built-in Windows **Administrator** account and does not target other user accounts unless specifically configured by the automation.

**Q: Does the solution apply to both servers and workstations?**

A: Yes. Separate compound conditions are provided for Windows Servers and Windows Workstations to ensure the appropriate devices are targeted.

**Q: Can the solution be enabled for selected organizations only?**

A: Yes. The organization-level **cPVAL Disable Administrator Account** custom field controls whether the solution should apply to an organization.

**Q: Is manual configuration required on each device?**

A: No. Once the custom field, automation, and applicable compound conditions are configured, the solution can automatically apply the required configuration to eligible devices.

**Q: What happens if the organization setting is not enabled?**

A: The compound conditions will not target the device for remediation, and the Administrator account will not be disabled by this solution.

## Changelog

### 2026-10-01

- Initial version of the document.
