---
id: '63282970-5875-48da-bf3f-60639eb3006b'
slug: /63282970-5875-48da-bf3f-60639eb3006b
title: 'CS_Deployment_Endpoint'
title_meta: 'CS_Deployment_Endpoint'
keywords: ['connectsecure', 'cybercns', 'vulnerability-scan', 'scope', 'os-type', 'deployment', 'endpoint']
description: 'Endpoint-level ConnectSecure agent deployment switch. Overrides Site and Company settings, whatever the device OS.'
tags: ['deployment', 'vulnerability', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-11-27
---

## Summary

Includes or excludes a single device, whatever its site and company say. Leave it empty to use [CS_Deployment_Site](/docs/0b020b21-1a7b-4bb2-9e33-00549b632986) or [CS_Deployment](/docs/a3fa2309-9ab8-476e-a684-25c17e7b0c0b).

| Option | What happens |
|---|---|
| `Enabled` | The device gets the agent, even when its site or company is `Disabled` or doesn't cover its OS type. |
| `Disabled` | The agent isn't installed on the device by this solution. |
| Empty | The site or company setting applies. |

## Dependencies

- [Solution: Deploy ConnectSecure Agent [Windows]](/docs/6772bca3-be64-4114-8fc7-10cbee463bcb)
- [Task: Deploy ConnectSecure Agent [Windows]](/docs/f525e770-2d55-4de5-af7e-0a95e8a825ce)
- [Group: Deploy ConnectSecure Agent [Windows]](/docs/762539d7-6380-4703-b3c7-5daccb53de7f)
- [Monitor: Deploy ConnectSecure Agent [Windows]](/docs/1478e5e2-97a5-435e-aba4-970f33ef598b)
- [Custom Field: CS_Deployment](/docs/a3fa2309-9ab8-476e-a684-25c17e7b0c0b)
- [Custom Field: CS_Deployment_Site](/docs/0b020b21-1a7b-4bb2-9e33-00549b632986)

## Custom Field Setup Location

**Custom Fields Path:** SETTINGS ➞ Custom Fields

## Details

| Name | Description | Level | Type | Option Type | Options | Help Text | Default Value | Editable |
|---|---|---|---|---|---|---|---|---|
| CS_Deployment_Endpoint | Endpoint-level ConnectSecure agent deployment switch. Overrides Site and Company settings, whatever the device OS. | `Endpoint` | `Dropdown` | `String` | `Enabled`, `Disabled` | Leave blank to inherit. Select Enabled to include this device, or Disabled to exclude it. |  | `Yes` |

:::note

Set it to `Enabled` on one device to try the solution before turning it on for a whole company.

This field has no default value, and shouldn't be given one. A default value would apply to every device and override the level above it everywhere.

:::

## Implementation

Install the custom field from the `ProVal - Content` Community, selecting the **Custom Fields** repository.

![Image1](../../../static/img/docs/63282970-5875-48da-bf3f-60639eb3006b/image1.webp)

## Changelog

### 2026-11-27

- Initial version of the document
