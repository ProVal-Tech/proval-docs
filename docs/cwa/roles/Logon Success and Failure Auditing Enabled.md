---
id: 'cwa-auditpol-logon-audit-check'
title: 'Logon Success/Failure Auditing Check with Auditpol'
title_meta: 'Logon Success/Failure Auditing Check with Auditpol'
keywords: ['auditpol', 'logon', 'auditing', 'windows', 'security']
description: 'This document provides a method to run auditpol.exe to check if logon success and failure auditing is enabled on Windows Active Directory Controllers. It includes the necessary detection string and applicable operating system information.'
tags: ['auditpol', 'logon', 'security', 'windows', 'active-directory']
draft: false
unlisted: false
---
## Summary

Runs auditpol.exe and determines if logon success / failure auditing is enabled.

## Settings

| Detection String                             | Comparator | Result              | Applicable OS         |
|----------------------------------------------|------------|---------------------|-----------------------|
| {%@auditpol.exe /get /subcategory:logon@%} | Contains   | Success and Failure | Windows AD Controller  |


