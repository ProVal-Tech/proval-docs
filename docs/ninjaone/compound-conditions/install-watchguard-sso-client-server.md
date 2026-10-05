---
id: '0d5815b7-b9d3-4a74-b76a-ab5ab9deca2f'
slug: /0d5815b7-b9d3-4a74-b76a-ab5ab9deca2f
title: 'Install WatchGuard SSO Client 12.7.0'
title_meta: 'Install WatchGuard SSO Client 12.7.0'
keywords: ['watchguard', 'sso', 'application', 'installation']
description: 'This compound condition is applied at the Windows Server Policy to run the WatchGuard SSO client installation every 2 hours where the custom field (cpvalNeedsWatchGuardSso) is checked, and the software (WatchGuard Authentication Client (12.7.0)) is missing.'
tags: ['application', 'installation']
draft: false
unlisted: false
last_update:
  date: 2026-10-05
---

## Summary

This compound condition is applied at the Windows Server Policy to run the WatchGuard SSO client installation every 2 hours where the custom field (cpvalNeedsWatchGuardSso) is checked, and the software (WatchGuard Authentication Client (12.7.0)) is missing.

## Details

- **Name:*Install WatchGuard SSO Client 12.7.0* 
- **Description:*This compound condition is applied at the Windows Server Policy to run the WatchGuard SSO client installation every 2 hours where the custom field (cpvalNeedsWatchGuardSso) is checked, and the software (WatchGuard Authentication Client (12.7.0)) is missing.* 
- **Recommended Agent Policies:*Windows Server Policy*

## Dependencies

- [Solution - Install WatchGuard Authentication Client 12.7.0](/docs/27fd43e4-e9f8-4e02-a2ae-1a7b0e2b12f7)

## Compound Condition Creation 

- [Compound Condition Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/compound-conditions/install-watchguard-sso-client-server.toml)


## Changelog

### 2026-10-05

- Initial version of the document
