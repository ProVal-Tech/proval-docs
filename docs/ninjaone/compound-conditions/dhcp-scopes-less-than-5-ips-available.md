---
id: 'dd4bfa5c-ab91-46f0-a0aa-9ebb83175e09'
slug: /dd4bfa5c-ab91-46f0-a0aa-9ebb83175e09
title: 'DHCP Scope Alert'
title_meta: 'DHCP Scope Alert'
keywords: ['dhcp', 'monitor', 'ip', 'addresses', 'network', 'alert', 'server']
description: 'This compound condition validates the script evaluation result and then create ticket if the error occurred.'
tags: ['networking', 'ticketing', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-07-28
---

## Summary

This compound condition runs the [Automation - DHCP Scope(s) < 5 IP Addresses](/docs/f36ee848-8f7a-48e1-8cfa-e5407a35b6e8) and generates a ticket with the script’s results if any monitored condition met.

## Details

- **Name:** `DHCP Scope Alert`  
- **Description:**  `This compound condition validates the script evaluation result and then create ticket if the error occurred.`
- **Recommended Agent Policies:**  `Windows Server Policy`

## Dependencies

- [Automation - Server Role Detection](/docs/5cda8c79-bcd0-4226-b5a4-db846b9b35a9)
- [Custom Field - CPVAL Roles Detected ](/docs/e9ec73dd-98b1-4436-a027-4ee8906f7cba)
- [Automation - DHCP Scope(s) < 5 IP Addresses](/docs/f36ee848-8f7a-48e1-8cfa-e5407a35b6e8)
- [CW Manage Ticket Template - DHCP Scopes IP Alerts](/docs/127f62ec-19d2-4ee4-8605-d9cbf3d8aad8)
- [Solution - DHCP Scope(s) < 5 IP Addresses](/docs/25ae26d7-19ef-4df6-8ea0-a179b5599dc28)


## Condition Creation

- [Compound Condition Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/compound-conditions/dhcp-scopes-less-than-5-ips-available.toml)

## Changelog

### 2026-07-30

- Initial version of the document
