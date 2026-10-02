---
id: 'b1682285-652d-4f50-b34b-c23e2c7382f6'
slug: /b1682285-652d-4f50-b34b-c23e2c7382f6
title: 'Windows Audit Policy - NinjaOne'
title_meta: 'Windows Audit Policy - NinjaOne'
keywords: ['windows', 'audit', 'policy', 'security', 'eventlogs']
description: 'This solution is used to deploy and configure the Windows Audit Policy on supported Windows devices.'
tags: ['audit', 'security', 'windows', 'eventlogs', 'active-directory', 'registry']
draft: false
unlisted: false
last_update:
date: 2026-10-02
---

## Purpose

`This solution is designed to deploy and configure the Windows Audit Policy on supported Windows devices using NinjaOne. The deployment can be targeted separately to Windows Servers and Workstations using compound conditions.`

## Associated Content

### Automation

| Content                                                            | Type   | Function                                                             |
| ------------------------------------------------------------------ | ------ | -------------------------------------------------------------------- |
| [Windows Audit Policy](/docs/e9340096-fbf2-495d-99f0-01cb43c0416c) | `Script` | Applies the Windows Audit Policy configuration to the target device. |

### Custom Field

| Content                                                                             | Type         | Function                                                                                |
| ----------------------------------------------------------------------------------- | ------------ | --------------------------------------------------------------------------------------- |
| [cPVAL Windows Audit Policy Deployment](/docs/7160184e-bf13-4862-861a-3fa86b9ef847) | `Custom Field` | Controls whether the Windows Audit Policy deployment should be performed on the device. |

### Compound Conditions

| Content                                                                           | Type               | Function                                                                          |
| --------------------------------------------------------------------------------- | ------------------ | --------------------------------------------------------------------------------- |
| [Windows Audit Policy - Servers](/docs/72c11059-d1bd-4ddc-ae3b-c911255a2ec8)      | `Compound Condition` | Targets eligible Windows Server devices for Windows Audit Policy deployment.      |
| [Windows Audit Policy - Workstations](/docs/1afaac33-8b12-45fc-ace2-80815c5ed9f8) | `Compound Condition` | Targets eligible Windows Workstation devices for Windows Audit Policy deployment. |

## Implementation

### Step 1: Create the Custom Field

Create the following Custom Field:

* [cPVAL Windows Audit Policy Deployment](/docs/7160184e-bf13-4862-861a-3fa86b9ef847)

Configure the Custom Field according to the organizations or devices where the Windows Audit Policy deployment is required.

### Step 2: Import the Automation Script

Import the following automation script:

* [Windows Audit Policy](/docs/e9340096-fbf2-495d-99f0-01cb43c0416c)

### Step 3: Configure the Compound Conditions

Configure the following compound conditions to target the appropriate devices:

* [Windows Audit Policy - Servers](/docs/72c11059-d1bd-4ddc-ae3b-c911255a2ec8)
* [Windows Audit Policy - Workstations](/docs/1afaac33-8b12-45fc-ace2-80815c5ed9f8)

The compound conditions use the Custom Field configuration to determine where the deployment should be performed.

## FAQ

`**Q: Which devices are supported?**`

A: The solution is designed to deploy the Windows Audit Policy to supported Windows Server and Workstation devices.

`**Q: How is the deployment targeted?**`

A: Deployment is controlled through the [cPVAL Windows Audit Policy Deployment](/docs/7160184e-bf13-4862-861a-3fa86b9ef847) Custom Field and the associated Server and Workstation compound conditions.

`**Q: Can the deployment be limited to selected organizations or devices?**`

A: Yes. The Custom Field and compound conditions can be configured to determine where the Windows Audit Policy deployment should be performed.

`**Q: What does the automation script do?**`

A: The automation script applies the Windows Audit Policy configuration to the target device.

`**Q: Can the automation be run manually?**`

A: Yes. The Windows Audit Policy automation can be run manually on an individual device when required.

## Changelog

### 2026-10-02

* Initial version of the document.
