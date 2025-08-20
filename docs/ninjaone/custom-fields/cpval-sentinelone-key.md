---
id: '44561301-d22b-4013-86af-d1842773d2ca'
slug: /44561301-d22b-4013-86af-d1842773d2ca
title: 'cPVAL SentinelOne Key'
title_meta: 'cPVAL SentinelOne Key'
keywords: ['sentinelone', 's1', 'management-console', 'management-server-url']
description: 'SentinelOne Installation token.'
tags: ['antivirus', 'auditing']
draft: false
unlisted: false
---

## Summary

This custom field at the organization level stores the Sentinel Site Key. The Site Key is used for organizing and managing endpoints based on their physical or logical network location within the organization.

**Note:** 
- For [Solution - SentinelOne Management Server Url Validation](/docs/5c97a683-f12f-4fb0-bc18-1720a561da93), there's no need to create this custom field if the partner is already using another custom field to store the SentinelOne installation token or key.  
- Mandatory for [Automation - SentinelOne Deployment](/docs/4e0f294f-9ecf-42a2-9832-497d4305360e)

## Details

| Label | Field Name | Definition Scope | Type | Required | Default Value | Technician Permission | Automation Permission | API Permission | Description | Tool Tip | Footer Text | Custom Field Tab Name |
| ----- | ---- | ---------------- | ---- | -------- | ------------- | --------------------- | --------------------- | -------------- | ----------- | -------- | ----------- |----------- |
| cPVAL SentinelOne Key | cpvalSentineloneKey | Organization | Text | True | | Editable | Read/Write | Read/Write | Stores the Sentinel Site Key. The Site Key is used for organizing and managing endpoints based on their physical or logical network location within the organization. | Stores the Sentinel Site Key. The Site Key is used for organizing and managing endpoints based on their physical or logical network location within the organization.| SentinelOne Installation token. | SentinelOne |

## Dependencies
- [Solution - SentinelOne Management Server Url Validation](/docs/5c97a683-f12f-4fb0-bc18-1720a561da93)
- [Automation - SentinelOne Deployment](/docs/4e0f294f-9ecf-42a2-9832-497d4305360e)

## Custom Field Creation

[Custom Field Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/custom-fields/cpval-sentinelone-key.toml)

## FAQ
1. Should this custom field be created if client is not using our script [SentinelOne Deployment](/docs/4e0f294f-9ecf-42a2-9832-497d4305360e)?
No. If they are not using our script for deployment and has a custom field already created with different name, then this custom field is not required to be created.

2. Should I create this custom field if client wants both, our [Solution - SentinelOne Management Server Url Validation](/docs/5c97a683-f12f-4fb0-bc18-1720a561da93) and [Automation - SentinelOne Deployment](/docs/4e0f294f-9ecf-42a2-9832-497d4305360e)?
Yes.

3. What if client is using different custom field to store the SentinelOne Key and wants to use our deployment script?
Create this custom field and migrate their key from the old to new if possible. Both the contents are using this custom field by default. 
