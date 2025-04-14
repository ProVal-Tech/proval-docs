---
id: '3a473cd6-8046-4b25-a9a7-a10e19ddd687'
slug: /3a473cd6-8046-4b25-a9a7-a10e19ddd687
title: 'StorageCraft ImageManager v7.5.X 32bit'
title_meta: 'StorageCraft ImageManager v7.5.X 32bit'
keywords: ['storagecraft', 'imagemanager', 'detection', 'windows']
description: 'This document provides a role definition to help track down machines with StorageCraft ImageManager v7.5.X 32-bit installed. It includes detection strings and settings for identifying the software on applicable operating systems.'
tags: ['software', 'windows']
draft: false
unlisted: false
---

## Summary

This role definition helps you track down machines with StorageCraft ImageManager v7.5.X 32-bit installed.

## Settings

| Detection String                                                                                       | Comparator     | Result      | Applicable OS |
|--------------------------------------------------------------------------------------------------------|----------------|-------------|----------------|
| `%\\\{@powershell.exe \"(Get-Item 'C://Program Files//StorageCraft//ImageManager//ImageManager.exe' | Select -ExpandProperty VersionInfo).ProductVersion\"@%}` | Regex Match    | `^7/.5.`    | Windows        |



