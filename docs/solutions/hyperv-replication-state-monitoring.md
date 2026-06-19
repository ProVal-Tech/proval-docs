---
id: '9f3f0b27-3b3b-4c3e-91b1-6d82d9480f52'
slug: /9f3f0b27-3b3b-4c3e-91b1-6d82d9480f52
title: 'HyperV - Replication State Monitoring'
title_meta: 'HyperV - Replication State Monitoring'
keywords: ['hyper-v', 'replication', 'state', 'monitoring', 'cw-rmm']
description: 'This solution outlines how to detect and monitor HyperV Host servers for replication state issues from CW RMM.'
tags: ['windows', 'alerting', 'hyper-v']
draft: false
unlisted: false
last_update:
  date: 2026-06-17
---

## Purpose

This solution outlines how to detect and monitor HyperV Host servers for replication state issues from CW RMM.

## Associated Content

### Custom Fields

| Name | Example | Type | Level | Required | Purpose |
|------|---------|------|-------|----------|---------|
| [HyperVReplicationStateMonitoring](/docs/6e2b0d4f-9a4d-4b10-9628-cf7be6a7ab44) | Yes | Flag | COMPANY | Yes | Check this box to enable alerts for HyperV Host servers with replication state issues. |

### Group

| Name | Purpose |
|------|---------|
| [HyperV Replication State Monitoring](/docs/3d997e81-827e-4f8b-a356-4f6a3dd0ce7b) | Group of HyperV Host servers where replication state monitoring is enabled. |

### Monitor

| Name | Type | Schedule | Purpose |
|------|------|----------|---------|
| [HyperV - Replication State Monitoring](/docs/b1f0a6d3-5ec6-4fc9-a9b9-fab67de7f3de) | Script | Every 15 minutes | Generate alerts for HyperV host virtual machines with replication states of Warning or Critical. |

## Implementation

### Step 1: Create the Required Custom Field

Create the custom field above under `SETTINGS -> Custom Fields` in CW RMM.

- [HyperVReplicationStateMonitoring](/docs/6e2b0d4f-9a4d-4b10-9628-cf7be6a7ab44)

### Step 2: Create the Dynamic Group

Create the group [HyperV Replication State Monitoring](/docs/3d997e81-827e-4f8b-a356-4f6a3dd0ce7b) under `ENDPOINTS -> Groups` as a dynamic group.

### Step 3: Set Up the Monitor

Configure the monitor [HyperV - Replication State Monitoring](/docs/b1f0a6d3-5ec6-4fc9-a9b9-fab67de7f3de) under `ENDPOINTS -> Alerts -> Monitors` to target the monitoring-enabled group and run every 15 minutes.

## FAQ

### How do I enable this monitoring for specific clients?

> Enable monitoring by setting the **HyperVReplicationStateMonitoring** custom field to `True` at the company level in CW RMM.

### How often does the monitor check replication state?

> The monitor runs every 15 minutes to detect replication state issues quickly.

### Which replication states trigger an alert?

> The monitor alerts when VM replication state is `Warning` or `Critical`.

### What happens when no VMs have replication enabled?

> The script returns `Replication not enabled for any VM`, and no issue alert is generated.

### Which servers are included in the monitoring group?

> The **HyperV Replication State Monitoring** dynamic group includes servers that:
>
> - Have the Hyper-V role assigned
> - Have the HyperVReplicationStateMonitoring custom field enabled (`True`)

### How can I change alert behavior?

> Update the monitor script output criteria or monitor settings in CW RMM if your process requires different trigger conditions.

## Changelog

### 2026-06-17

- Initial version of the document
