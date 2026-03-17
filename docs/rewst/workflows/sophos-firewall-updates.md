---
id: 'b1c5d7e9-4f6a-4b8c-0d2e-8f9a0b1c2d3e'
slug: /b1c5d7e9-4f6a-4b8c-0d2e-8f9a0b1c2d3e
title: 'Sophos Firewall Updates'
title_meta: 'Sophos Firewall Updates'
keywords: ['sophos', 'firewall', 'firmware update', 'security', 'network', 'automation', 'workflow']
description: 'Automatically manage Sophos firewall firmware updates across managed environments. Schedule updates during maintenance windows, perform pre-update health checks, and verify post-update functionality.'
tags: ['sophos', 'firewall', 'updates', 'security', 'automation']
draft: false
unlisted: false
last_update:
  date: 2026-03-04
---

# Summary

This workflow automates the management and deployment of Sophos firewall firmware updates across managed client environments. The solution monitors for available firmware updates, evaluates update applicability, schedules deployments during maintenance windows, performs pre-update health checks, executes the firmware update, and validates post-update firewall functionality. By automating the update process, the workflow ensures firewalls remain current with security patches, minimizes downtime through scheduled maintenance, and provides complete audit trails for compliance reporting.

# Usage

## Prerequisites

Before using this workflow, ensure the following requirements are met:

1. **Sophos Central Integration**: Configure Sophos Central API integration in Rewst
2. **PSA Integration**: For change management ticket creation
3. **Email Integration**: For notifications

4. **Organizational Variables**:
   - `sophos_update_ticket_board`: PSA board for update tickets
   - `sophos_maintenance_window_start`: Default maintenance window start
   - `sophos_maintenance_window_end`: Default maintenance window end
   - `sophos_auto_update_minor`: Auto-apply minor/patch updates
   - `sophos_notification_recipients`: Alert recipients

## Workflow Inputs

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `company_id` | String | No | Filter by PSA company |
| `firewall_ids` | Array | No | Specific firewalls to update (defaults to all) |
| `target_version` | String | No | Specific version to deploy |
| `maintenance_window_start` | DateTime | No | Scheduled start time |
| `maintenance_window_end` | DateTime | No | Scheduled end time |
| `force_update` | Boolean | No | Bypass version checks. Default: `false` |
| `dry_run` | Boolean | No | Check without updating. Default: `false` |

## Execution

### Scheduled Execution (Recommended)
- Run daily to check for available updates
- Execute updates during scheduled maintenance windows

### Manual Trigger
- Execute on-demand for urgent security patches

## Update Process Flow

1. **Update Discovery**: Check Sophos Central for available firmware updates
2. **Applicability Assessment**: Identify firewalls eligible for update
3. **Risk Evaluation**: Assess update criticality and potential impact
4. **Change Request**: Create change management ticket in PSA
5. **Pre-Update Health Check**: Validate firewall health and connectivity
6. **Configuration Backup**: Export current configuration
7. **Firmware Deployment**: Push firmware update to firewall
8. **Reboot Monitoring**: Monitor reboot process and service restoration
9. **Post-Update Validation**: Verify firewall functionality and connectivity
10. **VPN Tunnel Verification**: Confirm all VPN tunnels re-establish
11. **Completion Notification**: Update ticket and notify stakeholders

## Post-Execution Steps

1. Verify VPN tunnels and site-to-site connectivity
2. Confirm web filtering and security policies are active
3. Check logs for post-update errors
4. Close change management ticket

# Returned Data

```json
{
  "success": true,
  "update_summary": {
    "firewalls_checked": 45,
    "updates_available": 12,
    "updates_deployed": 10,
    "updates_deferred": 2,
    "successful": 10,
    "failed": 0
  },
  "updates_deployed": [
    {
      "firewall_name": "SFW-ACME-HQ",
      "company": "Acme Corp",
      "model": "XGS 3100",
      "previous_version": "20.0.1 MR-1",
      "new_version": "20.0.2",
      "update_type": "Security Patch",
      "start_time": "2026-03-04T02:00:00Z",
      "end_time": "2026-03-04T02:18:00Z",
      "duration_minutes": 18,
      "status": "Success",
      "health_check": "Passed",
      "vpn_tunnels_restored": 8,
      "ticket_id": "CHG-2026-055"
    }
  ],
  "deferred_updates": [
    {
      "firewall_name": "SFW-WIDGET-BR1",
      "company": "Widget Inc",
      "reason": "Outside maintenance window",
      "scheduled_date": "2026-03-06T03:00:00Z"
    }
  ],
  "health_check_results": {
    "all_interfaces_up": true,
    "vpn_tunnels_active": true,
    "web_filtering_active": true,
    "ips_active": true
  }
}
```

## Changelog

### 2026-03-04

- Initial version of the document
