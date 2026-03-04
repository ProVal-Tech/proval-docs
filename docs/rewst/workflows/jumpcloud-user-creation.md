---
id: 'a2d8f4b6-3c7e-4a9d-b5e1-8f6c2d9a4b7e'
slug: /a2d8f4b6-3c7e-4a9d-b5e1-8f6c2d9a4b7e
title: 'JumpCloud User Creation'
title_meta: 'JumpCloud User Creation'
keywords: ['jumpcloud', 'user creation', 'directory', 'identity management', 'provisioning', 'automation', 'workflow']
description: 'Automatically create user accounts in JumpCloud with proper group memberships, system bindings, and directory configurations. Streamline identity provisioning with automated JumpCloud user management.'
tags: ['jumpcloud', 'automation', 'provisioning', 'identity']
draft: false
unlisted: false
---

# Summary

This workflow automates the creation of user accounts in JumpCloud, configuring identity attributes, group memberships, system bindings, application access, and MFA policies. The solution provisions new JumpCloud users with the correct organizational settings, assigns them to user groups that govern system and application access, and optionally binds them to specific devices. By automating this process, the workflow ensures consistent identity provisioning, enforces security baselines from day one, reduces onboarding delays, and maintains a centralized directory that governs access across all connected resources.

# Usage

## Prerequisites

Before using this workflow, ensure the following requirements are met:

1. **JumpCloud Integration**: Configure the JumpCloud API integration in Rewst with the following:
   - JumpCloud API key with administrative privileges
   - Organization ID (for multi-tenant environments)
   - API v1 and v2 access enabled
   - The following API capabilities:
     - System user management (create, read, update)
     - User group management (read, update, add members)
     - System group management (read)
     - Application access management (read)
     - MFA configuration access

2. **JumpCloud Administrative Access**: Ensure the API key has:
   - Administrator-level permissions
   - Ability to create and manage users
   - Ability to manage group memberships
   - Access to all relevant user groups and system groups

3. **Organizational Variables**: Configure the following organizational variables in your Rewst environment:
   - `jumpcloud_org_id`: JumpCloud Organization ID
   - `jumpcloud_default_mfa`: Enable MFA for new users (`true`/`false`)
   - `jumpcloud_mfa_exclusion_period_days`: Days before MFA is enforced (grace period)
   - `jumpcloud_password_policy`: Password complexity requirements
   - `jumpcloud_default_allow_public_key`: Allow SSH public key authentication
   - `jumpcloud_default_sudo`: Grant sudo access by default (`true`/`false`)
   - `jumpcloud_default_password_never_expires`: Password expiration policy
   - `jumpcloud_send_activation_email`: Send JumpCloud activation email to new users

4. **Group Structure**: Define and maintain JumpCloud groups:
   - Department-based user groups (e.g., `UG-Sales`, `UG-Engineering`)
   - Role-based user groups (e.g., `UG-Managers`, `UG-Contractors`)
   - System groups for device access (e.g., `SG-Windows-Workstations`, `SG-Linux-Servers`)
   - Application groups for SaaS access (e.g., `UG-Salesforce-Users`, `UG-AWS-Access`)
   - Policy groups for configuration management
   - Company-wide groups (e.g., `UG-All-Employees`)

5. **Group-to-Resource Mapping**: Define mappings for:
   - User groups to system groups (device access)
   - User groups to LDAP directories
   - User groups to RADIUS networks
   - User groups to SSO applications
   - User groups to policy configurations

## Configuration Steps

1. Import the workflow into your Rewst environment
2. Configure the JumpCloud API integration with proper credentials
3. Set up the organizational variables listed above
4. Define department-to-group and role-to-group mappings
5. Configure default user settings (MFA, sudo, password policy)
6. Set up activation email templates
7. Configure notification recipients for new user creation
8. Define system binding rules if applicable
9. Test the workflow with a test user account
10. Validate group memberships and resource access

## Workflow Inputs

