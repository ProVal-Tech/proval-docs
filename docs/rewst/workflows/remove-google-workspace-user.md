---
id: 'e0f4a6b8-3c5d-4e7f-9a1b-7c8d9e0f1a2b'
slug: /e0f4a6b8-3c5d-4e7f-9a1b-7c8d9e0f1a2b
title: 'Remove Google Workspace User'
title_meta: 'Remove Google Workspace User'
keywords: ['google workspace', 'user removal', 'offboarding', 'deprovisioning', 'gmail', 'automation', 'workflow']
description: 'Automatically deprovision Google Workspace user accounts during offboarding. Transfer data ownership, configure email delegation, remove licenses, and suspend or delete accounts.'
tags: ['google-workspace', 'user-removal', 'offboarding', 'automation']
draft: false
unlisted: false
last_update:
  date: 2026-03-04
---

# Summary

This workflow automates the removal and deprovisioning of Google Workspace user accounts during employee offboarding. The solution handles data transfer (Drive, Calendar, etc.), email delegation and forwarding, group membership removal, application token revocation, license removal, and account suspension or deletion. By automating the offboarding process, the workflow ensures consistent deprovisioning, preserves critical business data, maintains security compliance, and enables immediate license cost savings.

# Usage

## Prerequisites

Before using this workflow, ensure the following requirements are met:

1. **Google Workspace Integration**: Configure Google Workspace integration with admin directory and data transfer API access
2. **PSA Integration**: For ticket tracking
3. **Email Integration**: For notifications

4. **Organizational Variables**:
   - `google_removal_ticket_board`: PSA board for offboarding tasks
   - `google_default_data_owner`: Default data transfer recipient
   - `google_suspension_period_days`: Days to keep suspended before deletion
   - `google_auto_reply_template`: Default vacation/auto-reply template
   - `google_notification_recipients`: Alert recipients

## Workflow Inputs

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `user_email` | String | Yes | User account to remove |
| `company_id` | String | Yes | PSA company ID |
| `data_transfer_to` | String | No | Transfer Drive/Docs to this user |
| `email_delegate_to` | String | No | Grant email access to this user |
| `forward_email_to` | String | No | Forward incoming email to this address |
| `set_auto_reply` | Boolean | No | Configure auto-reply. Default: `true` |
| `auto_reply_message` | String | No | Custom auto-reply text |
| `action` | String | No | `suspend` or `delete`. Default: `suspend` |
| `remove_from_groups` | Boolean | No | Remove from all groups. Default: `true` |
| `revoke_tokens` | Boolean | No | Revoke app tokens. Default: `true` |
| `ticket_id` | String | No | Existing PSA ticket to update |

## Execution

### Manual Trigger
- Execute from PSA ticket or offboarding form

### Automated Trigger
- Part of user offboarding workflow

## Removal Process Flow

1. **User Validation**: Verify user exists and is active
2. **Password Reset**: Reset password to prevent access
3. **Session Revocation**: Sign user out of all active sessions
4. **Token Revocation**: Revoke all third-party app tokens
5. **Data Transfer**: Transfer Drive, Docs, and Calendar ownership
6. **Email Configuration**: Set up delegation, forwarding, and auto-reply
7. **Group Removal**: Remove from all Google Groups
8. **Alias Preservation**: Move aliases to delegated user if needed
9. **License Removal**: Remove Google Workspace license
10. **Account Suspension**: Suspend the user account
11. **OU Move**: Move to suspended/offboarded OU
12. **PSA Update**: Update ticket with removal details
13. **Notification**: Alert requestor of completion

# Returned Data

```json
{
  "success": true,
  "removal_summary": {
    "user_email": "john.smith@techco.com",
    "display_name": "John Smith",
    "company": "Tech Co",
    "action_taken": "Suspended",
    "removal_timestamp": "2026-03-04T20:00:00Z"
  },
  "pre_removal_actions": {
    "password_reset": true,
    "sessions_revoked": true,
    "active_sessions_terminated": 3,
    "tokens_revoked": 8
  },
  "data_transfer": {
    "drive_files_transferred": 1250,
    "drive_storage_gb": 15.8,
    "transferred_to": "sarah.jones@techco.com",
    "calendar_events_transferred": true,
    "documents_transferred": true
  },
  "email_configuration": {
    "delegate_granted": "sarah.jones@techco.com",
    "forwarding_to": "sarah.jones@techco.com",
    "auto_reply_enabled": true,
    "auto_reply_message": "John Smith is no longer with Tech Co. Please contact sarah.jones@techco.com."
  },
  "groups_removed": [
    "all-company@techco.com",
    "engineering@techco.com",
    "dev-team@techco.com",
    "project-alpha@techco.com"
  ],
  "license_removed": {
    "sku": "Google-Apps-For-Business",
    "name": "Google Workspace Business Standard",
    "monthly_savings": 12.00
  },
  "account_status": {
    "suspended": true,
    "organizational_unit": "/Suspended Users",
    "scheduled_deletion": "2026-06-04T00:00:00Z"
  },
  "ticket_id": "OFF-2026-018"
}
```

## Changelog

### 2026-03-04

- Initial version of the document
