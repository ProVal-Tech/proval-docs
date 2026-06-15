---
id: 'f4505cf9-915f-464f-ab45-95f9eaea7a8d'
slug: /f4505cf9-915f-464f-ab45-95f9eaea7a8d
title: 'Validate TLS SSL Hardening'
title_meta: 'Validate TLS SSL Hardening'
keywords: ['tls','ssl','validate','disable']
description: 'This script validates that insecure protocols (SSL 3.0, TLS 1.0, TLS 1.1) and specified weak cipher suites are disabled at both the server and client levels on the system, while ensuring TLS 1.2 and TLS 1.3 are enabled when supported, providing a clear PASS/FAIL status without making any changes.'
tags: ['tls','windows']
draft: false
unlisted: false
last_update:
  date: 2026-06-15
---

## Overview

This script validates that insecure protocols (SSL 3.0, TLS 1.0, TLS 1.1) and specified weak cipher suites are disabled at both the server and client levels on the system, while ensuring TLS 1.2 and TLS 1.3 are enabled when supported, providing a clear PASS/FAIL status without making any changes.

- TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384
- TLS_RSA_WITH_AES_256_CBC_SHA256
- TLS_RSA_WITH_AES_256_GCM_SHA384
- TLS_RSA_WITH_AES_128_CBC_SHA256
- TLS_RSA_WITH_AES_128_GCM_SHA256
- TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256

## Sample Run

`Play Button` > `Run Automation` > `Script`  

![SampleRun1](../../../static/img/docs/f4505cf9-915f-464f-ab45-95f9eaea7a8d/validate.webp)

## Dependencies

- [Solution - TLS/SSL Security Hardening](/docs/5e391e0f-088e-41be-8b6c-306e02a2cadb)

## Automation Setup/Import

[Automation Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/scripts/validate-tls-ssl-hardening.ps1)

## Output

- Activity Details  

## Changelog

### 2026-06-15

- Updated the script to validate that TLS 1.2 and TLS 1.3 are enabled when supported by the operating system. The script now updates the `cpvalTlsSslHardeningRequired` custom field if any insecure protocol is enabled, any weak cipher suite is present, or if TLS 1.2 and/or TLS 1.3 are not enabled when supported.

### 2026-04-10

- Initial version of the document.