---
id: 'cwa-secure-boot-detection'
title: 'Secure Boot Detection for Agents'
title_meta: 'Secure Boot Detection for Agents'
keywords: ['secure', 'boot', 'detection', 'agents', 'windows']
description: 'This document provides an overview of how to detect agents with Secure Boot enabled, including the detection string used and the expected result for applicable operating systems.'
tags: ['security', 'windows', 'configuration']
draft: false
unlisted: false
---
## Summary

This role is detected on agents that have Secure Boot enabled.

## Settings

Equals

| Detection String                                                                 | Comparator                                   | Result | Applicable OS |
|----------------------------------------------------------------------------------|----------------------------------------------|--------|---------------|
| {@%C:\\WINDOWS\\system32\\WindowsPowerShell\\v1.0\\powershell.exe -command "Confirm-SecureBootUEFI"@%} | The expected result of the Detection String | True   | Windows       |



