---
id: 'e6b2deb3-b9d1-4881-9c1b-192eced5ded7'
slug: /e6b2deb3-b9d1-4881-9c1b-192eced5ded7
title: 'Windows - Offline Files Enabled'
title_meta: 'Windows - Offline Files Enabled'
keywords: ['offline', 'files', 'windows', 'detection']
description: 'This document provides a method to detect if offline files are enabled in Windows using a PowerShell script. It includes detailed settings and detection strings for accurate results.'
tags: ['windows']
draft: false
unlisted: false
---

## Summary

This document outlines a method to detect if offline files are enabled in Windows.

## Settings

| Detection String                                                                                       | Comparator | Result | Applicable OS |
|-------------------------------------------------------------------------------------------------------|------------|--------|---------------|
| \{%@powershell.exe "Get-WmiObject -Class win32_OfflineFilesCache -ErrorAction SilentlyContinue | Select-Object -ExpandProperty Enabled"@%} | Equals     | True   | Windows       |