---
id: '20b92273-32c6-4526-b693-f90b88424077'
slug: /20b92273-32c6-4526-b693-f90b88424077
title: 'StorageCraft ImageManager v7.5.X 64bit'
title_meta: 'StorageCraft ImageManager v7.5.X 64bit'
keywords: ['storagecraft', 'imagemanager', 'version', 'detection', 'windows']
description: 'This document provides a role definition for tracking machines with StorageCraft ImageManager v7.5.X 64-bit installed. It includes detection strings, comparators, and applicable operating systems to ensure accurate identification of the software version.'
tags: ['installation', 'software', 'windows']
draft: false
unlisted: false
---

## Summary

This role definition helps you track machines with StorageCraft ImageManager v7.5.X 64-bit installed.

## Settings

| Detection String                                                                                          | Comparator    | Result   | Applicable OS |
|-----------------------------------------------------------------------------------------------------------|---------------|----------|----------------|
| `%\\\{@powershell.exe \"(Get-Item 'C://Program Files (x86)//StorageCraft//ImageManager//ImageManager.exe' | Select -ExpandProperty VersionInfo).ProductVersion\"@%}` | Regex Match   | `^7\.5\.` | Windows        |