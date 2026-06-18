---
id: 'c7b4badf-49a8-40b7-a6a0-db908b1c0694'
slug: /c7b4badf-49a8-40b7-a6a0-db908b1c0694
title: 'cPVAL TLS Client Enabled'
title_meta: 'cPVAL TLS Client Enabled'
keywords: ['tls', 'audit']
description: 'This stores the TLS Client Enabled state.'
tags: ['tls', 'audit']
draft: false
unlisted: false
last_update:
  date: 2026-06-18
---

## Summary

This stores the enabled TLS Client versions on an endpoint.

## Details

| Label | Field Name | Definition Scope | Type | Required | Default Value | Technician Permission | Automation Permission | API Permission | Description | Tool Tip | Footer Text |  Custom Field Tab Name |
| ----- | ---- | ---------------- | ---- | -------- | ------------- | --------------------- | --------------------- | -------------- | ----------- | -------- | ----------- | ----------- |
| cPVAL TLS Client Enabled | cpvalTlsClientEnabled | Device | Text | False |  | Read Only | Read/Write | Read/Write | This stores the enabled TLS Client versions on an endpoint. | This stores the enabled TLS Client versions on an endpoint. | This stores the enabled TLS Client versions on an endpoint. | TLS/SSL |

## Dependencies

- [Script - TLS Enabled List Audit](/docs/a19fe079-7179-4bdd-9572-248e1a48fb53)
- [Solution - TLS Version Audit](/docs/9882903a-a467-4136-bb9e-7e2c8f25ae01)

## Custom Field Creation

- [Custom Field Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/custom-fields/cpval-tls-client-enabled.toml)

## Sample Screenshot

![Sample Screenshot](../../../static/img/docs/c7b4badf-49a8-40b7-a6a0-db908b1c0694/image.webp)

## Changelog

### 2026-06-18

- Modified the Custom Field tab name, replacing `TLS Audit` with `TLS/SSL`.

### 2026-04-15

- Initial version of the document
