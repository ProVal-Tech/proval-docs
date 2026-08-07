---
id: 'b59d37f6-e24a-4c8b-8d7f-1a6e93c5b2d4'
slug: /b59d37f6-e24a-4c8b-8d7f-1a6e93c5b2d4
title: 'cPVAL Disk Health Status Overview'
title_meta: 'cPVAL Disk Health Status Overview'
keywords: ['crystaldiskinfo', 'disk', 'health', 'monitoring', 'smart', 'ssd', 'hdd']
description: 'Dynamic group of physical Windows devices audited by the Proactive Disk Health Monitor solution. Displays drive health status, data collection time, and alert state for fleet-wide review.'
tags: ['performance', 'report', 'software', 'hardware']
draft: false
unlisted: false
last_update:
  date: 2026-08-06
---

## Summary

This group dynamically collects physical Windows desktops and laptops that are actively audited by the [Proactive Disk Health Monitor](/docs/acd55d90-1704-440c-a92e-795c230ecf9a) solution. It provides a centralized dashboard for technicians to review drive health statuses, verify data collection times, and monitor the alert state across the fleet. Devices are added to this group once their [cPVAL Crystal Disk Alert Mode](/docs/72297da9-ba7f-443f-a21a-f56afc638a3e) is configured and not set to Disable.

## Details

**Name:** `cPVAL Disk Health Status Overview`  
**Description:** `Dynamic group of physical Windows devices audited by the Proactive Disk Health Monitor solution. Displays drive health status, data collection time, and alert state for fleet-wide review. Devices appear once their first audit completes.`

## Dependencies

- [Solution: Proactive Disk Health Monitor](/docs/acd55d90-1704-440c-a92e-795c230ecf9a)
- [Custom Field: cPVAL Crystal Disk Alert Mode](/docs/72297da9-ba7f-443f-a21a-f56afc638a3e)
- [Custom Field: cPVAL Crystal Disk Health Status](/docs/3f8a1c2e-9b47-4d5a-a6e3-1c9d84b2f7a5)
- [Custom Field: cPVAL Crystal Disk Alert Required](/docs/1e6d84a9-b25c-4d7f-a3b6-7f4e92c8d5a1)
- [Custom Field: cPVAL Crystal Disk Data Collection Time](/docs/c47b9e25-a63d-4f81-8c5e-9d2a64f7b3c8)

## Group Creation

[Group Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/groups/cpval-disk-health-status-overview.toml)

## Changelog

### 2026-08-06

- Initial version of the document
