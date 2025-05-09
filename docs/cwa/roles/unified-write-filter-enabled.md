---
id: '5dda23dc-3290-4d32-bbbc-c95713e8030d'
slug: /5dda23dc-3290-4d32-bbbc-c95713e8030d
title: 'Unified Write Filter - Enabled'
title_meta: 'Unified Write Filter - Enabled'
keywords: ['unified', 'writer', 'filter', 'status', 'check', 'agent']
description: 'This document provides an overview of how to determine if an agent has the Unified Writer Filter enabled, including the necessary detection string and applicable settings for Windows operating systems.'
tags: ['performance', 'security', 'windows']
draft: false
unlisted: false
---

## Summary

This document outlines how to determine if an agent has the Unified Writer Filter enabled.

## Settings

| Detection String                                                                                          | Comparator | Result | Applicable OS |
|-----------------------------------------------------------------------------------------------------------|------------|--------|----------------|
| `\{@%powershell.exe -command "Get-WmiObject -Namespace "root/standardcimv2/embedded" -Class UWF_Filter | select -ExpandProperty CurrentEnabled"@%}` | Equals     | True   | Windows        |