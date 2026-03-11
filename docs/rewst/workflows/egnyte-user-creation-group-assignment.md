---
id: 'e4a7c9b2-8d3f-4e5a-b1c6-9f2d7e8a3b5c'
slug: /e4a7c9b2-8d3f-4e5a-b1c6-9f2d7e8a3b5c
title: 'Egnyte User Creation and Group Assignment'
title_meta: 'Egnyte User Creation and Group Assignment'
keywords: ['egnyte', 'user creation', 'group assignment', 'file sharing', 'automation', 'provisioning', 'workflow']
description: 'Automatically create Egnyte user accounts and assign them to appropriate groups based on role, department, and access requirements. Streamline file sharing platform provisioning with automated user and group management.'
tags: ['egnyte', 'automation', 'provisioning']
draft: false
unlisted: false
last_update:
  date: 2026-03-04
---

# Summary

This workflow automates the creation of user accounts in Egnyte and assigns them to the appropriate groups based on role, department, and organizational access requirements. The solution provisions new Egnyte accounts with the correct user type, authentication settings, and storage quotas, then adds users to relevant groups that govern folder access and permissions. By automating this process, the workflow eliminates manual provisioning steps, ensures consistent group-based access control, reduces onboarding delays, and maintains organized permission structures across the Egnyte file sharing platform.

# Usage

## Prerequisites

Before using this workflow, ensure the following requirements are met:

1. **Egnyte Integration**: Configure the Egnyte API integration in Rewst with the following:
   - Egnyte domain URL (e.g., `https://company.egnyte.com`)
   - API key with administrative privileges
   - OAuth 2.0 credentials (client ID and secret)
   - The following API scopes:
     - User management (create, read, update)
     - Group management (read, update, add members)
     - Folder/permission management (read)

2. **Egnyte Administrative Access**: Ensure the API account has:
   - Power User or Administrator role
   - Ability to create and manage users
   - Ability to manage group memberships
   - Access to all relevant groups and folders

3. **Organizational Variables**: Configure the following organizational variables in your Rewst environment:
   - `egnyte_domain`: Egnyte domain URL (e.g., `company.egnyte.com`)
   - `egnyte_default_user_type`: Default user type (`standard`, `power`, `admin`)
   - `egnyte_default_auth_type`: Authentication type (`egnyte`, `sso`, `ad`)
   - `egnyte_default_role`: Default role for new users
   - `egnyte_storage_quota_gb`: Default storage quota in GB per user
   - `egnyte_send_invite_email`: Boolean to send Egnyte invite email

4. **Group Structure**: Define and maintain:
   - Department-based groups (e.g., `Sales`, `Engineering`, `Finance`)
   - Role-based groups (e.g., `Managers`, `Executives`, `Contractors`)
   - Project-based groups (e.g., `Project-Alpha`, `Project-Beta`)
   - Access-level groups (e.g., `Confidential-Access`, `Public-Read-Only`)
   - Company-wide groups (e.g., `All-Staff`, `All-Employees`)

5. **Group Mapping**: Create a mapping of roles/departments to Egnyte groups:
   - Department to group assignments
   - Job title to additional group assignments
   - Location-based group assignments
   - Default groups for all new users

## Configuration Steps

1. Import the workflow into your Rewst environment
2. Configure the Egnyte API integration with proper credentials
3. Set up the organizational variables listed above
4. Define department-to-group and role-to-group mappings
5. Configure default user settings (user type, auth, quota)
6. Set up invitation email templates
7. Configure notification recipients for new user creation
8. Define approval workflows if required
9. Test the workflow with a test user account
10. Validate group memberships and folder access

## Workflow Inputs

