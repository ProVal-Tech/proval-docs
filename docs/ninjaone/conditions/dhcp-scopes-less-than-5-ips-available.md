---
id: 'd2385bd4-5444-43cd-98e1-bffc97f247df'
slug: /d2385bd4-5444-43cd-98e1-bffc97f247df
title: 'DHCP Scope(s) < 5 IP Addresses'
title_meta: 'DHCP Scope(s) < 5 IP Addresses'
keywords: ['dhcp', 'monitor', 'ip', 'addresses', 'network', 'alert', 'server']
description: 'This compound condition validates the script evalution result and then create ticket if the error occured.'
tags: ['networking', 'ticketing', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-07-28
---

## Summary

The condition runs the [Automation - DHCP Scope(s) < 5 IP Addresses](/docs/f36ee848-8f7a-48e1-8cfa-e5407a35b6e8) automation once per hour and generates a ticket with the script’s results if any monitored condition met.

## Details

**Name:** `DHCP Scope(s) < 5 IP Addresses`
**Description:**  `This compound condition validates the script evalution result and then create ticket if the error occured.`
**Recommended Agent Policies:**  `Windows Server Policy`

## Dependencies

- [Automation - DHCP Scope(s) < 5 IP Addresses](/docs/f36ee848-8f7a-48e1-8cfa-e5407a35b6e8)
- [CW Manage - DHCP Scopes IP Alerts](/docs/127f62ec-19d2-4ee4-8605-d9cbf3d8aad8)
- [Solution - DHCP Scope(s) < 5 IP Addresses](/docs/25ae26d7-19ef-4df6-8ea0-a179b5599dc28)

## Condition Creation

[Condition Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/conditions/dhcp-scopes-less-than-5-ips-available.toml)

## Changelog

### 2026-07-28

- Initial version of the document
