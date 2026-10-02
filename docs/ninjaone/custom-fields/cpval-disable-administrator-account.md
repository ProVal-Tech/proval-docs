---
id: '17eca8b1-0d43-4a31-8a1a-c0686f399372'
slug: /17eca8b1-0d43-4a31-8a1a-c0686f399372
title: 'cPVAL Disable Administrator Account'
title_meta: 'cPVAL Disable Administrator Account'
keywords: ['disable', 'administrator', 'windows']
description: 'Used within the compound condition to determine whether the Disable Administrator solution needs to be run on the Organization.'
tags: ['accounts', 'auditing', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-10-02
---

## Summary

Used within the compound condition to determine whether the Disable Administrator solution needs to be run on the Organization.

## Details

| Label | Field Name | Example | Definition Scope | Type | Required | Default Value | Dropdown Options | Editable | Custom Field Tab |
| ----- | ---------- | ------- | ---------------- | ---- | -------- | ------------- | ---------------- | -------- | ---------------- |
| `cPVAL Disable Administrator Account` | `cpvalDisableAdministratorAccount` | -- | `Device`, `Organization`, `Location` | `Drop-Down` | False | --- | `Disabled`, `Windows Workstation`, `Windows Servers`, `Windows` | True | `Disable Administrator Account` |

## Dependencies

- [Solution - Disable Administrator Account](/docs/c3553e8f-bacf-4b6c-a53f-87cd615d0260)

## Custom Field Creation

- [Custom Field Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/custom-fields/cpval-disable-administrator-account.toml)

## Sample Screenshot

![Image1](../../../static/img/docs/17eca8b1-0d43-4a31-8a1a-c0686f399372/custom-field.webp)

## Changelog

### 2026-10-02

- Initial Version of the document.