The workflow expects the following input parameters:

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `first_name` | String | Yes | User's first name |
| `last_name` | String | Yes | User's last name |
| `email` | String | Yes | User's email address (used as Egnyte username) |
| `department` | String | Yes | Department name for group mapping |
| `job_title` | String | No | Job title for role-based group assignment |
| `user_type` | String | No | Egnyte user type: `standard`, `power`, or `admin`. Default: `standard` |
| `auth_type` | String | No | Authentication method: `egnyte`, `sso`, or `ad`. Default: `sso` |
| `role` | String | No | Egnyte role assignment |
| `storage_quota_gb` | Number | No | Storage quota in GB. Default: org variable value |
| `groups` | Array | No | Specific Egnyte group names to add user to |
| `additional_groups` | Array | No | Extra groups beyond department/role defaults |
| `company_name` | String | No | Company name for MSP environments |
| `office_location` | String | No | Office location for location-based group assignment |
| `send_invite` | Boolean | No | Send Egnyte invitation email to user. Default: `true` |
| `manager_email` | String | No | Manager email for notification |
| `skip_group_defaults` | Boolean | No | Skip default group assignments, use only specified groups. Default: `false` |

## Execution

### Form Trigger (Recommended)
Create a form in Rewst for IT or HR to submit:
1. Navigate to the Egnyte provisioning form
2. Fill in user details and department
3. Select or confirm group assignments
4. Submit the form to trigger the workflow

### Onboarding Integration
Integrate with the new user onboarding workflow:
- Trigger automatically as a sub-workflow during employee onboarding
- Receive user details from the parent onboarding workflow
- Return results to the onboarding summary

### HR System Integration
Configure automatic triggers when:
- A new employee record is created in the HR system
- An employee's department or role changes (for group updates)
- A contractor or temporary worker is provisioned

### Manual Trigger
1. Navigate to the workflow in the Rewst platform
2. Click "Run Workflow"
3. Enter user details and group preferences
4. Review the configuration and click "Execute"

### API Trigger
Integrate with external systems by calling the Rewst API endpoint with user details in JSON format.

### Bulk Provisioning
Process multiple users at once:
1. Provide a CSV or JSON array of user records
2. Workflow iterates through each user
3. Creates accounts and assigns groups sequentially
4. Generates a summary report of all actions

## Provisioning Process Flow

The workflow executes the following steps in sequence:

1. **Input Validation**: Verify all required fields and validate email format
2. **Duplicate Check**: Check if user already exists in Egnyte by email or username
3. **Group Resolution**: Map department and role to Egnyte groups
4. **Group Verification**: Confirm all target groups exist in Egnyte
5. **User Creation**: Create the Egnyte user account with specified settings
6. **Group Assignment**: Add user to each resolved group
7. **Permission Verification**: Confirm group-based folder permissions are inherited
8. **Invitation Email**: Send Egnyte invitation to the user (if enabled)
9. **Manager Notification**: Notify manager of account creation
10. **IT Notification**: Alert IT team of new Egnyte account
11. **Documentation**: Log all actions for audit purposes

## Post-Execution Steps

After the workflow completes successfully:

1. **Verify Account Creation**:
   - Confirm user appears in Egnyte admin console
   - Verify user type and authentication settings
   - Check storage quota is applied correctly

2. **Validate Group Memberships**:
   - Confirm user is listed in all assigned groups
   - Verify folder access inherited from groups
   - Test file/folder visibility and permissions

3. **User Communication**:
   - Confirm invitation email was received
   - Provide login instructions if needed
   - Share folder structure overview with new user

4. **Access Testing**:
   - Have user log in and verify access
   - Test file upload and download in assigned folders
   - Verify no access to restricted folders

5. **Documentation**:
   - Update user provisioning records
   - Log group assignments for audit
   - Note any special access requirements

# Returned Data

The workflow returns the following data upon completion:

