---
id: '27fd43e4-e9f8-4e02-a2ae-1a7b0e2b12f7'
slug: /27fd43e4-e9f8-4e02-a2ae-1a7b0e2b12f7
title: 'Install WatchGuard Authentication Client'
title_meta: 'Install WatchGuard Authentication Client'
keywords: ['watchguard', 'sso', 'application', 'installation']
description: 'This solution is built to deploy the WatchGuard Authentication Client on the Windows machines.'
tags: ['application', 'installation']
draft: false
unlisted: false
last_update:
  date: 2026-10-05
---

## Purpose

This solution is built to deploy the WatchGuard Authentication Client on the Windows machines.

## Associated Content

| Content                                             | Type                                                      | Function                                               |
|-----------------------------------------------------|-----------------------------------------------------------|--------------------------------------------------------|
| [Watchguard SSO Client Install](/docs/f5146456-a17a-4e73-9826-4922a24de010)      | Script | Installs WatchGuard Authentication Client (SSO Client) 12.7.0 on endpoints. |
| [cPVAL Needs WatchGuard SSO)](/docs/8365bf85-26a4-45cf-bc52-a3b2984094c9)      | Custom field | This custom field needed to be selected for the installation of the WatchGuard SSO Client on Windows workstations or Windows Server. |
| [Install WatchGuard SSO Client - Workstation](/docs/c76f5013-02a4-42a2-a8aa-ba4486309b55)      | Compound Condition | This compound condition is applied at the Windows Workstation Policy to run the WatchGuard SSO client installation every 2 hours where the custom field (cpvalNeedsWatchGuardSso) is set to Windows or Windows Workstation, and the software (WatchGuard Authentication Client) is missing. |
| [Install WatchGuard SSO Client - Server](/docs/0d5815b7-b9d3-4a74-b76a-ab5ab9deca2f)      | Compound Condition | This compound condition is applied at the Windows Server Policy to run the WatchGuard SSO client installation every 2 hours where the custom field (cpvalNeedsWatchGuardSso) is set to Windows or Windows Server, and the software (WatchGuard Authentication Client) is missing. |

## Implementation

- Create the custom field
- Create the script
- Create the compound conditions

## Changelog

### 2026-10-05

- Initial version of the document