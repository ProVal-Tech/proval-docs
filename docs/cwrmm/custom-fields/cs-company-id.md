---
id: 'c93bfacb-1e95-42f1-88a2-358ef12de48e'
slug: /c93bfacb-1e95-42f1-88a2-358ef12de48e
title: 'CS_Company_ID'
title_meta: 'CS_Company_ID'
keywords: ['connectsecure', 'cybercns', 'company-id', 'agent-registration', 'company']
description: 'Company-level ConnectSecure Company ID that identifies this client in the ConnectSecure portal. Overridden by Site settings.'
tags: ['deployment', 'vulnerability', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-11-27
---

## Summary

The ConnectSecure Company ID that identifies this client in the ConnectSecure portal. The [Deploy ConnectSecure Agent [Windows]](/docs/f525e770-2d55-4de5-af7e-0a95e8a825ce) task registers the agent to this company. [CS_Company_ID_Site](/docs/0755e964-3e42-4132-900e-3889a8c4fc93) overrides it for a site whose devices belong to a different company in ConnectSecure.

## Dependencies

- [Solution: Deploy ConnectSecure Agent [Windows]](/docs/6772bca3-be64-4114-8fc7-10cbee463bcb)
- [Task: Deploy ConnectSecure Agent [Windows]](/docs/f525e770-2d55-4de5-af7e-0a95e8a825ce)
- [Custom Field: CS_Company_ID_Site](/docs/0755e964-3e42-4132-900e-3889a8c4fc93)

## Custom Field Setup Location

**Custom Fields Path:** SETTINGS ➞ Custom Fields

## Details

| Name | Description | Level | Type | Help Text | Default Value | Editable |
|---|---|---|---|---|---|---|
| CS_Company_ID | Company-level ConnectSecure Company ID that identifies this client in the ConnectSecure portal. Overridden by Site settings. | `Company` | `Text Box` | Enter the Company ID of this client from the ConnectSecure portal. |  | `Yes` |

:::note

This field has no default value, and shouldn't be given one. Each client has its own Company ID, and a default value would register every client's devices to the same company.

:::

## Implementation

Install the custom field from the `ProVal - Content` Community, selecting the **Custom Fields** repository.

![Image1](../../../static/img/docs/c93bfacb-1e95-42f1-88a2-358ef12de48e/image1.webp)

## Changelog

### 2026-11-27

- Initial version of the document
