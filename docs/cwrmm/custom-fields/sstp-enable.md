---
id: '57f97be2-e027-413f-919e-b6984ce6fba1'
slug: /57f97be2-e027-413f-919e-b6984ce6fba1
title: 'SSTP_Enable'
title_meta: 'SSTP_Enable'
keywords: ['sstp', 'vpn', 'scope', 'os-type', 'deployment', 'company']
description: 'Company-level SSTP VPN deployment scope by OS type. Overridden by Site or Endpoint settings. The default value acts as the portal-wide default.'
tags: ['vpn', 'deployment', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-11-27
---

## Summary

Sets which Windows devices of a company get the SSTP VPN connection, by OS type. [SSTP_Enable_Site](/docs/48e518b7-2a64-42a1-9d00-8e46136a86d2) overrides it for a site, and [SSTP_Enable_Endpoint](/docs/2e5a736d-431a-46ba-a157-e6f7e6740843) overrides both for a single device. The [SSTP VPN Deployment](/docs/9848ce15-c56b-4ccd-a80f-95b21e5a4f75) group uses these fields to choose the devices the [SSTP VPN Deployment](/docs/11eb7169-75d8-456d-a28d-fe9aff517ac7) task runs on.

The field's default value applies to every company that doesn't have its own value, so it works as the portal-wide default. It's `Disabled` out of the box, so nothing is deployed until you choose otherwise.

| Option | Devices in scope |
|---|---|
| `Windows Workstations and Servers` | Windows workstations and Windows servers |
| `Windows Workstations Only` | Windows workstations |
| `Windows Servers Only` | Windows servers |
| `Disabled` | None. No connection is created or changed. |

## Dependencies

- [Solution: SSTP VPN Deployment](/docs/7513f241-2384-433a-8887-fe8a014a927e)
- [Task: SSTP VPN Deployment](/docs/11eb7169-75d8-456d-a28d-fe9aff517ac7)
- [Group: SSTP VPN Deployment](/docs/9848ce15-c56b-4ccd-a80f-95b21e5a4f75)
- [Custom Field: SSTP_Enable_Site](/docs/48e518b7-2a64-42a1-9d00-8e46136a86d2)
- [Custom Field: SSTP_Enable_Endpoint](/docs/2e5a736d-431a-46ba-a157-e6f7e6740843)

## Custom Field Setup Location

**Custom Fields Path:** SETTINGS ➞ Custom Fields

## Details

| Name | Description | Level | Type | Option Type | Options | Help Text | Default Value | Editable |
|---|---|---|---|---|---|---|---|---|
| SSTP_Enable | Company-level SSTP VPN deployment scope by OS type. Overridden by Site or Endpoint settings. The default value acts as the portal-wide default. | `Company` | `Dropdown` | `String` | `Windows Workstations and Servers`, `Windows Workstations Only`, `Windows Servers Only`, `Disabled` | Select which Windows devices get the SSTP VPN connection, or Disabled to exclude the client. | `Disabled` | `Yes` |

:::note

Fill in the connection settings for the company before you turn deployment on. A device in scope with a required setting missing fails the task until the setting is filled in.

Turning deployment off doesn't remove a connection that's already on a device. It only stops the task from creating or updating it.

:::

## Implementation

Install the custom field from the `ProVal - Content` Community, selecting the **Custom Fields** repository.

![Image1](../../../static/img/docs/57f97be2-e027-413f-919e-b6984ce6fba1/image1.webp)

## Changelog

### 2026-11-27

- Initial version of the document
