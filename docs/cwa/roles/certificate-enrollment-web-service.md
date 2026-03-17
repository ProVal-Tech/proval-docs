---
id: '0397a186-bb18-4fc4-b9a3-d36de5c9efce'
slug: /0397a186-bb18-4fc4-b9a3-d36de5c9efce
title: 'Certificate Enrollment Web Service'
title_meta: 'Certificate Enrollment Web Service'
keywords: ['certificate', 'enrollment', 'web', 'service', 'feature', 'detection', 'windows']
description: 'This document outlines a role used to detect servers that have the Certificate Enrollment Web Service Feature installed. It includes a detailed detection string and settings applicable for Windows operating systems.'
tags: ['security', 'windows']
draft: false
unlisted: false
last_update:
  date: 2025-05-09
---

## Summary

This document describes a role used to detect servers with the Certificate Enrollment Web Service Feature installed.

## Settings

| Detection String                                                                                                         | Comparator | Result   | Applicable OS |
|--------------------------------------------------------------------------------------------------------------------------|------------|----------|----------------|
| `\{@%powershell.exe -nologo -noprofile -command "Get-WindowsFeature -Name 'ADCS-Enroll-Web-Svc' -ErrorAction 'SilentlyContinue' | Select-Object InstallState | Ft -Hide"%}` | Contains    | Installed | Windows        |

## Changelog

### 2025-04-10

- Initial version of the document
