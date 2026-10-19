---
id: '5b3e6c68-6d0a-4b1f-b58a-eba8b870b9ad'
slug: /5b3e6c68-6d0a-4b1f-b58a-eba8b870b9ad
title: 'ChkDsk - All Drives - Servers'
title_meta: 'ChkDsk - All Drives - Servers'
keywords: ['chkdsk', 'all', 'drives', 'disk-space']
description: 'This condition is used to facilitate the automated execution of the disk health check script on Windows servers. It ensures the chkdsk scan and subsequent repair actions are triggered only on eligible Windows systems.'
tags: ['disk', 'diskspace', 'storage', 'auditing', 'report', 'custom-fields']
draft: false
unlisted: false
last_update:
  date: 2026-10-19
---

## Summary

This condition is used to facilitate the automated execution of the disk health check script on Windows Servers. It ensures the chkdsk scan and subsequent repair actions are triggered only on eligible Windows systems.

## Details

- **Name:** ChkDsk - All Drives - Servers
- **Description:** This condition is used to facilitate the automated execution of the disk health check script on Windows workstations. It ensures the chkdsk scan and subsequent repair actions are triggered only on eligible Windows systems.
- **Recommended Agent Policies:** Windows Server Policy

## Dependencies

* [Automation: CHKDSK - Run All Drives](/docs/b2cc4bdc-cbb4-46b7-a785-a7bbb9341b55)
* [Solution: CHKDSK All Drives - NinjaOne](/docs/d7759df0-48d0-45c4-a1ca-958fe849ad79)
* [Custom Field: cPVAL ChkDsk Deployment](/docs/d2bdfde4-73c9-49b9-9a10-4f24ce8f06cc)

## Compound Condition Creation 

- [Compound Condition Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/compound-conditions/chkdsk-all-drives-servers.toml)

## Changelog

### 2026-10-19

- Initial version of the document