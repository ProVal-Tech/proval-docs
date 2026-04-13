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
| [Windows Update Setting Enable](/docs/72550d20-2b73-43c7-982e-7d824ed90fe3) | Compound Condition | This compound conditions checks for the Windows agent where the Windows Update UI is set to enabled and its state recorded is not equals to enable. |

## Auditing Content

| Content                                             | Type                                                      | Function                                               |
|-----------------------------------------------------|-----------------------------------------------------------|--------------------------------------------------------|
| [Script - Windows Updates Settings Audit](/docs/aac11efa-8782-4bf9-ba64-55337d81d5a0)    | Script | This script audits the Windows Update settings state and displays that information to the custom group. |
| [cPVAL Windows Update UI State](/docs/ad629c28-f5f4-432d-93d2-abb3a35e4737) | Custom Field | This stores the Windows Update UI state audit from the script "Windows Updates - Enable or Disable Settings". |
| [cPVAL Windows Update Settings UI Audit](/docs/a2670f69-d6b0-4dad-a60b-24e0b2d311f1) | Custom Field | This checkbox enables the Windows Update Settings UI Audit by running the [Script - Windows Updates Settings Audit](/docs/aac11efa-8782-4bf9-ba64-55337d81d5a0) |
| [cPVAL Windows Update Notification Setting](/docs/96736e81-e157-483b-89e0-449b6c358217) | Custom Field | This stores the Windows Update (Check for Updates) notification level state. |
| [Windows Update UI Audit](/docs/90702d57-0604-4f19-a439-0e2eb001e6f9) | Group | This group contains the devices with the status of the "Windows State UI" and also shows the custom field "Windows Update Button" status to show if the CF state is set to Enabled or Disabled for |
| [Windows Update Enable/Disable](/docs/ad334429-2dd1-4425-9c5a-5c7dc89d23e3) | Group | This group contains the devices where the custom field "cPVAL Windows Update Button" or "cPVAL Windows Update Notification Level" is set. |
| [Windows Update Settings UI Audit Enable](/docs/c988cacf-1964-4c9b-8a9f-bb6b43c283cb) | Group | This group assists in scheduling the script to perform the Windows Update UI Audit. |
| [Windows Update Settings UI Audit](/docs/86d31646-1550-49dc-816f-95271dd73f07) | Tasks | This task triggers the script to run on the group [Windows Update Settings UI Audit Enable](/docs/c988cacf-1964-4c9b-8a9f-bb6b43c283cb) |


## Implementation

- Create the [Script - Windows Updates - Enable or Disable Settings](/docs/c988cacf-1964-4c9b-8a9f-bb6b43c283cb) 
- - Create the [Script - Windows Updates Settings Audit](/docs/aac11efa-8782-4bf9-ba64-55337d81d5a0)
- Create the custom field [cPVAL Windows Update Button](/docs/134eb999-a5dd-4599-ae1f-4c0082590007)
- Create the custom field [cPVAL Windows Update UI State](/docs/ad629c28-f5f4-432d-93d2-abb3a35e4737)
- Create the custom field [cPVAL Windows Update Notification Level](/docs/233110ca-c1ca-4ef0-84ba-4285ab3c895e)
- Create the custom field [cPVAL Windows Update Notification Setting](/docs/96736e81-e157-483b-89e0-449b6c358217) 
- Create the custom field [cPVAL Windows Update Settings UI Audit](/docs/a2670f69-d6b0-4dad-a60b-24e0b2d311f1)
- Create the group  [Windows Update UI Audit](/docs/90702d57-0604-4f19-a439-0e2eb001e6f9)
- Create the group  [Windows Update Enable/Disable](/docs/ad334429-2dd1-4425-9c5a-5c7dc89d23e3)
- Create the group  [Windows Update Settings UI Audit Enable](/docs/c988cacf-1964-4c9b-8a9f-bb6b43c283cb) 
- Schedule the task [Windows Update Settings UI Audit](/docs/86d31646-1550-49dc-816f-95271dd73f07).
- Schedule the compound conditions [Windows Update Setting Enable](/docs/72550d20-2b73-43c7-982e-7d824ed90fe3)

## Changelog

### 2026-04-13

- Audit version created

### 2026-04-08

- Initial version of the document