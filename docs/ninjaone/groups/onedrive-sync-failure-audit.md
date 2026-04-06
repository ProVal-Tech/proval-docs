---
id: '301bd2d5-ba87-4bf2-ae1b-c1165c7347e7'
slug: /301bd2d5-ba87-4bf2-ae1b-c1165c7347e7
title: 'OneDrive Sync Failure Audit'
title_meta: 'OneDrive Sync Failure Audit'
keywords: ['onedrive', 'sync']
description: 'This group contains the agent where the onedrive sync state is not synced and is not empty.'
tags: ['onedrive']
draft: false
unlisted: false
last_update:
  date: 2026-04-06
---

## Summary

This group contains the agent where the onedrive sync state is not synced and is not empty.

## Dependencies

- [Script - Get OneDrive Sync Status](/docs/29e62bb2-d641-472d-a92b-11404471b915)
- [cPVAL OneDrive Sync Status Audit](/docs/cec3c5c0-10cc-4767-aea2-659f72b5bd56)

## Group Creation

[Group Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/groups/onedrive-sync-failure-audit.toml)


## Changelog

### 2026-04-06

- Added a custom field [cPVAL OneDrive Sync Status Audit](/docs/cec3c5c0-10cc-4767-aea2-659f72b5bd56) so that it can be used to store the Sync status of OneDrive, which can be further used to apply a filter to audit failed sync status machines.
