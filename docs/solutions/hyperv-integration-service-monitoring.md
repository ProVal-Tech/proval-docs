---
id: '08acb7b4-3513-4231-9372-3dbd05e2f43f'
slug: /08acb7b4-3513-4231-9372-3dbd05e2f43f
title: 'HyperV - Integration Service Monitoring'
title_meta: 'HyperV - Integration Service Monitoring'
keywords: ['hyper-v', 'integration-services', 'monitoring', 'health', 'cw-rmm']
description: 'This solution outlines how to detect and monitor HyperV Host servers for Integration Service health issues from CW RMM.'
tags: ['windows', 'alerting', 'hyper-v']
draft: false
unlisted: false
last_update:
  date: 2026-06-17
---

## Purpose

This solution outlines how to detect and monitor HyperV Host servers for Integration Service health issues from CW RMM.

## Associated Content

### Custom Fields

| Name | Example | Type | Level | Required | Purpose |
|------|---------|------|-------|----------|---------|
| [HyperVIntegrationSvcMonitoring](/docs/85741409-f7cd-4ec2-b8cc-fefd6f8f2e0b) | Yes | Flag | COMPANY | Yes | Check this box to enable alerts for HyperV Host servers with Integration Service health issues. |

### Group

| Name | Purpose |
|------|---------|
| [HyperV Integration Service Monitoring](/docs/293f12ae-e79f-42be-bf8b-896f071607e6) | Group of HyperV Host servers where integration service monitoring is enabled. |

### Monitor

| Name | Type | Schedule | Purpose |
|------|------|----------|---------|
| [HyperV - Integration Service Monitoring](/docs/f89a4ec6-84c5-4897-8c84-2f3ad8eb6f44) | Script | Every 15 minutes | Generate alerts for HyperV host virtual machines with failing Integration Services. |

## Implementation

### Step 1: Create the Required Custom Field

Create the custom field above under `SETTINGS -> Custom Fields` in CW RMM.

- [HyperVIntegrationSvcMonitoring](/docs/85741409-f7cd-4ec2-b8cc-fefd6f8f2e0b)

### Step 2: Create the Dynamic Group

Create the group [HyperV Integration Service Monitoring](/docs/293f12ae-e79f-42be-bf8b-896f071607e6) under `ENDPOINTS -> Groups` as a dynamic group.

### Step 3: Set Up the Monitor

Configure the monitor [HyperV - Integration Service Monitoring](/docs/f89a4ec6-84c5-4897-8c84-2f3ad8eb6f44) under `ENDPOINTS -> Alerts -> Monitors` to target the monitoring-enabled group and run every 15 minutes.

## FAQ

### How do I enable this monitoring for specific clients?

> Enable monitoring by setting the **HyperVIntegrationSvcMonitoring** custom field to `True` at the company level in CW RMM.

### How often does the monitor run?

> The monitor runs every 15 minutes.

### Which VMs are checked by this monitor?

> The monitor checks HyperV virtual machines that are currently in a `Running` state.

### What triggers an alert?

> An alert is triggered when one or more enabled Integration Services on a running VM report a status other than `OK`.

### What happens if there are no running VMs?

> The script returns `No running VMs found.` and does not raise an issue alert.

## Changelog

### 2026-06-17

- Initial version of the document
