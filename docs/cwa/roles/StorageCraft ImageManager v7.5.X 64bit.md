---
id: '20b92273-32c6-4526-b693-f90b88424077'
title: 'StorageCraft ImageManager v7.5.X Detection Role Definition'
title_meta: 'StorageCraft ImageManager v7.5.X Detection Role Definition'
keywords: ['storagecraft', 'imagemanager', 'version', 'detection', 'windows']
description: 'This document provides a role definition for tracking machines with StorageCraft ImageManager v7.5.X 64bit installed. It includes detection strings, comparators, and applicable operating systems to ensure accurate identification of the software version.'
tags: ['software', 'windows', 'configuration', 'installation']
draft: false
unlisted: false
---
## Summary

This role definition helps you track down machines with StorageCraft ImageManager v7.5.X 64bit installed.

## Settings

| Detection String                                                                                          | Comparator    | Result  | Applicable OS |
|-----------------------------------------------------------------------------------------------------------|---------------|---------|----------------|
| `%{@powershell.exe "(Get-Item 'C://Program Files (x86)//StorageCraft//ImageManager//ImageManager.exe' | Select -ExpandProperty VersionInfo).ProductVersion"@%}` | Regex Match   | `^7//.5.` | Windows        |







