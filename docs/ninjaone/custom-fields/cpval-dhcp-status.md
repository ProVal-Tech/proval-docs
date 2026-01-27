---
id: 'ce67cff7-8ff2-42a6-8b05-c9dc22bd3392'
slug: /ce67cff7-8ff2-42a6-8b05-c9dc22bd3392
title: 'cPVAL DHCP Status'
title_meta: 'cPVAL DHCP Status'
keywords: ['windows','dhcp','network']
description: 'Displays whether DHCP is enabled or disabled on the active network adapter.'
tags: ['windows','auditing','custom-fields','networking']
draft: false
unlisted: false
---

## Summary

Displays whether DHCP is enabled or disabled on the active network adapter. Indicates the DHCP configuration status for the active network interface.

## Details

| Label | Field Name | Definition Scope | Type | Required | Default Value | Technician Permission | Automation Permission | API Permission | Description | Tool Tip | Footer Text | Custom Field Tab Name |
| ----- | ---- | ---------------- | ---- | -------- | ------------- | --------------------- | --------------------- | -------------- | ----------- | -------- | ----------- | ----------- |
| cPVAL DHCP Status | cpvalDhcpStatus | `Device` | Text | False | -- | Editable | Read/Write | Read/Write | Displays whether DHCP is enabled or disabled on the active network adapter. | Indicates the DHCP configuration status for the active network interface. | Collected automatically from the system’s active network adapter configuration. | Network Adapters |

## Dependencies

- [Script - Get - Network Adapter details](/docs/50ff2168-46f2-4c9b-8ccc-0d3671178267)
- [Solution - Network Adapter Details](/docs/81d8fa31-72c7-4339-a107-4a41a3e489f5)

## Custom Field Creation

- [Custom Field Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/custom-fields/cpval-dhcp-status.toml)

## Sample Screenshot

![cpval DHCP Server](../../../static/img/docs/ce67cff7-8ff2-42a6-8b05-c9dc22bd3392/dhcp.webp)  
