---
id: 'b3c9d5e7-1a4f-4b8c-9e2d-6f7a8b3c5d9e'
slug: /b3c9d5e7-1a4f-4b8c-9e2d-6f7a8b3c5d9e
title: 'Remove JumpCloud User'
title_meta: 'Remove JumpCloud User'
keywords: ['jumpcloud', 'user removal', 'deprovisioning', 'offboarding', 'identity', 'automation', 'workflow']
description: 'Automatically remove user accounts from JumpCloud, revoking all group memberships, system bindings, application access, and directory configurations. Ensure secure and complete user deprovisioning.'
tags: ['jumpcloud', 'automation', 'offboarding', 'identity']
draft: false
unlisted: false
last_update:
  date: 2026-03-04
---

# Summary

This workflow automates the removal of user accounts from JumpCloud, revoking all group memberships, system bindings, application access, LDAP bindings, and MFA configurations. The solution ensures complete deprovisioning by systematically removing the user from all associated resources before disabling or deleting the account. By automating this process, the workflow eliminates the risk of orphaned access, maintains security compliance, and ensures consistent offboarding across all JumpCloud-managed resources.

# Usage

## Prerequisites

Before using this workflow, ensure the following requirements are met:

1. **JumpCloud Integration**: Configure the JumpCloud API integration in Rewst with:
   - JumpCloud API key with administrative privileges
   - Organization ID (for multi-tenant environments)
   - User management permissions (read, update, delete)
   - Group management permissions (read, update)

2. **Organizational Variables**: Configure the following organizational variables:
   - `jumpcloud_org_id`: JumpCloud Organization ID
   - `jumpcloud_removal_mode`: `disable` or `delete` (default: `disable`)
   - `jumpcloud_retention_days`: Days to retain disabled account before deletion
   - `jumpcloud_notify_on_removal`: Send notifications on user removal

## Workflow Inputs

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `user_identifier` | String | Yes | JumpCloud user ID, username, or email |
| `removal_mode` | String | No | `disable` or `delete`. Default: `disable` |
| `revoke_all_access` | Boolean | No | Remove from all groups and systems. Default: `true` |
| `backup_user_data` | Boolean | No | Export user details before removal. Default: `true` |
| `reason` | String | No | Reason for removal (for audit trail) |
| `notify_manager` | Boolean | No | Notify manager of removal. Default: `true` |
| `manager_email` | String | No | Manager email for notification |

## Execution

### Event-Driven Trigger (Recommended)
- Triggered by HR system when employee status changes to terminated
- Triggered by offboarding workflow as a sub-workflow
- Triggered when PSA contact is set to inactive

### Manual Trigger
1. Navigate to the workflow in Rewst
2. Enter the user identifier
3. Select removal mode and options
4. Execute and monitor progress

## Removal Process Flow

1. **User Lookup**: Locate user account in JumpCloud by ID, username, or email
2. **Data Backup**: Export user details, group memberships, and system bindings
3. **Group Removal**: Remove user from all user groups
4. **System Unbinding**: Remove user from all bound systems
5. **Application Revocation**: Revoke SSO application access
6. **LDAP Unbinding**: Remove LDAP directory bindings
7. **RADIUS Removal**: Remove from RADIUS server access
8. **MFA Removal**: Clear MFA configurations and tokens
9. **SSH Key Removal**: Remove SSH public keys
10. **Account Action**: Disable or delete account based on configuration
11. **Notification**: Notify manager and IT team
12. **Documentation**: Log all actions for audit

# Returned Data

```json
{
  "success": true,
  "user_info": {
    "jumpcloud_user_id": "60a1b2c3d4e5f6a7b8c9d0e1",
    "username": "john.smith",
    "email": "john.smith@company.com",
    "display_name": "John Smith"
  },
  "actions_taken": {
    "account_status": "disabled",
    "groups_removed": 5,
    "systems_unbound": 8,
    "applications_revoked": 6,
    "ldap_bindings_removed": 1,
    "radius_removed": 1,
    "mfa_cleared": true,
    "ssh_keys_removed": 1
  },
  "backup": {
    "backed_up": true,
    "backup_location": "offboarding/2026/john.smith/jumpcloud-export.json",
    "includes": ["user_details", "group_memberships", "system_bindings", "custom_attributes"]
  },
  "notifications_sent": {
    "manager_notification": { "sent": true, "recipient": "jane.doe@company.com" },
    "it_notification": { "sent": true, "recipients": ["it-team@company.com"] }
  },
  "audit_trail": {
    "workflow_run_id": "jc-remove-12345",
    "initiated_by": "hr.admin@company.com",
    "completed_timestamp": "2026-03-04T15:31:00Z",
    "reason": "Employee termination"
  }
}
```

## Changelog

### 2026-03-04

- Initial version of the document
