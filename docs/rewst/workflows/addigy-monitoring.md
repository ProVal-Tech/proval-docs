---
id: 'b5c9d1e3-8f0a-4b2c-4d6e-2f3a4b5c6d7e'
slug: /b5c9d1e3-8f0a-4b2c-4d6e-2f3a4b5c6d7e
title: 'Addigy Integration and Monitoring'
title_meta: 'Addigy Integration and Monitoring'
keywords: ['addigy', 'apple', 'mac', 'device management', 'MDM', 'monitoring', 'automation', 'workflow']
description: 'Automatically monitor and manage Apple devices through Addigy MDM integration. Process device alerts, compliance checks, and software deployment status for managed macOS and iOS devices.'
tags: ['addigy', 'apple', 'mdm', 'monitoring', 'automation']
draft: false
unlisted: false
---

# Summary

This workflow automates the monitoring and management of Apple devices through the Addigy MDM platform. The solution processes device alerts, evaluates compliance posture, monitors software deployment status, tracks device health metrics, and creates PSA tickets for issues requiring attention. By integrating Addigy with your automation platform, the workflow provides unified visibility into Apple device fleet health, ensures compliance with organizational policies, and streamlines incident response for macOS and iOS device issues.

# Usage

## Prerequisites

Before using this workflow, ensure the following requirements are met:

1. **Addigy Integration**: Configure the Addigy API integration in Rewst with:
   - Addigy API credentials (client ID and secret)
   - Organization access
   - Device and policy read permissions

2. **PSA Integration**: For ticket creation and tracking
3. **Email Integration**: For notifications

4. **Organizational Variables**:
   - `addigy_ticket_board`: PSA board for Addigy tickets
   - `addigy_compliance_check_enabled`: Enable compliance monitoring
   - `addigy_alert_severity_mapping`: Map Addigy alerts to PSA priority
   - `addigy_notification_recipients`: Alert recipients

## Workflow Inputs

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `device_ids` | Array | No | Specific devices to check (defaults to all) |
| `company_id` | String | No | Filter by PSA company |
| `check_compliance` | Boolean | No | Check device compliance. Default: `true` |
| `check_alerts` | Boolean | No | Process device alerts. Default: `true` |
| `check_software` | Boolean | No | Check software deployment status. Default: `true` |
| `check_updates` | Boolean | No | Check for pending OS updates. Default: `true` |
| `create_tickets` | Boolean | No | Create tickets for issues. Default: `true` |

## Execution

### Scheduled Execution (Recommended)
- Run daily for compliance and alert processing
- Run weekly for comprehensive fleet reporting

### Event-Driven Trigger
- Trigger on new Addigy alerts or policy violations

## Monitoring Process Flow

1. **Device Enumeration**: Retrieve all managed Apple devices from Addigy
2. **Alert Processing**: Fetch and process new device alerts
3. **Compliance Check**: Evaluate device compliance against policies
4. **Software Status**: Check software deployment and patch status
5. **OS Updates**: Identify devices with pending macOS/iOS updates
6. **Health Metrics**: Collect device health data (storage, battery, etc.)
7. **Issue Detection**: Aggregate findings by severity
8. **Ticket Creation**: Create PSA tickets for actionable issues
9. **Report Generation**: Generate fleet health summary
10. **Notification**: Alert teams of critical issues

# Returned Data

```json
{
  "success": true,
  "fleet_summary": {
    "total_devices": 120,
    "macos_devices": 95,
    "ios_devices": 25,
    "devices_online": 112,
    "devices_offline": 8,
    "devices_compliant": 105,
    "devices_non_compliant": 15,
    "compliance_rate": 87.5
  },
  "alerts_processed": {
    "total_alerts": 12,
    "critical": 1,
    "warning": 4,
    "informational": 7,
    "tickets_created": 5
  },
  "compliance_issues": [
    {
      "device_name": "MBP-John-Smith",
      "serial_number": "C1234567890",
      "company": "Acme Corp",
      "issues": ["FileVault disabled", "Firewall disabled"],
      "os_version": "macOS 15.2",
      "last_checkin": "2026-03-04T12:00:00Z",
      "ticket_id": "MDM-2026-001"
    }
  ],
  "pending_updates": {
    "devices_needing_updates": 18,
    "critical_updates": 3,
    "security_updates": 8,
    "feature_updates": 7
  },
  "software_deployments": {
    "successful": 45,
    "pending": 8,
    "failed": 2
  }
}
```
