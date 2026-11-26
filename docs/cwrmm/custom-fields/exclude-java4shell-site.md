---
id: 'e930bd04-92b1-4635-a307-e4bedafd872e'
slug: /e930bd04-92b1-4635-a307-e4bedafd872e
title: 'Exclude_Java4Shell_Site'
title_meta: 'Exclude_Java4Shell_Site'
keywords: ['java', 'java4shell', 'cve-2026-114938', 'openjdk', 'vulnerability', 'audit', 'custom-fields', 'cw-rmm']
description: 'Site-level custom field to exclude a site from the Java4Shell Vulnerability Audit.'
tags: ['vulnerability', 'cve', 'security', 'patching', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-11-23
---

## Summary

Site-level custom field to exclude a site from the Java4Shell Vulnerability Audit.

## Dependencies

- [Solution: Java4Shell Vulnerability Audit (ConnectWise RMM)](/docs/a0ee9b5c-fa3c-4f2e-b7ca-71da1cf3e7cd)
- [Task: Java4Shell Vulnerability Audit-Remediation](/docs/2511ac9a-4b2b-45d9-9d3c-8056c1c21655)

## Details

**Custom Fields Path:** `SETTINGS` ➞ `Custom Fields`

| Name | Description | Level | Type | Help Text | Default Value | Editable |
|---|---|---|---|---|---|---|
| Exclude_Java4Shell_Site | Site-level custom field to exclude a site from the Java4Shell Vulnerability Audit. | Site | Flag | Exclude every endpoint of the site from the Java4Shell Vulnerability Audit. | `No` | `Yes` |

## Completed Custom Field

![Complete Screenshot](../../../static/img/docs/e930bd04-92b1-4635-a307-e4bedafd872e/image.webp)

## Changelog

### 2026-11-23

- Initial version of the document.