The workflow expects the following input parameters:

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `first_name` | String | Yes | User's first name |
| `last_name` | String | Yes | User's last name |
| `email` | String | Yes | User's email address |
| `username` | String | Yes | JumpCloud username (typically `firstname.lastname`) |
| `department` | String | Yes | Department name for group mapping |
| `job_title` | String | No | Job title for role-based group assignment |
| `company_name` | String | No | Company name for MSP environments |
| `employee_id` | String | No | Employee identifier |
| `office_location` | String | No | Office location for location-based policies |
| `manager_email` | String | No | Manager email for notification |
| `password` | String | No | Initial password (auto-generated if not provided) |
| `password_never_expires` | Boolean | No | Disable password expiration. Default: `false` |
| `enable_mfa` | Boolean | No | Require MFA enrollment. Default: `true` |
| `mfa_exclusion_days` | Number | No | MFA grace period in days. Default: 7 |
| `allow_sudo` | Boolean | No | Grant sudo/admin on bound systems. Default: `false` |
| `unix_uid` | Number | No | Custom UNIX UID (auto-assigned if not provided) |
| `unix_guid` | Number | No | Custom UNIX GID (auto-assigned if not provided) |
| `user_groups` | Array | No | Specific JumpCloud user group names to add to |
| `additional_groups` | Array | No | Extra groups beyond department/role defaults |
| `system_bindings` | Array | No | Specific system IDs to bind the user to |
| `ldap_bind` | Boolean | No | Bind user as LDAP user. Default: `false` |
| `allow_public_key` | Boolean | No | Allow SSH public key auth. Default: `false` |
| `public_key` | String | No | SSH public key to add to user account |
| `send_activation_email` | Boolean | No | Send JumpCloud activation email. Default: `true` |
| `skip_group_defaults` | Boolean | No | Skip default group assignments. Default: `false` |
| `attributes` | Object | No | Custom attributes to set on the user |

## Execution

### Form Trigger (Recommended)
Create a form in Rewst for IT or HR to submit:
1. Navigate to the JumpCloud provisioning form
2. Fill in user details, department, and role
3. Select or confirm group assignments and access
4. Submit the form to trigger the workflow

### Onboarding Integration
Integrate with the new user onboarding workflow:
- Trigger automatically as a sub-workflow during employee onboarding
- Receive user details from the parent onboarding workflow
- Return account details to the onboarding summary

### HR System Integration
Configure automatic triggers when:
- A new employee record is created in the HR system
- An employee's department or role changes (for group updates)
- A contractor or temporary worker is provisioned

### Manual Trigger
1. Navigate to the workflow in the Rewst platform
2. Click "Run Workflow"
3. Enter user details and configuration preferences
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

1. **Input Validation**: Verify all required fields, validate email and username format
2. **Duplicate Check**: Check if username or email already exists in JumpCloud
3. **Password Handling**: Generate secure password if not provided
4. **Group Resolution**: Map department, role, and location to JumpCloud user groups
5. **Group Verification**: Confirm all target groups exist in JumpCloud
6. **User Creation**: Create the JumpCloud system user with specified attributes
7. **Custom Attributes**: Apply any custom attributes to the user account
8. **User Group Assignment**: Add user to each resolved user group
9. **System Binding**: Bind user to specified systems or systems inherited from groups
10. **LDAP Binding**: Configure LDAP access if enabled
11. **SSH Key Configuration**: Add SSH public key if provided
12. **MFA Configuration**: Set MFA enrollment and exclusion period
13. **Activation Email**: Send JumpCloud activation email to the user
14. **Manager Notification**: Notify manager of account creation
15. **IT Notification**: Alert IT team of new JumpCloud account
16. **Documentation**: Log all actions for audit purposes

## Post-Execution Steps

After the workflow completes successfully:

1. **Verify Account Creation**:
   - Confirm user appears in JumpCloud admin console
   - Verify user status is Active or Activated
   - Check all attributes are set correctly

2. **Validate Group Memberships**:
   - Confirm user is listed in all assigned user groups
   - Verify inherited system and application access from groups
   - Check LDAP and RADIUS bindings if configured

3. **User Activation**:
   - Confirm activation email was received by user
   - Guide user through initial password setup
   - Assist with MFA enrollment

4. **Access Testing**:
   - Have user log in to verify credentials
   - Test system access on bound devices
   - Verify SSO application access through groups
   - Test LDAP authentication if applicable

5. **Documentation**:
   - Update user provisioning records
   - Log group assignments for audit
   - Note any special access or custom attributes

# Returned Data

The workflow returns the following data upon completion:

