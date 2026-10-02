---
id: '8eb15892-347b-4786-a818-0d1bfb55f79b'
slug: /8eb15892-347b-4786-a818-0d1bfb55f79b
title: 'Set USB Storage State'
title_meta: 'Set USB Storage State'
keywords: ['usb', 'storage', 'registry']
description: 'This solution provides the USB Storage enabling/disabling automation and on-demand contents.'
tags: ['registry', 'storage']
draft: false
unlisted: false
last_update:
  date: 2026-10-02
---

## Purpose

This solution provides the USB Storage enabling/disabling automation and on-demand contents.

## Associated Content

| Content                                             | Type                                                      | Function                                               |
|-----------------------------------------------------|-----------------------------------------------------------|--------------------------------------------------------|
| [cPVAL Disable USB Storage](/docs/f4b7f1b5-7a05-423c-9bea-39b4e7bbcc68)      | Custom Field | This custom field is required to be checked to set the automation for the USB Storage disabling. |
| [cPVAL Enable USB Storage](/docs/340ffc39-bd0c-4978-ac24-04b392355cab)      | Custom Field | This custom field is required to be checked to set the automation for the USB Storage enabling. |
| [Set USB Storage State](/docs/b066122e-052f-4b5c-a7e7-a2c58f4e5d8d) | Script | Enables or disables USB mass storage via the USBSTOR service 'Start' value. |
| [cPVAL Disable USB Storage](/docs/ce5ce33c-1963-4c3e-90bc-10bca29cfc86)      | Group | This group contains the agents where the "Disable USB Storage" custom field is checked. |
| [cPVAL Enable USB Storage](/docs/88f93d6f-7b69-4373-9793-5e81227d01c1)      | Group | This group contains the agents where the "Enable USB Storage" custom field is checked. |
| [Disable USB Storage](/docs/16269b3d-11f5-4c7c-b34e-a50493c293fe)      | Task | This task set automation to the target group agents of Disable USB Storage custom field checked. |
| [Enable USB Storage](/docs/824c2880-aacd-437c-aae6-6047dbd4e829)      | Task | This task set automation to the target group agents of Enable USB Storage custom field checked. |




## Implementation

- Create the custom fields [cPVAL Disable USB Storage](/docs/f4b7f1b5-7a05-423c-9bea-39b4e7bbcc68) and [cPVAL Enable USB Storage](/docs/340ffc39-bd0c-4978-ac24-04b392355cab).
- Create the script [Set USB Storage State](/docs/b066122e-052f-4b5c-a7e7-a2c58f4e5d8d) 
- Create the groups [cPVAL Disable USB Storage](/docs/ce5ce33c-1963-4c3e-90bc-10bca29cfc86) and [cPVAL Enable USB Storage](/docs/88f93d6f-7b69-4373-9793-5e81227d01c1)
- Create the tasks [Disable USB Storage](/docs/16269b3d-11f5-4c7c-b34e-a50493c293fe) and [Enable USB Storage](/docs/824c2880-aacd-437c-aae6-6047dbd4e829)
- Check the custom field [cPVAL Disable USB Storage](/docs/f4b7f1b5-7a05-423c-9bea-39b4e7bbcc68) and [cPVAL Enable USB Storage](/docs/340ffc39-bd0c-4978-ac24-04b392355cab) at the `organization`, `location` or `device` level where the USB storage is required to be `disabled`, and `enabled` respectively.
- Enable the Task to allow the automation to run weekly.

## Changelog

### 2026-10-02

- Initial version of the document