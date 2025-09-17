---
id: '060ad5d8-ee1d-4ee2-a92d-7dbc14121bc6'
slug: /060ad5d8-ee1d-4ee2-a92d-7dbc14121bc6
title: 'cPVAL Disable IPv6'
title_meta: 'cPVAL Disable IPv6'
keywords: ['disable-ipv6', 'ipv6', 'security', 'network', 'network-adapter', 'device-standard']
description: 'This custom field controls IPv6 disablement based on the selected operating system. Choose None to opt out for the current Client, Location, or Computer.'
tags: ['networking', 'security']
draft: false
unlisted: false
---

## Summary

This custom field controls IPv6 disablement based on the selected operating system. Choose None to opt out for the current Client, Location, or Computer.

## Details

| Label | Field Name | Definition Scope | Type | Required | Default Value | Available Options | Technician Permission | Automation Permission | API Permission | Description | Tool Tip | Footer Text | Custom Field Tab Name |
| ----- | ---- | ---------------- | ---- | -------- | ------------- | --------------------- | --------------------- | -------------- | ----------- | -------- | ----------- | ----------- | ----------- |
| cPVAL Disable IPv6 | cpvalDisableIpv6 | `Organization`, `Location`, `Device` | Drop-down | False | | `None`, `Windows Workstation and Windows Server`, `Windows Workstation`, `Windows Server` | Editable | Read_Write | Read_Write | Select the operating system(s) for which IPv6 should be disabled. Choose None to exclude the Client, Location, or Computer from IPv6 disabling. | Use this dropdown to specify the target OS for disabling IPv6. Selecting None will leave IPv6 enabled for the selected entity. | This setting controls IPv6 disablement based on the selected operating system. Choose None to opt out for the current Client, Location, or Computer. | Device Standards |

## Dependencies

- [Solution - Disable IPv6](/docs/1e9dee40-965f-4b6c-a9cf-4cb45162d5ac)
- [Solution - Device Standards](/docs/a0c383d4-699a-4bb8-af7f-c2a007747182)

## Custom Field Creation

[Custom Field Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/custom-fields/cpval-disable-ipv6.toml)

## Sample Screenshot

![Image1](../../../static/img/docs/060ad5d8-ee1d-4ee2-a92d-7dbc14121bc6/image1.webp)
