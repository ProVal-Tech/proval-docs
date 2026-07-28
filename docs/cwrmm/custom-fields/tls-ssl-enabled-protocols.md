---
id: 'a90fed7d-ec54-429a-a7cf-14a1af8870bb'
slug: /a90fed7d-ec54-429a-a7cf-14a1af8870bb
title: 'TLS_SSL_Enabled_Protocols'
title_meta: 'TLS_SSL_Enabled_Protocols'
keywords: ['tls','ssl','disable','enable','security-hardening','tls-1.2']
description: 'Comma-separated list of TLS/SSL protocol versions currently enabled on the device, read from the live SCHANNEL registry state after hardening. OS default-enabled protocols are included when their key is absent; any protocol whose key forcefully disables it is excluded.'
tags: ['tls','windows']
draft: false
unlisted: false
last_update:
  date: 2026-07-28
---

## Summary

Comma-separated list of TLS/SSL protocol versions currently enabled on the device, read from the live SCHANNEL registry state after hardening. OS default-enabled protocols are included when their key is absent; any protocol whose key forcefully disables it is excluded.

## Dependencies

- [Solution: TLS/SSL Security Hardening](/docs/13ac3912-863b-41fe-bb61-dfd681f06fa8)

## Custom Field Setup Location

**Custom Fields Path:** SETTINGS ➞ Custom Fields

## Details

| Name | Description | Level | Type | Option Type | Options | Help Text | Default Value | Editable |
|---|---|---|---|---|---|---|---|---|
| TLS_SSL_Enabled_Protocols | Comma-separated list of TLS/SSL protocol versions currently enabled on the device, read from the live SCHANNEL registry state after hardening. OS default-enabled protocols are included when their key is absent; any protocol whose key forcefully disables it is excluded. | `Endpoint` | `Text Box` | | | | | `No` |

## Completed Custom Field

![Image1](../../../static/img/docs/a90fed7d-ec54-429a-a7cf-14a1af8870bb/image1.webp)

## Changelog

### 2026-07-28

- Initial version of the document
