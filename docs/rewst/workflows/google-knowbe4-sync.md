---
id: 'c2d6e8f0-5a7b-4c9d-1e3f-9a0b1c2d3e4f'
slug: /c2d6e8f0-5a7b-4c9d-1e3f-9a0b1c2d3e4f
title: 'Google Workspace to KnowBe4 User Sync'
title_meta: 'Google Workspace to KnowBe4 User Sync'
keywords: ['google workspace', 'knowbe4', 'user sync', 'security awareness', 'phishing', 'training', 'automation', 'workflow']
description: 'Automatically synchronize users from Google Workspace to KnowBe4 security awareness training platform. Maintain accurate user enrollment for phishing simulations and training campaigns.'
tags: ['google-workspace', 'knowbe4', 'sync', 'security', 'automation']
draft: false
unlisted: false
last_update:
  date: 2026-03-04
---

# Summary

This workflow automates the synchronization of user accounts from Google Workspace to the KnowBe4 security awareness training platform. The solution retrieves active Google Workspace users, maps them to corresponding KnowBe4 accounts, provisions new KnowBe4 users for unmatched accounts, handles stale user cleanup, and synchronizes group memberships and organizational unit mappings. By automating this synchronization, the workflow ensures all Google Workspace users are enrolled in security awareness training, supports targeted phishing campaigns by department, and eliminates manual user management.

# Usage

## Prerequisites

Before using this workflow, ensure the following requirements are met:

1. **Google Workspace Integration**: Configure Google Workspace integration with directory read permissions
2. **KnowBe4 Integration**: Configure KnowBe4 API integration with user management permissions
3. **PSA Integration**: For ticket tracking (optional)

4. **Organizational Variables**:
   - `knowbe4_google_sync_ou_filter`: Organizational units to include
   - `knowbe4_google_default_group`: Default KnowBe4 group for new users
   - `knowbe4_google_ou_group_mapping`: Map Google OUs to KnowBe4 groups
   - `knowbe4_google_remove_stale`: Remove users not in Google Workspace
   - `knowbe4_google_notification_recipients`: Alert recipients

## Workflow Inputs

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `company_id` | String | Yes | PSA company to sync |
| `google_domain` | String | No | Google Workspace domain (auto-detected if mapped) |
| `ou_filter` | Array | No | Organizational units to include |
| `sync_groups` | Boolean | No | Sync OU-based groups. Default: `true` |
| `remove_stale_users` | Boolean | No | Remove users not in Google. Default: `false` |
| `dry_run` | Boolean | No | Preview changes without applying. Default: `false` |

## Execution

### Scheduled Execution (Recommended)
- Run daily for user synchronization
- Run weekly for comprehensive audit

## Sync Process Flow

1. **Google User Retrieval**: Fetch active users from Google Workspace directory
2. **KnowBe4 User Retrieval**: Fetch all users from KnowBe4
3. **User Matching**: Match users by email address
4. **New User Identification**: Find Google users not in KnowBe4
5. **Stale User Identification**: Find KnowBe4 users not in Google Workspace
6. **User Provisioning**: Create KnowBe4 accounts for new users
7. **Attribute Sync**: Update name, department, title, and manager
8. **Group Assignment**: Sync organizational unit to KnowBe4 groups
9. **Stale User Handling**: Archive/remove users no longer in Google Workspace
10. **Report Generation**: Generate sync summary
11. **Notification**: Alert on sync results

# Returned Data

```json
{
  "success": true,
  "sync_summary": {
    "company": "Tech Co",
    "google_domain": "techco.com",
    "google_users_found": 85,
    "knowbe4_users_found": 80,
    "users_matched": 78,
    "users_created": 7,
    "users_updated": 15,
    "users_archived": 2,
    "groups_synced": 6,
    "sync_timestamp": "2026-03-04T16:00:00Z"
  },
  "users_created": [
    {
      "email": "sarah.jones@techco.com",
      "first_name": "Sarah",
      "last_name": "Jones",
      "organizational_unit": "/Engineering",
      "knowbe4_group": "Engineering",
      "enrollment_status": "Invited"
    }
  ],
  "users_archived": [
    {
      "email": "former.user@techco.com",
      "reason": "Suspended in Google Workspace",
      "last_google_login": "2026-01-15T00:00:00Z"
    }
  ],
  "attribute_updates": {
    "names_updated": 2,
    "departments_updated": 5,
    "titles_updated": 8,
    "managers_updated": 3
  },
  "group_changes": {
    "group_additions": 10,
    "group_removals": 3
  }
}
```

## Changelog

### 2026-03-04

- Initial version of the document
