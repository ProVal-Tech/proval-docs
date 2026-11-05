---
id: 'e2669c99-0a79-4456-9923-b63345bf9a3c'
slug: /e2669c99-0a79-4456-9923-b63345bf9a3c
title: 'Lock Stolen Systems [Macintosh]'
title_meta: 'Lock Stolen Systems [Macintosh]'
keywords: ['lock', 'stolen', 'lost', 'compound condition', 'macintosh']
description: 'Runs the Lock Stolen System [Macintosh] automation on Macs marked as stolen and opens a ConnectWise Manage ticket when they come online.'
tags: ['monitoring', 'data-theft', 'ticketing', 'macos']
draft: false
unlisted: false
last_update:
  date: 2026-11-05
---

## Summary

This compound condition runs the [Lock Stolen System [Macintosh]](/docs/08b38e83-0836-49de-b185-dbfc97a0f249) automation on Macs that have [cPVAL Mark System as Stolen](/docs/20a99ff3-a63d-4f73-bd48-3bb8d66626e6) checked. It runs once the device has been online for 10 minutes, and again every 30 minutes while it stays online and marked as stolen. It also opens a ConnectWise Manage ticket through the [Lock Stolen System](/docs/be59a0a6-33da-4ef2-8baf-848d47ba2ac0) ticket template, so your team knows the device is back online.

## Details

- **Name:** `Lock Stolen Systems [Macintosh]`
- **Description:** `Runs the Lock Stolen System [Macintosh] automation on Macs marked as stolen in cPVAL Mark System as Stolen.`
- **Recommended Agent Policies:** `Mac Policy [Default]`

## Dependencies

- [Custom Field: cPVAL Mark System as Stolen](/docs/20a99ff3-a63d-4f73-bd48-3bb8d66626e6)
- [Automation: Lock Stolen System [Macintosh]](/docs/08b38e83-0836-49de-b185-dbfc97a0f249)
- [Ticket Template: Lock Stolen System](/docs/be59a0a6-33da-4ef2-8baf-848d47ba2ac0)
- [Solution: Lock Stolen System](/docs/13b4df99-df9b-4a57-bc0f-8675c68be028)

## Compound Condition Creation

- [Compound Condition Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/compound-conditions/lock-stolen-systems-macintosh.toml)

## Changelog

### 2026-11-05

- Initial version of the document
