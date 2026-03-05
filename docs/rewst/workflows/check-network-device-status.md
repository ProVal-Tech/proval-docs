---
id: 'f3a7b9c1-6d8e-4f0a-2b4c-0d1e2f3a4b5c'
slug: /f3a7b9c1-6d8e-4f0a-2b4c-0d1e2f3a4b5c
title: 'Network Device Status Monitoring'
title_meta: 'Network Device Status Monitoring'
keywords: ['network', 'device status', 'monitoring', 'uptime', 'connectivity', 'automation', 'workflow']
description: 'Automatically check the status and health of network devices including switches, access points, and routers. Detect offline devices, performance degradation, and connectivity issues with proactive alerting.'
tags: ['network', 'monitoring', 'automation']
draft: false
unlisted: false
last_update:
  date: 2026-03-04
---

# Summary

This workflow automates the monitoring of network device status across managed environments. The solution queries network management platforms for device health, identifies offline or degraded devices, evaluates uptime and performance metrics, creates tickets for devices requiring attention, and generates network health reports. By continuously monitoring network device status, the workflow enables rapid detection of outages, reduces mean time to resolution, and provides visibility into network infrastructure health across all managed clients.

# Usage

## Prerequisites

Before using this workflow, ensure the following requirements are met:

1. **Network Monitoring Integration**: Configure integration with your network management platform (Datto Networking, Meraki, Auvik, etc.)
2. **PSA Integration**: For ticket creation on device issues
3. **Email Integration**: For notifications

4. **Organizational Variables**:
   - `network_check_interval_minutes`: Monitoring frequency
   - `network_offline_threshold_minutes`: Minutes offline before alerting
   - `network_ticket_board`: PSA board for network tickets
   - `network_notification_recipients`: Alert recipients

## Workflow Inputs

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `device_ids` | Array | No | Specific devices to check (defaults to all) |
| `company_id` | String | No | Filter by PSA company |
| `device_types` | Array | No | Filter by type: `switch`, `ap`, `router`, `firewall` |
| `include_performance` | Boolean | No | Include performance metrics. Default: `true` |
| `create_tickets` | Boolean | No | Create tickets for issues. Default: `true` |

## Execution

### Scheduled Execution (Recommended)
- Run every 15-30 minutes for continuous monitoring
- Run hourly for less critical environments

## Monitoring Process Flow

1. **Device Discovery**: Enumerate all managed network devices
2. **Status Check**: Query online/offline status for each device
3. **Performance Metrics**: Collect CPU, memory, bandwidth, and latency data
4. **Threshold Evaluation**: Compare metrics against alerting thresholds
5. **Issue Detection**: Identify offline, degraded, or high-utilization devices
6. **Ticket Creation**: Create tickets for devices requiring attention
7. **Report Generation**: Generate network health summary
8. **Notification**: Alert teams of critical device failures
9. **Documentation**: Log status for trending and capacity planning

# Returned Data

```json
{
  "success": true,
  "scan_summary": {
    "total_devices_checked": 250,
    "devices_online": 245,
    "devices_offline": 3,
    "devices_degraded": 2,
    "overall_health": "Warning"
  },
  "offline_devices": [
    {
      "device_name": "SW-FLOOR2-01",
      "device_type": "switch",
      "ip_address": "192.168.1.10",
      "company": "Acme Corp",
      "site": "Main Office",
      "last_seen": "2026-03-04T14:15:00Z",
      "downtime_minutes": 45,
      "impact": "12 connected endpoints affected",
      "ticket_created": true,
      "ticket_id": "NET-2026-001"
    }
  ],
  "degraded_devices": [
    {
      "device_name": "AP-LOBBY-01",
      "device_type": "access_point",
      "company": "Widget Inc",
      "issue": "High CPU utilization (92%)",
      "recommendation": "Investigate connected clients and interference",
      "ticket_created": true,
      "ticket_id": "NET-2026-002"
    }
  ],
  "performance_summary": {
    "average_uptime_percent": 99.7,
    "devices_over_80_cpu": 5,
    "devices_over_80_memory": 3,
    "high_bandwidth_utilization": 2
  }
}
```

## Changelog

### 2026-03-04

- Initial version of the document
