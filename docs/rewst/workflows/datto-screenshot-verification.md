---
id: 'e6f0a8b4-9c5d-4e3f-a7b1-3c4d5e6f7a8b'
slug: /e6f0a8b4-9c5d-4e3f-a7b1-3c4d5e6f7a8b
title: 'Datto Screenshot Verification Processing'
title_meta: 'Datto Screenshot Verification Processing'
keywords: ['datto', 'screenshot verification', 'backup', 'BCDR', 'monitoring', 'automation', 'workflow']
description: 'Automatically process and validate Datto backup screenshot verifications. Identify failed or missing screenshots, create tickets for backup issues, and maintain backup health visibility across managed devices.'
tags: ['datto', 'backup', 'monitoring', 'automation']
draft: false
unlisted: false
---

# Summary

This workflow automates the processing and validation of Datto backup screenshot verifications across managed devices. The solution retrieves screenshot verification results from Datto BCDR and SIRIS devices, identifies failed, missing, or anomalous screenshots, evaluates backup health, creates PSA tickets for issues requiring attention, and generates summary reports. By automating screenshot verification monitoring, the workflow ensures backup integrity is consistently validated, reduces manual review effort, and enables rapid response to backup failures before they impact disaster recovery readiness.

# Usage

## Prerequisites

Before using this workflow, ensure the following requirements are met:

1. **Datto Integration**: Configure the Datto API integration in Rewst with:
   - Datto API key and secret key
   - Access to BCDR/SIRIS device data
   - Screenshot verification data access

2. **PSA Integration**: For ticket creation when verification failures are detected
3. **Email Integration**: For notification delivery

4. **Organizational Variables**:
   - `datto_screenshot_failure_threshold`: Consecutive failures before alerting (e.g., 2)
   - `datto_screenshot_ticket_board`: PSA board for screenshot failure tickets
   - `datto_screenshot_notification_recipients`: Alert recipients
   - `datto_screenshot_include_successful`: Include successful verifications in reports

## Workflow Inputs

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `device_ids` | Array | No | Specific Datto device IDs to check (defaults to all) |
| `company_id` | String | No | Filter by PSA company |
| `check_period_hours` | Number | No | Time window to check for verifications. Default: 24 |
| `failure_threshold` | Number | No | Consecutive failures to trigger alert. Default: 2 |
| `create_tickets` | Boolean | No | Create tickets for failures. Default: `true` |
| `include_warnings` | Boolean | No | Include warnings in results. Default: `true` |

## Execution

### Scheduled Execution (Recommended)
- Run daily to process screenshot verifications from the previous 24 hours
- Schedule during business hours for timely ticket creation

### Manual Trigger
- Run on-demand for specific devices or after maintenance windows

## Processing Flow

1. **Device Enumeration**: Retrieve all managed Datto BCDR/SIRIS devices
2. **Screenshot Retrieval**: Fetch latest screenshot verification results
3. **Verification Analysis**: Evaluate each screenshot for pass/fail/missing
4. **Failure Detection**: Identify consecutive failures exceeding threshold
5. **Anomaly Detection**: Flag unusual patterns (e.g., blank screens, error messages)
6. **Ticket Creation**: Create PSA tickets for devices with verification failures
7. **Report Generation**: Generate summary of all verification results
8. **Notification**: Alert relevant teams of failures and issues
9. **Documentation**: Log results for trending and analysis

# Returned Data

```json
{
  "success": true,
  "scan_summary": {
    "total_devices_checked": 150,
    "devices_with_successful_screenshots": 142,
    "devices_with_failed_screenshots": 5,
    "devices_with_missing_screenshots": 3,
    "overall_success_rate": 94.7
  },
  "failures": [
    {
      "device_name": "SERVER-DC01",
      "device_id": "dev-12345",
      "company": "Acme Corp",
      "agent_name": "DC01-SystemState",
      "consecutive_failures": 3,
      "last_successful": "2026-03-01T02:00:00Z",
      "last_failure_reason": "VM failed to boot",
      "ticket_created": true,
      "ticket_id": "BCK-2026-001"
    }
  ],
  "missing_screenshots": [
    {
      "device_name": "SERVER-FS02",
      "device_id": "dev-67890",
      "company": "Widget Inc",
      "last_screenshot": "2026-02-28T02:00:00Z",
      "hours_since_last": 96,
      "ticket_created": true,
      "ticket_id": "BCK-2026-002"
    }
  ],
  "tickets_created": 8,
  "notifications_sent": 3
}
```
