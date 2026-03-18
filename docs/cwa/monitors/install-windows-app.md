---
id: 'b22f954e-6a02-46f4-81d3-3f5d18d4991c'
slug: /b22f954e-6a02-46f4-81d3-3f5d18d4991c
title: 'Install Windows App'
title_meta: 'Install Windows App'
keywords: ['windows', 'application', 'windows-app']
description: 'Identifies Windows workstations where automatic Windows App deployment is enabled, but the app is not installed or the desktop shortcut is missing or invalid. This monitor evaluates data collected by the Install Windows App remote monitor.'
tags: ['windows', 'application', 'software']
draft: false
unlisted: false
last_update:
  date: 2026-03-17
---

## Summary

Identifies Windows workstations where automatic `Windows App` deployment is enabled, but the app is not installed or the desktop shortcut is missing or invalid. This monitor evaluates data collected by the [Install Windows App](/docs/8bcee6a9-17e9-4cf8-af0f-ae92e7d60336) remote monitor.

## Dependencies

- [Script: Install Windows App](/docs/dd28b731-7fbc-4345-8d0b-6875df1d5658)
- [Remote Monitor: Install Windows App](/docs/8bcee6a9-17e9-4cf8-af0f-ae92e7d60336)
- Alert Template: `△ Custom - Execute Script - Install Windows App`
- [Solution: Install Windows App](/docs/0d8c4619-b666-44ec-93b1-2d00e4632865)

## Alert Template

`△ Custom - Execute Script - Install Windows App`

## Target

- Global (the monitor set is scoped by SQL to Windows workstations with deployment enabled)

## Changelog

### 2026-03-17

- SQL optimization

### 2025-12-17

- Initial version of the document
