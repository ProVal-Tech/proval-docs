---
id: 'f9a3b5c7-2d4e-4f6a-8b0c-6d7e8f9a0b1c'
slug: /f9a3b5c7-2d4e-4f6a-8b0c-6d7e8f9a0b1c
title: 'AppGate Upgrade'
title_meta: 'AppGate Upgrade'
keywords: ['appgate', 'upgrade', 'SDP', 'zero trust', 'software update', 'automation', 'workflow']
description: 'Automatically manage AppGate SDP upgrades across managed environments. Coordinate controller and gateway updates, schedule maintenance windows, and verify upgrade success with rollback capabilities.'
tags: ['appgate', 'upgrade', 'zero-trust', 'automation']
draft: false
unlisted: false
last_update:
  date: 2026-03-04
---

# Summary

This workflow automates the upgrade process for AppGate SDP (Software Defined Perimeter) infrastructure. The solution coordinates controller and gateway upgrades across managed environments, schedules maintenance windows, performs pre-upgrade health checks, executes firmware upgrades in the correct sequence, verifies post-upgrade functionality, and supports rollback if issues are detected. By automating the upgrade process, the workflow reduces downtime, minimizes human error, ensures consistent upgrade procedures, and provides complete audit trails for compliance.

# Usage

## Prerequisites

Before using this workflow, ensure the following requirements are met:

1. **AppGate Integration**: Configure the AppGate SDP API integration in Rewst
2. **PSA Integration**: For ticket tracking and change management
3. **Email Integration**: For notifications

4. **Organizational Variables**:
   - `appgate_upgrade_ticket_board`: PSA board for upgrade tickets
   - `appgate_maintenance_window_start`: Default maintenance window start time
   - `appgate_maintenance_window_end`: Default maintenance window end time
   - `appgate_auto_rollback`: Enable automatic rollback on failure
   - `appgate_notification_recipients`: Notification recipients

## Workflow Inputs

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `company_id` | String | Yes | PSA company for the upgrade |
| `target_version` | String | Yes | Target AppGate version |
| `appliance_ids` | Array | No | Specific appliances to upgrade (defaults to all) |
| `maintenance_window_start` | DateTime | No | Scheduled start time |
| `maintenance_window_end` | DateTime | No | Scheduled end time |
| `upgrade_controllers` | Boolean | No | Upgrade controllers. Default: `true` |
| `upgrade_gateways` | Boolean | No | Upgrade gateways. Default: `true` |
| `auto_rollback` | Boolean | No | Rollback on failure. Default: `true` |
| `dry_run` | Boolean | No | Validate without executing. Default: `false` |

## Execution

### Manual Trigger
- Execute on-demand when a new AppGate version is available

### Scheduled Execution
- Schedule during designated maintenance windows

## Upgrade Process Flow

1. **Pre-Flight Checks**: Validate target version, check compatibility
2. **Environment Assessment**: Inventory all controllers and gateways
3. **Health Baseline**: Capture current appliance health and connectivity
4. **Backup Configuration**: Export current configuration for rollback
5. **Controller Upgrade**: Upgrade controllers first (one at a time for HA)
6. **Controller Verification**: Validate controller functionality post-upgrade
7. **Gateway Upgrade**: Upgrade gateways in rolling fashion
8. **Gateway Verification**: Validate gateway connectivity post-upgrade
9. **Functional Testing**: Verify VPN connectivity and policy enforcement
10. **Completion**: Update tickets and notify stakeholders

## Post-Execution Steps

1. Verify user VPN connectivity through upgraded appliances
2. Monitor for post-upgrade errors in AppGate logs
3. Update documentation with new version information
4. Close change management ticket

# Returned Data

```json
{
  "success": true,
  "upgrade_summary": {
    "company": "Acme Corp",
    "previous_version": "6.1.2",
    "target_version": "6.2.0",
    "start_time": "2026-03-04T02:00:00Z",
    "end_time": "2026-03-04T03:45:00Z",
    "duration_minutes": 105,
    "total_appliances": 6,
    "successfully_upgraded": 6,
    "failed": 0
  },
  "controller_upgrades": [
    {
      "name": "Controller-Primary",
      "previous_version": "6.1.2",
      "new_version": "6.2.0",
      "status": "Success",
      "upgrade_time_minutes": 15,
      "health_check": "Passed"
    },
    {
      "name": "Controller-Secondary",
      "previous_version": "6.1.2",
      "new_version": "6.2.0",
      "status": "Success",
      "upgrade_time_minutes": 14,
      "health_check": "Passed"
    }
  ],
  "gateway_upgrades": [
    {
      "name": "Gateway-East",
      "previous_version": "6.1.2",
      "new_version": "6.2.0",
      "status": "Success",
      "upgrade_time_minutes": 12,
      "health_check": "Passed",
      "active_sessions_migrated": 45
    }
  ],
  "rollback_performed": false,
  "ticket_id": "CHG-2026-042"
}
```

## Changelog

### 2026-03-04

- Initial version of the document
