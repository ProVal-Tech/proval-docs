---
id: '0e230069-e0d6-49f6-ab3a-894f248f3f5b'
title: 'Detect Patch Config Mismatch'
title_meta: 'Detect Patch Config Mismatch'
keywords: ['patch', 'config', 'mismatch', 'validation', 'settings']
description: 'This document outlines a method to detect machines where the data returned by the Get Patch Config script does not align with the expected settings defined by the Patch Manager - WUA Settings Validation script. It includes dependencies and a global target for alerting.'
tags: []
draft: false
unlisted: false
---
## Summary

Detects the machines where the data returned by the [Get Patch Config](<../scripts/Get Patch Config.md>) script does not match the settings defined by the [Patch Manager - WUA Settings Validation](<../scripts/Patch Manager - WUA Settings Validation.md>) script.

## Dependencies

- [EPM - Data Collection - Script - Get Patch Config](<../scripts/Get Patch Config.md>)
- [CWM - Automate - Script - Patch Manager - WUA Settings Validation](<../scripts/Patch Manager - WUA Settings Validation.md>)
- [EPM - Data Collection - Custom Table - pvl_patch_config](<../tables/pvl_patch_config.md>)

## Target

Global

## Alert Template

**Name:**  `△ Custom - Patch Config Mismatch`