```json
{
  "success": true,
  "user_info": {
    "jumpcloud_user_id": "60a1b2c3d4e5f6a7b8c9d0e1",
    "username": "john.smith",
    "email": "john.smith@company.com",
    "first_name": "John",
    "last_name": "Smith",
    "display_name": "John Smith",
    "department": "Engineering",
    "job_title": "Software Developer",
    "employee_id": "EMP-2026-042"
  },
  "account_details": {
    "created": true,
    "created_timestamp": "2026-03-04T15:30:00Z",
    "account_status": "activated",
    "activation_email_sent": true,
    "organization_id": "5f9a8b7c6d5e4f3a2b1c0d9e",
    "login_portal": "https://console.jumpcloud.com/login"
  },
  "security_settings": {
    "mfa_required": true,
    "mfa_configured": false,
    "mfa_exclusion_until": "2026-03-11T15:30:00Z",
    "mfa_exclusion_days": 7,
    "password_set": true,
    "password_never_expires": false,
    "password_expiration_date": "2026-06-02T15:30:00Z",
    "allow_public_key_auth": false,
    "ssh_public_key_added": false,
    "sudo_enabled": false,
    "ldap_binding_user": false
  },
  "unix_attributes": {
    "uid": 5042,
    "gid": 5042,
    "home_directory": "/home/john.smith",
    "default_shell": "/bin/bash"
  },
  "group_assignments": {
    "total_groups_assigned": 5,
    "groups": [
      {
        "group_name": "UG-All-Employees",
        "group_id": "60b1c2d3e4f5a6b7c8d9e0f1",
        "group_type": "user_group",
        "assignment_source": "default",
        "added": true,
        "inherited_access": {
          "systems": 0,
          "applications": ["Google Workspace", "Slack"],
          "ldap_servers": 0,
          "radius_servers": 1
        }
      },
      {
        "group_name": "UG-Engineering",
        "group_id": "60c2d3e4f5a6b7c8d9e0f1a2",
        "group_type": "user_group",
        "assignment_source": "department",
        "added": true,
        "inherited_access": {
          "systems": 3,
          "applications": ["GitHub", "Jira", "AWS Console"],
          "ldap_servers": 1,
          "radius_servers": 0
        }
      },
      {
        "group_name": "UG-Developers",
        "group_id": "60d3e4f5a6b7c8d9e0f1a2b3",
        "group_type": "user_group",
        "assignment_source": "role",
        "added": true,
        "inherited_access": {
          "systems": 5,
          "applications": ["GitLab", "Docker Hub"],
          "ldap_servers": 0,
          "radius_servers": 0
        }
      },
      {
        "group_name": "UG-Seattle-Office",
        "group_id": "60e4f5a6b7c8d9e0f1a2b3c4",
        "group_type": "user_group",
        "assignment_source": "location",
        "added": true,
        "inherited_access": {
          "systems": 0,
          "applications": [],
          "ldap_servers": 0,
          "radius_servers": 1
        }
      },
      {
        "group_name": "UG-Project-Phoenix",
        "group_id": "60f5a6b7c8d9e0f1a2b3c4d5",
        "group_type": "user_group",
        "assignment_source": "additional",
        "added": true,
        "inherited_access": {
          "systems": 2,
          "applications": ["Project Phoenix Portal"],
          "ldap_servers": 0,
          "radius_servers": 0
        }
      }
    ],
    "groups_not_found": [],
    "groups_failed": []
  },
  "system_bindings": {
    "directly_bound_systems": 0,
    "group_inherited_systems": 10,
    "total_accessible_systems": 10,
    "systems": [
      {
        "system_name": "dev-server-01",
        "system_id": "sys-abc-123",
        "os": "Ubuntu 22.04",
        "access_via": "UG-Engineering",
        "sudo_access": false
      },
      {
        "system_name": "build-server-01",
        "system_id": "sys-def-456",
        "os": "CentOS 8",
        "access_via": "UG-Developers",
        "sudo_access": false
      }
    ]
  },
  "application_access": {
    "total_applications": 7,
    "applications": [
      {
        "application_name": "Google Workspace",
        "access_via": "UG-All-Employees",
        "sso_enabled": true
      },
      {
        "application_name": "Slack",
        "access_via": "UG-All-Employees",
        "sso_enabled": true
      },
      {
        "application_name": "GitHub",
        "access_via": "UG-Engineering",
        "sso_enabled": true
      },
      {
        "application_name": "Jira",
        "access_via": "UG-Engineering",
        "sso_enabled": true
      },
      {
        "application_name": "AWS Console",
        "access_via": "UG-Engineering",
        "sso_enabled": true
      },
      {
        "application_name": "GitLab",
        "access_via": "UG-Developers",
        "sso_enabled": true
      },
      {
        "application_name": "Docker Hub",
        "access_via": "UG-Developers",
        "sso_enabled": true
      }
    ]
  },
  "custom_attributes": {
    "attributes_set": 2,
    "attributes": [
      {
        "name": "costCenter",
        "value": "ENG-200"
      },
      {
        "name": "startDate",
        "value": "2026-03-10"
      }
    ]
  },
  "notifications_sent": {
    "activation_email": {
      "sent": true,
      "recipient": "john.smith@company.com",
      "sent_timestamp": "2026-03-04T15:30:30Z",
      "includes": ["activation_link", "portal_url", "mfa_instructions"]
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
    "workflow_run_id": "jc-prov-12345",
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
- `user_info`: Complete user details as created in JumpCloud

### Account Details
- **created**: Whether the account was successfully created
- **account_status**: Current status (`activated`, `pending_activation`, `suspended`)
- **activation_email_sent**: Whether the activation email was dispatched
- **login_portal**: URL for JumpCloud user portal

### Security Settings
- **mfa_required**: Whether MFA is required for the user
- **mfa_exclusion_until**: Date when MFA grace period expires
- **password_never_expires**: Password expiration policy
- **sudo_enabled**: Whether the user has sudo/admin privileges on bound systems
- **ldap_binding_user**: Whether the user is bound as an LDAP user

### UNIX Attributes
Auto-assigned or custom UID, GID, home directory, and default shell for Linux/macOS system access

### Group Assignments
- **groups**: Array of each group with assignment source, status, and inherited resource access
- **assignment_source**: How the group was determined (`default`, `department`, `role`, `location`, `additional`)
- **inherited_access**: Systems, applications, LDAP servers, and RADIUS servers the user gains access to through the group

### System Bindings
- **directly_bound_systems**: Systems the user is directly bound to
- **group_inherited_systems**: Systems accessible through group memberships
- **systems**: Detailed list of accessible systems with OS, access path, and sudo status

### Application Access
Complete list of SSO applications the user can access through group memberships

### Custom Attributes
Any custom attributes set on the JumpCloud user account

## Error Handling

If the workflow encounters errors during provisioning:

```json
{
  "success": false,
  "partial_completion": true,
  "user_info": {
    "email": "john.smith@company.com",
    "username": "john.smith"
  },
  "completed_steps": [
    "input_validation",
    "duplicate_check",
    "password_generation",
    "group_resolution",
    "user_creation"
  ],
  "failed_steps": [
    {
      "step": "group_assignment",
      "error": {
        "type": "GROUP_NOT_FOUND",
        "message": "User group 'UG-DevOps' does not exist in JumpCloud",
        "code": "ERR-GRP-001",
        "timestamp": "2026-03-04T15:30:15Z",
        "affected_group": "UG-DevOps"
      },
      "impact": "User created but not added to 1 of 5 groups. Missing access to DevOps resources.",
      "remediation": "Create the group in JumpCloud admin console or update group mapping"
    }
  ],
  "account_created": true,
  "jumpcloud_user_id": "60a1b2c3d4e5f6a7b8c9d0e1",
  "groups_assigned": 4,
  "groups_failed": 1,
  "manual_intervention_required": true,
  "recommended_actions": [
    "Verify group 'UG-DevOps' exists in JumpCloud admin console",
    "Create the missing group or update the department-to-group mapping",
    "Manually add the user to the correct group via JumpCloud admin portal"
  ]
}
```

Common error types:
- `USER_ALREADY_EXISTS`: Username or email already registered in JumpCloud
- `GROUP_NOT_FOUND`: Specified user group does not exist
- `GROUP_MEMBERSHIP_FAILED`: Unable to add user to group
- `INVALID_USERNAME_FORMAT`: Username contains invalid characters
- `SYSTEM_BINDING_FAILED`: Unable to bind user to specified system
- `SSH_KEY_INVALID`: Provided SSH public key is malformed
- `API_RATE_LIMIT`: JumpCloud API rate limit exceeded
- `AUTHENTICATION_FAILED`: JumpCloud API key invalid or expired
- `ORGANIZATION_NOT_FOUND`: Invalid Organization ID for multi-tenant setup
- `PASSWORD_POLICY_VIOLATION`: Generated or provided password does not meet policy requirements
- `MFA_CONFIGURATION_FAILED`: Unable to configure MFA settings

## Best Practices

1. **Username Convention**: Establish and enforce a consistent username format (e.g., `firstname.lastname`)
2. **Group Organization**: Use a clear naming convention for user groups (e.g., `UG-` prefix for user groups, `SG-` for system groups)
3. **Default Groups**: Define universal groups that all users should be added to
4. **MFA Enforcement**: Always enable MFA with a reasonable grace period for enrollment
5. **Least Privilege**: Assign minimum necessary group memberships and avoid granting sudo by default
6. **SSO Integration**: Leverage JumpCloud SSO for application access through group-based assignments
7. **Password Policy**: Enforce strong password requirements through JumpCloud policies
8. **Regular Audits**: Periodically review user accounts and group memberships
9. **Onboarding Integration**: Pair with user onboarding workflow for complete provisioning
10. **Offboarding Coordination**: Ensure corresponding offboarding workflow disables JumpCloud access
11. **Custom Attributes**: Use custom attributes for metadata that aids in reporting and automation
12. **System Binding Strategy**: Prefer group-based system access over direct bindings for easier management
13. **LDAP Consideration**: Only enable LDAP binding for users who need legacy application access
14. **Bulk Provisioning**: Use batch mode for onboarding multiple users simultaneously
15. **Activation Timing**: Schedule account creation close to start date to avoid premature access
