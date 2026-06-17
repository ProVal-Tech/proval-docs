---
id: '3d997e81-827e-4f8b-a356-4f6a3dd0ce7b'
slug: /3d997e81-827e-4f8b-a356-4f6a3dd0ce7b
title: 'HyperV Replication State Monitoring'
title_meta: 'HyperV Replication State Monitoring'
keywords: ['hyper-v', 'replication', 'monitoring', 'dynamic-group', 'alert']
description: 'Group of HyperV Host servers where replication state monitoring is turned on.'
tags: ['windows', 'alerting', 'hyper-v']
draft: false
unlisted: false
last_update:
  date: 2026-06-17
---

## Summary

Group of HyperV Host servers where replication state monitoring is turned on.

## Dependencies

- [Custom Field: HyperVReplicationStateMonitoring](/docs/6e2b0d4f-9a4d-4b10-9628-cf7be6a7ab44)
- [Solution: HyperV - Replication State Monitoring](/docs/9f3f0b27-3b3b-4c3e-91b1-6d82d9480f52)

## Group Setup Location

- **Group Path:** `ENDPOINTS` -> `Groups`
- **Group Type:** `Dynamic Group`

## Group Summary

- **Group Name:** `HyperV Replication State Monitoring`
- **Category:** `HyperV`
- **Description:** `Group of HyperV Host servers where replication state monitoring is turned on.`

![Image1](../../../static/img/docs/3d997e81-827e-4f8b-a356-4f6a3dd0ce7b/image1.webp)

## Group Criteria

The group is defined by the following **conditions**, joined by an **AND** logic.

| Condition | Operator | Value(s) |
|-----------|----------|----------|
| Machine Roles | Contains any of | `Hyper-v` |
| HyperVReplicationStateMonitoring | Equal | `True` |

**Logic:** Detects HyperV Host servers where HyperVReplicationStateMonitoring is enabled.

![Image2](../../../static/img/docs/3d997e81-827e-4f8b-a356-4f6a3dd0ce7b/image2.webp)

## Completed Group

![Image3](../../../static/img/docs/3d997e81-827e-4f8b-a356-4f6a3dd0ce7b/image3.webp)

## Changelog

### 2026-06-17

- Initial version of the document
