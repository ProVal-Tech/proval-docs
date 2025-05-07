---
id: '0e230069-e0d6-49f6-ab3a-894f248f3f5b'
slug: /0e230069-e0d6-49f6-ab3a-894f248f3f5b
title: 'Patch Config Mismatch'
title_meta: 'Patch Config Mismatch'
keywords: ['patch', 'config', 'mismatch', 'validation', 'settings']
description: 'This document outlines a method to detect machines where the data returned by the Get Patch Config script does not align with the expected settings defined by the Patch Manager - WUA Settings Validation script. It includes dependencies and a global target for alerting.'
tags: []
draft: false
unlisted: false
---

## Summary

This document detects machines where the data returned by the [Get Patch Config](/docs/c1b906ec-7aea-41f3-8241-358d3d644900) script does not match the settings defined by the [Patch Manager - WUA Settings Validation](/docs/1f78325c-968a-4a73-ba85-2a18c061063e) script.

## Dependencies

- [EPM - Data Collection - Script - Get Patch Config](/docs/c1b906ec-7aea-41f3-8241-358d3d644900)
- [CWM - Automate - Script - Patch Manager - WUA Settings Validation](/docs/1f78325c-968a-4a73-ba85-2a18c061063e)
- [EPM - Data Collection - Custom Table - pvl_patch_config](/docs/c9891eb9-3731-4b0d-9882-dcb4a73229eb)

## Target

Global

## Alert Template

**Name:** `△ Custom - Patch Config Mismatch`

