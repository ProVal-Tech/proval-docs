---
id: '0755e964-3e42-4132-900e-3889a8c4fc93'
slug: /0755e964-3e42-4132-900e-3889a8c4fc93
title: 'CS_Company_ID_Site'
title_meta: 'CS_Company_ID_Site'
keywords: ['connectsecure', 'cybercns', 'company-id', 'agent-registration', 'site']
description: 'Site-level override for the ConnectSecure Company ID. Overrides Company settings.'
tags: ['deployment', 'vulnerability', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-11-27
---

## Summary

Overrides [CS_Company_ID](/docs/c93bfacb-1e95-42f1-88a2-358ef12de48e) for one site. Leave it empty to use the company's value. Fill it in only when the site's devices belong to a different company in ConnectSecure.

## Dependencies

- [Solution: Deploy ConnectSecure Agent [Windows]](/docs/6772bca3-be64-4114-8fc7-10cbee463bcb)
- [Task: Deploy ConnectSecure Agent [Windows]](/docs/f525e770-2d55-4de5-af7e-0a95e8a825ce)
- [Custom Field: CS_Company_ID](/docs/c93bfacb-1e95-42f1-88a2-358ef12de48e)

## Custom Field Setup Location

**Custom Fields Path:** SETTINGS ➞ Custom Fields

## Details

| Name | Description | Level | Type | Help Text | Default Value | Editable |
|---|---|---|---|---|---|---|
| CS_Company_ID_Site | Site-level override for the ConnectSecure Company ID. Overrides Company settings. | `Site` | `Text Box` | Leave blank to inherit. Enter a Company ID when this site maps to its own company in ConnectSecure. |  | `Yes` |

:::note

This field has no default value, and shouldn't be given one. A default value would apply to every site and override the level above it everywhere.

:::

## Implementation

Install the custom field from the `ProVal - Content` Community, selecting the **Custom Fields** repository.

![Image1](../../../static/img/docs/0755e964-3e42-4132-900e-3889a8c4fc93/image1.webp)

## Changelog

### 2026-11-27

- Initial version of the document
