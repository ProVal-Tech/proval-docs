---
id: '5cca5370-e9c6-4c17-83dc-89d8f028de2f'
slug: /5cca5370-e9c6-4c17-83dc-89d8f028de2f
title: 'SSTP_Ticket_Site'
title_meta: 'SSTP_Ticket_Site'
keywords: ['sstp', 'vpn', 'tickets', 'workflow', 'site']
description: 'Site-level override for ticketing on failed SSTP VPN deployments. Overrides Company settings, but overridden by Endpoint.'
tags: ['vpn', 'deployment', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-11-27
---

## Summary

Overrides [SSTP_Ticket](/docs/9525e584-65f9-4540-bab4-d968878b5df9) for one site. Leave it empty to use the company's value. [SSTP_Ticket_Endpoint](/docs/9dc62dce-b999-40ad-adea-b1cfd9d6808f) overrides it for a single device.

| Option | What happens when the task fails on a device |
|---|---|
| `Enabled` | One ticket is created for the device through the [CWRMM Ticket Management for Monitors](/docs/57daa951-2acc-4be7-a025-0d0ca729ef57) workflow. It closes after the next successful run. |
| `Disabled` | No ticket. The failure shows in the task's Script Log. |
| Empty | The company's value applies. |

## Dependencies

- [Solution: SSTP VPN Deployment](/docs/7513f241-2384-433a-8887-fe8a014a927e)
- [Task: SSTP VPN Deployment](/docs/11eb7169-75d8-456d-a28d-fe9aff517ac7)
- [Custom Field: SSTP_Ticket](/docs/9525e584-65f9-4540-bab4-d968878b5df9)
- [Custom Field: SSTP_Ticket_Endpoint](/docs/9dc62dce-b999-40ad-adea-b1cfd9d6808f)
- [Custom Field: Ticket_Mgmt_Webhook_Url](/docs/8e55deb6-bef8-4501-9e64-7b25e7fcd1ab)
- [Workflows: CWRMM Ticket Management for Monitors](/docs/57daa951-2acc-4be7-a025-0d0ca729ef57)

## Custom Field Setup Location

**Custom Fields Path:** SETTINGS ➞ Custom Fields

## Details

| Name | Description | Level | Type | Option Type | Options | Help Text | Default Value | Editable |
|---|---|---|---|---|---|---|---|---|
| SSTP_Ticket_Site | Site-level override for ticketing on failed SSTP VPN deployments. Overrides Company settings, but overridden by Endpoint. | `Site` | `Dropdown` | `String` | `Enabled`, `Disabled` | Leave blank to inherit. Select Enabled to create tickets for failed deployments. |  | `Yes` |

:::note

This field has no default value, and shouldn't be given one. A default value would apply to every site and override the level above it everywhere.

:::

## Implementation

Install the custom field from the `ProVal - Content` Community, selecting the **Custom Fields** repository.

![Image1](../../../static/img/docs/5cca5370-e9c6-4c17-83dc-89d8f028de2f/image1.webp)

## Changelog

### 2026-11-27

- Initial version of the document
