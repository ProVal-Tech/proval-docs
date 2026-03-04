---
id: 'a2b6c8d0-5e7f-4a9b-1c3d-9e0f1a2b3c4d'
slug: /a2b6c8d0-5e7f-4a9b-1c3d-9e0f1a2b3c4d
title: 'Remove User from Security Groups'
title_meta: 'Remove User from Security Groups'
keywords: ['security groups', 'user removal', 'access', 'offboarding', 'active directory', 'entra id', 'automation', 'workflow']
description: 'Automatically remove a user from all security groups across Active Directory and Entra ID. Support offboarding and access revocation by ensuring complete security group membership cleanup.'
tags: ['security-groups', 'offboarding', 'access-management', 'automation']
draft: false
unlisted: false
---

# Summary

This workflow automates the removal of a user from all security groups across Active Directory and/or Entra ID (Azure AD). Commonly used during employee offboarding or access revocation scenarios, the solution discovers all security group memberships for the target user, documents them for audit purposes, removes the user from each group, verifies removal, and preserves group membership data for potential rollback. By automating security group removal, the workflow ensures complete access revocation, eliminates the risk of overlooked group memberships, and maintains a detailed audit trail for compliance.

# Usage

## Prerequisites

Before using this workflow, ensure the following requirements are met:

1. **Active Directory Integration**: Configure AD integration with group management permissions (if on-premises)
2. **Microsoft 365 / Entra ID Integration**: Configure M365 integration with group management permissions (if cloud)
3. **PSA Integration**: For ticket tracking
4. **Email Integration**: For notifications

4. **Organizational Variables**:
   - `security_group_removal_ticket_board`: PSA board for access changes
   - `security_group_preserve_list`: Groups to never remove from
   - `security_group_removal_scope`: `ad`, `entra`, or `both`
   - `security_group_notification_recipients`: Alert recipients

## Workflow Inputs

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `user_identifier` | String | Yes | Username, email, or UPN |
| `company_id` | String | Yes | PSA company ID |
| `scope` | String | No | `ad`, `entra`, or `both`. Default: org variable |
| `exclude_groups` | Array | No | Group names/IDs to skip |
| `include_distribution` | Boolean | No | Also remove from distribution groups. Default: `false` |
| `include_m365_groups` | Boolean | No | Also remove from M365 groups. Default: `true` |
| `backup_memberships` | Boolean | No | Save memberships for rollback. Default: `true` |
| `ticket_id` | String | No | Existing PSA ticket to update |

## Execution

### Manual Trigger
- Execute from PSA ticket or form submission

### Automated Trigger
- Part of user offboarding workflow
- Security incident response

## Removal Process Flow

1. **User Resolution**: Resolve user identifier across AD and Entra ID
2. **Membership Discovery**: Enumerate all security group memberships
3. **Exclusion Filtering**: Apply exclusion rules and preserve list
4. **Membership Backup**: Save current memberships for rollback
5. **AD Group Removal**: Remove from on-premises AD security groups
6. **Entra ID Group Removal**: Remove from cloud security groups
7. **M365 Group Removal**: Remove from Microsoft 365 groups if enabled
8. **Distribution Group Removal**: Remove from distribution groups if enabled
9. **Verification**: Confirm all removals were successful
10. **Audit Documentation**: Log all changes with timestamps
11. **PSA Update**: Update ticket with removal details
12. **Notification**: Alert requestor of completion

# Returned Data

```json
{
  "success": true,
  "removal_summary": {
    "user": "john.smith@acmecorp.com",
    "display_name": "John Smith",
    "company": "Acme Corp",
    "scope": "both",
    "total_groups_found": 28,
    "groups_removed": 25,
    "groups_excluded": 3,
    "removal_timestamp": "2026-03-04T22:00:00Z"
  },
  "ad_groups_removed": [
    {
      "group_name": "VPN-Users",
      "group_type": "Security",
      "distinguished_name": "CN=VPN-Users,OU=Groups,DC=acmecorp,DC=local",
      "removed": true
    },
    {
      "group_name": "Sales-Team",
      "group_type": "Security",
      "distinguished_name": "CN=Sales-Team,OU=Groups,DC=acmecorp,DC=local",
      "removed": true
    },
    {
      "group_name": "File-Share-Sales",
      "group_type": "Security",
      "distinguished_name": "CN=File-Share-Sales,OU=Groups,DC=acmecorp,DC=local",
      "removed": true
    }
  ],
  "entra_groups_removed": [
    {
      "group_name": "SaaS-App-Users",
      "group_id": "abc123-def456",
      "group_type": "Security",
      "removed": true
    },
    {
      "group_name": "Conditional-Access-MFA",
      "group_id": "ghi789-jkl012",
      "group_type": "Security",
      "removed": true
    }
  ],
  "m365_groups_removed": [
    {
      "group_name": "Sales Department",
      "group_id": "mno345-pqr678",
      "group_type": "Microsoft 365",
      "removed": true
    }
  ],
  "groups_excluded": [
    {
      "group_name": "Domain Users",
      "reason": "On preserve list"
    },
    {
      "group_name": "All-Employees-DL",
      "reason": "Distribution group - not included"
    }
  ],
  "membership_backup": {
    "backup_created": true,
    "backup_id": "BKUP-GRP-2026-001",
    "rollback_available": true,
    "rollback_expiry": "2026-04-04T22:00:00Z"
  },
  "verification": {
    "ad_memberships_remaining": 1,
    "entra_memberships_remaining": 0,
    "all_target_groups_cleared": true
  },
  "ticket_id": "OFF-2026-015"
}
```
