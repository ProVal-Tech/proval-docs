---
id: 'cwa-unified-writer-filter-status'
title: 'Unified Writer Filter Status Check'
title_meta: 'Unified Writer Filter Status Check'
keywords: ['unified', 'writer', 'filter', 'status', 'check', 'agent']
description: 'This document provides an overview of how to determine if an agent has the Unified Writer Filter enabled, including the necessary detection string and applicable settings for Windows operating systems.'
tags: ['windows', 'configuration', 'security', 'performance']
draft: false
unlisted: false
---
## Summary

This role denotes if an agent has the Unified Writer Filter enabled.

## Settings

| Detection String                                                                                          | Comparator | Result | Applicable OS |
|-----------------------------------------------------------------------------------------------------------|------------|--------|----------------|
| {@%powershell.exe -command "Get-WmiObject -Namespace "root\standardcimv2\embedded" -Class UWF_Filter | select -ExpandProperty CurrentEnabled"@%} | Equals     | True   | Windows        |


