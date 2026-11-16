---
id: 'ac1c2105-bc81-4dca-9786-1991d00e5155'
slug: /ac1c2105-bc81-4dca-9786-1991d00e5155
title: 'cPVAL Tungsten PrintixClientID'
title_meta: 'cPVAL Tungsten PrintixClientID'
keywords: ['printix', 'tungsten', 'printix-client', 'tenant', 'tenant-id']
description: 'The Printix tenant ID that the Install/Update Tungsten Printix Client automation uses to download the installer and register the client to the tenant.'
tags: ['custom-fields', 'deployment', 'print', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-11-16
---

## Summary

The unique ID of the client's Printix tenant, a GUID such as `00000000-0000-0000-0000-000000000000`. The [Install/Update Tungsten Printix Client](/docs/0c5963fc-ac9d-44ff-8fad-8ae2fd267547) automation uses it to download the tenant's installer from Printix and to check that the installed client is registered to this tenant. A client registered to another tenant, or to no tenant, is reinstalled.


Set this field together with [cPVAL Tungsten PrintixClientDomain](/docs/4e5a88c2-1f5a-41fd-bd22-fd3d7ea2fb9b), usually at the organization level. A location or device value overrides it. If the field is empty, or the value isn't a GUID, the automation fails without making changes.

## Details

| Label | Field Name | Example | Definition Scope | Type | Required | Default Value | Dropdown Options | Editable | Custom Field Tab |
| ----- | ---------- | ------- | ---------------- | ---- | -------- | ------------- | ---------------- | -------- | ---------------- |
| cPVAL Tungsten PrintixClientID | cpvalTungstenPrintixclientid | 00000000-0000-0000-0000-000000000000 | `Organization`, `Location`, `Device` | Text | No |  |  | Yes | `Tungsten Printix Client` |

## Dependencies

- [Custom Field: cPVAL Tungsten PrintixClientDomain](/docs/4e5a88c2-1f5a-41fd-bd22-fd3d7ea2fb9b)
- [Custom Field: cPVAL Tungsten Printix Client Deployment](/docs/d53a9981-9c39-4392-bf02-9d069b529f2f)
- [Automation: Install/Update Tungsten Printix Client](/docs/0c5963fc-ac9d-44ff-8fad-8ae2fd267547)
- [Compound Condition: Deploy Tungsten Printix Client - Workstations](/docs/96795ceb-d3c7-4d36-b424-d2979140e036)
- [Compound Condition: Deploy Tungsten Printix Client - Servers](/docs/aad200d0-6423-4b95-80c8-0e8cbae219fa)
- [Solution: Deploy Tungsten Printix Client - NinjaOne](/docs/9424b17b-b55f-417d-9d2d-a953bed8575e)

## Custom Field Creation

- [Custom Field Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/custom-fields/cpval-tungsten-printixclientid.toml)

## Sample Screenshot

![Image1](../../../static/img/docs/ac1c2105-bc81-4dca-9786-1991d00e5155/image1.webp)

## Changelog

### 2026-11-16

- Initial version of the document
