---
id: '588b31d4-04a3-4b39-af8c-6c1f24da0710'
slug: /588b31d4-04a3-4b39-af8c-6c1f24da0710
title: 'Domain Admin Account LockOut'
title_meta: 'Domain Admin Account LockOut'
keywords:  ['Domain','Admin','Account','Lockout']
description: 'Runs the "Domain Admin Account LockOut" automation every 15 minutes on Infrastructure masters'
tags: ['domain','active-directory']
draft: False
unlisted: false
---

## Summary
Runs the [Domain Admin Account LockOut](/docs/54cb9acb-d11d-4a88-a0ca-92032b46fe23) automation every 15 minutes on Infrastructure masters

## Details

**Name:**  `Domain Admin Account LockOut`
**Description:**  `Runs the "Domain Admin Account LockOut" automation every 15 minutes on Infrastructure masters`
**Recommended Agent Policies:**   `Windows Server - Active Directory`

## Dependencies
[Script : Domain Admin Account LockOut](/docs/54cb9acb-d11d-4a88-a0ca-92032b46fe23)
[Ticket Template : Domain Admin Account LockOut](/docs/4583116e-e1b9-42bc-826d-61ec2785e532)

## Condition Creation

[Condition Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/conditions/domain-admin-account-lockouts.toml)
