---
id: 'd5e9f7a3-8b4c-4d2e-9f6a-2b3c4d5e6f7a'
slug: /d5e9f7a3-8b4c-4d2e-9f6a-2b3c4d5e6f7a
title: 'Dark Web Alert Processing'
title_meta: 'Dark Web Alert Processing'
keywords: ['dark web', 'alert processing', 'security', 'credential breach', 'monitoring', 'automation', 'workflow']
description: 'Automatically process and respond to dark web alerts for compromised credentials. Streamline incident response by automating password resets, notifications, and ticket creation when breached credentials are detected.'
tags: ['security', 'automation', 'dark-web', 'incident-response']
draft: false
unlisted: false
last_update:
  date: 2026-03-04
---

# Summary

This workflow automates the processing of dark web monitoring alerts when compromised credentials are detected. The solution ingests alerts from dark web monitoring services, identifies affected users, validates the breach severity, initiates password resets, creates PSA tickets for tracking, notifies affected users and administrators, and documents the incident for compliance. By automating this response, the workflow reduces the window of exposure, ensures consistent incident handling, and maintains a complete audit trail for security compliance.

# Usage

## Prerequisites

Before using this workflow, ensure the following requirements are met:

1. **Dark Web Monitoring Integration**: Configure integration with your dark web monitoring provider (ID Agent, SpyCloud, Have I Been Pwned, etc.)
2. **Active Directory / Microsoft 365 Integration**: For automated password resets
3. **PSA Integration**: For ticket creation and tracking
4. **Email Integration**: For user and admin notifications

5. **Organizational Variables**:
   - `dark_web_auto_reset_password`: Automatically reset compromised passwords
   - `dark_web_force_mfa_reenroll`: Force MFA re-enrollment on compromised accounts
   - `dark_web_notification_recipients`: Security team email addresses
   - `dark_web_ticket_board`: PSA board for dark web alert tickets
   - `dark_web_severity_threshold`: Minimum severity to process

## Workflow Inputs

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `alert_id` | String | Yes | Dark web alert identifier |
| `compromised_email` | String | Yes | Email address found on dark web |
| `breach_source` | String | No | Name of the breached service |
| `breach_date` | String | No | Date of the breach |
| `data_types_exposed` | Array | No | Types of data exposed (password, email, SSN, etc.) |
| `company_id` | String | Yes | PSA company ID for the affected organization |
| `auto_reset` | Boolean | No | Automatically reset password. Default: org variable |
| `force_mfa` | Boolean | No | Force MFA re-enrollment. Default: `true` |
| `create_ticket` | Boolean | No | Create PSA ticket. Default: `true` |

## Execution

### Event-Driven Trigger (Recommended)
- Triggered automatically when dark web monitoring detects a new alert
- Webhook from monitoring service initiates processing

### Scheduled Processing
- Run periodically to poll for new alerts from monitoring API
- Process alerts in batches

## Processing Flow

1. **Alert Ingestion**: Receive and parse dark web alert details
2. **User Identification**: Match compromised email to internal user accounts
3. **Severity Assessment**: Evaluate breach severity based on data types exposed
4. **Account Validation**: Verify the account is active and requires action
5. **Password Reset**: Force password reset on compromised account
6. **Session Revocation**: Revoke all active sessions and tokens
7. **MFA Re-enrollment**: Force MFA re-enrollment if configured
8. **Ticket Creation**: Create PSA ticket for tracking and documentation
9. **User Notification**: Notify affected user with instructions
10. **Admin Notification**: Alert security team with breach details
11. **Documentation**: Log incident for compliance reporting

# Returned Data

```json
{
  "success": true,
  "alert_id": "DW-2026-001",
  "compromised_account": {
    "email": "john.smith@company.com",
    "user_found_in_directory": true,
    "account_status": "active"
  },
  "breach_details": {
    "source": "Third-Party SaaS Platform",
    "breach_date": "2025-12-15",
    "data_types_exposed": ["email", "password_hash", "phone_number"],
    "severity": "High"
  },
  "actions_taken": {
    "password_reset": true,
    "sessions_revoked": true,
    "mfa_reset": true,
    "conditional_access_applied": false,
    "ticket_created": true,
    "ticket_id": "SEC-2026-001"
  },
  "notifications_sent": {
    "user_notification": { "sent": true, "recipient": "john.smith@company.com" },
    "security_team": { "sent": true, "recipients": ["security@company.com"] },
    "manager_notification": { "sent": true, "recipient": "jane.doe@company.com" }
  }
}
```

## Changelog

### 2026-03-04

- Initial version of the document
