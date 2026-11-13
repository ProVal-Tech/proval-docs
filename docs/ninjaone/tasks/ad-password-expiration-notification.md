---
id: '8f778daf-45e8-476a-bd0d-d61928e84987'
slug: /8f778daf-45e8-476a-bd0d-d61928e84987
title: 'AD Password Expiration Notification'
title_meta: 'AD Password Expiration Notification'
keywords: ['access-management', user-management', 'active-directory', 'ad', 'password-expiration', 'notification']
description: 'This task is scheduled to run on the Windows Server Domain Controller (specifically to DC with Infrastructure role) to perform the AD user expiration alerting.'
tags: ['active-directory', 'access-management']
draft: false
unlisted: false
last_update:
  date: 2026-11-09
---

## Summary

This task is scheduled to run on the Windows Server Domain Controller (specifically to DC with Infrastructure role) to perform the AD user expiration alerting.

## Dependencies

- [Solution - AD Password Expiration Notification](/docs/d4cea30e-2724-4a28-870e-91eb349ad028)

## Details

| Name       | Description | Allow Groups | Repeats | Recur every | Start At | Ends | Targets | Automations |
| ---------- | ----------- | ------------ | ------- | ----------- | -------- | ---- | ------- | ----------- |
| AD Password Expiration Notification | This task is scheduled to run on the Windows Server Domain Controller (specifically to DC with Infrastructure role) to perform the AD user expiration alerting. | Yes | Daily | 1 day | 11/10/2026 06:00 AM | Never | Is Primary Domain Controller (built-in group) | AD - Password Expiration Notification |

## Task Creation

[Task Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/tasks/ad-password-expiration-notification.toml)

## Changelog

### 2026-11-09

- Initial version of the document