---
id: '6603bbfc-9901-4246-b464-cbbf12620357'
slug: /6603bbfc-9901-4246-b464-cbbf12620357
title: 'StorageCraft ImageManager v7.6.X 64bit'
title_meta: 'StorageCraft ImageManager v7.6.X 64bit'
keywords: ['storagecraft', 'imagemanager', 'detection', 'version', 'windows']
description: 'This document provides information on detecting the installation of the 64-bit version of StorageCraft ImageManager v7.6.x on Windows machines, including the detection string and applicable operating systems.'
tags: ['software', 'windows']
draft: false
unlisted: false
last_update:
  date: 2025-05-09
---

## Summary

This document describes how to detect machines that have the 64-bit version of StorageCraft ImageManager v7.6.x installed.

## Settings

| Detection String                                                                                          | Comparator    | Result    | Applicable OS |
|-----------------------------------------------------------------------------------------------------------|---------------|-----------|----------------|
| %@powershell.exe "(Get-Item 'C:/Program Files (x86)/StorageCraft/ImageManager/ImageManager.exe' | Select -ExpandProperty VersionInfo).ProductVersion"@% | Regex Match   | ^7/.6.    | Windows        |

## Changelog

### 2025-04-10

- Initial version of the document
