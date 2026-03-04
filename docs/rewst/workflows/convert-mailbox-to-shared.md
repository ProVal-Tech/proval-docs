---
id: 'b7c1d3e5-0f2a-4b4c-6d8e-4f5a6b7c8d9e'
slug: /b7c1d3e5-0f2a-4b4c-6d8e-4f5a6b7c8d9e
title: 'Convert User Mailbox to Shared Mailbox'
title_meta: 'Convert User Mailbox to Shared Mailbox'
keywords: ['office 365', 'mailbox conversion', 'shared mailbox', 'offboarding', 'exchange online', 'automation', 'workflow']
description: 'Automatically convert an Office 365 user mailbox to a shared mailbox. Support user offboarding by preserving email access while freeing the user license for reallocation.'
tags: ['office 365', 'mailbox', 'conversion', 'offboarding', 'automation']
draft: false
unlisted: false
---

# Summary

This workflow automates the conversion of a Microsoft 365 user mailbox to a shared mailbox. Commonly used during employee offboarding, the solution converts the mailbox type, grants delegate access to designated users, configures auto-reply messages, sets up mail forwarding if required, manages calendar and contact delegation, and removes the user license to reduce costs. By automating this process, the workflow ensures consistent mailbox conversion procedures, preserves critical business communications, and enables immediate license cost savings.

# Usage

## Prerequisites

Before using this workflow, ensure the following requirements are met:

1. **Microsoft 365 Integration**: Configure M365 integration with Exchange Online management permissions
2. **PSA Integration**: For ticket tracking
3. **Email Integration**: For notifications

4. **Organizational Variables**:
   - `m365_conversion_ticket_board`: PSA board for conversion tasks
   - `m365_conversion_auto_reply_template`: Default auto-reply message template
   - `m365_conversion_default_delegate`: Default delegate for converted mailboxes
   - `m365_conversion_remove_license`: Remove license after conversion
   - `m365_conversion_notification_recipients`: Alert recipients

## Workflow Inputs

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `user_email` | String | Yes | Mailbox to convert |
| `company_id` | String | Yes | PSA company ID |
| `delegate_users` | Array | No | Users to grant Full Access |
| `send_as_users` | Array | No | Users to grant Send As |
| `set_auto_reply` | Boolean | No | Configure auto-reply. Default: `true` |
| `auto_reply_message` | String | No | Custom auto-reply text |
| `forward_to` | String | No | Email address for mail forwarding |
| `remove_license` | Boolean | No | Remove license after conversion. Default: `true` |
| `hide_from_gal` | Boolean | No | Hide from Global Address List. Default: `true` |
| `ticket_id` | String | No | Existing PSA ticket to update |

## Execution

### Manual Trigger
- Execute from PSA ticket or form submission

### Automated Trigger
- Part of user offboarding workflow

## Conversion Process Flow

1. **User Validation**: Verify user mailbox exists and is a user mailbox
2. **Pre-Conversion Checks**: Verify mailbox size, litigation hold status
3. **Mailbox Conversion**: Convert user mailbox to shared mailbox type
4. **Delegate Assignment**: Grant Full Access to designated users
5. **Send As Configuration**: Grant Send As permissions to designated users
6. **Auto-Reply Setup**: Configure out-of-office / auto-reply message
7. **Mail Forwarding**: Set up forwarding rules if specified
8. **GAL Visibility**: Hide mailbox from Global Address List
9. **License Removal**: Remove M365 license to free for reallocation
10. **Verification**: Confirm all settings applied correctly
11. **PSA Update**: Update ticket with conversion details
12. **Notification**: Alert requestor and delegates

# Returned Data

```json
{
  "success": true,
  "conversion_summary": {
    "user_email": "john.smith@acmecorp.com",
    "display_name": "John Smith",
    "company": "Acme Corp",
    "previous_type": "UserMailbox",
    "new_type": "SharedMailbox",
    "mailbox_size_gb": 12.4,
    "conversion_timestamp": "2026-03-04T18:00:00Z"
  },
  "permissions_granted": {
    "full_access": [
      {
        "user": "jane.doe@acmecorp.com",
        "granted": true
      },
      {
        "user": "manager@acmecorp.com",
        "granted": true
      }
    ],
    "send_as": [
      {
        "user": "jane.doe@acmecorp.com",
        "granted": true
      }
    ]
  },
  "auto_reply": {
    "enabled": true,
    "message": "John Smith is no longer with Acme Corp. Please contact jane.doe@acmecorp.com for assistance."
  },
  "mail_forwarding": {
    "enabled": true,
    "forward_to": "jane.doe@acmecorp.com",
    "deliver_and_forward": true
  },
  "gal_hidden": true,
  "license_removed": {
    "removed": true,
    "license_sku": "ENTERPRISEPACK",
    "license_name": "Office 365 E3",
    "monthly_savings": 36.00
  },
  "verification": {
    "mailbox_type": "SharedMailbox",
    "delegates_confirmed": true,
    "auto_reply_active": true,
    "forwarding_active": true,
    "license_count": 0
  },
  "ticket_id": "OFF-2026-015"
}
```
