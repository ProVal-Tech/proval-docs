---
id: 'e39d54a4-ed93-4782-9ab1-81399a71ba15'
slug: /e39d54a4-ed93-4782-9ab1-81399a71ba15
title: 'EPP_Ticket'
title_meta: 'EPP_Ticket'
keywords: ['entra', 'password-protection', 'proxy', 'tickets', 'workflow', 'company']
description: 'Company-level ticketing for failed Entra Password Protection Proxy health checks. Enabled creates one ticket per device when a check fails and closes it when the proxy is healthy again. Overridden by Site or Endpoint settings.'
tags: ['active-directory', 'monitoring', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-11-27
---

## Summary

Turns on tickets for failed proxy health checks. [EPP_Ticket_Site](/docs/96899194-d7e8-4302-aa6a-110ecc1b8cb9) overrides it for a site, and [EPP_Ticket_Endpoint](/docs/d80dd799-f481-4ae4-9a8f-85ef90dbe7c0) overrides both for a single server. The [Entra Password Protection Proxy Monitoring Configuration Writer](/docs/af137ce1-f349-4067-ae66-aebfaf5e08bd) task writes the result to the configuration file that the [Entra Password Protection Proxy Health](/docs/de5d3a2a-085c-4150-8469-a9efdea0b3c2) monitor reads. The default value, `Disabled`, applies to every company that doesn't have its own value.

| Option | What happens when a check fails |
|---|---|
| `Enabled` | One ticket is created for the server through the [CWRMM Ticket Management for Monitors](/docs/57daa951-2acc-4be7-a025-0d0ca729ef57) workflow. It closes once every check passes again. |
| `Disabled` | No ticket. The monitor still raises an alert in CW RMM. |

## Dependencies

- [Solution: Entra Password Protection Proxy Health](/docs/d588fdb2-344a-451e-8941-1d011fc21e80)
- [Task: Entra Password Protection Proxy Monitoring Configuration Writer](/docs/af137ce1-f349-4067-ae66-aebfaf5e08bd)
- [Monitor: Entra Password Protection Proxy Health](/docs/de5d3a2a-085c-4150-8469-a9efdea0b3c2)
- [Custom Field: EPP_Ticket_Site](/docs/96899194-d7e8-4302-aa6a-110ecc1b8cb9)
- [Custom Field: EPP_Ticket_Endpoint](/docs/d80dd799-f481-4ae4-9a8f-85ef90dbe7c0)
- [Custom Field: Ticket_Mgmt_Webhook_Url](/docs/8e55deb6-bef8-4501-9e64-7b25e7fcd1ab)
- [Workflows: CWRMM Ticket Management for Monitors](/docs/57daa951-2acc-4be7-a025-0d0ca729ef57)

## Custom Field Setup Location

**Custom Fields Path:** SETTINGS ➞ Custom Fields

## Details

| Name | Description | Level | Type | Option Type | Options | Help Text | Default Value | Editable |
|---|---|---|---|---|---|---|---|---|
| EPP_Ticket | Company-level ticketing for failed Entra Password Protection Proxy health checks. Enabled creates one ticket per device when a check fails and closes it when the proxy is healthy again. Overridden by Site or Endpoint settings. | `Company` | `Dropdown` | `String` | `Enabled`, `Disabled` | Select Enabled to create tickets for failed health checks, or Disabled to alert in CW RMM only. Requires the Ticket_Mgmt_Webhook_Url field. | `Disabled` | `Yes` |

:::note

Tickets need the [CWRMM Ticket Management for Monitors](/docs/57daa951-2acc-4be7-a025-0d0ca729ef57) workflow and its bot, and the real webhook URL as the default value of [Ticket_Mgmt_Webhook_Url](/docs/8e55deb6-bef8-4501-9e64-7b25e7fcd1ab).

A change takes effect after the next daily run of the configuration writer task, or straight away if you run the task on the server.

:::

## Implementation

Install the custom field from the `ProVal - Content` Community, selecting the **Custom Fields** repository.

![Image1](../../../static/img/docs/e39d54a4-ed93-4782-9ab1-81399a71ba15/image1.webp)

## Changelog

### 2026-11-27

- Initial version of the document
