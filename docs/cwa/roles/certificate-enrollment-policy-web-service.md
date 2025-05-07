---
id: '466473be-93fc-494f-82ef-b62deadb0622'
slug: /466473be-93fc-494f-82ef-b62deadb0622
title: 'Certificate Enrollment Policy Web Service'
title_meta: 'Certificate Enrollment Policy Web Service'
keywords: ['certificate', 'enrollment', 'web', 'service', 'feature', 'detection', 'windows']
description: 'This document outlines a role used to detect servers that have the Certificate Enrollment Policy Web Service Feature installed, providing a detailed detection string and applicable settings for Windows operating systems.'
tags: ['windows']
draft: false
unlisted: false
---

## Summary

This document outlines a role used to detect servers with the Certificate Enrollment Policy Web Service Feature installed.

## Settings

| Detection String                                                                                     | Comparator | Result   | Applicable OS |
|------------------------------------------------------------------------------------------------------|------------|----------|---------------|
| `\{%@powershell.exe -nologo -noprofile -command "Get-WindowsFeature -Name 'ADCS-Enroll-Web-Pol' -ErrorAction 'SilentlyContinue' | Select-Object InstallState | Ft -Hide"@%}` | Contains   | Installed | Windows       |


