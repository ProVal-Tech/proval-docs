---
id: 'c76f5013-02a4-42a2-a8aa-ba4486309b55'
slug: /c76f5013-02a4-42a2-a8aa-ba4486309b55
title: 'Install WatchGuard SSO Client 12.7.0'
title_meta: 'Install WatchGuard SSO Client 12.7.0'
keywords: ['watchguard', 'sso', 'application', 'installation']
description: 'This compound condition is applied at the Windows Workstation Policy to run the WatchGuard SSO client installation every 2 hours where the custom field (cpvalNeedsWatchGuardSso) is set to Windows or Windows Workstation, and the software (WatchGuard Authentication Client) is missing.'
tags: ['application', 'installation']
draft: false
unlisted: false
last_update:
  date: 2026-10-05
---

## Summary

This compound condition is applied at the Windows Workstation Policy to run the WatchGuard SSO client installation every 2 hours where the custom field (cpvalNeedsWatchGuardSso) is set to Windows or Windows Workstation, and the software (WatchGuard Authentication Client) is missing.

## Details

- **Name:*Install WatchGuard SSO Client 12.7.0* 
- **Description:*This compound condition is applied at the Windows Workstation Policy to run the WatchGuard SSO client installation every 2 hours where the custom field (cpvalNeedsWatchGuardSso) is set to Windows or Windows Workstation, and the software (WatchGuard Authentication Client) is missing.* 
- **Recommended Agent Policies:*Windows Workstation Policy*

## Dependencies

- [Solution - Install WatchGuard Authentication Client 12.7.0](/docs/27fd43e4-e9f8-4e02-a2ae-1a7b0e2b12f7)

## Compound Condition Creation 

- [Compound Condition Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/compound-conditions/install-watchguard-sso-client-workstation.toml)


## Changelog

### 2026-10-05

- Initial version of the document
