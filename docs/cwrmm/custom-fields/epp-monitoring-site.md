---
id: 'f0aac000-1eb0-4f95-bf9a-d3d4b453e870'
slug: /f0aac000-1eb0-4f95-bf9a-d3d4b453e870
title: 'EPP_Monitoring_Site'
title_meta: 'EPP_Monitoring_Site'
keywords: ['entra', 'password-protection', 'proxy', 'monitoring', 'enable', 'site']
description: 'Site-level override for Entra Password Protection Proxy health monitoring. Overrides Company settings, but overridden by Endpoint.'
tags: ['active-directory', 'monitoring', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-11-27
---

## Summary

Overrides [EPP_Monitoring](/docs/bec78a0c-3524-45c2-8229-46daadacb5e6) for one site. Leave it empty to use the company's value. [EPP_Monitoring_Endpoint](/docs/4e7effaa-04ba-4d39-b386-db53b8a22d13) overrides it for a single device.

| Option | What happens |
|---|---|
| `Enabled` | The company's Entra Password Protection Proxy servers are monitored. Devices without the proxy aren't affected. |
| `Disabled` | Not monitored. |
| Empty | The company's value applies. |

## Dependencies

- [Solution: Entra Password Protection Proxy Health](/docs/d588fdb2-344a-451e-8941-1d011fc21e80)
- [Task: Entra Password Protection Proxy Monitoring Configuration Writer](/docs/af137ce1-f349-4067-ae66-aebfaf5e08bd)
- [Group: Entra Password Protection Proxy Health](/docs/c114a048-e3f7-4fdf-8cb5-047311bdb66c)
- [Monitor: Entra Password Protection Proxy Health](/docs/de5d3a2a-085c-4150-8469-a9efdea0b3c2)
- [Custom Field: EPP_Monitoring](/docs/bec78a0c-3524-45c2-8229-46daadacb5e6)
- [Custom Field: EPP_Monitoring_Endpoint](/docs/4e7effaa-04ba-4d39-b386-db53b8a22d13)

## Custom Field Setup Location

**Custom Fields Path:** SETTINGS ➞ Custom Fields

## Details

| Name | Description | Level | Type | Option Type | Options | Help Text | Default Value | Editable |
|---|---|---|---|---|---|---|---|---|
| EPP_Monitoring_Site | Site-level override for Entra Password Protection Proxy health monitoring. Overrides Company settings, but overridden by Endpoint. | `Site` | `Dropdown` | `String` | `Enabled`, `Disabled` | Leave blank to inherit. Select Enabled to monitor the proxy servers at this site, or Disabled to exclude the site. |  | `Yes` |

:::note

This field has no default value, and shouldn't be given one. A default value would apply to every site and override the level above it everywhere.

:::

## Implementation

Install the custom field from the `ProVal - Content` Community, selecting the **Custom Fields** repository.

![Image1](../../../static/img/docs/f0aac000-1eb0-4f95-bf9a-d3d4b453e870/image1.webp)

## Changelog

### 2026-11-27

- Initial version of the document
