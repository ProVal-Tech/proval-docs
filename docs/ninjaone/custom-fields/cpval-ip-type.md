---
id: '9e7a6f5f-f8c7-483d-9b0a-c04dc10f7cb4'
slug: /9e7a6f5f-f8c7-483d-9b0a-c04dc10f7cb4
title: 'cPVAL IP Type'
title_meta: 'cPVAL IP Type'
keywords: ['windows','dns','IP']
description: 'Displays the DNS server address configured on the active network adapter.'
tags: ['windows','auditing','custom-fields','networking']
draft: false
unlisted: false
---

## Summary

Indicates whether the IP configuration type is Static or Dynamic (DHCP) for the active network adapter. Detected automatically from the active network adapter settings.

## Details

| Label | Field Name | Definition Scope | Type | Required | Default Value | Technician Permission | Automation Permission | API Permission | Description | Tool Tip | Footer Text | Custom Field Tab Name |
| ----- | ---- | ---------------- | ---- | -------- | ------------- | --------------------- | --------------------- | -------------- | ----------- | -------- | ----------- | ----------- |
| cPVAL IP Type | cpvalIpType | `Device` | Text | False | -- | Editable | Read/Write | Read/Write | Indicates whether the IP configuration type is Static or Dynamic (DHCP) for the active network adapter. | Shows the IP address assignment method in use. | Detected automatically from the active network adapter settings. | Network Adapters |

## Dependencies

- [Script - Get - Network Adapter details](/docs/50ff2168-46f2-4c9b-8ccc-0d3671178267)
- [Solution - Network Adapter Details](/docs/81d8fa31-72c7-4339-a107-4a41a3e489f5)

## Custom Field Creation

- [Custom Field Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/custom-fields/cpval-ip-type.toml)

## Sample Screenshot

![cpval IP Type](../../../static/img/docs/9e7a6f5f-f8c7-483d-9b0a-c04dc10f7cb4/ip-type.webp)