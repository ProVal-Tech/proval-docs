---
id: '9eaa6337-abd3-42ee-afc3-556723ce25da'
slug: /9eaa6337-abd3-42ee-afc3-556723ce25da
title: 'TLS 1.0 Enabled'
title_meta: 'TLS 1.0 Enabled'
keywords: ['tls', 'agent', 'security', 'windows']
description: 'This document outlines how to check if an agent has TLS 1.0 enabled, including the necessary detection string and applicable operating systems. It provides a clear overview of the settings required for proper verification.'
tags: ['security', 'windows']
draft: false
unlisted: false
---

## Summary

This document describes how to check if an agent has TLS 1.0 enabled.

## Settings

| Detection String                                                                 | Comparator | Result | Applicable OS |
|----------------------------------------------------------------------------------|------------|--------|----------------|
| \{%-HKLM/SYSTEM/CurrentControlSet/Control/SecurityProviders/SCHANNEL/Protocols/TLS 1.0/Client:Enabled-%} | Equals     | 1      | Windows        |

