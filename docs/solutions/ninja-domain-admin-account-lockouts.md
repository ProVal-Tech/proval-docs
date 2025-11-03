---
id: '87830e26-2018-4cd1-ba7e-a66fae0aa7e6'
slug: /87830e26-2018-4cd1-ba7e-a66fae0aa7e6
title: 'Domain Admin Account LockOut'
title_meta: 'Domain Admin Account LockOut'
keywords: ['domain','admin','account','lockout']
description: 'The purpose of this solution is to monitor the recent locked domain admin accounts and create tickets as soon as a locked account is detected. This solution has to be executed against Infrastructure masters only'
tags: ['domain','active-directory']
draft: false
unlisted: false
---

## Purpose

The purpose of this solution is to monitor the recent locked domain admin accounts and create tickets as soon as a locked account is detected. This solution has to be executed against Infrastructure masters only.

## Associated Content

| Content                                             | Type                                                      | Function                                               |
|-----------------------------------------------------|-----------------------------------------------------------|--------------------------------------------------------|
| [Domain Admin Account LockOut](/docs/54cb9acb-d11d-4a88-a0ca-92032b46fe23)   | Script |   Monitors the Security log for recent account lockouts |
| [Domain Admin Account LockOut](/docs/4583116e-e1b9-42bc-826d-61ec2785e532)  | Ticket Template |  Configures how a ConnectWise Manage ticket will be generated for Domain account lockouts |
| [Domain Admin Account LockOut](/docs/588b31d4-04a3-4b39-af8c-6c1f24da0710)  | Condition |  Runs the [Domain Admin Account LockOut](/docs/54cb9acb-d11d-4a88-a0ca-92032b46fe23) automation every 15 minutes on Infrastructure masters |

## Implementation

- Create the [Script : Domain Admin Account LockOut](/docs/54cb9acb-d11d-4a88-a0ca-92032b46fe23) using the implementation instruction provided in the document.
- Create the  [Ticket Template : Domain Admin Account LockOut](/docs/4583116e-e1b9-42bc-826d-61ec2785e532) using the implementation instruction provided in the document.
- Create the [Condition : Domain Admin Account LockOut](/docs/588b31d4-04a3-4b39-af8c-6c1f24da0710) using the implementation instruction provided in the document.
