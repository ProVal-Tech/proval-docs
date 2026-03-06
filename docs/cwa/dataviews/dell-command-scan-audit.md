---
id: '08c932b0-f79a-4c37-bfbe-c2aade829abb'
slug: /08c932b0-f79a-4c37-bfbe-c2aade829abb
title: 'Dell Command Scan Audit'
title_meta: 'Dell Command Scan Audit'
keywords: ['dell', 'workstation', 'update', 'installation', 'firmware', 'bios', 'driver']
description: 'This dataview collects the information of the Dell updates available on the Dell machine.'
tags: ['bios', 'firmware', 'installation', 'software', 'update', 'windows']
draft: false
unlisted: false

last_update:
  date: 2026-03-06
---

## Summary

This dataview collects the information of the Dell updates available on the Dell machine using the [Script - Dell Command Update - InstallUpgrade + Command Handler](/docs/2ab976d5-8a03-49e6-9d72-ad529631d276)

## Dependencies

[Script - Dell Command Update - InstallUpgrade + Command Handler](/docs/2ab976d5-8a03-49e6-9d72-ad529631d276)

[Table - pvl_dellcommand_audit](/docs/21a8afce-3a1c-4bdf-b2d2-a5581583e27c)

## Columns

| Column | Description |
| ------ | ----------- |
| Client    | Client name of the agent |
| Location | Location name of the agent |
| Computer | Computer name of the agent |
| Operating System | Operating system of the agent |
| LastContact | Last contact of the agent with the CW Automate |
| Last Logged In User | Last logged in user on the agent |
| Form Factor | It shows the agent type (Laptop, Desktop, Server etc.) |
| UpdateID | Update ID of the update detected by Dell command handler |
| Description | Update description |
| UpdateType | Update type (Security, application, driver, etc.) |
| UpdateSeverity | Update severity (urgent, security, etc.) |
| UpdateCategory | Update category (AP, SY, etc.) |
| Script Run Time | Dell command last scan run time |

## Changelog

### 2026-03-06

- Updated implementation created using [Agnostic - Initialize-DellCommandUpdate](/docs/aa963f3d-f149-4bfa-8fdc-30f12c21ce7f).