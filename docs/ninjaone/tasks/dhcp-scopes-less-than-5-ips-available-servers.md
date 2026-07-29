---
id: '3aaea0e7-76f1-4cfc-8e0f-8940b176c17b'
slug: /3aaea0e7-76f1-4cfc-8e0f-8940b176c17b
title: 'DHCP Scope(s) < 5 IP Addresses'
title_meta: 'DHCP Scope(s) < 5 IP Addresses'
keywords: ['dhcp', 'monitor', 'ip', 'addresses', 'network', 'alert', 'server']
description: 'This task is used to run the script DHCP Scopes less than 5 IP Addresses on windows Servers'
tags: ['networking', 'ticketing', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-07-28
---

## Summary

This task is used to run the [Automation - DHCP Scope(s) < 5 IP Addresses](/docs/f36ee848-8f7a-48e1-8cfa-e5407a35b6e8) on windows Servers.

## Dependencies

- [Automation - DHCP Scope(s) < 5 IP Addresses](/docs/f36ee848-8f7a-48e1-8cfa-e5407a35b6e8)
- [Solution - DHCP Scope(s) < 5 IP Addresses](/docs/25ae26d7-19ef-4df6-8ea0-a179b5599dc28)

## Details

| Name | Description | Allow Groups | Repeats | Recur every | Start At | Ends | Targets | Automations |
| ---------- | ----------- | ------------ | ------- | ----------- | -------- | ---- | ------- | ----------- |
| DHCP Scope(s) < 5 IP Addresses | It detects the DHCP servers having any active DHCP scope with less than 5 IP addresses available. | `Yes` | `Daily` | `Every 1 day` | `07/28/2026` | `Never` | `cPVAL Windows Servers` | DHCP Scope(s) < 5 IP Addresses Available |

## Task Creation

[Task Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/tasks/dhcp-scopes-less-than-5-ips-available-servers.toml)

## Changelog

### 2025-07-28

- Initial version of the document
