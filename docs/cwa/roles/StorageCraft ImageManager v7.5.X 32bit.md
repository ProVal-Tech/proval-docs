---
id: 'cwa-storagecraft-imagemanager-75'
title: 'StorageCraft ImageManager v7.5.X Detection'
title_meta: 'StorageCraft ImageManager v7.5.X Detection'
keywords: ['storagecraft', 'imagemanager', 'detection', 'windows']
description: 'This document provides a role definition to help track down machines with StorageCraft ImageManager v7.5.X 32bit installed. It includes detection strings and settings for identifying the software on applicable operating systems.'
tags: ['software', 'windows', 'configuration', 'detection']
draft: false
unlisted: false
---
## Summary

This role definition helps you track down machines with StorageCraft ImageManager v7.5.X 32bit installed.

## Settings

| Detection String                                                                                       | Comparator     | Result      | Applicable OS |
|--------------------------------------------------------------------------------------------------------|----------------|-------------|----------------|
| `%{@powershell.exe "(Get-Item 'C:\\Program Files\\StorageCraft\\ImageManager\\ImageManager.exe' | Select -ExpandProperty VersionInfo).ProductVersion"@%}` | Regex Match    | `^7\.5.`    | Windows        |


