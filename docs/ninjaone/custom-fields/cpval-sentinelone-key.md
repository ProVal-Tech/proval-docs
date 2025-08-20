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

**Note:** There's no need to create this custom field if the partner is already using another custom field to store the SentinelOne installation token or key.

## Details

| Label | Field Name | Definition Scope | Type | Required | Default Value | Technician Permission | Automation Permission | API Permission | Description | Tool Tip | Footer Text | Custom Field Tab Name |
| ----- | ---- | ---------------- | ---- | -------- | ------------- | --------------------- | --------------------- | -------------- | ----------- | -------- | ----------- |----------- |
| cPVAL SentinelOne Key | cpvalSentineloneKey | Organization | Text | false | | Editable | Read/Write | Read/Write | SentinelOne Installation token. | SentinelOne Installation token. | SentinelOne Installation token. | SentinelOne |

## Dependencies
- [Solution - SentinelOne Management Server Url Validation](/docs/5c97a683-f12f-4fb0-bc18-1720a561da93)

## Custom Field Creation

[Custom Field Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/custom-fields/cpval-sentinelone-key.toml)
