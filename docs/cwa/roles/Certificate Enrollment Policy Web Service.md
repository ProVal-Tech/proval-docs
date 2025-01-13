---
id: 'cwa-detect-certificate-enrollment-policy'
title: 'Detect Certificate Enrollment Policy Web Service Feature'
title_meta: 'Detect Certificate Enrollment Policy Web Service Feature'
keywords: ['certificate', 'enrollment', 'web', 'service', 'feature', 'detection', 'windows']
description: 'This document outlines a role used to detect servers that have the Certificate Enrollment Policy Web Service Feature installed, providing a detailed detection string and applicable settings for Windows operating systems.'
tags: ['detection', 'windows', 'feature', 'server']
draft: false
unlisted: false
---
## Summary

Role used to detect the servers with Certificate Enrollment Policy Web Service Feature installed.

## Settings

| Detection String                                                                                     | Comparator | Result   | Applicable OS |
|------------------------------------------------------------------------------------------------------|------------|----------|---------------|
| {%@powershell.exe -nologo -noprofile -command "Get-windoewsFeature -Name 'ADCS-Enroll-Web-Pol' -erroraction 'SilentlyContinue' | Select-Object InstallState | Ft -hide"@%} | Contains   | Installed | Windows       |



