---
id: 'cwa-detect-offline-files'
title: 'Detect Offline Files in Windows'
title_meta: 'Detect Offline Files in Windows'
keywords: ['offline', 'files', 'windows', 'detection']
description: 'This document provides a method to detect if offline files are enabled in Windows using a PowerShell script. It includes detailed settings and detection strings for accurate results.'
tags: ['windows', 'detection', 'configuration']
draft: false
unlisted: false
---
## Summary

This role will detect if offline files are enabled in Windows.

## Settings

| Detection String                                                                                       | Comparator | Result | Applicable OS |
|-------------------------------------------------------------------------------------------------------|------------|--------|---------------|
| {%@powershell.exe "Get-WmiObject -Class win32_OfflineFilesCache -ErrorAction SilentlyContinue | Select-Object -ExpandProperty Enabled"@%} | Equals     | True   | Windows       |




