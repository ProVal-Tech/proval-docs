---
id: '9525e584-65f9-4540-bab4-d968878b5df9'
slug: /9525e584-65f9-4540-bab4-d968878b5df9
title: 'SSTP_Ticket'
title_meta: 'SSTP_Ticket'
keywords: ['sstp', 'vpn', 'tickets', 'workflow', 'company']
description: 'Company-level ticketing for failed SSTP VPN deployments. Enabled creates a ticket when the deployment fails on a device and closes it after the next successful run. Overridden by Site or Endpoint settings.'
tags: ['vpn', 'deployment', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-11-27
---

## Summary

Turns on tickets for failed deployments. [SSTP_Ticket_Site](/docs/5cca5370-e9c6-4c17-83dc-89d8f028de2f) overrides it for a site, and [SSTP_Ticket_Endpoint](/docs/9dc62dce-b999-40ad-adea-b1cfd9d6808f) overrides both for a single device. The default value, `Disabled`, applies to every company that doesn't have its own value.

| Option | What happens when the task fails on a device |
|---|---|
| `Enabled` | One ticket is created for the device through the [CWRMM Ticket Management for Monitors](/docs/57daa951-2acc-4be7-a025-0d0ca729ef57) workflow. It closes after the next successful run. |
| `Disabled` | No ticket. The failure shows in the task's Script Log. |

## Dependencies

- [Solution: SSTP VPN Deployment](/docs/7513f241-2384-433a-8887-fe8a014a927e)
- [Task: SSTP VPN Deployment](/docs/11eb7169-75d8-456d-a28d-fe9aff517ac7)
- [Custom Field: SSTP_Ticket_Site](/docs/5cca5370-e9c6-4c17-83dc-89d8f028de2f)
- [Custom Field: SSTP_Ticket_Endpoint](/docs/9dc62dce-b999-40ad-adea-b1cfd9d6808f)
- [Custom Field: Ticket_Mgmt_Webhook_Url](/docs/8e55deb6-bef8-4501-9e64-7b25e7fcd1ab)
- [Workflows: CWRMM Ticket Management for Monitors](/docs/57daa951-2acc-4be7-a025-0d0ca729ef57)

## Custom Field Setup Location

**Custom Fields Path:** SETTINGS ➞ Custom Fields

## Details

| Name | Description | Level | Type | Option Type | Options | Help Text | Default Value | Editable |
|---|---|---|---|---|---|---|---|---|
| SSTP_Ticket | Company-level ticketing for failed SSTP VPN deployments. Enabled creates a ticket when the deployment fails on a device and closes it after the next successful run. Overridden by Site or Endpoint settings. | `Company` | `Dropdown` | `String` | `Enabled`, `Disabled` | Select Enabled to create tickets for failed deployments. Requires the Ticket_Mgmt_Webhook_Url field. | `Disabled` | `Yes` |

:::note

Tickets need the [CWRMM Ticket Management for Monitors](/docs/57daa951-2acc-4be7-a025-0d0ca729ef57) workflow and its bot, and the real webhook URL as the default value of [Ticket_Mgmt_Webhook_Url](/docs/8e55deb6-bef8-4501-9e64-7b25e7fcd1ab). See the [SSTP VPN Deployment](/docs/7513f241-2384-433a-8887-fe8a014a927e) solution.

A ticket that's already open still closes after the next successful run, even if tickets have been turned off since.

:::

## Implementation

Install the custom field from the `ProVal - Content` Community, selecting the **Custom Fields** repository.

![Image1](../../../static/img/docs/9525e584-65f9-4540-bab4-d968878b5df9/image1.webp)

## Changelog

### 2026-11-27

- Initial version of the document
