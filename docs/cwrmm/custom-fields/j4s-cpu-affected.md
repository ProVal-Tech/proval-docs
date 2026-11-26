---
id: 'bf17cd4d-3653-45a2-85a5-376d17c568bc'
slug: /bf17cd4d-3653-45a2-85a5-376d17c568bc
title: 'J4S_CPU_AVX512_VBMI'
title_meta: 'J4S_CPU_AVX512_VBMI'
keywords: ['java', 'java4shell', 'cve-2026-114938', 'openjdk', 'vulnerability', 'audit', 'custom-fields', 'cw-rmm']
description: 'Endpoint-level custom field populated by the Java4Shell Vulnerability Audit-Remediation task. Whether the JVM reports AVX-512 VBMI on the endpoint''s processor, the condition for Java4Shell: ''Yes'', ''No'', ''Unknown'', or ''Not Checked'' (no Java runtime).'
tags: ['vulnerability', 'cve', 'security', 'patching', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-11-23
---

## Summary

Endpoint-level custom field populated by the [Task: Java4Shell Vulnerability Audit-Remediation](/docs/2511ac9a-4b2b-45d9-9d3c-8056c1c21655). Whether the JVM reports AVX-512 VBMI on the endpoint's processor, the condition for Java4Shell: 'Yes', 'No', 'Unknown', or 'Not Checked' (no Java runtime).

## Dependencies

- [Solution: Java4Shell Vulnerability Audit (ConnectWise RMM)](/docs/a0ee9b5c-fa3c-4f2e-b7ca-71da1cf3e7cd)
- [Task: Java4Shell Vulnerability Audit-Remediation](/docs/2511ac9a-4b2b-45d9-9d3c-8056c1c21655)

## Details

**Custom Fields Path:** `SETTINGS` ➞ `Custom Fields`

| Name | Description | Level | Type | Help Text | Default Value | Editable |
|---|---|---|---|---|---|---|
| J4S_CPU_AVX512_VBMI | Whether the JVM reports AVX-512 VBMI on the endpoint's processor, the condition for Java4Shell: 'Yes', 'No', 'Unknown', or 'Not Checked' (no Java runtime). | Endpoint | Text Box | Populated by the Java4Shell Vulnerability Audit-Remediation task. Do not edit. |  | `No` |

## Completed Custom Field

![Complete Screenshot](../../../static/img/docs/bf17cd4d-3653-45a2-85a5-376d17c568bc/image.webp)

## Changelog

### 2026-11-23

- Initial version of the document.
