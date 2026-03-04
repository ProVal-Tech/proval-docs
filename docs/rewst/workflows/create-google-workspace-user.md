---
id: 'd9e3f5a7-2b4c-4d6e-8f0a-6b7c8d9e0f1a'
slug: /d9e3f5a7-2b4c-4d6e-8f0a-6b7c8d9e0f1a
title: 'Create Google Workspace User'
title_meta: 'Create Google Workspace User'
keywords: ['google workspace', 'user creation', 'onboarding', 'provisioning', 'gmail', 'automation', 'workflow']
description: 'Automatically create Google Workspace user accounts with proper organizational unit placement, group memberships, license assignment, and application access configuration.'
tags: ['google-workspace', 'user-creation', 'onboarding', 'automation']
draft: false
unlisted: false
last_update:
  date: 2026-03-04
---

# Summary

This workflow automates the creation of Google Workspace user accounts as part of the user onboarding process. The solution creates the user account, places it in the correct organizational unit, assigns appropriate licenses, configures group memberships, sets up email aliases, configures application access, and delivers credentials securely. By automating Google Workspace provisioning, the workflow ensures consistent account configuration, reduces onboarding time, eliminates manual errors, and maintains compliance with organizational standards.

# Usage

## Prerequisites

Before using this workflow, ensure the following requirements are met:

1. **Google Workspace Integration**: Configure Google Workspace integration with admin directory API access
2. **PSA Integration**: For ticket tracking
3. **Email Integration**: For notifications and credential delivery

4. **Organizational Variables**:
   - `google_user_creation_ticket_board`: PSA board for onboarding tasks
   - `google_default_ou`: Default organizational unit path
   - `google_department_ou_mapping`: Map departments to OUs
   - `google_default_license`: Default license SKU
   - `google_department_groups`: Department-specific group mappings
   - `google_default_groups`: Default groups for all users
   - `google_password_policy`: Initial password generation rules

## Workflow Inputs

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `first_name` | String | Yes | User's first name |
| `last_name` | String | Yes | User's last name |
| `company_id` | String | Yes | PSA company ID |
| `department` | String | Yes | Department name |
| `title` | String | Yes | Job title |
| `manager_email` | String | No | Manager's email address |
| `license_sku` | String | No | License to assign (default: org variable) |
| `email_aliases` | Array | No | Additional email aliases |
| `custom_ou` | String | No | Override default OU path |
| `additional_groups` | Array | No | Extra groups beyond defaults |
| `ticket_id` | String | No | Existing PSA ticket to update |

## Execution

### Manual Trigger
- Execute from PSA ticket or onboarding form

### Automated Trigger
- Part of new user onboarding workflow
- Triggered by HR system integration

## Creation Process Flow

1. **Input Validation**: Verify required fields and domain mapping
2. **Email Generation**: Generate primary email address
3. **Duplicate Check**: Verify email doesn't already exist
4. **OU Determination**: Map department to organizational unit
5. **Password Generation**: Generate initial password per policy
6. **User Creation**: Create Google Workspace user account
7. **License Assignment**: Assign appropriate Google Workspace license
8. **OU Placement**: Move user to correct organizational unit
9. **Group Assignment**: Add to default and department groups
10. **Email Aliases**: Configure additional email aliases
11. **Application Access**: Configure app-specific settings
12. **Credential Delivery**: Send credentials via secure method
13. **PSA Update**: Update ticket with account details
14. **Notification**: Alert requestor and manager

# Returned Data

```json
{
  "success": true,
  "user_created": {
    "primary_email": "john.smith@techco.com",
    "display_name": "John Smith",
    "first_name": "John",
    "last_name": "Smith",
    "organizational_unit": "/Engineering",
    "department": "Engineering",
    "title": "Software Developer",
    "manager": "sarah.jones@techco.com",
    "account_enabled": true,
    "password_must_change": true,
    "creation_timestamp": "2026-03-04T19:00:00Z"
  },
  "license": {
    "sku": "Google-Apps-For-Business",
    "name": "Google Workspace Business Standard",
    "assigned": true
  },
  "email_aliases": [
    {
      "alias": "jsmith@techco.com",
      "created": true
    }
  ],
  "group_memberships": [
    {
      "group": "all-company@techco.com",
      "type": "Default",
      "added": true
    },
    {
      "group": "engineering@techco.com",
      "type": "Department",
      "added": true
    },
    {
      "group": "dev-team@techco.com",
      "type": "Department",
      "added": true
    }
  ],
  "application_access": {
    "gmail": "Enabled",
    "drive": "Enabled",
    "calendar": "Enabled",
    "meet": "Enabled",
    "chat": "Enabled"
  },
  "credential_delivery": {
    "method": "Secure email to manager",
    "delivered_to": "sarah.jones@techco.com",
    "temporary_password": true
  },
  "ticket_id": "ONB-2026-023"
}
```

## Changelog

### 2026-03-04

- Initial version of the document
