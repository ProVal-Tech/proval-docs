---
id: '265e1888-ce5f-4d44-a5c4-6a64d578eb98'
slug: /265e1888-ce5f-4d44-a5c4-6a64d578eb98
title: 'Enable Defender'
title_meta: 'Enable Defender'
keywords: ['antivirus', 'windows', 'security', 'defender']
description: 'This solution contains the automation to enable the defender and provide an option to create a ticket for failure.'
tags: ['antivirus', 'windows', 'security']
draft: false
unlisted: false
last_update:
  date: 2026-10-07
---

## Purpose

This solution contains the automation to enable the defender and provide an option to create a ticket for failure.

## Associated Content

| Content                                             | Type                                                      | Function                                               |
|-----------------------------------------------------|-----------------------------------------------------------|--------------------------------------------------------|
| [Enable Defender](/docs/51524601-539b-437b-a885-424fc59da0e5)     | Script | Enables / repairs Microsoft Defender Antivirus when Webroot or another active AV is not present. |
| [Create Ticket for Enable Defender Failure - Server](/docs/3b070dda-67e6-4c3a-9668-efd9ec269fc2)     | Compound Condition | This compound condition is used to create a ticket if the Enable Defender Automation fails on a Windows server. |
| [Create Ticket for Enable Defender Failure - Workstation](/docs/924f71e0-3d47-474c-b4f2-2218e6d0af8f)     | Compound Condition | This compound condition is used to create a ticket if the Enable Defender Automation fails on a Windows workstation. |
| [Enable Defender - Workstation](/docs/81ca93ab-6803-4691-a2f3-c0f4aab3be1e)     | Compound Condition | This compound condition is used to run automation to enable Defender on the Windows workstation. |
| [Enable Defender - Server](/docs/f44c5231-75d9-4067-8460-aee0e3900700)     | Compound Condition | This compound condition is used to run automation to enable Defender on the Windows server. |
| [cpval Enable Defender Only](/docs/0f8717c5-1ceb-4941-a73e-6e00efdb8cae)     | Custom field | This custom field is designed to enable Windows Defender only. It doesn't lead to setting up automation for ticket creation for the failure. |
| [cPVAL Enable Defender With Ticket On Failure](/docs/79e87b45-f26b-4a49-b5be-da58c743dccd)     | Custom field | This custom field is designed to enable Windows Defender and set up automation for ticket creation for the failure. |
| [cPVAL Defender Enable Status](/docs/56b73bb4-bc25-4335-9d99-c4f3dfe0509d)     | Custom field | This custom field stores the success or failure of the Enable Defender automation. |

## Implementation

- Create the custom fields
- Create the script
- Create the compound conditions and enable it once the partner approves for the automation.

## Changelog

### 2026-10-07

- Initial version of the document