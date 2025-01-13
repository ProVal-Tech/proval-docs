---
id: 'cwa-tls-1-1-detection'
title: 'TLS 1.1 Detection Role'
title_meta: 'TLS 1.1 Detection Role'
keywords: ['tls', 'detection', 'windows', 'security']
description: 'This document outlines a role that detects machines with TLS 1.1 enabled, providing necessary settings and detection strings for system administrators.'
tags: ['security', 'windows', 'configuration']
draft: false
unlisted: false
---
## Summary

This role detects the machines on which TLS 1.1 is enabled.

## Settings

| Detection String                                                                 | Comparator | Result | Applicable OS |
|----------------------------------------------------------------------------------|------------|--------|----------------|
| {%-HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.1\Client:Enabled-%} | Equals     | 1      | Windows        |



