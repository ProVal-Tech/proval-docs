---
id: 'b5f4d983-bd00-4f9f-9ec6-b385781f0164'
slug: /b5f4d983-bd00-4f9f-9ec6-b385781f0164
title: 'Execute Script - Audit Installed AI Tools'
title_meta: 'Execute Script - Audit Installed AI Tools'
keywords: ['audit', 'ai', 'ai-tools', 'audit-ai-tools', 'installed-ai', 'installed-ai-tools', 'installed-ai-applications']
description: 'Executes auditing script once per week against Windows Workstations.'
tags: ['auditing', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-06-01
---

## Summary

This monitor executes the [Audit Installed AI Tools](/docs/f4273886-5b8f-11f1-b684-92000234cfc2) script once per week against Windows Workstations.

## Dependencies

- [Script: Audit Installed AI Tools](/docs/f4273886-5b8f-11f1-b684-92000234cfc2)
- [Custom Table: pvl_installed_ai_applications_audit](/docs/fcd315e9-e261-4553-a9c3-8440f748cdc6)
- [Solution: Installed AI Tools Audit](/docs/e1783dde-9fda-4c89-80b3-0f5ecc73382c)

## Target

Global

## Alert Template

- `△ Custom - Execute Script - Audit Installed AI Tools`

## Changelog

### 2026-06-01

- Initial version of the document
