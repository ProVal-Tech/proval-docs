---
id: '54cb9acb-d11d-4a88-a0ca-92032b46fe23'
slug: /54cb9acb-d11d-4a88-a0ca-92032b46fe23
title: 'Domain Admin Account LockOut'
title_meta: 'Domain Admin Account LockOut'
keywords:  ['domain','admin','account','lockout']
description: 'This script monitors the Security log for recent account lockouts, checks if any Domain Admin accounts are affected, outputs detailed info about the locked accounts, and fails immediately if any Domain Admin is locked out.'
tags: ['domain','active-directory']
draft: false
unlisted: false
---

## Overview
This script monitors the Security log for recent account lockouts (Event ID 4740), checks if any Domain Admin accounts are affected, outputs detailed info about the locked accounts, if any Domain Admin is locked out in last 15 minutes. This retrieves and outputs detailed information including the username, last login time, lockout time, endpoint, and domain.

**NOTE:** This script has to be executed against Infrastructure masters only.

## Sample Run

`Play Button` > `Run Automation` > `Script`  

![SampleRun1](../../../static/img/docs/54cb9acb-d11d-4a88-a0ca-92032b46fe23/image1.webp)

Schedule this script against infrastructure master using the [Condition](/docs/588b31d4-04a3-4b39-af8c-6c1f24da0710) to generate automatic tickets on domain account lockouts.

## Dependencies
- [Solution : Domain Admin Account LockOut](/docs/87830e26-2018-4cd1-ba7e-a66fae0aa7e6)
- [Condition : Domain Admin Account LockOut](/docs/588b31d4-04a3-4b39-af8c-6c1f24da0710)
- [Ticket Template : Domain Admin Account LockOut](/docs/4583116e-e1b9-42bc-826d-61ec2785e532)

## Automation Setup/Import

[Automation Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/scripts/domain-admin-account-lockouts.ps1)

## Output

- Activity Details 
