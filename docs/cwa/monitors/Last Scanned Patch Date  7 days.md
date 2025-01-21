---
id: '43acf895-0eee-4e39-ac9d-cabc5f23e9a1'
title: 'Last Scanned Patch Date  7 days'
title_meta: 'Last Scanned Patch Date  7 days'
keywords: ['monitor', 'autofix', 'patch', 'inventory', 'script']
description: 'This document outlines a monitor set that identifies machines with patch inventory older than 7 days and executes an autofix script to address the issue. It includes dependencies and target information for implementation.'
tags: ['patching', 'sql']
draft: false
unlisted: false
---

## Summary

The monitor set will look for machines where the patch inventory is older than 7 days and will execute an autofix script against those machines.

## Dependencies

[SEC - Windows Patching - Script - Repair Failing Patch Scans](<../scripts/Repair Failing Patch Scans.md>)

## Target

Global - Should be run without explicitly defined targets. The SQL will target machines with patching policies automatically.



