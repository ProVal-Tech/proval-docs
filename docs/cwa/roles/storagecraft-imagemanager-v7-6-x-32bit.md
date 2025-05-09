---
id: '4346f562-64bc-43d2-9057-b61a04f86cd0'
slug: /4346f562-64bc-43d2-9057-b61a04f86cd0
title: 'StorageCraft ImageManager v7.6.X 32bit'
title_meta: 'StorageCraft ImageManager v7.6.X 32bit'
keywords: ['storagecraft', 'imagemanager', 'detection', 'version', 'windows']
description: 'This document provides a method to detect if StorageCraft ImageManager version 7.6.X 32-bit is installed on Windows systems. It includes a detection string, comparator, and applicable operating systems for accurate identification.'
tags: ['software', 'windows']
draft: false
unlisted: false
---

## Summary

This document outlines the method to detect if StorageCraft ImageManager v7.6.X 32-bit is installed.

## Settings

| Detection String                                                                                       | Comparator    | Result  | Applicable OS |
|--------------------------------------------------------------------------------------------------------|---------------|---------|----------------|
| `\{%@powershell.exe "(Get-Item 'C://Program Files//StorageCraft//ImageManager//ImageManager.exe' | Select -ExpandProperty VersionInfo).ProductVersion"@%}` | Regex Match   | ^7\.6\. | Windows        |