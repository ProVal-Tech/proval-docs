---
id: '599af337-988a-427d-a675-7547e8530596'
title: 'TLS 1.2 Enabled'
title_meta: 'TLS 1.2 Enabled'
keywords: ['tls', 'endpoint', 'security', 'version', 'check']
description: 'This document provides a method to determine if the endpoint is using TLS version 1.2. It includes details on how to access the relevant data in the dataview under @Security - TLS Status, along with the necessary detection string settings for verification.'
tags: ['security', 'windows']
draft: false
unlisted: false
---

## Summary

This document will determine if the endpoint is using TLS version 1.2. This data is visible in the dataview under @Security - TLS Status.

## Settings

| Detection String                                                                 | Comparator | Result | Applicable OS |
|----------------------------------------------------------------------------------|------------|--------|----------------|
| `{%-HKLM/SYSTEM/CurrentControlSet/Control/SecurityProviders/SCHANNEL/Protocols/TLS 1.2/Client:Enabled-%}` | Equals     | 1      | Windows OS     |



