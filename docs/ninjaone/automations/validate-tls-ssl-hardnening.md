---
id: 'f4505cf9-915f-464f-ab45-95f9eaea7a8d'
slug: /f4505cf9-915f-464f-ab45-95f9eaea7a8d
title: 'Validate TLS SSL Hardening'
title_meta: 'Validate TLS SSL Hardening'
keywords: ['tls','ssl','validate','disable']
description: 'This PowerShell script validates whether insecure SSL/TLS protocols and specified weak TLS 1.2 cipher suites have been successfully disabled on the target system. It provides a clear PASS/FAIL status for each item without making any configuration changes.'
tags: ['tls','windows']
draft: false
unlisted: false
last_update:
  date: 2026-04-10
---

## Overview

This script is designed for post-implementation validation of TLS/SSL hardening. It performs the following checks:

**Protocol Validation:**  Verifies that legacy protocols SSL 3.0, TLS 1.0, and TLS 1.1 are disabled at both the server and client levels by checking the corresponding registry settings under SCHANNEL.
    
**Cipher Suite Validation:** Checks whether the specified weak TLS 1.2 cipher suites are no longer active on the system using the Get-TlsCipherSuite cmdlet. A fallback mechanism is included to support different Windows versions.
    
**Output Format:** Displays results in a simple PASS / FAIL / INFO format for each protocol and cipher, making it easy to review in RMM tools such as NinjaRMM.
   
**Non-Intrusive Operation:** This is a read-only script and does not modify any system settings.

## Sample Run

`Play Button` > `Run Automation` > `Script`  
![SampleRun1](../../../static/img/docs/f4505cf9-915f-464f-ab45-95f9eaea7a8d/validate.webp)

## Automation Setup/Import

[Automation Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/scripts/validate-tls-ssl-hardening.ps1)

## Output

- Activity Details  

## Changelog

*** 2026-04-10

- Initial version of the document.