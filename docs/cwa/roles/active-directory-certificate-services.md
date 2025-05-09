---
id: '72e7fd5f-827f-4b49-86c2-a894036cd4a3'
slug: /72e7fd5f-827f-4b49-86c2-a894036cd4a3
title: 'Active Directory Certificate Services'
title_meta: 'Active Directory Certificate Services'
keywords: ['adcs', 'servers', 'detection', 'windows', 'feature']
description: 'This document outlines a method to detect servers that have the Active Directory Certificate Services (ADCS) role installed. It provides a PowerShell command to check the installation state of the AD-Certificate feature on Windows servers.'
tags: ['active-directory', 'windows']
draft: false
unlisted: false
---

## Summary

This document describes how to detect servers with the ADCS role installed.

## Settings

| Detection String                                                                                                                                          | Comparator | Result   | Applicable OS |
|----------------------------------------------------------------------------------------------------------------------------------------------------------|------------|----------|---------------|
| `\{%@powershell.exe -nologo -noprofile -command "Get-WindowsFeature -Name 'AD-Certificate' -ErrorAction 'SilentlyContinue' | Select-Object InstallState | Ft -Hide"@%}` | Contains   | Installed | Windows       |