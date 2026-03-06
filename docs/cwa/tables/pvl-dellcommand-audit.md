---
id: '21a8afce-3a1c-4bdf-b2d2-a5581583e27c'
slug: /21a8afce-3a1c-4bdf-b2d2-a5581583e27c
title: 'pvl_dellcommand_audit'
title_meta: 'pvl_dellcommand_audit'
keywords: ['dell', 'workstation', 'update', 'installation', 'firmware', 'bios', 'driver']
description: 'This table stores the dell command scan data fetched by the script.'
tags: ['bios', 'firmware', 'installation', 'software', 'update', 'windows']
draft: false
unlisted: false
last_update:
  date: 2025-03-25
---

## Purpose

This table stores the dell command scan data fetched by the [Script - Dell Command Update - InstallUpgrade + Command Handler](/docs/2ab976d5-8a03-49e6-9d72-ad529631d276).

## Dependencies

[Script - Dell Command Update - InstallUpgrade + Command Handler](/docs/2ab976d5-8a03-49e6-9d72-ad529631d276)

## Tables

pvl_dellcommand_audit

### pvl_dellcommand_audit

| Column | Type | Explanation |
| ------ | ---- | ----------- |
| computerid | INT | Computerid of the agent |
| UpdateID | VARCHAR | Update ID of the detected patch |
| Description | VARCHAR | Detected patch description |
| UpdateType | VARCHAR | Describe the Update type (ex: Application, System) |
| UpdateSeverity | VARCHAR | It stores the update severity information (ex: Security, Urgent) |
| UpdateCategory | VARCHAR | It stores the category information about the detected patch |
| ScriptRanDate | VARCHAR | It stores the information about the script last ran time |

## Changelog

### 2026-03-05

- Updated the solution to use the [Agnostic - Initialize-DellCommandUpdate](/docs/aa963f3d-f149-4bfa-8fdc-30f12c21ce7f) to fetch the dell command scanned update using automation as well as the update feature if arguments passed.
