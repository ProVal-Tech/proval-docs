---
id: '56e6b247-f80a-4bd8-b2e2-8cf44f76b7e1'
slug: /56e6b247-f80a-4bd8-b2e2-8cf44f76b7e1
title: 'Update Windows Deferral Settings'
title_meta: 'Update Windows Deferral Settings'
keywords: ['windows','feature','update','deferral','update']
description: 'This solution is designed to configure the automatic check and update the deferral feature update registries if any mismatch found using the NinjaOne platform.'
tags: ['updates','registry','auditing']
draft: false
unlisted: false
last_update:
  date: 2026-03-05
---

## Purpose

The goal of the solution is to check and update the deferral feature update registries if any mismatch found using the NinjaOne platform.

## Associated Content

### Custom Field

| Content | Type | Available Options | Function |
| ------- | ---- | ----------------- | -------- |
| [Custom Field: cPVAL DeferFeatureUpdates](/docs/297e4a2e-e7a3-43ea-bbae-a88715d472b4) | `Custom Filed` | `Enabled`, `Disabled` | This custom field is used to store the values for DeferFeatureUpdates. It contains two possible values: 1 = Enabled, 2 = Disabled. |
| [Custom Field: cPVAL BranchReadinessLevel](/docs/c4accdf3-29e3-4dda-8a05-eae9093d629e) | `Custom Filed` | `16`, `32` | This field controls the Windows Update Branch Readiness Level. Select the appropriate channel to determine which feature update builds the device will receive. |
| [Custom Field: cPVAL Feature Update Configuration](/docs/29e44495-0c4b-425c-bb1f-118dab2633e2) | `Custom Filed` | `Disabled`, `Windows`, `Windows Servers`, `Windows Workstations` | This Custom Fields Controls the Configuration of Feature update deferral on the machine based on the selected operating system. Choose Disabled to skip applying this setting to the current Client, Location, or Computer. |
| [Custom Field: cPVAL DeferFeatureUpdatesPeriodInDays](/docs/0cb57dd0-6349-4544-a146-f822e6dccceb) | `Custom Filed` | `0-365` | Specifies the number of days to defer Windows feature updates. Accepts values between 0 and 365 days. |

### Automation

| Content | Function | Type |
| ------- | -------- | ---- |
| [Automation: Update Windows Deferral Settings](/docs/5d4e1aa7-4ec8-4a7a-ba50-7a93366a232a) | Controls the Windows Update deferral configuration for the device, including feature update servicing channel and deferral period. These settings determine when feature updates are made available after release. | `Script` |
| [Automation: WinUpdate Deferral Audit](/docs/79c86028-fa08-450f-bc45-e2f3f2026732) | Reads current Windows Update deferral registry values and compares them against Ninja Custom Field desired values. Exits with 1 if drift is detected. | `Script` |

### Compound Conditions

| Content | Function | Type |
| ------- | -------- | ---- |
| [Compound Conditions: Feature Update Defer Configuration workstations](/docs/73c10fcb-2102-4e7d-80b6-e051cf8e55ec) | Triggers the [Automation: WinUpdate Deferral Audit](/docs/79c86028-fa08-450f-bc45-e2f3f2026732) and if the drift equal to 1 then it run the automation [Automation: Update Windows Deferral Settings](/docs/5d4e1aa7-4ec8-4a7a-ba50-7a93366a232a) on Windows Workstations to update the registry values. | `Compound Condition` |
| [Compound Conditions: Feature Update Defer Configuration servers](/docs/00483199-7fbc-4838-82e7-32cfa2c626cf) | Triggers the [Automation: WinUpdate Deferral Audit](/docs/79c86028-fa08-450f-bc45-e2f3f2026732) and if the drift equal to 1 then it run the automation [Automation: Update Windows Deferral Settings](/docs/5d4e1aa7-4ec8-4a7a-ba50-7a93366a232a) on Windows Servers to update the registry values. | `Compound Condition` |

## Implementation

### Step 1: Create the following Custom Field

- [Custom Field: cPVAL DeferFeatureUpdatesPeriodInDays](/docs/0cb57dd0-6349-4544-a146-f822e6dccceb)
- [Custom Field: cPVAL DeferFeatureUpdates](/docs/297e4a2e-e7a3-43ea-bbae-a88715d472b4)
- [Custom Field: cPVAL BranchReadinessLevel](/docs/c4accdf3-29e3-4dda-8a05-eae9093d629e)
- [Custom Field: cPVAL Feature Update Configuration](/docs/29e44495-0c4b-425c-bb1f-118dab2633e2)

### Step 2: Import Automation Scripts

Import the following automation scripts:

- [Automation: Update Windows Deferral Settings](/docs/5d4e1aa7-4ec8-4a7a-ba50-7a93366a232a)
- [Automation: WinUpdate Deferral Audit](/docs/79c86028-fa08-450f-bc45-e2f3f2026732)

### Step 3: Configure the following Compound Conditions

Create three compound conditions targeting the appropriate device policies:

- [Compound Conditions: Feature Update Defer Configuration workstations](/docs/73c10fcb-2102-4e7d-80b6-e051cf8e55ec)
- [Compound Conditions: Feature Update Defer Configuration servers](/docs/00483199-7fbc-4838-82e7-32cfa2c626cf)

## FAQ

Q1: What is the purpose of this solution?
A1: It ensures Windows feature update deferral settings are applied consistently on all managed devices. The solution audits registry values and updates any mismatches based on the NinjaOne custom fields or variables.

Q2: Which devices are affected by this solution?
A2: Both Windows Workstations and Windows Servers are supported. Separate compound conditions ensure the correct settings are applied for each device type.

Q3: How is the desired configuration defined?
A3: The desired values are stored in NinjaOne custom fields:
      cPVAL DeferFeatureUpdates
      cPVAL BranchReadinessLevel
      cPVAL DeferFeatureUpdatesPeriodInDays

Q4: What happens if the current registry settings already match the desired configuration?
A4: The audit script will detect no drift, and the update script will not run, avoiding unnecessary changes.

Q5: Can this solution be customized for different update channels or defer periods?
A5: Yes. You can configure the branch readiness level and defer period in the respective custom fields for each device or client.

Q6: How do I verify that the solution has applied correctly?
A6: You can run the WinUpdate Deferral Audit script manually to check if any drift is detected. Logs and audit results can be reviewed in NinjaOne Activity Logs.

Q7: Will this solution interfere with other Windows Update policies?
A7: No. It only modifies feature update deferral settings and respects the configurations defined in the NinjaOne custom fields.

## Changelog

### 2026-03-06

- Initial version of the document
