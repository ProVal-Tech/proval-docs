---
id: 'c6d0e2f4-9a1b-4c3d-5e7f-3a4b5c6d7e8f'
slug: /c6d0e2f4-9a1b-4c3d-5e7f-3a4b5c6d7e8f
title: 'SaaS Alerts Monitoring'
title_meta: 'SaaS Alerts Monitoring'
keywords: ['saas alerts', 'SaaS monitoring', 'security', 'cloud applications', 'automation', 'workflow']
description: 'Automatically monitor and process SaaS Alerts events for cloud application security. Detect unauthorized access, data exfiltration, suspicious activities, and policy violations across managed SaaS platforms.'
tags: ['saas alerts', 'security', 'monitoring', 'automation']
draft: false
unlisted: false
---

# Summary

This workflow provides comprehensive automated monitoring of the SaaS Alerts platform, processing security events and alerts across all monitored cloud applications. The solution ingests events from SaaS Alerts, categorizes them by threat type and severity, correlates related events, identifies actionable security incidents, and orchestrates appropriate responses including ticket creation, automated remediation, and stakeholder notifications. By centralizing SaaS security monitoring, the workflow ensures consistent threat detection and response across Microsoft 365, Google Workspace, Salesforce, Dropbox, and other monitored SaaS platforms.

# Usage

## Prerequisites

Before using this workflow, ensure the following requirements are met:

1. **SaaS Alerts Integration**: Configure the SaaS Alerts API integration in Rewst
2. **PSA Integration**: For ticket creation and tracking
3. **Microsoft 365/Google Integration**: For automated remediation actions
4. **Email Integration**: For notifications

4. **Organizational Variables**:
   - `saas_alerts_poll_interval_minutes`: How often to check for new alerts
   - `saas_alerts_severity_mapping`: Map SaaS Alerts severity to PSA priority
   - `saas_alerts_ticket_board`: PSA board for security tickets
   - `saas_alerts_auto_remediate`: Enable automatic remediation
   - `saas_alerts_remediation_actions`: Allowed auto-remediation actions
   - `saas_alerts_notification_recipients`: Security team emails

## Workflow Inputs

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `company_id` | String | No | Filter by PSA company |
| `alert_types` | Array | No | Filter by alert type |
| `severity_filter` | String | No | Minimum severity to process |
| `time_range_hours` | Number | No | Time window for alerts. Default: 24 |
| `auto_remediate` | Boolean | No | Enable auto-remediation. Default: org variable |
| `create_tickets` | Boolean | No | Create PSA tickets. Default: `true` |
| `generate_report` | Boolean | No | Generate summary report. Default: `true` |

## Execution

### Scheduled Execution (Recommended)
- Run every 15-30 minutes for near real-time monitoring
- Run daily for comprehensive summary reports

### Event-Driven Trigger
- Webhook from SaaS Alerts for immediate processing

## Monitoring Process Flow

1. **Event Retrieval**: Fetch new events from SaaS Alerts API
2. **Event Classification**: Categorize by threat type and severity
3. **Correlation**: Group related events into incidents
4. **Deduplication**: Prevent duplicate tickets for ongoing events
5. **Impact Assessment**: Evaluate scope and affected users
6. **Ticket Creation**: Create PSA tickets for incidents
7. **Auto-Remediation**: Execute automated responses for known threats
8. **Notification**: Alert security team for high-severity events
9. **Report Generation**: Generate security event summary
10. **Documentation**: Log all events for compliance

# Returned Data

```json
{
  "success": true,
  "monitoring_summary": {
    "time_range": "2026-03-04T00:00:00Z to 2026-03-04T15:30:00Z",
    "total_events_processed": 156,
    "critical_events": 2,
    "high_events": 8,
    "medium_events": 34,
    "low_events": 112,
    "companies_affected": 12
  },
  "critical_incidents": [
    {
      "incident_id": "INC-SA-001",
      "type": "data_exfiltration",
      "severity": "Critical",
      "user": "john.smith@acmecorp.com",
      "company": "Acme Corp",
      "application": "Microsoft 365",
      "description": "Bulk download of 500+ files from SharePoint in 30 minutes",
      "events_correlated": 3,
      "remediation_taken": "User session revoked, download blocked",
      "ticket_id": "SEC-2026-001"
    }
  ],
  "auto_remediation_summary": {
    "actions_taken": 5,
    "sessions_revoked": 3,
    "accounts_suspended": 1,
    "mfa_enforced": 1
  },
  "tickets_created": 10,
  "notifications_sent": 4
}
```
