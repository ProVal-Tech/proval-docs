---
id: '3a6239b1-a7d1-470a-80de-f633f69d9691'
slug: /3a6239b1-a7d1-470a-80de-f633f69d9691
title: 'cPVAL QuickPass Token'
title_meta: 'cPVAL QuickPass Token'
keywords: ['quickpass', 'agent', 'windows', 'install']
description: 'Custom Field to enter the Quickpass Token to authenticate the installer and associate the endpoint with the correct MSP/tenant account.'
tags: ['installation', 'software', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-10-21  
---

## Summary

Custom Field to enter the QuickPass Token to authenticate the installer and associate the endpoint with the correct MSP/tenant account.

## Details

| Label | Field Name | Example | Definition Scope | Type | Required | Default Value | Editable | Custom Field Tab |
| ----- | ---------- | ------- | ---------------- | ---- | -------- | ------------- | -------- | ---------------- |
| cPVAL QuickPass Token | cpvalQuickpassToken | `3233d5-4eee-8d65-eddededed` | `Organization`, `Location`, `Device` | Text | False | | True | QuickPass |

## Dependencies

* [Solution - Deploy QuickPass Agent](/docs/a68fa93c-45c7-4491-80d1-5e7543016b7f)

## Custom Field Creation

- [Custom Field Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/custom-fields/cpval-quickpass-token.toml)

## Sample Screenshot

![Image1](../../../static/img/docs/3a6239b1-a7d1-470a-80de-f633f69d9691/image1.webp)

## Changelog

### 2026-10-21

- Initial version of the document
