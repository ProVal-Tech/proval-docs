---
id: 'f7a1b9c5-0d6e-4f4a-b8c2-4d5e6f7a8b9c'
slug: /f7a1b9c5-0d6e-4f4a-b8c2-4d5e6f7a8b9c
title: 'SaaS Alerts Ticket Processing'
title_meta: 'SaaS Alerts Ticket Processing'
keywords: ['saas alerts', 'ticket processing', 'security', 'SaaS monitoring', 'automation', 'workflow']
description: 'Automatically process SaaS Alerts security events into PSA tickets with appropriate categorization, priority assignment, and technician routing. Streamline SaaS security incident management.'
tags: ['saas alerts', 'security', 'automation', 'ticketing']
draft: false
unlisted: false
---

# Summary

This workflow automates the processing of security alerts from SaaS Alerts into PSA tickets. The solution ingests alert events from the SaaS Alerts platform, evaluates severity and type, determines appropriate categorization and priority, creates tickets in the PSA system, assigns them to the relevant service board and team, and includes contextual information to accelerate resolution. By automating this process, the workflow ensures no SaaS security alerts are missed, maintains consistent ticket creation standards, and enables rapid response to threats such as unauthorized access, data exfiltration, suspicious sign-ins, and policy violations.

# Usage

## Prerequisites

Before using this workflow, ensure the following requirements are met:

1. **SaaS Alerts Integration**: Configure the SaaS Alerts API integration in Rewst
2. **PSA Integration**: For ticket creation with appropriate permissions
3. **Email Integration**: For notifications

4. **Organizational Variables**:
   - `saas_alerts_severity_mapping`: Map SaaS Alerts severity to PSA priority
   - `saas_alerts_ticket_board`: PSA service board for SaaS alert tickets
   - `saas_alerts_auto_resolve_low`: Auto-resolve low-severity alerts
   - `saas_alerts_notification_recipients`: Alert recipient emails
   - `saas_alerts_dedup_window_hours`: Deduplication window for repeat alerts

## Workflow Inputs

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `alert_id` | String | Yes | SaaS Alerts alert identifier |
| `alert_type` | String | Yes | Type of alert (e.g., `suspicious_login`, `data_exfiltration`) |
| `severity` | String | Yes | Alert severity level |
| `affected_user` | String | Yes | User associated with the alert |
| `company_id` | String | Yes | PSA company ID |
| `alert_details` | Object | No | Full alert payload from SaaS Alerts |
| `create_ticket` | Boolean | No | Create PSA ticket. Default: `true` |
| `auto_remediate` | Boolean | No | Attempt automatic remediation. Default: `false` |

## Execution

### Event-Driven Trigger (Recommended)
- Webhook from SaaS Alerts triggers processing for each new alert
- Real-time processing ensures fastest response

### Scheduled Processing
- Poll SaaS Alerts API for new alerts every 15-30 minutes
- Process alerts in batches

## Processing Flow

1. **Alert Ingestion**: Receive and parse SaaS Alerts event
2. **Deduplication**: Check for existing tickets for the same alert
3. **Severity Mapping**: Map alert severity to PSA priority levels
4. **Company Matching**: Match affected organization to PSA company
5. **Context Enrichment**: Add user details, device info, and location data
6. **Ticket Creation**: Create PSA ticket with full alert context
7. **Assignment**: Route ticket to appropriate board and team
8. **Remediation**: Execute auto-remediation if enabled and applicable
9. **Notification**: Alert security team for high-severity events
10. **Documentation**: Log alert processing for audit

# Returned Data

```json
{
  "success": true,
  "alert_id": "SA-2026-12345",
  "alert_details": {
    "type": "suspicious_login",
    "severity": "High",
    "affected_user": "john.smith@company.com",
    "description": "Login from unusual location: Russia",
    "saas_application": "Microsoft 365",
    "source_ip": "203.0.113.50",
    "location": "Moscow, Russia",
    "timestamp": "2026-03-04T14:30:00Z"
  },
  "processing_results": {
    "duplicate_found": false,
    "ticket_created": true,
    "ticket_id": "SEC-2026-045",
    "psa_priority": "High",
    "psa_board": "Security Alerts",
    "assigned_team": "Security Operations"
  },
  "remediation": {
    "auto_remediated": true,
    "actions_taken": [
      "User session revoked",
      "Temporary sign-in block applied",
      "MFA challenge required on next login"
    ]
  },
  "notifications_sent": {
    "security_team": { "sent": true },
    "account_manager": { "sent": true }
  }
}
```
