---
id: 'a6b0c2d4-9e1f-4a3b-5c7d-3e4f5a6b7c8d'
slug: /a6b0c2d4-9e1f-4a3b-5c7d-3e4f5a6b7c8d
title: 'Remove Office 365 Mailbox Permissions'
title_meta: 'Remove Office 365 Mailbox Permissions'
keywords: ['office 365', 'mailbox', 'permissions', 'delegation', 'security', 'automation', 'workflow']
description: 'Automatically remove mailbox permissions and delegations from Office 365 user accounts. Support offboarding, access reviews, and security remediation by revoking Full Access, Send As, and Send on Behalf permissions.'
tags: ['office365', 'mailbox', 'permissions', 'security', 'automation']
draft: false
unlisted: false
last_update:
  date: 2026-03-04
---

# Summary

This workflow automates the removal of mailbox permissions from Microsoft 365 user accounts. The solution handles the revocation of Full Access, Send As, and Send on Behalf permissions, as well as shared mailbox memberships and calendar delegations. Used primarily during user offboarding, access reviews, or security incident response, the workflow ensures all mailbox access is properly revoked, documented, and auditable. By automating permission removal, the workflow eliminates manual Exchange Online administration, prevents orphaned permissions, and maintains security compliance.

# Usage

## Prerequisites

Before using this workflow, ensure the following requirements are met:

1. **Microsoft 365 Integration**: Configure M365 integration with Exchange Online management permissions
2. **PSA Integration**: For ticket tracking
3. **Email Integration**: For notifications

4. **Organizational Variables**:
   - `m365_permission_ticket_board`: PSA board for permission changes
   - `m365_permission_removal_scope`: Default scope (all or specific types)
   - `m365_permission_notification_recipients`: Alert recipients

## Workflow Inputs

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `user_email` | String | Yes | User whose permissions to remove |
| `company_id` | String | Yes | PSA company ID |
| `permission_types` | Array | No | Types to remove: `full_access`, `send_as`, `send_on_behalf`, `calendar`. Default: all |
| `target_mailboxes` | Array | No | Specific mailboxes to remove from (defaults to all) |
| `remove_from_shared` | Boolean | No | Remove from shared mailboxes. Default: `true` |
| `ticket_id` | String | No | Existing PSA ticket to update |

## Execution

### Manual Trigger
- Execute from PSA ticket or form submission

### Automated Trigger
- Part of user offboarding workflow
- Security incident response

## Removal Process Flow

1. **User Validation**: Verify user exists in M365 tenant
2. **Permission Discovery**: Enumerate all mailbox permissions for the user
3. **Full Access Removal**: Remove Full Access permissions from all mailboxes
4. **Send As Removal**: Remove Send As permissions from all mailboxes
5. **Send on Behalf Removal**: Remove Send on Behalf permissions
6. **Calendar Delegation Removal**: Remove calendar delegate access
7. **Shared Mailbox Removal**: Remove from all shared mailbox memberships
8. **Verification**: Confirm all permissions are revoked
9. **Documentation**: Log removed permissions for audit trail
10. **PSA Update**: Update ticket with removal details
11. **Notification**: Alert requestor of completion

# Returned Data

```json
{
  "success": true,
  "removal_summary": {
    "user_email": "john.smith@acmecorp.com",
    "user_display_name": "John Smith",
    "company": "Acme Corp",
    "total_permissions_removed": 12
  },
  "permissions_removed": {
    "full_access": [
      {
        "mailbox": "ceo@acmecorp.com",
        "permission": "FullAccess",
        "removed": true
      },
      {
        "mailbox": "finance@acmecorp.com",
        "permission": "FullAccess",
        "removed": true
      }
    ],
    "send_as": [
      {
        "mailbox": "info@acmecorp.com",
        "permission": "SendAs",
        "removed": true
      }
    ],
    "send_on_behalf": [
      {
        "mailbox": "sales@acmecorp.com",
        "permission": "SendOnBehalf",
        "removed": true
      }
    ],
    "calendar_delegates": [
      {
        "mailbox": "ceo@acmecorp.com",
        "permission": "CalendarDelegate",
        "access_level": "Editor",
        "removed": true
      }
    ],
    "shared_mailboxes": [
      {
        "mailbox": "support@acmecorp.com",
        "removed": true
      },
      {
        "mailbox": "billing@acmecorp.com",
        "removed": true
      }
    ]
  },
  "verification": {
    "remaining_full_access": 0,
    "remaining_send_as": 0,
    "remaining_send_on_behalf": 0,
    "remaining_calendar_delegates": 0,
    "remaining_shared_mailboxes": 0,
    "all_permissions_cleared": true
  },
  "ticket_id": "OFF-2026-015"
}
```

## Changelog

### 2026-03-04

- Initial version of the document
