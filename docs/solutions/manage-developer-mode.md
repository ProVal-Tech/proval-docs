---
id: '3ab05cd9-d579-49d1-92c8-2b57870f5e7d'
slug: /3ab05cd9-d579-49d1-92c8-2b57870f5e7d
title: 'Manage Developer Mode'
title_meta: 'Manage Developer Mode'
keywords: ['developer-mode', 'enable-developer-mode', 'disable-developer-mode', 'check-developer-mode', 'manage-developer-mode']
description: 'Deploys and manages Windows Developer Mode across devices using custom fields, scheduled automation, and reporting views in NinjaRMM.'
tags: ['windows', 'auditing', 'security']
draft: false
unlisted: false
last_update:
  date: 2026-06-17
---

## Purpose

This solution manages Windows Developer Mode across Windows 10 and Windows 11 devices. It lets you define a desired state, run scheduled checks or enforcement, and track the current state on each endpoint.

Use this solution to:

- Enable Developer Mode where required.
- Disable Developer Mode where not allowed.
- Audit the current Developer Mode state without making changes.
- Compare desired vs current state for validation and compliance reporting.

## Associated Content

### Custom Fields

| Content | Type | Function |
| ------- | ---- | -------- |
| [cPVAL Desired Developer Mode](/docs/bdb8829b-76bf-4703-9cd6-7bcb6f5068a2) | Custom Field | Stores the desired action: `None`, `Check`, `Enable`, or `Disable`. |
| [cPVAL Current Developer Mode](/docs/9e05e3a1-05fb-4e33-a74c-f9df79ca5e1b) | Custom Field | Stores the last reported Developer Mode state from the device. |

### Automation

| Content | Type | Function |
| ------- | ---- | -------- |
| [Manage Developer Mode](/docs/d1a715d8-715c-4f72-9f2a-a0d93c5c40af) | Automation | Enables, disables, or checks Developer Mode based on parameter or custom field value. |

### Group

| Content | Type | Function |
| ------- | ---- | -------- |
| [Manage Developer Mode](/docs/056a117e-1e9b-4a81-b1a7-966c15b660f9) | Group | Targets devices where desired state is `Check`, `Enable`, or `Disable` and excludes `None`. |

### Task

| Content | Type | Function |
| ------- | ---- | -------- |
| [Manage Developer Mode](/docs/6098e1b1-86c8-4016-9715-b6be8f1b71ed) | Task | Runs daily at `11:00 AM` on devices in the group to enforce or audit Developer Mode state. |

### Script Reference

| Content | Type | Function |
| ------- | ---- | -------- |
| [Manage-DeveloperMode](/docs/89c84696-8c47-4dbe-a134-0f25a5822ae2) | PowerShell | Core script logic used by the automation package. |

## Implementation

### Step 1: Create the Custom Fields

- [cPVAL Desired Developer Mode](/docs/bdb8829b-76bf-4703-9cd6-7bcb6f5068a2)
- [cPVAL Current Developer Mode](/docs/9e05e3a1-05fb-4e33-a74c-f9df79ca5e1b)

### Step 2: Create the Automation

- [Manage Developer Mode](/docs/d1a715d8-715c-4f72-9f2a-a0d93c5c40af)

### Step 3: Create the Group

- [Manage Developer Mode](/docs/056a117e-1e9b-4a81-b1a7-966c15b660f9)

### Step 4: Create the Task

- [Manage Developer Mode](/docs/6098e1b1-86c8-4016-9715-b6be8f1b71ed)

### Step 5: Validate Results

- Confirm [cPVAL Desired Developer Mode](/docs/bdb8829b-76bf-4703-9cd6-7bcb6f5068a2) is set as intended.
- Run or wait for the scheduled [Manage Developer Mode](/docs/6098e1b1-86c8-4016-9715-b6be8f1b71ed) task.
- Confirm [cPVAL Current Developer Mode](/docs/9e05e3a1-05fb-4e33-a74c-f9df79ca5e1b) matches the expected state.

## FAQs

### Q1. What does this solution do?

> It helps you control and audit Developer Mode on Windows endpoints using a desired-state custom field, a scheduled task, and a reporting group.

### Q2. What happens when the desired value is `None`?

> Devices with `None` are excluded from scheduled automation targeting. You can still run the automation manually, and manual runs default to `Check` if no action parameter is provided.

### Q3. Which setting takes priority: task parameter or custom field?

> The automation `Action` parameter takes priority. If no parameter is supplied, the automation uses [cPVAL Desired Developer Mode](/docs/bdb8829b-76bf-4703-9cd6-7bcb6f5068a2). If neither is set, it defaults to `Check`.

### Q4. My automation suddenly started failing with signature errors. Was the script changed?

> Not always. The NinjaOne automation implementation validates two signatures during execution: its own script signature first, and then the signature of the downloaded script. A failure in either check will stop execution. If changes were made outside the approved process, signature validation can fail.

### Q5. Why does script signing matter?

> Signing confirms script integrity and publisher trust at both levels of execution. It helps ensure the NinjaOne automation wrapper and the downloaded script have not been tampered with and are approved for use.

### Q6. What should I do if I get a signature validation failure?

> Re-run the automation first to retry a clean download. If the issue continues, verify endpoint security tools are not modifying script files and confirm network access to the content repository. If any update is needed to the NinjaOne automation implementation, route the change through ProVal so the script can be re-signed after the update. Include activity logs and error details when escalating.

### Q7. Where can I check the current status for all machines where this solution is enabled?

> Use the [Manage Developer Mode](/docs/056a117e-1e9b-4a81-b1a7-966c15b660f9) group. This is the best place to review all targeted devices in one view.
>
> Check these columns in the group:
>
> - [cPVAL Desired Developer Mode](/docs/bdb8829b-76bf-4703-9cd6-7bcb6f5068a2)
> - [cPVAL Current Developer Mode](/docs/9e05e3a1-05fb-4e33-a74c-f9df79ca5e1b)

## Changelog

### 2026-06-17

- Initial version of the document
