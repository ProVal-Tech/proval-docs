---
id: 'bec78a0c-3524-45c2-8229-46daadacb5e6'
slug: /bec78a0c-3524-45c2-8229-46daadacb5e6
title: 'EPP_Monitoring'
title_meta: 'EPP_Monitoring'
keywords: ['entra', 'password-protection', 'proxy', 'monitoring', 'enable', 'company']
description: 'Company-level Entra Password Protection Proxy health monitoring. Overridden by Site or Endpoint settings. The default value acts as the portal-wide default.'
tags: ['active-directory', 'monitoring', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-11-27
---

## Summary

Turns Entra Password Protection Proxy health monitoring on or off for a company. [EPP_Monitoring_Site](/docs/f0aac000-1eb0-4f95-bf9a-d3d4b453e870) overrides it for a site, and [EPP_Monitoring_Endpoint](/docs/4e7effaa-04ba-4d39-b386-db53b8a22d13) overrides both for a single server. The [Entra Password Protection Proxy Health](/docs/c114a048-e3f7-4fdf-8cb5-047311bdb66c) group uses these fields, together with the installed proxy software, to choose the servers that the [Entra Password Protection Proxy Monitoring Configuration Writer](/docs/af137ce1-f349-4067-ae66-aebfaf5e08bd) task and the [Entra Password Protection Proxy Health](/docs/de5d3a2a-085c-4150-8469-a9efdea0b3c2) monitor run on.

The field's default value applies to every company that doesn't have its own value, so it works as the portal-wide default. It's `Disabled` out of the box.

| Option | What happens |
|---|---|
| `Enabled` | The company's Entra Password Protection Proxy servers are monitored. Devices without the proxy aren't affected. |
| `Disabled` | Not monitored. |

## Dependencies

- [Solution: Entra Password Protection Proxy Health](/docs/d588fdb2-344a-451e-8941-1d011fc21e80)
- [Task: Entra Password Protection Proxy Monitoring Configuration Writer](/docs/af137ce1-f349-4067-ae66-aebfaf5e08bd)
- [Group: Entra Password Protection Proxy Health](/docs/c114a048-e3f7-4fdf-8cb5-047311bdb66c)
- [Monitor: Entra Password Protection Proxy Health](/docs/de5d3a2a-085c-4150-8469-a9efdea0b3c2)
- [Custom Field: EPP_Monitoring_Site](/docs/f0aac000-1eb0-4f95-bf9a-d3d4b453e870)
- [Custom Field: EPP_Monitoring_Endpoint](/docs/4e7effaa-04ba-4d39-b386-db53b8a22d13)

## Custom Field Setup Location

**Custom Fields Path:** SETTINGS ➞ Custom Fields

## Details

| Name | Description | Level | Type | Option Type | Options | Help Text | Default Value | Editable |
|---|---|---|---|---|---|---|---|---|
| EPP_Monitoring | Company-level Entra Password Protection Proxy health monitoring. Overridden by Site or Endpoint settings. The default value acts as the portal-wide default. | `Company` | `Dropdown` | `String` | `Enabled`, `Disabled` | Select Enabled to monitor the Entra Password Protection Proxy servers of this client, or Disabled to exclude the client. | `Disabled` | `Yes` |

:::note

Turning monitoring off removes the servers from the group, so the monitor stops checking them. Close any ticket that's still open by hand.

:::

## Implementation

Install the custom field from the `ProVal - Content` Community, selecting the **Custom Fields** repository.

![Image1](../../../static/img/docs/bec78a0c-3524-45c2-8229-46daadacb5e6/image1.webp)

## Changelog

### 2026-11-27

- Initial version of the document
