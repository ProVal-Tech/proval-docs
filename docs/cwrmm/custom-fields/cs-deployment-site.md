---
id: '0b020b21-1a7b-4bb2-9e33-00549b632986'
slug: /0b020b21-1a7b-4bb2-9e33-00549b632986
title: 'CS_Deployment_Site'
title_meta: 'CS_Deployment_Site'
keywords: ['connectsecure', 'cybercns', 'vulnerability-scan', 'scope', 'os-type', 'deployment', 'site']
description: 'Site-level override for the ConnectSecure agent deployment scope by OS type. Overrides Company settings, but overridden by Endpoint.'
tags: ['deployment', 'vulnerability', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-11-27
---

## Summary

Overrides [CS_Deployment](/docs/a3fa2309-9ab8-476e-a684-25c17e7b0c0b) for one site. Leave it empty to use the company's value. [CS_Deployment_Endpoint](/docs/63282970-5875-48da-bf3f-60639eb3006b) overrides it for a single device.

A site set to `Disabled` is excluded even when its company is enabled, and a site set to an OS option is included even when its company is `Disabled`.

| Option | Devices in scope |
|---|---|
| `Windows Workstations and Servers` | Windows workstations and Windows servers |
| `Windows Workstations Only` | Windows workstations |
| `Windows Servers Only` | Windows servers |
| `Disabled` | None. The agent isn't deployed. |

## Dependencies

- [Solution: Deploy ConnectSecure Agent [Windows]](/docs/6772bca3-be64-4114-8fc7-10cbee463bcb)
- [Task: Deploy ConnectSecure Agent [Windows]](/docs/f525e770-2d55-4de5-af7e-0a95e8a825ce)
- [Group: Deploy ConnectSecure Agent [Windows]](/docs/762539d7-6380-4703-b3c7-5daccb53de7f)
- [Monitor: Deploy ConnectSecure Agent [Windows]](/docs/1478e5e2-97a5-435e-aba4-970f33ef598b)
- [Custom Field: CS_Deployment](/docs/a3fa2309-9ab8-476e-a684-25c17e7b0c0b)
- [Custom Field: CS_Deployment_Endpoint](/docs/63282970-5875-48da-bf3f-60639eb3006b)

## Custom Field Setup Location

**Custom Fields Path:** SETTINGS ➞ Custom Fields

## Details

| Name | Description | Level | Type | Option Type | Options | Help Text | Default Value | Editable |
|---|---|---|---|---|---|---|---|---|
| CS_Deployment_Site | Site-level override for the ConnectSecure agent deployment scope by OS type. Overrides Company settings, but overridden by Endpoint. | `Site` | `Dropdown` | `String` | `Windows Workstations and Servers`, `Windows Workstations Only`, `Windows Servers Only`, `Disabled` | Leave blank to inherit. Select which Windows devices get the ConnectSecure agent, or Disabled to exclude the site. |  | `Yes` |

:::note

This field has no default value, and shouldn't be given one. A default value would apply to every site and override the level above it everywhere.

:::

## Implementation

Install the custom field from the `ProVal - Content` Community, selecting the **Custom Fields** repository.

![Image1](../../../static/img/docs/0b020b21-1a7b-4bb2-9e33-00549b632986/image1.webp)

## Changelog

### 2026-11-27

- Initial version of the document
