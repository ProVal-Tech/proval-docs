---
id: 'cwa-detect-ca-web-enrollment'
title: 'Detect Servers with Certification Authority Web Enrollment Feature'
title_meta: 'Detect Servers with Certification Authority Web Enrollment Feature'
keywords: ['servers', 'certification', 'authority', 'web', 'enrollment']
description: 'This document provides a PowerShell role designed to detect servers that have the Certification Authority Web Enrollment feature installed. It includes a detailed detection string and settings for compatibility with Windows operating systems.'
tags: ['windows', 'configuration', 'security', 'report']
draft: false
unlisted: false
---
## Summary

Role used to detect the servers with Certification Authority Web Enrollment Feature installed.

## Settings

| Detection String                                                                                     | Comparator | Result    | Applicable OS |
|------------------------------------------------------------------------------------------------------|------------|-----------|----------------|
| {%@powershell.exe -nologo -noprofile -command "Get-windowsFeature -Name 'ADCS-Web-Enrollment' -erroraction 'SilentlyContinue' | Select-Object InstallState | Ft -hide"@%} | Contains    | Installed | Windows        |




