---
id: '705b400b-28fc-4c01-95a6-edbf43960122'
slug: /705b400b-28fc-4c01-95a6-edbf43960122
title: 'Lock Stolen Systems [Windows]'
title_meta: 'Lock Stolen Systems [Windows]'
keywords: ['lock', 'stolen', 'lost', 'compound condition', 'windows']
description: 'Runs the Lock Stolen System [Windows] automation on Windows computers marked as stolen and opens a ConnectWise Manage ticket when they come online.'
tags: ['monitoring', 'data-theft', 'ticketing', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-11-12
---

## Summary

This compound condition runs the [Lock Stolen System [Windows]](/docs/0f78be64-557a-4c0e-b7cf-e2ba41e71374) automation on Windows computers that have [cPVAL Mark System as Stolen](/docs/20a99ff3-a63d-4f73-bd48-3bb8d66626e6) checked. It runs once the device has been online for 10 minutes, and again every 30 minutes while it stays online and marked as stolen. It also opens a ConnectWise Manage ticket through the [Lock Stolen System](/docs/be59a0a6-33da-4ef2-8baf-848d47ba2ac0) ticket template, so your team knows the device is back online. Each later run is added to the same ticket, which stays open until your team closes it.

## Details

- **Name:** `Lock Stolen Systems [Windows]`
- **Description:** `Runs the Lock Stolen System [Windows] automation on Windows computers marked as stolen in cPVAL Mark System as Stolen.`
- **Recommended Agent Policies:** `Windows Workstation Policy [Default]`

## Dependencies

- [Custom Field: cPVAL Mark System as Stolen](/docs/20a99ff3-a63d-4f73-bd48-3bb8d66626e6)
- [Automation: Lock Stolen System [Windows]](/docs/0f78be64-557a-4c0e-b7cf-e2ba41e71374)
- [Ticket Template: Lock Stolen System](/docs/be59a0a6-33da-4ef2-8baf-848d47ba2ac0)
- [Solution: Lock Stolen System](/docs/13b4df99-df9b-4a57-bc0f-8675c68be028)

## Compound Condition Creation

- [Compound Condition Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/compound-conditions/lock-stolen-systems-windows.toml)

## Changelog

### 2026-11-12

- Renamed the compound condition to Lock Stolen Systems [Windows] and the automation it runs to Lock Stolen System [Windows].
- Rewrote the document.

### 2026-02-10

- Initial version of the document
