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
| [Script - Windows Updates - Enable or Disable Settings](/docs/c988cacf-1964-4c9b-8a9f-bb6b43c283cb)     | Script | Manages Windows Update user interface access and notification behavior using local policy settings. This script controls two Windows Update behaviors by configuring supported registry policy keys under `HKLM:\Software\Policies\Microsoft\Windows\WindowsUpdate`. |
| [cPVAL Windows Update Button](/docs/134eb999-a5dd-4599-ae1f-4c0082590007) | Custom Field | This custom field is used to configure the Windows Updates notification based on the selected options. |
| [cPVAL Windows Update UI State](/docs/ad629c28-f5f4-432d-93d2-abb3a35e4737) | Custom Field | This stores the Windows Update UI state audit from the script "Windows Updates - Enable or Disable Settings". |
| [cPVAL Windows Update Notification Level](/docs/233110ca-c1ca-4ef0-84ba-4285ab3c895e) | Custom Field | This custom field is used to configure the Windows Updates notification based on the selected options. |
| [Windows Update UI Audit](/docs/90702d57-0604-4f19-a439-0e2eb001e6f9) | Group | This group contains the devices with the status of the `Windows State UI` and also shows the custom field `Windows Update Button` status and `Windows Update Notification Level` to show there manual selected options for the automation set. |
| [Set Windows Update UI](/docs/41247e58-a82d-49be-b335-55176d698da9) | Group | This group contains the device where the Windows Update UI is required to be set. It can be used for the automation scheduling of the script. |

## Implementation

- Create the [Script - Windows Updates - Enable or Disable Settings](/docs/c988cacf-1964-4c9b-8a9f-bb6b43c283cb) 
- Create the custom field [cPVAL Windows Update Button](/docs/134eb999-a5dd-4599-ae1f-4c0082590007)
- Create the custom field [cPVAL Windows Update UI State](/docs/ad629c28-f5f4-432d-93d2-abb3a35e4737)
- Create the custom field [cPVAL Windows Update Notification Level](/docs/233110ca-c1ca-4ef0-84ba-4285ab3c895e)
- Create the group  [Windows Update UI Audit](/docs/90702d57-0604-4f19-a439-0e2eb001e6f9)
- Create the group  [Set Windows Update UI](/docs/41247e58-a82d-49be-b335-55176d698da9)
- Schedule the task to trigger the  [Script - Windows Updates - Enable or Disable Settings](/docs/c988cacf-1964-4c9b-8a9f-bb6b43c283cb) to the [Group - Set Windows Update UI](/docs/41247e58-a82d-49be-b335-55176d698da9) where `cPVAL Windows Update Button` is set.

## Changelog

### 2026-04-08

- Initial version of the document