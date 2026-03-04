---
id: 'e2f6a8b0-5c7d-4e9f-1a3b-9c0d1e2f3a4b'
slug: /e2f6a8b0-5c7d-4e9f-1a3b-9c0d1e2f3a4b
title: 'Sophos Firewall License Expiration Monitoring'
title_meta: 'Sophos Firewall License Expiration Monitoring'
keywords: ['sophos', 'firewall', 'license expiration', 'monitoring', 'renewal', 'automation', 'workflow']
description: 'Automatically monitor Sophos Firewall license expiration dates and generate alerts before licenses expire. Ensure continuous firewall protection with proactive license lifecycle management.'
tags: ['sophos', 'firewall', 'licensing', 'monitoring', 'automation']
draft: false
unlisted: false
---

# Summary

This workflow automates the monitoring of Sophos Firewall license expiration dates across all managed firewalls. The solution queries Sophos Central or firewall APIs for license status, identifies licenses approaching expiration, creates PSA tickets for renewal action, and sends proactive notifications to stakeholders. By automating license monitoring, the workflow prevents lapses in firewall protection, ensures compliance with security requirements, and provides ample lead time for procurement and renewal processes.

# Usage

## Prerequisites

Before using this workflow, ensure the following requirements are met:

1. **Sophos Central Integration**: Configure the Sophos Central API integration in Rewst
2. **PSA Integration**: For ticket creation on expiring licenses
3. **Email Integration**: For notifications

4. **Organizational Variables**:
   - `sophos_license_warning_days`: Days before expiration to alert (e.g., 90, 60, 30)
   - `sophos_license_critical_days`: Days before expiration for critical alert (e.g., 14)
   - `sophos_license_ticket_board`: PSA board for license tickets
   - `sophos_license_notification_recipients`: Alert recipients
   - `sophos_license_auto_create_quote`: Auto-create renewal quote

## Workflow Inputs

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `firewall_ids` | Array | No | Specific firewalls to check (defaults to all) |
| `company_id` | String | No | Filter by PSA company |
| `warning_threshold_days` | Number | No | Days before expiration to alert. Default: 60 |
| `include_active` | Boolean | No | Include active licenses in report. Default: `false` |
| `create_tickets` | Boolean | No | Create tickets for expiring licenses. Default: `true` |
| `send_report` | Boolean | No | Send summary report. Default: `true` |

## Execution

### Scheduled Execution (Recommended)
- Run weekly to scan all firewall licenses
- Run daily as licenses approach critical threshold

## Monitoring Process Flow

1. **Firewall Discovery**: Enumerate all managed Sophos Firewalls
2. **License Retrieval**: Query license details for each firewall
3. **Expiration Check**: Compare license dates against warning thresholds
4. **Categorization**: Classify licenses as active, warning, critical, or expired
5. **Ticket Creation**: Create renewal tickets for expiring licenses
6. **Quote Generation**: Generate renewal quotes if configured
7. **Report Generation**: Create license status summary report
8. **Notification**: Alert stakeholders of expiring licenses
9. **Documentation**: Log license status for tracking

# Returned Data

```json
{
  "success": true,
  "scan_summary": {
    "total_firewalls_checked": 45,
    "licenses_active": 38,
    "licenses_warning": 4,
    "licenses_critical": 2,
    "licenses_expired": 1
  },
  "expiring_licenses": [
    {
      "firewall_name": "FW-HQ-01",
      "firewall_serial": "C1234567890",
      "company": "Acme Corp",
      "license_type": "Enhanced Support",
      "expiration_date": "2026-04-15",
      "days_until_expiry": 42,
      "status": "warning",
      "renewal_cost_estimate": "$1,200",
      "ticket_created": true,
      "ticket_id": "LIC-2026-001"
    },
    {
      "firewall_name": "FW-BRANCH-03",
      "firewall_serial": "C9876543210",
      "company": "Widget Inc",
      "license_type": "FullGuard Plus",
      "expiration_date": "2026-03-18",
      "days_until_expiry": 14,
      "status": "critical",
      "renewal_cost_estimate": "$2,400",
      "ticket_created": true,
      "ticket_id": "LIC-2026-002"
    }
  ],
  "expired_licenses": [
    {
      "firewall_name": "FW-REMOTE-07",
      "company": "Tech Co",
      "license_type": "Web Protection",
      "expired_date": "2026-02-28",
      "days_expired": 4,
      "impact": "Web filtering disabled",
      "ticket_id": "LIC-2026-003"
    }
  ],
  "notifications_sent": 5
}
```
