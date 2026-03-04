---
id: 'f5a9b1c3-8d0e-4f2a-4b6c-2d3e4f5a6b7c'
slug: /f5a9b1c3-8d0e-4f2a-4b6c-2d3e4f5a6b7c
title: 'Remove Office 365 Licensing'
title_meta: 'Remove Office 365 Licensing'
keywords: ['office 365', 'licensing', 'removal', 'deprovisioning', 'cost management', 'automation', 'workflow']
description: 'Automatically remove Office 365 licenses from user accounts. Support user offboarding, license optimization, and cost management by reclaiming unused or unnecessary licenses.'
tags: ['office 365', 'licensing', 'deprovisioning', 'automation']
draft: false
unlisted: false
---

# Summary

This workflow automates the removal of Microsoft 365 licenses from user accounts. The solution supports various scenarios including user offboarding, license optimization, and cost management. The workflow validates the user identity, documents currently assigned licenses, performs pre-removal checks (mailbox backup, data retention), removes specified or all licenses, and verifies the removal was successful. By automating license removal, the workflow ensures consistent deprovisioning, prevents orphaned licenses, and supports cost optimization through timely license reclamation.

# Usage

## Prerequisites

Before using this workflow, ensure the following requirements are met:

1. **Microsoft 365 Integration**: Configure M365 integration with license management permissions
2. **PSA Integration**: For ticket tracking
3. **Email Integration**: For notifications

4. **Organizational Variables**:
   - `m365_license_removal_ticket_board`: PSA board for license changes
   - `m365_license_backup_mailbox`: Archive mailbox before removal
   - `m365_license_grace_period_days`: Days to wait before removal
   - `m365_license_notification_recipients`: Alert recipients

## Workflow Inputs

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `user_email` | String | Yes | User email address |
| `company_id` | String | Yes | PSA company ID |
| `license_skus` | Array | No | Specific license SKUs to remove (defaults to all) |
| `backup_mailbox` | Boolean | No | Backup mailbox before removal. Default: `true` |
| `convert_to_shared` | Boolean | No | Convert to shared mailbox first. Default: `false` |
| `ticket_id` | String | No | Existing PSA ticket to update |
| `reason` | String | No | Reason for removal |

## Execution

### Manual Trigger
- Execute from PSA ticket or form submission

### Automated Trigger
- Part of user offboarding workflow
- License optimization workflow

## Removal Process Flow

1. **User Validation**: Verify user exists in M365 tenant
2. **License Inventory**: Document currently assigned licenses
3. **Pre-Removal Checks**: Verify mailbox backup, data retention compliance
4. **Mailbox Conversion**: Convert to shared mailbox if requested
5. **License Removal**: Remove specified or all licenses
6. **Verification**: Confirm licenses were successfully removed
7. **Service Validation**: Verify services are properly deactivated
8. **PSA Update**: Update ticket with removal details
9. **Cost Documentation**: Log license cost savings
10. **Notification**: Alert requestor of completion

# Returned Data

```json
{
  "success": true,
  "removal_summary": {
    "user_email": "john.smith@acmecorp.com",
    "user_display_name": "John Smith",
    "company": "Acme Corp",
    "licenses_removed": [
      {
        "sku": "ENTERPRISEPACK",
        "name": "Office 365 E3",
        "monthly_cost": 36.00
      },
      {
        "sku": "POWER_BI_STANDARD",
        "name": "Power BI (free)",
        "monthly_cost": 0.00
      }
    ],
    "total_licenses_removed": 2,
    "monthly_savings": 36.00,
    "annual_savings": 432.00
  },
  "pre_removal_actions": {
    "mailbox_backed_up": true,
    "backup_location": "shared-mailbox-archive",
    "converted_to_shared": true,
    "data_retention_compliant": true
  },
  "verification": {
    "licenses_remaining": 0,
    "services_deactivated": ["Exchange Online", "SharePoint Online", "Teams", "Office Apps"],
    "mailbox_type": "SharedMailbox"
  },
  "ticket_id": "OFF-2026-015",
  "reason": "Employee termination - effective 2026-03-01"
}
```
