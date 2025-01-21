---
id: 'f25a5083-75f1-4adb-bad8-1612c44f33dd'
title: 'Detect Network Device Enrollment Service Feature'
title_meta: 'Detect Network Device Enrollment Service Feature'
keywords: ['network', 'device', 'enrollment', 'service', 'feature', 'detection', 'windows']
description: 'This document outlines the role used to detect servers that have the Network Device Enrollment Service feature installed, including the settings and detection strings required for effective identification.'
tags: ['security', 'windows']
draft: false
unlisted: false
---

## Summary

This document describes the role used to detect servers with the Network Device Enrollment Service feature installed.

## Settings

| Detection String                                                                                   | Comparator | Result   | Applicable OS |
|----------------------------------------------------------------------------------------------------|------------|----------|---------------|
| `\{@%powershell.exe -nologo -noprofile -command "Get-WindowsFeature -Name 'ADCS-Device-Enrollment' -ErrorAction 'SilentlyContinue' | Select-Object InstallState | Ft -hide"%}` | Contains    | Installed | Windows       |


