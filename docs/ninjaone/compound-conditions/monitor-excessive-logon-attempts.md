---
id: 'e15874f0-0d01-409e-9131-b84494dadf29'
slug: /e15874f0-0d01-409e-9131-b84494dadf29
title: 'Monitor - Excessive Logon Attempts'
title_meta: 'Monitor - Excessive Logon Attempts'
keywords: ['excessive-logon-attempts', 'excessive', 'logon', 'bruteforce', 'brute', 'failed-logon', '4625', 'password-spraying', 'domain-controller']
description: 'Runs Excessive Logon Attempts every 4 hours on domain controllers holding the Infrastructure Master role and creates a ConnectWise Manage ticket when the failed logon attempts recorded since the last run reach the threshold.'
tags: ['security', 'accounts', 'eventlogs', 'active-directory']
draft: false
unlisted: false
last_update:
  date: 2026-11-11
---

## Summary

Runs [Excessive Logon Attempts](/docs/3b52c821-6c63-4da6-87e8-8bd5c96e78de) every 4 hours on domain controllers whose [cPVAL Roles Detected](/docs/e9ec73dd-98b1-4436-a027-4ee8906f7cba) field contains `Infrastructure Master`, unless [cPVAL Enable Excessive Logon Detection](/docs/57a80bea-ffac-4925-bc95-c51bf6db01f1) is set to `Disable`. The script counts the failed logon attempts (Security event ID 4625) recorded since its last run, which can indicate a brute-force or password-spraying attack.

The script parameters are left empty in the compound condition, so the threshold and exclusions come from the `cPVAL Excessive Logon` custom fields. These can be set at the organization, location or device level.

## Details

- **Name:** `Monitor - Excessive Logon Attempts`
- **Description:** `Runs Excessive Logon Attempts every 4 hours on domain controllers holding the Infrastructure Master role, unless cPVAL Enable Excessive Logon Detection is Disable, and creates a ConnectWise Manage ticket when failed logons reach the threshold.`
- **Recommended Agent Policies:** `Windows Server Policy`

## Dependencies

- [Automation - Excessive Logon Attempts](/docs/3b52c821-6c63-4da6-87e8-8bd5c96e78de)
- [CW Manage Ticket Template - Excessive Logon Failures](/docs/87e8cc64-8a82-4d83-9a91-dcd82c63ffea)
- [Custom Field - cPVAL Roles Detected](/docs/e9ec73dd-98b1-4436-a027-4ee8906f7cba)
- [Custom Field - cPVAL Enable Excessive Logon Detection](/docs/57a80bea-ffac-4925-bc95-c51bf6db01f1)
- [Solution - Excessive Logon Attempts](/docs/e99ec890-ae05-4ad5-bdbc-6b0599be67e9)

## Compound Condition Creation

- [Compound Condition Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/compound-conditions/monitor-excessive-logon-attempts.toml)

## Changelog

### 2026-11-11

- Initial version of the document
