---
id: 'e4f8a0b2-7c9d-4e1f-3a5b-1c2d3e4f5a6b'
slug: /e4f8a0b2-7c9d-4e1f-3a5b-1c2d3e4f5a6b
title: 'Check Office 365 CW Manage Email Connectors'
title_meta: 'Check Office 365 CW Manage Email Connectors'
keywords: ['office 365', 'connectwise', 'manage', 'email connector', 'monitoring', 'automation', 'workflow']
description: 'Automatically monitor and validate Office 365 email connectors configured in ConnectWise Manage. Detect configuration issues, authentication failures, and mail flow problems to ensure reliable ticket processing.'
tags: ['office365', 'connectwise', 'email', 'monitoring', 'automation']
draft: false
unlisted: false
---

# Summary

This workflow automates the monitoring and validation of Office 365 email connectors configured in ConnectWise Manage. The solution checks the health of email integration between M365 and CW Manage, validates OAuth/authentication tokens, tests mail flow, identifies connector configuration issues, and creates alerts when problems are detected. By proactively monitoring email connectors, the workflow prevents ticket creation failures, ensures incoming emails are properly converted to tickets, and reduces time to detect and resolve mail flow disruptions.

# Usage

## Prerequisites

Before using this workflow, ensure the following requirements are met:

1. **ConnectWise Manage Integration**: Configure CW Manage API integration with email connector access
2. **Microsoft 365 Integration**: Configure M365 integration with mail flow read access
3. **PSA Integration**: For alert ticket creation
4. **Email Integration**: For notifications

4. **Organizational Variables**:
   - `cw_email_connector_ticket_board`: PSA board for connector issues
   - `cw_email_connector_check_interval`: Check interval in minutes
   - `cw_email_connector_failure_threshold`: Failures before alerting
   - `cw_email_connector_notification_recipients`: Alert recipients

## Workflow Inputs

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `connector_ids` | Array | No | Specific connectors to check (defaults to all) |
| `company_id` | String | No | Filter by PSA company |
| `test_mail_flow` | Boolean | No | Send test email to verify flow. Default: `true` |
| `check_auth_tokens` | Boolean | No | Validate OAuth tokens. Default: `true` |
| `create_tickets` | Boolean | No | Create tickets for issues. Default: `true` |

## Execution

### Scheduled Execution (Recommended)
- Run every 30-60 minutes for continuous monitoring
- Run every 15 minutes for critical environments

## Monitoring Process Flow

1. **Connector Enumeration**: Retrieve all email connectors from CW Manage
2. **Status Check**: Check online/offline status of each connector
3. **Authentication Validation**: Verify OAuth tokens are valid and not expired
4. **Mail Flow Test**: Send test email and verify receipt
5. **Queue Analysis**: Check for email queue backlogs
6. **Error Log Review**: Check connector logs for recent errors
7. **Token Refresh**: Refresh expiring OAuth tokens if possible
8. **Issue Detection**: Compile all findings by severity
9. **Ticket Creation**: Create tickets for connector failures
10. **Notification**: Alert teams of critical mail flow issues

# Returned Data

```json
{
  "success": true,
  "check_summary": {
    "total_connectors": 8,
    "connectors_healthy": 7,
    "connectors_warning": 0,
    "connectors_failed": 1,
    "overall_status": "Warning"
  },
  "connector_results": [
    {
      "connector_name": "Support - Acme Corp",
      "email_address": "support@acmecorp.com",
      "status": "Healthy",
      "auth_status": "Valid",
      "token_expires_in_days": 45,
      "mail_flow_test": "Passed",
      "last_email_received": "2026-03-04T14:55:00Z",
      "emails_processed_24h": 128,
      "queue_depth": 0
    },
    {
      "connector_name": "Support - Widget Inc",
      "email_address": "support@widgetinc.com",
      "status": "Failed",
      "auth_status": "Token Expired",
      "token_expired_date": "2026-03-03T00:00:00Z",
      "mail_flow_test": "Failed",
      "last_email_received": "2026-03-03T12:30:00Z",
      "emails_processed_24h": 0,
      "queue_depth": 15,
      "error": "OAuth token expired. Requires re-authentication.",
      "ticket_created": true,
      "ticket_id": "INT-2026-012"
    }
  ],
  "tokens_expiring_soon": [
    {
      "connector_name": "Support - Tech Co",
      "expires_in_days": 7,
      "recommendation": "Re-authenticate connector"
    }
  ]
}
```
