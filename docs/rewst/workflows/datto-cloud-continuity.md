---
id: 'c0d4e6f8-3a5b-4c7d-9e1f-7a8b9c0d1e2f'
slug: /c0d4e6f8-3a5b-4c7d-9e1f-7a8b9c0d1e2f
title: 'Datto Cloud Continuity Monitoring'
title_meta: 'Datto Cloud Continuity Monitoring'
keywords: ['datto', 'cloud continuity', 'DRaaS', 'disaster recovery', 'monitoring', 'automation', 'workflow']
description: 'Automatically monitor Datto Cloud Continuity status and health. Track cloud replication, failover readiness, and DR testing compliance to ensure disaster recovery preparedness.'
tags: ['datto', 'disaster-recovery', 'monitoring', 'automation']
draft: false
unlisted: false
last_update:
  date: 2026-03-04
---

# Summary

This workflow automates the monitoring and validation of Datto Cloud Continuity services, ensuring disaster recovery readiness across all protected devices. The solution checks cloud replication status, validates off-site backup integrity, monitors storage utilization, verifies failover capabilities, and tracks DR testing compliance. By continuously monitoring cloud continuity health, the workflow provides early warning of replication issues, ensures business continuity plans remain viable, and generates compliance reports for DR auditing.

# Usage

## Prerequisites

Before using this workflow, ensure the following requirements are met:

1. **Datto Integration**: Configure the Datto API integration with cloud continuity data access
2. **PSA Integration**: For ticket creation on failures
3. **Email Integration**: For alert notifications

4. **Organizational Variables**:
   - `datto_cc_replication_threshold_hours`: Max hours since last successful replication
   - `datto_cc_storage_warning_percent`: Storage utilization warning threshold
   - `datto_cc_ticket_board`: PSA board for cloud continuity tickets
   - `datto_cc_dr_test_frequency_days`: Required DR test frequency

## Workflow Inputs

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `device_ids` | Array | No | Specific devices to check (defaults to all) |
| `company_id` | String | No | Filter by PSA company |
| `check_replication` | Boolean | No | Check cloud replication status. Default: `true` |
| `check_storage` | Boolean | No | Check storage utilization. Default: `true` |
| `check_dr_testing` | Boolean | No | Check DR test compliance. Default: `true` |
| `create_tickets` | Boolean | No | Create tickets for issues. Default: `true` |

## Execution

### Scheduled Execution (Recommended)
- Run daily to check cloud replication health
- Run weekly for comprehensive DR readiness assessment

## Monitoring Process Flow

1. **Device Enumeration**: Retrieve all Datto devices with cloud continuity
2. **Replication Status**: Check last successful cloud replication for each device
3. **Storage Analysis**: Evaluate cloud storage utilization and trends
4. **DR Test Compliance**: Verify DR tests are conducted per schedule
5. **Failover Readiness**: Validate cloud failover configurations
6. **Issue Detection**: Identify devices with replication failures or delays
7. **Ticket Creation**: Create tickets for devices requiring attention
8. **Report Generation**: Generate cloud continuity health report
9. **Notification**: Alert teams of critical issues

# Returned Data

```json
{
  "success": true,
  "scan_summary": {
    "total_devices": 85,
    "replication_healthy": 80,
    "replication_delayed": 3,
    "replication_failed": 2,
    "storage_warning": 4,
    "dr_test_overdue": 6,
    "overall_health": "Warning"
  },
  "replication_issues": [
    {
      "device_name": "SERVER-SQL01",
      "company": "Acme Corp",
      "last_successful_replication": "2026-03-02T04:00:00Z",
      "hours_since_replication": 48,
      "status": "delayed",
      "ticket_created": true,
      "ticket_id": "DR-2026-001"
    }
  ],
  "storage_warnings": [
    {
      "device_name": "SERVER-FS01",
      "company": "Widget Inc",
      "cloud_storage_used_tb": 3.8,
      "cloud_storage_total_tb": 4.0,
      "utilization_percent": 95,
      "days_until_full": 12
    }
  ],
  "dr_test_compliance": {
    "devices_compliant": 79,
    "devices_overdue": 6,
    "compliance_percentage": 93.0
  }
}
```

## Changelog

### 2026-03-04

- Initial version of the document