```json
{
  "success": true,
  "user_info": {
    "egnyte_user_id": 12345678,
    "username": "john.smith",
    "email": "john.smith@company.com",
    "first_name": "John",
    "last_name": "Smith",
    "display_name": "John Smith",
    "department": "Sales",
    "job_title": "Account Executive"
  },
  "account_details": {
    "created": true,
    "created_timestamp": "2026-03-04T15:30:00Z",
    "user_type": "standard",
    "auth_type": "sso",
    "role": "Standard User",
    "status": "active",
    "storage_quota_gb": 25,
    "egnyte_domain": "company.egnyte.com",
    "login_url": "https://company.egnyte.com"
  },
  "group_assignments": {
    "total_groups_assigned": 5,
    "groups": [
      {
        "group_name": "All-Staff",
        "group_id": "grp-001",
        "assignment_source": "default",
        "added": true,
        "folder_access_granted": [
          "/Shared/Company-Wide",
          "/Shared/Announcements",
          "/Shared/Templates"
        ]
      },
      {
        "group_name": "Sales",
        "group_id": "grp-045",
        "assignment_source": "department",
        "added": true,
        "folder_access_granted": [
          "/Shared/Sales",
          "/Shared/Sales/Proposals",
          "/Shared/Sales/Collateral",
          "/Shared/Sales/Pipeline-Reports"
        ]
      },
      {
        "group_name": "CRM-Users",
        "group_id": "grp-067",
        "assignment_source": "role",
        "added": true,
        "folder_access_granted": [
          "/Shared/CRM-Resources",
          "/Shared/CRM-Exports"
        ]
      },
      {
        "group_name": "Seattle-Office",
        "group_id": "grp-112",
        "assignment_source": "location",
        "added": true,
        "folder_access_granted": [
          "/Shared/Offices/Seattle"
        ]
      },
      {
        "group_name": "Q1-Sales-Campaign",
        "group_id": "grp-189",
        "assignment_source": "additional",
        "added": true,
        "folder_access_granted": [
          "/Shared/Projects/Q1-Campaign"
        ]
      }
    ],
    "groups_not_found": [],
    "groups_failed": []
  },
  "permissions_summary": {
    "total_folders_accessible": 12,
    "folder_permissions": [
      {
        "folder_path": "/Shared/Company-Wide",
        "permission_level": "Viewer",
        "inherited_from": "All-Staff"
      },
      {
        "folder_path": "/Shared/Sales",
        "permission_level": "Full",
        "inherited_from": "Sales"
      },
      {
        "folder_path": "/Shared/Sales/Proposals",
        "permission_level": "Editor",
        "inherited_from": "Sales"
      },
      {
        "folder_path": "/Shared/Sales/Collateral",
        "permission_level": "Viewer",
        "inherited_from": "Sales"
      }
    ]
  },
  "notifications_sent": {
    "invitation_email": {
      "sent": true,
      "recipient": "john.smith@company.com",
      "sent_timestamp": "2026-03-04T15:30:30Z",
      "includes_login_instructions": true
    },
    "manager_notification": {
      "sent": true,
      "recipient": "jane.doe@company.com",
      "sent_timestamp": "2026-03-04T15:30:45Z"
    },
    "it_notification": {
      "sent": true,
      "recipients": ["it-team@company.com"],
      "sent_timestamp": "2026-03-04T15:31:00Z"
    }
  },
  "audit_trail": {
    "workflow_run_id": "egnyte-prov-12345",
    "initiated_by": "hr.admin@company.com",
    "initiated_timestamp": "2026-03-04T15:29:45Z",
    "completed_timestamp": "2026-03-04T15:31:00Z",
    "duration_seconds": 75,
    "all_steps_successful": true
  }
}
```

## Data Structure Details

### Success Indicators
- `success`: Boolean indicating whether the workflow completed successfully
- `user_info`: Complete user details as created in Egnyte

### Account Details
- **created**: Whether the account was successfully created
- **user_type**: Egnyte user type assigned (`standard`, `power`, `admin`)
- **auth_type**: Authentication method configured (`egnyte`, `sso`, `ad`)
- **storage_quota_gb**: Storage quota allocated to the user
- **login_url**: Direct URL for the user to access Egnyte

