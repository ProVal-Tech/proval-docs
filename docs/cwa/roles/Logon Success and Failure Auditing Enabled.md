---
id: '4a2bb766-6bdb-43f4-bf79-44d191fbcb59'
title: 'Logon Success and Failure Auditing Enabled'
title_meta: 'Logon Success and Failure Auditing Enabled'
keywords: ['auditpol', 'logon', 'auditing', 'windows', 'security']
description: 'This document provides a method to run auditpol.exe to check if logon success and failure auditing is enabled on Windows Active Directory Controllers. It includes the necessary detection string and applicable operating system information.'
tags: ['active-directory', 'security', 'windows']
draft: false
unlisted: false
---

## Summary

This document outlines how to run `auditpol.exe` to determine if logon success and failure auditing is enabled.

## Settings

| Detection String                             | Comparator | Result              | Applicable OS         |
|----------------------------------------------|------------|---------------------|-----------------------|
| `auditpol.exe /get /subcategory:logon`     | Contains   | Success and Failure | Windows AD Controller  |



