---
id: 'cwa-detect-adcs-servers'
title: 'Detect ADCS Role Installed on Servers'
title_meta: 'Detect ADCS Role Installed on Servers'
keywords: ['adcs', 'servers', 'detection', 'windows', 'feature']
description: 'This document outlines a method to detect servers that have the Active Directory Certificate Services (ADCS) role installed. It provides a PowerShell command to check the installation state of the AD-Certificate feature on Windows servers.'
tags: ['windows', 'detection', 'feature', 'servers', 'active-directory']
draft: false
unlisted: false
---

## Summary

To detect the servers with ADCS role installed.

## Settings

| Detection String                                                                                                                                          | Comparator | Result   | Applicable OS |
|----------------------------------------------------------------------------------------------------------------------------------------------------------|------------|----------|---------------|
| {%@powershell.exe -nologo -noprofile -command "Get-windowsFeature -Name 'AD-Certificate' -erroraction 'SilentlyContinue' | Select-Object InstallState | Ft -hide"@%} | Contains   | Installed | Windows       |
