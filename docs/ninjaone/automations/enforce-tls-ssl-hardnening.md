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
  date: 2026-06-15
---

## Overview

Enforces Windows TLS/SSL security hardening by disabling legacy protocols (SSL 3.0, TLS 1.0, and TLS 1.1), enabling supported modern TLS versions (TLS 1.2 and TLS 1.3), configuring .NET Framework strong cryptography settings to help maintain application compatibility when legacy protocols are disabled, removing weak TLS cipher suites, and optionally initiating a reboot or enabling the `Reboot Pending Prompt` solution to notify users that a restart is required for the changes to take effect. It disables below Cipher Suites:

- TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384
- TLS_RSA_WITH_AES_256_CBC_SHA256
- TLS_RSA_WITH_AES_256_GCM_SHA384
- TLS_RSA_WITH_AES_128_CBC_SHA256
- TLS_RSA_WITH_AES_128_GCM_SHA256
- TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256

**NOTE:** `A system reboot is required for all changes to take full effect. Either use 'Force Reboot' parameter to immediately restart the machine after hardening so the TLS/SSL changes are fully applied. Or enable  'cPVAL Enable Reboot Prompts' custom field to send user prompts for Reboot. 'Reboot Pending Prompt' solution must be enabled in the environment to use this feature.`

## Sample Run

`Play Button` > `Run Automation` > `Script`  

![SampleRun1](../../../static/img/docs/5a33db63-8a92-4ab3-9984-e0af4db8f576/enforce.webp)

## Dependencies

- [Solution - TLS/SSL Security Hardening](/docs/5e391e0f-088e-41be-8b6c-306e02a2cadb)
- [Solution - Reboot Pending Prompt](/docs/d7758fa4-9fcc-4259-a7a5-0ca65dda10eb)

## Parameters

| Name | Example | Accepted Values | Required | Default | Type | Description |
| ---- | ------- | --------------- | -------- | ------- | ---- | ----------- |
|Force Reboot| - | - | False | Not selected | Check-box |Select it to immediately reboot the machine after applying the TLS Hardening.|

## Automation Setup/Import

[Automation Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/scripts/enforce-tls-ssl-hardening.ps1)

## Output

- Activity Details  

## Changelog

### 2026-06-15

- Updated the script to configure .NET Framework strong cryptography settings, helping maintain application compatibility when legacy protocols are disabled and modern TLS versions are enforced.
- Added a Force Reboot parameter that can immediately restart the machine after hardening so the TLS/SSL changes are fully applied.
- Added an option for reboot prompts through the `cPVAL Enable Reboot Prompts` custom field. When enabled, the script sets `cPVAL Pending Reboot` to trigger user notifications. This feature requires the `Reboot Pending Prompt` solution to be enabled in the environment.


### 2026-04-10

- Initial version of the document.