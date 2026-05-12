---
id: '8bbf34f6-8c05-4776-9f8c-c589944b4042'
slug: /8bbf34f6-8c05-4776-9f8c-c589944b4042
title: 'Windows Server Roles Detection'
title_meta: 'Windows Server Roles Detection'
keywords: ['task', 'scheduled-task', 'roles']
description: 'Retrieves installed Windows Server roles and stores to the cPVAL Roles Detected custom field.'
tags: ['windows']
draft: false
unlisted: false
last_update:
  date: 2026-05-12
---

## Summary

Runs the [Windows Server Roles Detection](/docs/5cda8c79-bcd0-4226-b5a4-db846b9b35a9) automation daily against [cPVAL - Windows Servers](/docs/c73e004e-6a9c-40e4-8e74-babb4b729256) group to identify the installed Windows Server roles and updates the [cPVAL Roles Detected](/docs/e9ec73dd-98b1-4436-a027-4ee8906f7cba) custom field with the retrieved information.

## Dependencies

[cPVAL Roles Detected](/docs/e9ec73dd-98b1-4436-a027-4ee8906f7cba)
[Windows Server Roles Detection](/docs/5cda8c79-bcd0-4226-b5a4-db846b9b35a9)

## Details

| Name       | Description | Allow Groups | Repeats | Recur every | Start At | Ends | Targets | Automations |
| ---------- | ----------- | ------------ | ------- | ----------- | -------- | ---- | ------- | ----------- |
| Windows Server Roles Detection | Retrieves installed Windows Server roles and stores to the cPVAL Roles Detected custom field. | True | Daily | 1 Days | Current Time | Never | [cPVAL - Windows Servers](/docs/c73e004e-6a9c-40e4-8e74-babb4b729256) group | [Windows Server Roles Detection](/docs/5cda8c79-bcd0-4226-b5a4-db846b9b35a9) automation |

## Task Creation

[Task Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/tasks/windows-server-roles-detection.toml)

## Changelog

### 2026-05-12

- Created the toml file that was missing and updated the document.

### 2025-03-31

- Initial version of the document
