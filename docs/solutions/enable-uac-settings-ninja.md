---
id: '01c2c7d9-7ce9-4e09-981b-b18e55ed2cbf'
slug: /01c2c7d9-7ce9-4e09-981b-b18e55ed2cbf
title: 'Enable UAC Settings'
title_meta: 'Enable UAC Settings'
keywords: ['uac', 'setting', 'windows']
description: 'Configures the Windows User Account Control (UAC) level on supported Windows Workstations where UAC configuration is enabled.'
tags: ['windows']
draft: false
unlisted: false
last_update:
  date: 2026-10-08
---

## Purpose

This solution configures the Windows User Account Control (UAC) level on supported Windows Workstations where UAC configuration is enabled.

The solution uses a NinjaOne custom field to centrally determine which Windows Workstations should have a specific UAC setting applied. A compound condition automatically targets Windows Workstations based on the selected configuration.

The solution supports the following platform:

* Windows Workstations

When enabled for an endpoint, the associated automation configures the Windows UAC level according to the setting selected through the custom field.

## Associated Content

| Content                                             | Type                                                      | Function                                               |
|-----------------------------------------------------|-----------------------------------------------------------|--------------------------------------------------------|
| [cPVAL Enable UAC Setting](/docs/43bb3115-51f9-4523-9de9-1f948478f214) | Custom Field | Custom Field to choose the UAC setting to apply to Windows workstations. |
| [Enable UAC and Set Level](/docs/1e92329a-e461-4299-a762-2fd19bf48e40) | Custom Field | Configures the Windows User Account Control (UAC) level based on the selected setting. |
| [Enable UAC - Workstations](/docs/3cdcd628-ba11-4cfe-b31e-66128af63856) | Compound Condition | Triggers the [Automation - Enable UAC and Set Level](/docs/1e92329a-e461-4299-a762-2fd19bf48e40) on Windows workstations where UAC setting is enabled through the [Custom Field - cPVAL Enable UAC Setting](/docs/43bb3115-51f9-4523-9de9-1f948478f214)|

## Implementation

The solution requires the custom field, automation, and applicable compound condition to be configured in NinjaOne.

### Step 1: Create the Custom Field

Create the following custom field in NinjaOne:

* [cPVAL Enable UAC Setting](/docs/43bb3115-51f9-4523-9de9-1f948478f214)

The custom field is used to determine whether UAC configuration should be applied to Windows Workstations and which UAC setting should be configured.

### Step 2: Configure the UAC Setting

Set the [cPVAL Enable UAC Setting](/docs/43bb3115-51f9-4523-9de9-1f948478f214) custom field on the applicable endpoint or at the appropriate organizational or location level.

Select the required UAC setting based on the available options configured for the custom field.

### Step 3: Create the Automation

Create the following automation:

* [Automation - Enable UAC and Set Level](/docs/1e92329a-e461-4299-a762-2fd19bf48e40)


### Step 4: Create the Compound Condition

Create and apply the following compound condition:

* [Compound Condition - Enable UAC - Workstations](/docs/3cdcd628-ba11-4cfe-b31e-66128af63856)

The compound condition targets supported Windows Workstations where UAC configuration is enabled through the [cPVAL Enable UAC Setting](/docs/43bb3115-51f9-4523-9de9-1f948478f214) custom field.


## FAQ

### Q: Which platforms are supported?

> Windows Workstations

### Q: What does this solution configure?

> The solution configures the Windows User Account Control (UAC) level according to the setting selected through the [cPVAL Enable UAC Setting](/docs/43bb3115-51f9-4523-9de9-1f948478f214) custom field.

### Q: How do I enable UAC configuration for an endpoint?

> Configure the [cPVAL Enable UAC Setting](/docs/43bb3115-51f9-4523-9de9-1f948478f214) custom field with the appropriate UAC setting for the Windows Workstation.

### Q: How is the automation triggered?

> The [Compound Condition - Enable UAC - Workstations](/docs/3cdcd628-ba11-4cfe-b31e-66128af63856) targets Windows Workstations where UAC configuration is enabled through the [cPVAL Enable UAC Setting](/docs/43bb3115-51f9-4523-9de9-1f948478f214) custom field. When the endpoint matches the required conditions, the [Automation - Enable UAC and Set Level](/docs/1e92329a-e461-4299-a762-2fd19bf48e40) is triggered.

### Q: Is any manual configuration required on the endpoint?

> No. The solution is designed to manage the UAC setting through NinjaOne custom fields, automations, and compound conditions.

### Q: What happens if UAC configuration is not enabled?

> If the endpoint does not match the configuration required by the applicable compound condition, the automation is not triggered for that endpoint.

### Q: Can this solution be applied to Windows Servers?

> No. This solution is designed specifically for Windows Workstations. Windows Servers are not targeted by the associated compound condition.

## Changelog

### 2026-10-08

- Initial version of the document