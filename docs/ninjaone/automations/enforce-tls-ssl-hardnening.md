---
id: '5a33db63-8a92-4ab3-9984-e0af4db8f576'
slug: /5a33db63-8a92-4ab3-9984-e0af4db8f576
title: 'Enforce TLS SSL Hardening'
title_meta: 'Enforce TLS SSL Hardening'
keywords: ['tls','ssl','enforce','disable']
description: 'This PowerShell script enforces TLS/SSL hardening by disabling insecure protocols (SSL 3.0, TLS 1.0, TLS 1.1) and removing specified weak TLS 1.2 cipher suites to strengthen system security and align with modern security standards.'
tags: ['tls','windows']
draft: false
unlisted: false
last_update:
  date: 2026-04-10
---

## Overview

This script is designed to disable SSL 3.0, TLS 1.0, and TLS 1.1 at both server and client levels. Additionally, it disables below Cipher Suites:

- TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384
- TLS_RSA_WITH_AES_256_CBC_SHA256
- TLS_RSA_WITH_AES_256_GCM_SHA384
- TLS_RSA_WITH_AES_128_CBC_SHA256
- TLS_RSA_WITH_AES_128_GCM_SHA256
- TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256

**NOTE:** `A system reboot is required for all changes to take full effect.`

## Sample Run

`Play Button` > `Run Automation` > `Script`  

![SampleRun1](../../../static/img/docs/5a33db63-8a92-4ab3-9984-e0af4db8f576/enforce.webp)

## Automation Setup/Import

[Automation Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/scripts/enforce-tls-ssl-hardening.ps1)

## Output

- Activity Details  

## Changelog

### 2026-04-10

- Initial version of the document.