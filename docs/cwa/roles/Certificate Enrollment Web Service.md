---
id: 'cwa-detect-cert-enrollment-web-service'
title: 'Detect Certificate Enrollment Web Service Feature'
title_meta: 'Detect Certificate Enrollment Web Service Feature'
keywords: ['certificate', 'enrollment', 'web', 'service', 'feature', 'detection', 'windows']
description: 'This document outlines a role used to detect servers that have the Certificate Enrollment Web Service Feature installed. It includes a detailed detection string and settings applicable for Windows operating systems.'
tags: ['windows', 'feature', 'detection', 'security']
draft: false
unlisted: false
---
## Summary

Role used to detect the servers with Certificate Enrollment Web Service Feature installed.

## Settings

| Detection String                                                                                                         | Comparator | Result   | Applicable OS |
|--------------------------------------------------------------------------------------------------------------------------|------------|----------|----------------|
| {@%powershell.exe -nologo -noprofile -command "Get-windowsFeature -Name 'ADCS-Enroll-Web-Svc' -erroraction 'SilentlyContinue' | Select-Object InstallState | Ft -hide"@%} | Contains    | Installed | Windows        |



