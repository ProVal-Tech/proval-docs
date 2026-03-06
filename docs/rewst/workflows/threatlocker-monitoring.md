---
id: 'd7e1f3a5-0b2c-4d4e-6f8a-4b5c6d7e8f9a'
slug: /d7e1f3a5-0b2c-4d4e-6f8a-4b5c6d7e8f9a
title: 'ThreatLocker Monitoring and Management'
title_meta: 'ThreatLocker Monitoring and Management'
keywords: ['threatlocker', 'application control', 'ringfencing', 'security', 'allowlisting', 'automation', 'workflow']
description: 'Automatically monitor ThreatLocker events, process approval requests, manage application policies, and create tickets for security incidents. Streamline endpoint application security management.'
tags: ['threatlocker', 'security', 'endpoint', 'automation']
draft: false
unlisted: false
last_update:
  date: 2026-03-04
---

# Summary

This workflow automates the monitoring and management of ThreatLocker application control across managed endpoints. The solution processes application approval requests, monitors for blocked application events, manages allowlisting and ringfencing policies, detects potential security threats, and creates PSA tickets for events requiring technician intervention. By automating ThreatLocker management, the workflow reduces manual approval processing time, ensures consistent security policy enforcement, and provides rapid response to application control events.

# Usage

## Prerequisites

Before using this workflow, ensure the following requirements are met:

1. **ThreatLocker Integration**: Configure the ThreatLocker API integration in Rewst
2. **PSA Integration**: For ticket creation and tracking
3. **Email Integration**: For notifications

4. **Organizational Variables**:
   - `threatlocker_ticket_board`: PSA board for ThreatLocker tickets
   - `threatlocker_auto_approve_categories`: Application categories to auto-approve
   - `threatlocker_block_alert_threshold`: Blocks before creating ticket
   - `threatlocker_notification_recipients`: Alert recipients

## Workflow Inputs

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `company_id` | String | No | Filter by PSA company |
| `event_types` | Array | No | Filter by event type |
| `time_range_hours` | Number | No | Time window for events. Default: 24 |
| `process_approvals` | Boolean | No | Process pending approval requests. Default: `true` |
| `monitor_blocks` | Boolean | No | Monitor blocked applications. Default: `true` |
| `create_tickets` | Boolean | No | Create tickets for events. Default: `true` |

## Execution

### Scheduled Execution (Recommended)
- Run every 30-60 minutes for approval processing
- Run daily for comprehensive reporting

### Event-Driven Trigger
- Trigger on new approval requests or security events

## Processing Flow

1. **Event Retrieval**: Fetch events from ThreatLocker API
2. **Approval Processing**: Review and process pending approval requests
3. **Block Analysis**: Analyze blocked application events
4. **Pattern Detection**: Identify repeat blocks or suspicious patterns
5. **Auto-Approval**: Process auto-approvals for known safe applications
6. **Ticket Creation**: Create tickets for events needing review
7. **Policy Updates**: Apply approved policy changes
8. **Report Generation**: Generate security event summary
9. **Notification**: Alert teams of security events

# Returned Data

```json
{
  "success": true,
  "monitoring_summary": {
    "total_events": 245,
    "approval_requests": 18,
    "blocked_applications": 52,
    "security_alerts": 3,
    "policy_changes": 5
  },
  "approval_requests": [
    {
      "request_id": "REQ-12345",
      "application": "Zoom Meeting Client",
      "hash": "abc123def456",
      "requested_by": "john.smith",
      "company": "Acme Corp",
      "device": "DESKTOP-JS01",
      "auto_approved": true,
      "reason": "Application in approved category"
    }
  ],
  "security_events": [
    {
      "event_type": "suspicious_execution",
      "application": "powershell.exe (obfuscated script)",
      "company": "Widget Inc",
      "device": "LAPTOP-MW02",
      "user": "mike.wilson",
      "action_taken": "Blocked",
      "risk_level": "High",
      "ticket_created": true,
      "ticket_id": "SEC-2026-015"
    }
  ],
  "blocked_summary": {
    "unique_applications_blocked": 15,
    "repeat_blocks": 8,
    "tickets_created": 5
  },
  "auto_approvals_processed": 12,
  "manual_review_required": 6
}
```

## Changelog

### 2026-03-04

- Initial version of the document
