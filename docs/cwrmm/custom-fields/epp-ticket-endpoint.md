---
id: 'd80dd799-f481-4ae4-9a8f-85ef90dbe7c0'
slug: /d80dd799-f481-4ae4-9a8f-85ef90dbe7c0
title: 'EPP_Ticket_Endpoint'
title_meta: 'EPP_Ticket_Endpoint'
keywords: ['entra', 'password-protection', 'proxy', 'tickets', 'workflow', 'endpoint']
description: 'Endpoint-level override for ticketing on failed Entra Password Protection Proxy health checks. Overrides Site and Company settings.'
tags: ['active-directory', 'monitoring', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-11-27
---

## Summary

Overrides [EPP_Ticket_Site](/docs/96899194-d7e8-4302-aa6a-110ecc1b8cb9) and [EPP_Ticket](/docs/e39d54a4-ed93-4782-9ab1-81399a71ba15) for a single device. Leave it empty to use the site or company value.

| Option | What happens when a check fails |
|---|---|
| `Enabled` | One ticket is created for the server through the [CWRMM Ticket Management for Monitors](/docs/57daa951-2acc-4be7-a025-0d0ca729ef57) workflow. It closes once every check passes again. |
| `Disabled` | No ticket. The monitor still raises an alert in CW RMM. |
| Empty | The site or company value applies. |

## Dependencies

- [Solution: Entra Password Protection Proxy Health](/docs/d588fdb2-344a-451e-8941-1d011fc21e80)
- [Task: Entra Password Protection Proxy Monitoring Configuration Writer](/docs/af137ce1-f349-4067-ae66-aebfaf5e08bd)
- [Monitor: Entra Password Protection Proxy Health](/docs/de5d3a2a-085c-4150-8469-a9efdea0b3c2)
- [Custom Field: EPP_Ticket](/docs/e39d54a4-ed93-4782-9ab1-81399a71ba15)
- [Custom Field: EPP_Ticket_Site](/docs/96899194-d7e8-4302-aa6a-110ecc1b8cb9)
- [Custom Field: Ticket_Mgmt_Webhook_Url](/docs/8e55deb6-bef8-4501-9e64-7b25e7fcd1ab)
- [Workflows: CWRMM Ticket Management for Monitors](/docs/57daa951-2acc-4be7-a025-0d0ca729ef57)

## Custom Field Setup Location

**Custom Fields Path:** SETTINGS ➞ Custom Fields

## Details

| Name | Description | Level | Type | Option Type | Options | Help Text | Default Value | Editable |
|---|---|---|---|---|---|---|---|---|
| EPP_Ticket_Endpoint | Endpoint-level override for ticketing on failed Entra Password Protection Proxy health checks. Overrides Site and Company settings. | `Endpoint` | `Dropdown` | `String` | `Enabled`, `Disabled` | Leave blank to inherit. Select Enabled to create tickets for this server, or Disabled to alert in CW RMM only. |  | `Yes` |

:::note

This field has no default value, and shouldn't be given one. A default value would apply to every device and override the level above it everywhere.

:::

## Implementation

Install the custom field from the `ProVal - Content` Community, selecting the **Custom Fields** repository.

![Image1](../../../static/img/docs/d80dd799-f481-4ae4-9a8f-85ef90dbe7c0/image1.webp)

## Changelog

### 2026-11-27

- Initial version of the document