### Group Assignments
- **total_groups_assigned**: Number of groups the user was added to
- **groups**: Array of each group with assignment source, status, and folder access granted
- **assignment_source**: How the group was determined (`default`, `department`, `role`, `location`, `additional`)
- **groups_not_found**: Groups specified but not found in Egnyte
- **groups_failed**: Groups where membership addition failed

### Permissions Summary
- **total_folders_accessible**: Total number of folders the user can access
- **folder_permissions**: Detailed list of folders with permission levels and inheritance source

### Notifications Sent
Confirmation of invitation email, manager notification, and IT team notification

## Error Handling

If the workflow encounters errors during provisioning:

```json
{
  "success": false,
  "partial_completion": true,
  "user_info": {
    "email": "john.smith@company.com",
    "first_name": "John",
    "last_name": "Smith"
  },
  "completed_steps": [
    "input_validation",
    "duplicate_check",
    "group_resolution",
    "user_creation"
  ],
  "failed_steps": [
    {
      "step": "group_assignment",
      "error": {
        "type": "GROUP_NOT_FOUND",
        "message": "Group 'Sales-West' does not exist in Egnyte",
        "code": "ERR-GRP-001",
        "timestamp": "2026-03-04T15:30:15Z",
        "affected_group": "Sales-West"
      },
      "impact": "User created but not added to 1 of 5 groups",
      "remediation": "Create the group in Egnyte admin console or update group mapping"
    }
  ],
  "account_created": true,
  "groups_assigned": 4,
  "groups_failed": 1,
  "manual_intervention_required": true,
  "recommended_actions": [
    "Verify group 'Sales-West' exists in Egnyte admin console",
    "Create the missing group or update the department-to-group mapping",
    "Manually add the user to the correct group"
  ]
}
```

Common error types:
- `USER_ALREADY_EXISTS`: Email or username already registered in Egnyte
- `GROUP_NOT_FOUND`: Specified group does not exist
- `GROUP_MEMBERSHIP_FAILED`: Unable to add user to group
- `INVALID_USER_TYPE`: Invalid user type specified
- `QUOTA_EXCEEDED`: Storage quota exceeds available allocation
- `LICENSE_LIMIT_REACHED`: Maximum Egnyte user licenses consumed
- `API_RATE_LIMIT`: Egnyte API rate limit exceeded
- `AUTHENTICATION_FAILED`: Egnyte API credentials invalid or expired
- `INVALID_EMAIL_FORMAT`: Email address format is invalid
- `SSO_CONFIGURATION_MISSING`: SSO not configured for specified auth type

## Best Practices

1. **Group Organization**: Maintain a clear group naming convention and structure in Egnyte
2. **Default Groups**: Define universal groups that all users should be added to
3. **Role Templates**: Create standardized group assignment templates by role and department
4. **Duplicate Prevention**: Always check for existing accounts before creating new ones
5. **SSO Integration**: Use SSO authentication when available for seamless access
6. **Storage Quotas**: Set appropriate quotas by role to manage storage costs
7. **Least Privilege**: Assign minimum necessary group memberships and permissions
8. **Regular Audits**: Periodically review group memberships and remove stale access
9. **Documentation**: Maintain a current group-to-folder mapping document
10. **Onboarding Integration**: Pair with user onboarding workflow for complete provisioning
11. **Offboarding Coordination**: Ensure corresponding offboarding workflow removes Egnyte access
12. **Bulk Provisioning**: Use batch mode for onboarding multiple users simultaneously
13. **Testing**: Test with non-production groups before deploying changes to group mappings
14. **Notification Management**: Keep notification recipients current to avoid missed alerts
15. **License Monitoring**: Track Egnyte license usage to avoid hitting limits during provisioning

## Changelog

### 2026-03-04

- Initial version of the document
