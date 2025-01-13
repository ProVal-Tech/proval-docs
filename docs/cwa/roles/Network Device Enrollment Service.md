---
id: 'cwa-detect-network-device-enrollment-service'
title: 'Detect Network Device Enrollment Service Feature'
title_meta: 'Detect Network Device Enrollment Service Feature'
keywords: ['network', 'device', 'enrollment', 'service', 'feature', 'detection', 'windows']
description: 'This document outlines the role used to detect servers that have the Network Device Enrollment Service feature installed, including the settings and detection strings required for effective identification.'
tags: ['configuration', 'windows', 'security']
draft: false
unlisted: false
---
## Summary

Role used to detect the servers with Network Device Enrollment Service Feature installed.

## Settings

| Detection String                                                                                   | Comparator | Result   | Applicable OS |
|----------------------------------------------------------------------------------------------------|------------|----------|---------------|
| {@%powershell.exe -nologo -noprofile -command "Get-windowsFeature -Name 'ADCS-Device-Enrollment' -erroraction 'SilentlyContinue' | Select-Object InstallState | Ft -hide"@%} | Contains    | Installed | Windows       |




