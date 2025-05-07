---
id: 'd4d3bee7-87cb-4499-a152-ae70fc9f2aa6'
slug: /d4d3bee7-87cb-4499-a152-ae70fc9f2aa6
title: 'TLS 1.1 Enabled'
title_meta: 'TLS 1.1 Enabled'
keywords: ['tls', 'detection', 'windows', 'security']
description: 'This document outlines a role that detects machines with TLS 1.1 enabled, providing necessary settings and detection strings for system administrators.'
tags: ['security', 'windows']
draft: false
unlisted: false
---

## Summary

This role detects the machines on which TLS 1.1 is enabled.

## Settings

| Detection String                                                                 | Comparator | Result | Applicable OS |
|----------------------------------------------------------------------------------|------------|--------|----------------|
| \{%-HKLM/SYSTEM/CurrentControlSet/Control/SecurityProviders/SCHANNEL/Protocols/TLS 1.1/Client:Enabled-%} | Equals     | 1      | Windows        |

