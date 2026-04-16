---
id: 'a6da0735-ac80-40f8-8ad3-375ffa8d0e93'
slug: /a6da0735-ac80-40f8-8ad3-375ffa8d0e93
title: 'Windows Update UI Enable-Disable'
title_meta: 'Windows Update UI Enable-Disable'
keywords: ['windows','updates','patching']
description: 'This solution provides the option to enable/disable the Windows Update UI and also facilitates the Notification level settings with the auditing feature.'
tags: ['windows','updates','patching']
draft: false
unlisted: false
last_update:
  date: 2026-04-08
---

## Purpose

This solution provides the option to enable/disable the Windows Update UI and also facilitates the Notification level settings with the auditing feature.

## Associated Content

| Content                                             | Type                                                      | Function                                               |
|-----------------------------------------------------|-----------------------------------------------------------|--------------------------------------------------------|
| [Windows Updates - Enable or Disable Settings](/docs/c988cacf-1964-4c9b-8a9f-bb6b43c283cb)     | Script | Manages Windows Update user interface access and notification behavior using local policy settings. This script controls two Windows Update behaviors by configuring supported registry policy keys under `HKLM:\Software\Policies\Microsoft\Windows\WindowsUpdate`. |
| [cPVAL Windows Update Button](/docs/134eb999-a5dd-4599-ae1f-4c0082590007) | Custom Field | This custom field is used to configure the Windows Updates notification based on the selected options. |
| [cPVAL Windows Update Notification Level](/docs/233110ca-c1ca-4ef0-84ba-4285ab3c895e) | Custom Field | This custom field is used to configure the Windows Updates notification based on the selected options. |
| [cPVAL Enable Windows Update Management](/docs/e1a4db82-eea6-4e2b-a687-9fc551d9c884) | Custom Field | This custom field allows the option to run the Windows Update UI management to be enabled or disabled based on the OS type selection. |
| [cPVAL Windows Update UI State](/docs/ad629c28-f5f4-432d-93d2-abb3a35e4737) | Custom Field | This stores the Windows Update UI state audit from the script [Script - Windows Updates - Enable or Disable Settings](/docs/c988cacf-1964-4c9b-8a9f-bb6b43c283cb). |
| [cPVAL Windows Update Notification Setting](/docs/96736e81-e157-483b-89e0-449b6c358217) | Custom Field | This stores the Windows Update (Check for Updates) notification level state that is fetched from [Script - Windows Updates - Enable or Disable Settings](/docs/c988cacf-1964-4c9b-8a9f-bb6b43c283cb) |
| [Windows Update UI Settings Workstations](/docs/72550d20-2b73-43c7-982e-7d824ed90fe3) | Compound Condition | This compound conditions applied to the `Windows Workstation Policy` and it checks for the Windows agent where the `cPVAL Enable Windows Update Management` custom field is set at the `Organization`, `Locations`, or `Device` level. |
| [Windows Update UI Settings Servers](/docs/e6260d92-d292-4b89-bd6c-19df1f96939d) | Compound Condition | This compound conditions applied to the `Windows Server Policy` and it checks for the Windows agent where the `cPVAL Enable Windows Update Management` custom field is set at the `Organization`, `Locations`, or `Device` level. |

## Implementation

- Create the [Script - Windows Updates - Enable or Disable Settings](/docs/c988cacf-1964-4c9b-8a9f-bb6b43c283cb) 
- Create the custom field [cPVAL Windows Update Button](/docs/134eb999-a5dd-4599-ae1f-4c0082590007)
- Create the custom field [cPVAL Windows Update UI State](/docs/ad629c28-f5f4-432d-93d2-abb3a35e4737)
- Create the custom field [cPVAL Windows Update Notification Level](/docs/233110ca-c1ca-4ef0-84ba-4285ab3c895e)
- Create the custom field [cPVAL Windows Update Notification Setting](/docs/96736e81-e157-483b-89e0-449b6c358217) 
- Create the custom field [cPVAL Enable Windows Update Management](/docs/e1a4db82-eea6-4e2b-a687-9fc551d9c884)
- Create the group  [Windows Update UI Audit](/docs/90702d57-0604-4f19-a439-0e2eb001e6f9)
- Schedule the compound conditions [Windows Update UI Settings Servers](/docs/e6260d92-d292-4b89-bd6c-19df1f96939d) and [Windows Update UI Settings Workstations](/docs/72550d20-2b73-43c7-982e-7d824ed90fe3).

## Changelog

### 2026-04-16

- Removed unnecessary auditing solution, that contains multiple groups, custom fields, and complicated compound conditions.
- Added this new custom field to enable the solution based on the OS selection just like the ignite service plan patching for the Windows workstations, and Windows Servers.

### 2026-04-13

- Audit version created

### 2026-04-08

- Initial version of the document