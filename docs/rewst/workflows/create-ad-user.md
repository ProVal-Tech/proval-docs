---
id: 'c8d2e4f6-1a3b-4c5d-7e9f-5a6b7c8d9e0f'
slug: /c8d2e4f6-1a3b-4c5d-7e9f-5a6b7c8d9e0f
title: 'Create Active Directory User'
title_meta: 'Create Active Directory User'
keywords: ['active directory', 'AD', 'user creation', 'onboarding', 'provisioning', 'automation', 'workflow']
description: 'Automatically create Active Directory user accounts with proper OU placement, group memberships, attributes, and home directory configuration. Streamline user onboarding with consistent AD provisioning.'
tags: ['active-directory', 'user-creation', 'onboarding', 'automation']
draft: false
unlisted: false
---

# Summary

This workflow automates the creation of Active Directory user accounts as part of the user onboarding process. The solution creates the user object with proper naming conventions, places it in the correct Organizational Unit, sets standard and custom attributes, assigns security and distribution group memberships, configures home directory and profile paths, sets initial password with change-at-next-logon, and enables the account. By automating AD user creation, the workflow ensures consistent provisioning, reduces onboarding time, eliminates manual configuration errors, and maintains compliance with organizational naming and security standards.

# Usage

## Prerequisites

Before using this workflow, ensure the following requirements are met:

1. **Active Directory Integration**: Configure AD integration via RMM agent or Rewst agent with user management permissions
2. **PSA Integration**: For ticket tracking
3. **Email Integration**: For notifications and credential delivery

4. **Organizational Variables**:
   - `ad_user_creation_ticket_board`: PSA board for onboarding tasks
   - `ad_default_ou`: Default OU for new users
   - `ad_department_ou_mapping`: Map departments to OUs
   - `ad_username_format`: Username format (e.g., `first.last`, `flast`)
   - `ad_default_groups`: Default security groups for all users
   - `ad_department_groups`: Department-specific group mappings
   - `ad_home_directory_path`: UNC path for home directories
   - `ad_password_policy`: Initial password generation rules

## Workflow Inputs

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `first_name` | String | Yes | User's first name |
| `last_name` | String | Yes | User's last name |
| `company_id` | String | Yes | PSA company ID |
| `department` | String | Yes | Department name |
| `title` | String | Yes | Job title |
| `manager` | String | No | Manager's AD username or email |
| `office_location` | String | No | Office/site location |
| `phone_number` | String | No | Business phone number |
| `employee_id` | String | No | Employee ID number |
| `custom_ou` | String | No | Override default OU path |
| `additional_groups` | Array | No | Extra groups beyond defaults |
| `create_home_directory` | Boolean | No | Create home folder. Default: `true` |
| `ticket_id` | String | No | Existing PSA ticket to update |

## Execution

### Manual Trigger
- Execute from PSA ticket or onboarding form

### Automated Trigger
- Part of new user onboarding workflow
- Triggered by HR system integration

## Creation Process Flow

1. **Input Validation**: Verify required fields and company mapping
2. **Username Generation**: Generate username per naming convention
3. **Duplicate Check**: Verify username doesn't already exist
4. **OU Determination**: Map department to appropriate OU
5. **Password Generation**: Generate initial password per policy
6. **User Creation**: Create AD user object with all attributes
7. **Group Assignment**: Add user to default and department groups
8. **Home Directory**: Create home folder and set permissions
9. **Profile Configuration**: Set profile path and logon script
10. **Account Enablement**: Enable the user account
11. **Credential Delivery**: Send credentials via secure method
12. **PSA Update**: Update ticket with account details
13. **Notification**: Alert requestor and manager

# Returned Data

```json
{
  "success": true,
  "user_created": {
    "display_name": "John Smith",
    "username": "john.smith",
    "sam_account_name": "john.smith",
    "user_principal_name": "john.smith@acmecorp.local",
    "email": "john.smith@acmecorp.com",
    "distinguished_name": "CN=John Smith,OU=Sales,OU=Users,DC=acmecorp,DC=local",
    "department": "Sales",
    "title": "Account Executive",
    "manager": "CN=Jane Doe,OU=Sales,OU=Users,DC=acmecorp,DC=local",
    "office": "New York - HQ",
    "phone": "555-0150",
    "employee_id": "EMP-2026-045",
    "account_enabled": true,
    "password_must_change": true
  },
  "group_memberships": [
    {
      "group": "Domain Users",
      "type": "Default",
      "added": true
    },
    {
      "group": "All-Employees",
      "type": "Default",
      "added": true
    },
    {
      "group": "Sales-Team",
      "type": "Department",
      "added": true
    },
    {
      "group": "VPN-Users",
      "type": "Default",
      "added": true
    },
    {
      "group": "CRM-Access",
      "type": "Department",
      "added": true
    }
  ],
  "home_directory": {
    "created": true,
    "path": "\\\\fileserver\\home$\\john.smith",
    "permissions_set": true
  },
  "credential_delivery": {
    "method": "Secure email to manager",
    "delivered_to": "jane.doe@acmecorp.com",
    "temporary_password": true
  },
  "ticket_id": "ONB-2026-022"
}
```
