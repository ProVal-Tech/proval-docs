---
id: 'd1e5f7a9-4b6c-4d8e-0f2a-8b9c0d1e2f3a'
slug: /d1e5f7a9-4b6c-4d8e-0f2a-8b9c0d1e2f3a
title: 'Datto Missing Drives Detection'
title_meta: 'Datto Missing Drives Detection'
keywords: ['datto', 'missing drives', 'backup', 'BCDR', 'monitoring', 'hardware', 'automation', 'workflow']
description: 'Automatically detect and alert on missing or offline drives in Datto BCDR devices. Proactively identify hardware issues before they impact backup integrity and disaster recovery readiness.'
tags: ['datto', 'backup', 'monitoring', 'hardware', 'automation']
draft: false
unlisted: false
---

# Summary

This workflow automates the detection of missing or offline drives in Datto BCDR and SIRIS appliances. The solution monitors drive health status across all managed Datto devices, identifies drives that have gone offline, are degraded, or are no longer detected by the system, and creates priority tickets for hardware intervention. By proactively monitoring drive status, the workflow prevents data loss from undetected drive failures, ensures RAID array integrity, and enables timely hardware replacement before backup capacity or redundancy is compromised.

# Usage

## Prerequisites

Before using this workflow, ensure the following requirements are met:

1. **Datto Integration**: Configure the Datto API integration with device hardware status access
2. **PSA Integration**: For ticket creation on drive issues
3. **Email Integration**: For urgent notifications

4. **Organizational Variables**:
   - `datto_drive_ticket_board`: PSA board for hardware tickets
   - `datto_drive_ticket_priority`: Default priority for drive alerts
   - `datto_drive_notification_recipients`: Notification recipients
   - `datto_drive_check_raid_status`: Include RAID status checks

## Workflow Inputs

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `device_ids` | Array | No | Specific devices to check (defaults to all) |
| `company_id` | String | No | Filter by PSA company |
| `include_degraded` | Boolean | No | Include degraded drives. Default: `true` |
| `include_smart_warnings` | Boolean | No | Include SMART warning drives. Default: `true` |
| `create_tickets` | Boolean | No | Create tickets for issues. Default: `true` |

## Execution

### Scheduled Execution (Recommended)
- Run daily to check drive health across all Datto devices
- Run hourly for critical environments

## Detection Process Flow

1. **Device Enumeration**: Retrieve all managed Datto appliances
2. **Drive Inventory**: Query current drive status for each device
3. **Baseline Comparison**: Compare current drives against expected configuration
4. **Missing Detection**: Identify drives no longer present or responding
5. **Health Evaluation**: Check SMART data and drive health indicators
6. **RAID Assessment**: Evaluate RAID array status and redundancy
7. **Ticket Creation**: Create priority tickets for missing or failing drives
8. **Notification**: Send urgent alerts for critical drive failures
9. **Documentation**: Log drive health for trending

# Returned Data

```json
{
  "success": true,
  "scan_summary": {
    "total_devices_checked": 85,
    "total_drives_checked": 340,
    "drives_healthy": 332,
    "drives_missing": 2,
    "drives_degraded": 4,
    "drives_smart_warning": 2,
    "devices_with_issues": 5
  },
  "missing_drives": [
    {
      "device_name": "DATTO-SIRIS-01",
      "device_id": "dev-12345",
      "company": "Acme Corp",
      "drive_bay": "Bay 3",
      "expected_drive": "4TB WD Red",
      "last_seen": "2026-03-03T08:00:00Z",
      "raid_status": "Degraded",
      "raid_level": "RAID 5",
      "data_at_risk": false,
      "ticket_created": true,
      "ticket_id": "HW-2026-001",
      "urgency": "High"
    }
  ],
  "degraded_drives": [
    {
      "device_name": "DATTO-SIRIS-05",
      "device_id": "dev-67890",
      "company": "Widget Inc",
      "drive_bay": "Bay 1",
      "smart_status": "Warning",
      "reallocated_sectors": 45,
      "temperature_c": 52,
      "recommendation": "Schedule replacement within 7 days",
      "ticket_created": true,
      "ticket_id": "HW-2026-002"
    }
  ],
  "tickets_created": 5,
  "notifications_sent": 3
}
```
