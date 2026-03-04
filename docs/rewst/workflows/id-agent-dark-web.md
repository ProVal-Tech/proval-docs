---
id: 'e8f2a4b6-1c3d-4e5f-7a9b-5c6d7e8f9a0b'
slug: /e8f2a4b6-1c3d-4e5f-7a9b-5c6d7e8f9a0b
title: 'ID Agent Dark Web Monitoring'
title_meta: 'ID Agent Dark Web Monitoring'
keywords: ['id agent', 'dark web', 'credential monitoring', 'breach detection', 'security', 'automation', 'workflow']
description: 'Automatically monitor ID Agent Dark Web alerts for compromised credentials. Process new exposure events, create tickets, notify affected users, and enforce password resets for breached accounts.'
tags: ['id-agent', 'dark-web', 'security', 'automation']
draft: false
unlisted: false
---

# Summary

This workflow automates the monitoring and processing of ID Agent Dark Web alerts for compromised credentials. The solution continuously checks for new credential exposures on the dark web, correlates exposed accounts with managed users, creates PSA tickets for remediation, enforces password resets when possible, and notifies stakeholders of potential breaches. By automating dark web alert processing, the workflow ensures rapid response to compromised credentials, reduces exposure time, and provides accountability through ticket-based tracking.

# Usage

## Prerequisites

Before using this workflow, ensure the following requirements are met:

1. **ID Agent Integration**: Configure the ID Agent API integration in Rewst
2. **PSA Integration**: For ticket creation and tracking
3. **Microsoft 365/Active Directory Integration**: For automated password resets
4. **Email Integration**: For notifications

4. **Organizational Variables**:
   - `id_agent_ticket_board`: PSA board for dark web alert tickets
   - `id_agent_auto_reset`: Enable automatic password reset
   - `id_agent_notify_users`: Notify affected users directly
   - `id_agent_severity_mapping`: Map exposure types to ticket priority
   - `id_agent_notification_recipients`: Security team emails

## Workflow Inputs

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `company_id` | String | No | Filter by PSA company |
| `date_range_days` | Number | No | Days of alerts to process. Default: 7 |
| `exposure_types` | Array | No | Filter by exposure type |
| `auto_reset_passwords` | Boolean | No | Force password reset. Default: org variable |
| `create_tickets` | Boolean | No | Create PSA tickets. Default: `true` |
| `notify_end_users` | Boolean | No | Send user notifications. Default: org variable |

## Execution

### Scheduled Execution (Recommended)
- Run daily for routine monitoring
- Run every 4 hours for heightened security posture

## Processing Flow

1. **Alert Retrieval**: Fetch new dark web exposure alerts from ID Agent
2. **Deduplication**: Filter out previously processed alerts
3. **User Correlation**: Match exposed emails to managed user accounts
4. **Risk Assessment**: Evaluate severity based on data exposed
5. **Ticket Creation**: Create PSA tickets for each exposure event
6. **Password Reset**: Enforce password reset for compromised accounts
7. **MFA Enforcement**: Ensure MFA is enabled on affected accounts
8. **User Notification**: Send awareness emails to affected users
9. **Management Notification**: Alert security team of high-risk exposures
10. **Documentation**: Log exposure details for compliance

# Returned Data

```json
{
  "success": true,
  "monitoring_summary": {
    "total_alerts_processed": 24,
    "new_exposures": 8,
    "previously_processed": 16,
    "companies_affected": 5,
    "unique_users_exposed": 12
  },
  "exposures": [
    {
      "alert_id": "DW-2026-001",
      "email": "jane.doe@acmecorp.com",
      "company": "Acme Corp",
      "source_breach": "third-party-service-2025",
      "data_exposed": ["email", "password_hash", "phone_number"],
      "exposure_date": "2026-03-01T00:00:00Z",
      "risk_level": "High",
      "user_found_in_directory": true,
      "password_reset_enforced": true,
      "mfa_status": "Enabled",
      "user_notified": true,
      "ticket_id": "SEC-2026-025"
    }
  ],
  "remediation_summary": {
    "password_resets_enforced": 6,
    "mfa_already_enabled": 10,
    "mfa_enforcement_pending": 2,
    "user_notifications_sent": 8,
    "tickets_created": 8
  }
}
```
