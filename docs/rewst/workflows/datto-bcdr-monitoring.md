---
id: 'a4b8c0d2-7e9f-4a1b-3c5d-1e2f3a4b5c6d'
slug: /a4b8c0d2-7e9f-4a1b-3c5d-1e2f3a4b5c6d
title: 'Datto BCDR Monitoring'
title_meta: 'Datto BCDR Monitoring'
keywords: ['datto', 'BCDR', 'backup', 'disaster recovery', 'monitoring', 'automation', 'workflow']
description: 'Automatically monitor Datto BCDR appliances for backup health, agent status, storage capacity, and device alerts. Ensure disaster recovery readiness with comprehensive BCDR monitoring.'
tags: ['datto', 'backup', 'disaster recovery', 'monitoring', 'automation']
draft: false
unlisted: false
---

# Summary

This workflow provides comprehensive automated monitoring of Datto BCDR (Business Continuity and Disaster Recovery) appliances. The solution continuously evaluates backup job status, agent connectivity, storage capacity, device health, cloud replication, and screenshot verifications across all managed Datto devices. By consolidating BCDR health monitoring into a single automated workflow, the solution ensures backup integrity, provides early warning of capacity issues, and maintains complete visibility into disaster recovery readiness across all client environments.

# Usage

## Prerequisites

Before using this workflow, ensure the following requirements are met:

1. **Datto Integration**: Configure the Datto API integration in Rewst with full device and backup data access
2. **PSA Integration**: For ticket creation and tracking
3. **Email Integration**: For notifications and reports

4. **Organizational Variables**:
   - `datto_bcdr_ticket_board`: PSA board for BCDR tickets
   - `datto_bcdr_backup_failure_threshold`: Consecutive failures before alerting
   - `datto_bcdr_storage_warning_percent`: Storage warning threshold
   - `datto_bcdr_agent_offline_hours`: Hours offline before alerting
   - `datto_bcdr_report_recipients`: Report distribution list

## Workflow Inputs

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `device_ids` | Array | No | Specific Datto devices to monitor (defaults to all) |
| `company_id` | String | No | Filter by PSA company |
| `check_backups` | Boolean | No | Check backup job status. Default: `true` |
| `check_agents` | Boolean | No | Check agent connectivity. Default: `true` |
| `check_storage` | Boolean | No | Check storage capacity. Default: `true` |
| `check_replication` | Boolean | No | Check cloud replication. Default: `true` |
| `check_screenshots` | Boolean | No | Check screenshot verifications. Default: `true` |
| `create_tickets` | Boolean | No | Create tickets for issues. Default: `true` |
| `generate_report` | Boolean | No | Generate health summary report. Default: `true` |

## Execution

### Scheduled Execution (Recommended)
- Run daily for comprehensive BCDR health assessment
- Run every 4 hours for backup job monitoring

## Monitoring Process Flow

1. **Device Enumeration**: Retrieve all managed Datto BCDR appliances
2. **Backup Status Check**: Evaluate latest backup job results per agent
3. **Agent Health**: Check agent connectivity and last check-in
4. **Storage Analysis**: Evaluate local storage utilization and trends
5. **Cloud Replication**: Verify off-site replication status
6. **Screenshot Verification**: Check latest screenshot verification results
7. **Device Health**: Monitor device hardware status and alerts
8. **Issue Aggregation**: Compile all findings by severity
9. **Ticket Creation**: Create tickets for actionable issues
10. **Report Generation**: Generate comprehensive BCDR health report
11. **Notification**: Distribute report and alert on critical issues

# Returned Data

```json
{
  "success": true,
  "scan_summary": {
    "total_devices": 85,
    "total_agents": 340,
    "devices_healthy": 78,
    "devices_warning": 5,
    "devices_critical": 2,
    "overall_health_score": 91
  },
  "backup_status": {
    "agents_successful": 320,
    "agents_failed": 12,
    "agents_in_progress": 5,
    "agents_paused": 3,
    "success_rate": 94.1
  },
  "agent_health": {
    "agents_online": 335,
    "agents_offline": 5,
    "agents_offline_details": [
      {
        "device_name": "DATTO-01",
        "agent_name": "SERVER-DB01",
        "company": "Acme Corp",
        "last_checkin": "2026-03-03T08:00:00Z",
        "hours_offline": 32,
        "ticket_id": "BCK-2026-010"
      }
    ]
  },
  "storage_status": {
    "devices_healthy": 80,
    "devices_warning": 4,
    "devices_critical": 1,
    "critical_devices": [
      {
        "device_name": "DATTO-SIRIS-03",
        "company": "Tech Co",
        "used_tb": 7.6,
        "total_tb": 8.0,
        "utilization_percent": 95,
        "estimated_days_until_full": 8,
        "ticket_id": "BCK-2026-011"
      }
    ]
  },
  "replication_status": {
    "devices_synced": 82,
    "devices_behind": 3,
    "oldest_unsynced_hours": 48
  },
  "tickets_created": 8,
  "report_generated": true
}
```
