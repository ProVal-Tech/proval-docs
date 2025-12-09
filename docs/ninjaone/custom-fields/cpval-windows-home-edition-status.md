---
id: '4a1a47e3-19f1-4dba-be3c-be633cd52979'
slug: /4a1a47e3-19f1-4dba-be3c-be633cd52979
title: 'cPVAL Windows Home Edition Status'
title_meta: 'cPVAL Windows Home Edition Status'
keywords: ['check','home','edition']
description: 'This custom field checks the OS Caption value to determine whether the installed Windows operating system is a home edition. It displays True if the OS name contains Home otherwise it displays False.'
tags: ['windows','custom-fields','auditing']
draft: true
unlisted: false
---

## Summary

This custom field checks the OS Caption value to determine whether the installed Windows operating system is a home edition. It displays True if the OS name contains Home otherwise it displays False.

## Details

| Label | Field Name | Definition Scope | Type | Required | Default Value | Technician Permission | Automation Permission | API Permission | Description | Tool Tip | Footer Text |  Custom Field Tab Name |
| ----- | ---- | ---------------- | ---- | -------- | ------------- | --------------------- | --------------------- | -------------- | ----------- | -------- | ----------- | ----------- |
| cPVAL Windows Home Edition Status | cpvalWindowsHomeEditionStatus | `Device`  | Text | No      | -    | Editable       | Read/Write  | Read/Write  | This custom field checks the OS Caption value to determine whether the installed Windows operating system is a home edition. It displays True if the OS name contains Home otherwise it displays False.  | Identifies whether the device is running Windows home edition. Displays True or False.  | Identifies whether the device is running Windows home edition. Displays True or False.  | `Home Edition` |

## Dependencies

- [Automation - Check Windows Home Edition Status](/docs/ffef0ee2-6b6c-43df-ab5a-ef2dbc702325)

## Custom Field Creation

[Custom Field Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/custom-fields/check-windows-home-edition-status.toml)

## Sample Screenshot

![Home Edition Status](../../../static/img/docs/4a1a47e3-19f1-4dba-be3c-be633cd52979/customfiledrun.webp)
