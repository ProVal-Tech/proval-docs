---
id: 'bfeadced-7753-468a-9119-b2b7f4499cf2'
slug: /bfeadced-7753-468a-9119-b2b7f4499cf2
title: 'IPv6 Enabled'
title_meta: 'IPv6 Enabled'
keywords: ['ipv6', 'network', 'adapter', 'windows', 'detection']
description: 'This document outlines the steps to identify machines where IPv6 is enabled on any network adapter. It includes a detection string, comparator, and applicable operating systems for effective implementation.'
tags: ['networking', 'security', 'windows']
draft: false
unlisted: false
---

## Summary

The purpose of this document is to identify machines where IPv6 is enabled on any network adapter.

## Settings

| Detection String                                                                                                          | Comparator | Result | Applicable OS |
|---------------------------------------------------------------------------------------------------------------------------|------------|--------|----------------|
| `%{@C:/Windows/System32/WindowsPowerShell/v1.0/powershell.exe -ExecutionPolicy Bypass -Command "(Get-NetAdapterBinding -Name '*' -ComponentID 'ms_tcpip6').enabled"@%}` | Contains   | True   | Windows        |

## Implementation

Use the following document as a guide to implement this role:  
[Create a PowerShell-based Role](/docs/3c7cb0d9-ed0a-482f-8cfe-7072c87fd990)