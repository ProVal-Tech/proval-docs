---
id: 'f1a5b7c9-4d6e-4f8a-0b2c-8d9e0f1a2b3c'
slug: /f1a5b7c9-4d6e-4f8a-0b2c-8d9e0f1a2b3c
title: 'Set All PSA Contacts to Inactive'
title_meta: 'Set All PSA Contacts to Inactive'
keywords: ['PSA', 'contacts', 'inactive', 'deactivation', 'offboarding', 'bulk update', 'automation', 'workflow']
description: 'Automatically set all contacts for a PSA company to inactive status. Support client offboarding, contract termination, or bulk contact deactivation with audit trail and notification.'
tags: ['psa', 'contacts', 'offboarding', 'automation']
draft: false
unlisted: false
---

# Summary

This workflow automates the bulk deactivation of all contacts for a specified company in the PSA (Professional Services Automation) system. Commonly used during client offboarding or contract termination, the solution retrieves all active contacts for the target company, validates the deactivation request, sets each contact to inactive status, updates related records, and generates a comprehensive audit trail. By automating this process, the workflow ensures complete contact deactivation, prevents orphaned active contacts, and maintains data integrity during client offboarding.

# Usage

## Prerequisites

Before using this workflow, ensure the following requirements are met:

1. **PSA Integration**: Configure PSA integration (ConnectWise Manage, Autotask, HaloPSA) with contact management permissions
2. **Email Integration**: For notifications

4. **Organizational Variables**:
   - `psa_contact_deactivation_ticket_board`: PSA board for bulk operations
   - `psa_contact_preserve_primary`: Keep primary contact active
   - `psa_contact_notification_recipients`: Alert recipients

## Workflow Inputs

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `company_id` | String | Yes | PSA company ID |
| `exclude_contacts` | Array | No | Contact IDs to exclude from deactivation |
| `preserve_primary` | Boolean | No | Keep primary contact active. Default: `false` |
| `reason` | String | No | Reason for bulk deactivation |
| `confirmation` | Boolean | Yes | Explicit confirmation required. Default: `false` |
| `ticket_id` | String | No | Existing PSA ticket to update |

## Execution

### Manual Trigger
- Execute from PSA ticket or administrative form
- Requires explicit confirmation parameter

### Automated Trigger
- Part of client offboarding workflow

## Deactivation Process Flow

1. **Company Validation**: Verify company exists in PSA
2. **Contact Retrieval**: Fetch all active contacts for the company
3. **Exclusion Processing**: Filter out excluded contacts
4. **Confirmation Check**: Verify explicit confirmation was provided
5. **Pre-Deactivation Snapshot**: Document current contact state
6. **Bulk Deactivation**: Set each contact to inactive status
7. **Related Records Update**: Update associated tickets, configurations
8. **Audit Trail**: Log all changes with timestamps
9. **PSA Update**: Update ticket with deactivation summary
10. **Notification**: Alert requestor and management

# Returned Data

```json
{
  "success": true,
  "deactivation_summary": {
    "company_id": 1234,
    "company_name": "Former Client LLC",
    "total_contacts_found": 45,
    "contacts_deactivated": 43,
    "contacts_excluded": 2,
    "contacts_already_inactive": 0,
    "deactivation_timestamp": "2026-03-04T21:00:00Z",
    "reason": "Client contract terminated - effective 2026-03-01"
  },
  "contacts_deactivated": [
    {
      "contact_id": 5001,
      "name": "Jane Doe",
      "email": "jane.doe@formerclient.com",
      "title": "CEO",
      "previous_status": "Active",
      "new_status": "Inactive"
    },
    {
      "contact_id": 5002,
      "name": "Bob Wilson",
      "email": "bob.wilson@formerclient.com",
      "title": "IT Manager",
      "previous_status": "Active",
      "new_status": "Inactive"
    }
  ],
  "contacts_excluded": [
    {
      "contact_id": 5003,
      "name": "Billing Contact",
      "reason": "Explicitly excluded"
    }
  ],
  "related_updates": {
    "open_tickets_reassigned": 3,
    "configurations_updated": 12,
    "scheduled_tasks_disabled": 5
  },
  "audit_trail": {
    "operation_id": "BULK-DEACT-2026-001",
    "initiated_by": "admin@msp.com",
    "timestamp": "2026-03-04T21:00:00Z",
    "rollback_available": true
  },
  "ticket_id": "CLO-2026-008"
}
```
