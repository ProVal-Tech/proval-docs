---
id: 'bb1e5b89-09c4-4c74-806e-e1b10a3a09b0'
slug: /bb1e5b89-09c4-4c74-806e-e1b10a3a09b0
title: 'Disable Local Administrator - Workstations'
title_meta: 'Disable Local Administrator - Workstations'
keywords: ['disable', 'local-administrator', 'windows']
description: 'This compound condition is used to run the automation to disable the local Administrator account when it is found to be enabled and the organization has enabled this setting.'
tags: ['accounts', 'auditing', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-09-30
---

## Summary

This compound condition is used to run the automation to disable the local Administrator account when it is found to be enabled and the organization has enabled this setting.

## Details

- **Name:** `Disable Local Administrator - Servers`
- **Description:** `This compound condition is used to run the automation to disable the local Administrator account when it is found to be enabled and the organization has enabled this setting.`
- **Recommended Agent Policies:** `Windows Workstation Policy`

## Dependencies

- [Solution - Disable Local Administrator](/docs/c3553e8f-bacf-4b6c-a53f-87cd615d0260)
- [Custom Field - cPVAL Disable Local Administrator](/docs/17eca8b1-0d43-4a31-8a1a-c0686f399372)
- [Windows - Administrator account process Disable](/docs/f28fbe84-8c67-4442-afb9-e06d7e9ec15b)

## Compound Condition Creation 

- [Compound Condition Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/compound-conditions/disable-local-administrator-workstations.toml)

## Changelog

### 2026-09-30

- Initial Version of the document.