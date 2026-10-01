---
id: '216608bc-7f31-44c3-9fc6-6f5be20f99ba'
slug: /216608bc-7f31-44c3-9fc6-6f5be20f99ba
title: 'cPVAL Disable UPnP Service'
title_meta: 'cPVAL Disable UPnP Service'
keywords: ['upnp', 'windows','disable']
description: 'Custom Field to choose operating system to disable the UPnP Device Host (upnphost) service on Windows devices.'
tags:  ['security', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-10-01
---

## Summary

Custom Field to choose operating system to disable the UPnP Device Host (upnphost) service on Windows devices.

## Details

| Label | Field Name | Example | Definition Scope | Type | Required | Default Value | Dropdown Options | Editable | Custom Field Tab |
| ----- | ---------- | ------- | ---------------- | ---- | -------- | ------------- | ---------------- | -------- | ---------------- |
| cPVAL Disable UPnP Service | cpvalDisableUpnpService | `Organization`, `Location`, `Device` | Drop-down | False | | <ul><li>Disable</li><li>Windows Workstations</li><li>Windows Servers</li><li>Windows</li></ul> | Editable | Read_Write | Read_Write | Windows Services |

## Dependencies

- [Solution - Disable UPnP Service](/docs/70d10692-83c6-4c25-b546-9beadaba5468)

## Custom Field Creation

- [Custom Field Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/custom-fields/cpval-disable-upnp-service.toml)

## Sample Screenshot

![Image1](../../../static/img/docs/76daa3ea-f62f-44bf-948b-4ad02a33270f/image1.webp)

## Changelog

### 2026-10-01

- Initial version of the document
