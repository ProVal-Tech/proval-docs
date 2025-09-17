---
id: '79b177eb-4421-48b2-b47c-9163ceebcf78'
slug: /79b177eb-4421-48b2-b47c-9163ceebcf78
title: 'Disable IPv6 Windows Server'
title_meta: 'Disable IPv6 Windows Server'
keywords: ['disable-ipv6', 'ipv6', 'security', 'network', 'network-adapter', 'device-standard']
description: 'This condition ensures that the Disable IPv6 script runs on Windows servers where the IPv6 protocol is active on any network adapter, and the disabling mechanism is enabled through the cPVAL Disable IPv6 custom field.'
tags: ['networking', 'security']
draft: false
unlisted: false
---

## Summary

This condition ensures that the [Disable IPv6](/docs/44ab6bd7-fe4f-4c1a-a743-9db643091d3d) script runs on Windows servers where the IPv6 protocol is active on any network adapter, and the disabling mechanism is enabled through the [cPVAL Disable IPv6](/docs/060ad5d8-ee1d-4ee2-a92d-7dbc14121bc6) custom field.

## Details

**Name:** `Disable IPv6`  
**Description:** `This condition ensures that the Disable IPv6 script runs on Windows servers where the IPv6 protocol is active on any network adapter, and the disabling mechanism is enabled through the cPVAL Disable IPv6 custom field.`  
**Recommended Agent Policies:** `Windows Server [Default]`

## Dependencies

- [Custom Field - cPVAL Disable IPv6](/docs/060ad5d8-ee1d-4ee2-a92d-7dbc14121bc6)
- [Automation - Get IPv6 Enabled Adapters](/docs/eace3666-d7f3-41f5-a819-df7056a94e5f)
- [Automation - Disable IPv6](/docs/44ab6bd7-fe4f-4c1a-a743-9db643091d3d)
- [Solution - Disable IPv6](/docs/)
- [Solution - Device Standards](/docs/)

## Compound Condition Creation

[Compound Condition Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/compound-conditions/disable-ipv6-windows-server.toml)
