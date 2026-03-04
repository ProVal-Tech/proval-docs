---
id: 'a0b4c6d8-3e5f-4a7b-9c1d-7e8f9a0b1c2d'
slug: /a0b4c6d8-3e5f-4a7b-9c1d-7e8f9a0b1c2d
title: 'Office 365 to KnowBe4 User Sync'
title_meta: 'Office 365 to KnowBe4 User Sync'
keywords: ['office 365', 'knowbe4', 'user sync', 'security awareness', 'phishing', 'training', 'automation', 'workflow']
description: 'Automatically synchronize users from Microsoft 365 to KnowBe4 security awareness training platform. Maintain accurate user lists, group memberships, and enrollment for phishing simulations and training campaigns.'
tags: ['office365', 'knowbe4', 'sync', 'security', 'automation']
draft: false
unlisted: false
---

# Summary

This workflow automates the synchronization of user accounts from Microsoft 365 to the KnowBe4 security awareness training platform. The solution retrieves licensed M365 users, maps them to corresponding KnowBe4 accounts, creates new KnowBe4 users for unmatched accounts, removes users who no longer exist in M365, and updates group memberships and user attributes. By automating this synchronization, the workflow ensures all licensed users are enrolled in security awareness training, maintains accurate user data for targeted campaigns, and eliminates manual user management overhead.

# Usage

## Prerequisites

Before using this workflow, ensure the following requirements are met:

1. **Microsoft 365 Integration**: Configure M365 integration with user read permissions
2. **KnowBe4 Integration**: Configure KnowBe4 API integration with user management permissions
3. **PSA Integration**: For ticket tracking (optional)

4. **Organizational Variables**:
   - `knowbe4_sync_license_filter`: M365 license SKUs to include
   - `knowbe4_default_group`: Default KnowBe4 group for new users
   - `knowbe4_department_group_mapping`: Map M365 departments to KnowBe4 groups
   - `knowbe4_remove_stale_users`: Remove users not in M365
   - `knowbe4_notification_recipients`: Alert recipients

## Workflow Inputs

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `company_id` | String | Yes | PSA company to sync |
| `m365_tenant_id` | String | No | Specific M365 tenant (auto-detected if mapped) |
| `license_filter` | Array | No | M365 license SKUs to include |
| `sync_groups` | Boolean | No | Sync department-based groups. Default: `true` |
| `remove_stale_users` | Boolean | No | Remove users not in M365. Default: `false` |
| `dry_run` | Boolean | No | Preview changes without applying. Default: `false` |

## Execution

### Scheduled Execution (Recommended)
- Run daily for user synchronization
- Run weekly for comprehensive audit

## Sync Process Flow

1. **M365 User Retrieval**: Fetch all licensed users from Microsoft 365
2. **KnowBe4 User Retrieval**: Fetch all users from KnowBe4
3. **User Matching**: Match users by email address
4. **New User Identification**: Find M365 users not in KnowBe4
5. **Stale User Identification**: Find KnowBe4 users not in M365
6. **User Creation**: Create new KnowBe4 accounts for unmatched M365 users
7. **Attribute Update**: Sync name, department, title, and manager
8. **Group Assignment**: Update KnowBe4 group memberships
9. **Stale User Processing**: Archive/remove users no longer in M365
10. **Report Generation**: Generate sync summary
11. **Notification**: Alert on sync completion and issues

# Returned Data

```json
{
  "success": true,
  "sync_summary": {
    "company": "Acme Corp",
    "m365_users_found": 150,
    "knowbe4_users_found": 142,
    "users_matched": 138,
    "users_created": 12,
    "users_updated": 25,
    "users_archived": 4,
    "groups_synced": 8,
    "sync_timestamp": "2026-03-04T15:00:00Z"
  },
  "users_created": [
    {
      "email": "new.hire@acmecorp.com",
      "first_name": "New",
      "last_name": "Hire",
      "department": "Sales",
      "knowbe4_group": "Sales Team",
      "enrollment_status": "Invited"
    }
  ],
  "users_archived": [
    {
      "email": "former.employee@acmecorp.com",
      "reason": "No longer in M365",
      "last_m365_sync": "2026-02-15T00:00:00Z"
    }
  ],
  "attribute_updates": {
    "names_updated": 3,
    "departments_updated": 8,
    "titles_updated": 12,
    "managers_updated": 5
  },
  "group_changes": {
    "group_additions": 15,
    "group_removals": 6
  }
}
```
