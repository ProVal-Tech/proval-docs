---
id: 'a3fa2309-9ab8-476e-a684-25c17e7b0c0b'
slug: /a3fa2309-9ab8-476e-a684-25c17e7b0c0b
title: 'CS_Deployment'
title_meta: 'CS_Deployment'
keywords: ['connectsecure', 'cybercns', 'vulnerability-scan', 'scope', 'os-type', 'deployment', 'company']
description: 'Company-level ConnectSecure agent deployment scope by OS type. Overridden by Site or Endpoint settings. The default value acts as the portal-wide default.'
tags: ['deployment', 'vulnerability', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-11-27
---

## Summary

Sets which Windows devices of a company get the ConnectSecure Vulnerability Scan Agent, by OS type. [CS_Deployment_Site](/docs/0b020b21-1a7b-4bb2-9e33-00549b632986) overrides it for a site, and [CS_Deployment_Endpoint](/docs/63282970-5875-48da-bf3f-60639eb3006b) overrides both for a single device. The [Deploy ConnectSecure Agent [Windows]](/docs/762539d7-6380-4703-b3c7-5daccb53de7f) group uses these fields to choose the devices the [Deploy ConnectSecure Agent [Windows]](/docs/1478e5e2-97a5-435e-aba4-970f33ef598b) monitor checks.

The field's default value applies to every company that doesn't have its own value, so it works as the portal-wide default. It's `Disabled` out of the box, so nothing is deployed until you choose otherwise.

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
- [Custom Field: CS_Deployment_Site](/docs/0b020b21-1a7b-4bb2-9e33-00549b632986)
- [Custom Field: CS_Deployment_Endpoint](/docs/63282970-5875-48da-bf3f-60639eb3006b)

## Custom Field Setup Location

**Custom Fields Path:** SETTINGS ➞ Custom Fields

## Details

| Name | Description | Level | Type | Option Type | Options | Help Text | Default Value | Editable |
|---|---|---|---|---|---|---|---|---|
| CS_Deployment | Company-level ConnectSecure agent deployment scope by OS type. Overridden by Site or Endpoint settings. The default value acts as the portal-wide default. | `Company` | `Dropdown` | `String` | `Windows Workstations and Servers`, `Windows Workstations Only`, `Windows Servers Only`, `Disabled` | Select which Windows devices get the ConnectSecure agent, or Disabled to exclude the client. | `Disabled` | `Yes` |

:::note

Set [CS_Company_ID](/docs/c93bfacb-1e95-42f1-88a2-358ef12de48e) for the company before you turn deployment on. A device in scope without a Company ID fails the task, and the monitor tries again every hour.

Turning deployment off doesn't remove agents that are already installed.

:::

## Implementation

Install the custom field from the `ProVal - Content` Community, selecting the **Custom Fields** repository.

![Image1](../../../static/img/docs/a3fa2309-9ab8-476e-a684-25c17e7b0c0b/image1.webp)

## Changelog

### 2026-11-27

- Initial version of the document
