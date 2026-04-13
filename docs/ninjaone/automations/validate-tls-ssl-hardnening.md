---
id: 'f4505cf9-915f-464f-ab45-95f9eaea7a8d'
slug: /f4505cf9-915f-464f-ab45-95f9eaea7a8d
title: 'Validate TLS SSL Hardening'
title_meta: 'Validate TLS SSL Hardening'
keywords: ['tls','ssl','validate','disable']
description: 'This script validates whether insecure SSL/TLS protocols and specified weak TLS 1.2 cipher suites have been successfully disabled on the target system.'
tags: ['tls','windows']
draft: false
unlisted: false
last_update:
  date: 2026-04-10
---

## Overview

This script is designed to validate if SSL 3.0, TLS 1.0, and TLS 1.1 are disabled at both the server and client levels. Additionally, it checks if below cipher suites are disabled:

- TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384
- TLS_RSA_WITH_AES_256_CBC_SHA256
- TLS_RSA_WITH_AES_256_GCM_SHA384
- TLS_RSA_WITH_AES_128_CBC_SHA256
- TLS_RSA_WITH_AES_128_GCM_SHA256
- TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256

## Sample Run

`Play Button` > `Run Automation` > `Script`  

![SampleRun1](../../../static/img/docs/f4505cf9-915f-464f-ab45-95f9eaea7a8d/validate.webp)

## Automation Setup/Import

[Automation Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/scripts/validate-tls-ssl-hardening.ps1)

## Output

- Activity Details  

## Changelog

### 2026-04-10

- Initial version of the document.