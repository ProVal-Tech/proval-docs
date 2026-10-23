---
id: 'c17bbbb4-4caf-49ae-9067-f8a752358687'
slug: /c17bbbb4-4caf-49ae-9067-f8a752358687
title: 'cPVAL Enable QuickPass Deployment'
title_meta: 'cPVAL Enable QuickPass Deployment'
keywords: ['quickpass', 'agent', 'windows', 'install']
description: 'Custom field to select the operating system for deploying QuickPass agents on the endpoints.'
tags: ['installation', 'software', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-10-21
---

## Summary

Custom field to select the operating system for deploying QuickPass agents on the endpoints.

## Details

| Label | Field Name | Example | Definition Scope | Type | Required | Default Value | Dropdown Options | Editable | Custom Field Tab |
| ----- | ---------- | ------- | ---------------- | ---- | -------- | ------------- | ---------------- | -------- | ---------------- |
| cPVAL Enable QuickPass Deployment | cpvalEnableQuickpassDeployment | | `Organization`, `Location`, `Device` | Drop-down | False | | <ul><li>Disable</li><li>Windows</li><li>Windows Workstations</li><li>Windows Servers</li></ul> | Yes | QuickPass |

## Dependencies

* [Solution - Deploy QuickPass Agent](/docs/a68fa93c-45c7-4491-80d1-5e7543016b7f)

## Custom Field Creation

- [Custom Field Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/custom-fields/cpval-enable-quickpass-deployment.toml)

## Sample Screenshot

![Image1](../../../static/img/docs/c17bbbb4-4caf-49ae-9067-f8a752358687/image1.webp)

## Changelog

### 2026-10-21

- Initial version of the document
