---
id: 'b6843bcc-c5e6-4af4-b604-e6d1c5871a44'
slug: /b6843bcc-c5e6-4af4-b604-e6d1c5871a44
title: 'Execute Script - Get Patch Config'
title_meta: 'Execute Script - Get Patch Config'
keywords: ['patch', 'config', 'execution', 'windows', 'script']
description: 'This document outlines a method to detect computers where the Get Patch Config script has not been executed in the last 7 days. It is specifically designed for Windows 10, 11, Server 2016, 2019, and 2022 environments, ensuring that systems remain up-to-date with patch management practices.'
tags: ['windows']
draft: false
unlisted: false
---

## Summary

Detects the computers where the [Get Patch Config](/docs/c1b906ec-7aea-41f3-8241-358d3d644900) script has not been executed within the past 7 days.

**Limited to:** `Windows 10, 11, Server 2016, 2019, and 2022`

## Dependencies

- [EPM - Data Collection - Script - Get Patch Config](/docs/c1b906ec-7aea-41f3-8241-358d3d644900)
- [EPM - Data Collection - Custom Table - pvl_patch_config](/docs/c9891eb9-3731-4b0d-9882-dcb4a73229eb)

## Target

Global

## Alert Template

**Name:** `△ Custom - Execute Script - Get Patch Config`
