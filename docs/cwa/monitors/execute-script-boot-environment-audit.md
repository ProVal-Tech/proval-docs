---
id: 'abf814c3-a689-46db-990f-cbb4342f6be0'
slug: /abf814c3-a689-46db-990f-cbb4342f6be0
title: 'Execute Script - Boot Environment Audit'
title_meta: 'Execute Script - Boot Environment Audit'
keywords: ['boot', 'secure-boot', 'telemetry', 'secure-boot-certificates', 'kek', 'db', 'dbdefault', 'boot-environment-audit', 'secure-boot-audit']
description: 'This monitor executes the Boot Environment Audit script once per week against Windows Workstations and Servers.'
tags: ['secureboot', 'certificates', 'security', 'audit', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-05-06
---

## Summary

This monitor executes the [Boot Environment Audit](/docs/8203c614-47e4-11f1-b8be-92000234cfc2) script once per week against Windows Workstations and Servers.

## Dependencies

- [Custom Table: pvl_boot_environment_details](/docs/7b36b35a-51ab-4a6d-b129-f1057ef349b9)
- [Script: Boot Environment Audit](/docs/8203c614-47e4-11f1-b8be-92000234cfc2)
- [Solution: Boot Environment Audit](/docs/539d13a0-9444-4b40-8b09-aebf34ade1f8)

## Target

Global

## Alert Template

- `△ Custom - Execute Script - Boot Environment Audit`

## Changelog

### 2026-05-06

- Initial version of the document
