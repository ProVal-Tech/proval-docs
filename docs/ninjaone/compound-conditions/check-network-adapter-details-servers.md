---
id: '3c1b4d06-33e8-4e0c-8f2c-3bc93ebd36ae'
slug: /3c1b4d06-33e8-4e0c-8f2c-3bc93ebd36ae
title: 'Check Network Adapter Details - Servers'
title_meta: 'Check Network Adapter Details - Servers'
keywords: ['windows','dhcp','network']
description: 'This compound condition is used to facilitate the automated execution of the script to update the custom field on Windows servers. It ensures the custom field is updated only on eligible systems.'
tags: ['windows','auditing','networking']
draft: false
unlisted: false
---

## Summary

This compound condition is used to facilitate the automated execution of the script to update the custom field on Windows Servers. It ensures the custom field is updated only on eligible systems.

## Details

- **Name:** `Check Network Adapter Details - Servers`
- **Description:** `This compound condition is Used to automate and run the network adapter details script to update the custom field on eligible windows devices.`
- **Recommended Agent Policies:** `Windows Servers Policy`

## Dependencies

- [Group - cPVAL Network Adapter Details](/docs/c73e004e-6a9c-40e4-8e74-babb4b729256)
- [cPVAL DHCP Status](/docs/ce67cff7-8ff2-42a6-8b05-c9dc22bd3392)
- [cPVAL DNS Server](/docs/050b6b01-ec88-4c11-8e37-f5f34df0daa3)
- [cPVAL IP Type](/docs/9e7a6f5f-f8c7-483d-9b0a-c04dc10f7cb4)
- [cPVAL Check Network Adapter Details](/docs/fb89116d-060f-4787-95af-efdd731765d2)
- [Automation - Get - Network Adapter Details](/docs/50ff2168-46f2-4c9b-8ccc-0d3671178267)
- [Solution - Network Adapter Details](/docs/81d8fa31-72c7-4339-a107-4a41a3e489f5)

## Compound Condition Creation

- [Compound Condition Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/compound-conditions/check-network-adapter-details-servers.toml)
