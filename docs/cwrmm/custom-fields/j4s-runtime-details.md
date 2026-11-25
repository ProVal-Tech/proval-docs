---
id: '07d3161b-52fc-4584-8878-6b4a2ea9f932'
slug: /07d3161b-52fc-4584-8878-6b4a2ea9f932
title: 'J4S_Runtime_Details'
title_meta: 'J4S_Runtime_Details'
keywords: ['java', 'java4shell', 'cve-2026-114938', 'openjdk', 'vulnerability', 'audit', 'custom-fields', 'cw-rmm']
description: 'Endpoint-level custom field populated by the Java4Shell Vulnerability Audit task. The Java runtimes that need attention, as ''<product or folder> (<version>): <status>, mitigation <state>'', separated by semicolons and limited to 300 characters (''; +N more'' when cut). Folder paths use forward slashes, such as C:/Jenkins/jre. ''<N> runtime(s), none vulnerable'' or ''No Java runtime found'' otherwise.'
tags: ['vulnerability', 'cve', 'security', 'patching', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-11-23
---

## Summary

Endpoint-level custom field populated by the Java4Shell Vulnerability Audit task. The Java runtimes that need attention, as '<product or folder> (<version>): <status>, mitigation <state>', separated by semicolons and limited to 300 characters ('; +N more' when cut). Folder paths use forward slashes, such as C:/Jenkins/jre. '<N> runtime(s), none vulnerable' or 'No Java runtime found' otherwise.

## Dependencies

- [Solution - Java4Shell Vulnerability Audit (ConnectWise RMM)](/docs/a0ee9b5c-fa3c-4f2e-b7ca-71da1cf3e7cd)
- [Task - Java4Shell Vulnerability Audit](/docs/2511ac9a-4b2b-45d9-9d3c-8056c1c21655)

## Details

**Custom Fields Path:** `SETTINGS` ➞ `Custom Fields`

| Name | Description | Level | Type | Help Text | Default Value | Editable |
|---|---|---|---|---|---|---|
| J4S_Runtime_Details | The Java runtimes that need attention, as '<product or folder> (<version>): <status>, mitigation <state>', separated by semicolons and limited to 300 characters ('; +N more' when cut). Folder paths use forward slashes, such as C:/Jenkins/jre. '<N> runtime(s), none vulnerable' or 'No Java runtime found' otherwise. | Endpoint | Text Box | Populated by the Java4Shell Vulnerability Audit task. Do not edit. |  | `No` |

## Completed Custom Field

![Complete Screenshot](../../../static/img/docs/07d3161b-52fc-4584-8878-6b4a2ea9f932/image.webp)

## Changelog

### 2026-11-23

- Initial version of the document.
