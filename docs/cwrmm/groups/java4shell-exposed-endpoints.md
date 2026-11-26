---
id: '453048a4-1542-4f24-b5e5-4d9e26ed262b'
slug: /453048a4-1542-4f24-b5e5-4d9e26ed262b
title: 'Java4Shell Exposed Endpoints'
title_meta: 'Java4Shell Exposed Endpoints'
keywords: ['java', 'java4shell', 'cve-2026-114938', 'openjdk', 'vulnerability', 'audit', 'custom-fields', 'cw-rmm']
description: 'Endpoints with a Java runtime that is exploitable through Java4Shell (CVE-2026-114938) right now: vulnerable, on an affected processor, and not mitigated. Handle these first, starting with internet-facing servers.'
tags: ['vulnerability', 'cve', 'security', 'patching', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-11-23
---

## Summary

Endpoints with a Java runtime that is exploitable through Java4Shell (CVE-2026-114938) right now: vulnerable, on an affected processor, and not mitigated. Handle these first, starting with internet-facing servers.

## Dependencies

- [Custom Field: J4S_Status](/docs/b4eef927-7da8-47c0-90da-dd6c6f2bdc08)
- [Solution: Java4Shell Vulnerability Audit (ConnectWise RMM)](/docs/a0ee9b5c-fa3c-4f2e-b7ca-71da1cf3e7cd)
- [Task: Java4Shell Vulnerability Audit-Remediation](/docs/2511ac9a-4b2b-45d9-9d3c-8056c1c21655)

## Group Setup Location

- **Group Path:** `ENDPOINTS` ➞ `Groups`
- **Group Type:** `Dynamic Group`

## Group Summary

- **Group Name:** `Java4Shell Exposed Endpoints`
- **Category:** `Custom`
- **Description:** `Endpoints with a Java runtime that is exploitable through Java4Shell (CVE-2026-114938) right now: vulnerable, on an affected processor, and not mitigated. Handle these first, starting with internet-facing servers.`

## Criteria

| Block | Criteria Name | Operator | Value(s) |
|-------|---------------|----------|----------|
| 1     | J4S_Status | Contains any of | `Exposed` |

**Logic:**
A machine matches the group if its J4S_Status is Exposed.

## Completed Group

![Image](../../../static/img/docs/453048a4-1542-4f24-b5e5-4d9e26ed262b/image.webp)

## Changelog

### 2026-11-23

- Initial version of the document.
