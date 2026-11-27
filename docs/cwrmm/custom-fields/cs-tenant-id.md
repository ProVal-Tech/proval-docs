---
id: '5ce06a0b-16c7-4f91-9241-5bbba68c2ecd'
slug: /5ce06a0b-16c7-4f91-9241-5bbba68c2ecd
title: 'CS_Tenant_ID'
title_meta: 'CS_Tenant_ID'
keywords: ['connectsecure', 'cybercns', 'tenant-id', 'agent-registration', 'company']
description: 'ConnectSecure Tenant ID of the ConnectSecure environment. The default value acts as the portal-wide value.'
tags: ['deployment', 'vulnerability', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-11-27
---

## Summary

The Tenant ID of your ConnectSecure environment. The [Deploy ConnectSecure Agent [Windows]](/docs/f525e770-2d55-4de5-af7e-0a95e8a825ce) task passes it to the agent installer with the Company ID and the User Secret.

The Tenant ID is the same for every client, so enter it as the field's default value under **SETTINGS** ➞ **Custom Fields**. It then applies to every company that doesn't have its own value.

## Dependencies

- [Solution: Deploy ConnectSecure Agent [Windows]](/docs/6772bca3-be64-4114-8fc7-10cbee463bcb)
- [Task: Deploy ConnectSecure Agent [Windows]](/docs/f525e770-2d55-4de5-af7e-0a95e8a825ce)

## Custom Field Setup Location

**Custom Fields Path:** SETTINGS ➞ Custom Fields

## Details

| Name | Description | Level | Type | Help Text | Default Value | Editable |
|---|---|---|---|---|---|---|
| CS_Tenant_ID | ConnectSecure Tenant ID of the ConnectSecure environment. The default value acts as the portal-wide value. | `Company` | `Text Box` | Enter the Tenant ID from the ConnectSecure portal. Set it as the default value to apply it to every client. |  | `Yes` |

## Implementation

Install the custom field from the `ProVal - Content` Community, selecting the **Custom Fields** repository.

![Image1](../../../static/img/docs/5ce06a0b-16c7-4f91-9241-5bbba68c2ecd/image1.webp)

## Changelog

### 2026-11-27

- Initial version of the document
