---
id: '578ef29d-9a35-4249-9d76-f88ebbcd9ee0'
slug: /578ef29d-9a35-4249-9d76-f88ebbcd9ee0
title: 'J4S_Restart_Required'
title_meta: 'J4S_Restart_Required'
keywords: ['java', 'java4shell', 'cve-2026-114938', 'openjdk', 'vulnerability', 'audit', 'custom-fields', 'cw-rmm']
description: 'Endpoint-level custom field populated by the Java4Shell Vulnerability Audit-Remediation task. ''True'' when a running Java process still uses old code after an update or has not picked up the mitigation; ''False'' otherwise.'
tags: ['vulnerability', 'cve', 'security', 'patching', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-11-23
---

## Summary

Endpoint-level custom field populated by the [Task: Java4Shell Vulnerability Audit-Remediation](/docs/2511ac9a-4b2b-45d9-9d3c-8056c1c21655). 'True' when a running Java process still uses old code after an update or has not picked up the mitigation; 'False' otherwise.

## Dependencies

- [Solution: Java4Shell Vulnerability Audit (ConnectWise RMM)](/docs/a0ee9b5c-fa3c-4f2e-b7ca-71da1cf3e7cd)
- [Task: Java4Shell Vulnerability Audit-Remediation](/docs/2511ac9a-4b2b-45d9-9d3c-8056c1c21655)

## Details

**Custom Fields Path:** `SETTINGS` ➞ `Custom Fields`

| Name | Description | Level | Type | Help Text | Default Value | Editable |
|---|---|---|---|---|---|---|
| J4S_Restart_Required | 'True' when a running Java process still uses old code after an update or has not picked up the mitigation; 'False' otherwise. | Endpoint | Text Box | Populated by the Java4Shell Vulnerability Audit-Remediation task. Do not edit. |  | `No` |

## Completed Custom Field

![Complete Screenshot](../../../static/img/docs/578ef29d-9a35-4249-9d76-f88ebbcd9ee0/image.webp)

## Changelog

### 2026-11-23

- Initial version of the document.
