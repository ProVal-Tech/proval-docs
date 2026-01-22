---
id: 'a5c7e2f8-9d4b-4e6a-8f3c-1b2d5e7f9a4c'
slug: /a5c7e2f8-9d4b-4e6a-8f3c-1b2d5e7f9a4c
title: 'New User Onboarding Automation'
title_meta: 'New User Onboarding Automation'
keywords: ['onboarding', 'user creation', 'automation', 'active directory', 'office365', 'microsoft365', 'new hire', 'workflow']
description: 'Automate the complete new user onboarding process including account creation, license assignment, group memberships, and access provisioning. Streamline employee onboarding with comprehensive automation.'
tags: ['onboarding', 'office365', 'active directory', 'automation']
draft: false
unlisted: false
---

# Summary

This workflow automates the entire new user onboarding process, orchestrating account creation across multiple systems including Active Directory, Microsoft 365, and various business applications. The solution creates user accounts, assigns licenses, configures group memberships, provisions hardware, sends welcome communications, and generates necessary documentation. By automating these repetitive tasks, the workflow reduces onboarding time from hours to minutes, ensures consistency, eliminates manual errors, and provides a seamless experience for new employees starting on day one.

# Usage

## Prerequisites

Before using this workflow, ensure the following requirements are met:

1. **Active Directory Integration**: Configure Active Directory integration in Rewst with the following permissions:
   - User account creation and management
   - Group membership management
   - Organizational Unit (OU) read and write access
   - Password policy management

2. **Microsoft 365 Integration**: Configure the Microsoft Graph API integration with the necessary permissions:
   - `User.ReadWrite.All` - To create and manage user accounts
   - `Directory.ReadWrite.All` - To manage directory objects and groups
   - `License.ReadWrite.All` - To assign and manage licenses
   - `Group.ReadWrite.All` - To manage security and distribution groups
   - `Mail.Send` - To send welcome emails

3. **Additional Integrations** (as applicable):
   - **PSA System**: For creating contact records and tracking onboarding tasks
   - **HR System**: For retrieving employee information
   - **Device Management**: For MDM enrollment (Intune, Jamf, etc.)
   - **VPN/Network Access**: For provisioning network credentials
   - **Business Applications**: For creating accounts in LOB systems

4. **Organizational Variables**: Configure the following organizational variables in your Rewst environment:
   - `ad_default_ou`: Default Organizational Unit for new users
   - `ad_default_domain`: Active Directory domain name
   - `office365_default_domain`: Microsoft 365 tenant domain
   - `office365_default_usage_location`: Default usage location for licenses (e.g., `US`)
   - `default_password_policy`: Password requirements and complexity
   - `onboarding_notification_recipients`: Email addresses for onboarding notifications
   - `it_support_email`: IT support contact for new users
   - `helpdesk_phone`: Helpdesk phone number for welcome materials

5. **Templates and Resources**:
   - Email welcome template
   - New hire checklist template
   - Standard group memberships by role/department
   - License assignment matrix
   - Equipment assignment tracking

## Configuration Steps

1. Import the workflow into your Rewst environment
2. Configure all required integrations (AD, Microsoft 365, PSA, HR, etc.)
3. Set up the organizational variables listed above
4. Define role-based templates for standard access patterns
5. Customize email templates and welcome materials
6. Configure license assignment rules based on department/role
7. Set up group membership templates for common roles
8. Define equipment provisioning rules
9. Configure approval workflows if required
10. Test the workflow with test accounts before production use

## Workflow Inputs

The workflow expects the following input parameters:

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `first_name` | String | Yes | Employee's first name |
| `last_name` | String | Yes | Employee's last name |
| `email_address` | String | Yes | Desired email address (or username for auto-generation) |
| `start_date` | String | Yes | Employee start date (ISO 8601 format: YYYY-MM-DD) |
| `job_title` | String | Yes | Employee's job title |
| `department` | String | Yes | Department name |
| `office_location` | String | Yes | Physical office location |
| `manager_email` | String | Yes | Manager's email address for hierarchy assignment |
| `employee_id` | String | No | Employee ID from HR system |
| `phone_number` | String | No | Direct phone number |
| `mobile_number` | String | No | Mobile phone number |
| `company_name` | String | No | Company name for MSP environments |
| `role_template` | String | No | Predefined role template (e.g., `Sales`, `Engineering`, `Finance`) |
| `license_package` | String | No | License bundle to assign (e.g., `E3_Standard`, `E5_Developer`) |
| `additional_groups` | Array | No | Additional AD/365 groups to add user to |
| `equipment_needed` | Object | No | Hardware requirements (laptop model, monitors, peripherals) |
| `vpn_access_required` | Boolean | No | Whether VPN access is needed. Default: `true` |
| `remote_worker` | Boolean | No | Whether employee is remote. Default: `false` |
| `send_welcome_email` | Boolean | No | Send welcome email with credentials. Default: `true` |
| `create_psa_contact` | Boolean | No | Create PSA contact record. Default: `true` |
| `require_approval` | Boolean | No | Require manager approval before provisioning. Default: `false` |

## Execution

### Form Trigger (Recommended)
Create a user-friendly form in Rewst that HR or IT can complete:
1. Navigate to the onboarding form
2. Fill in the new employee information
3. Select the appropriate role template
4. Specify start date and special requirements
5. Submit the form to trigger the workflow

### HR System Integration
Configure automatic workflow triggers when:
- A new employee record is created in the HR system
- An employee status changes to "Active" or "Pre-Start"
- Employee information is updated before start date

### Manual Trigger
1. Navigate to the workflow in the Rewst platform
2. Click "Run Workflow"
3. Enter all required employee information
4. Review the configuration and click "Execute"
5. Monitor the workflow progress

### Scheduled Pre-Boarding
Run the workflow on a schedule to process upcoming new hires:
1. Query HR system for employees starting within X days
2. Automatically trigger onboarding workflows
3. Allow time for account propagation before start date

### API Trigger
Integrate with external HR or ticketing systems by calling the Rewst API endpoint with employee data in JSON format.

## Onboarding Process Flow

The workflow executes the following steps in sequence:

1. **Validation**: Verify all required information and check for existing accounts
2. **Active Directory Account Creation**: Create user account in appropriate OU
3. **Password Generation**: Generate secure initial password or retrieve from policy
4. **Group Membership Assignment**: Add user to standard and role-based groups
5. **Microsoft 365 Account Creation**: Create cloud user account and sync
6. **License Assignment**: Apply appropriate Microsoft 365 licenses
7. **Mailbox Configuration**: Create mailbox and configure settings
8. **Distribution List Addition**: Add to relevant distribution groups
9. **Shared Mailbox Access**: Grant access to shared mailboxes per role
10. **Security Group Membership**: Add to security groups for resource access
11. **SharePoint/OneDrive Setup**: Provision cloud storage and permissions
12. **Teams Assignment**: Add to relevant Teams channels
13. **PSA Contact Creation**: Create contact record in PSA system
14. **Equipment Assignment**: Create ticket or record for hardware provisioning
15. **VPN Account Creation**: Provision VPN/network access credentials
16. **Business Application Accounts**: Create accounts in LOB systems
17. **Welcome Email**: Send customized welcome email with instructions
18. **Manager Notification**: Notify manager of successful onboarding
19. **IT Notification**: Create checklist for IT completion items
20. **Documentation**: Generate onboarding summary and audit trail

## Post-Execution Steps

After the workflow completes successfully:

1. **Verify Account Creation**:
   - Confirm Active Directory account exists and is enabled
   - Check Microsoft 365 account is synced and licensed
   - Verify email mailbox is created and accessible

2. **Validate Access**:
   - Test login credentials work correctly
   - Confirm group memberships are applied
   - Verify access to shared resources

3. **Hardware Preparation**:
   - Review equipment assignment ticket
   - Prepare laptop/workstation with user profile
   - Stage equipment for pickup or shipping

4. **Documentation Review**:
   - Ensure all onboarding steps completed successfully
   - Review welcome email was sent
   - Confirm manager and IT received notifications

5. **Follow-Up Actions**:
   - Schedule Day 1 IT orientation if needed
   - Prepare any physical access badges or keys
   - Add any manual steps to IT checklist
   - Update onboarding tracker or dashboard

# Returned Data

The workflow returns the following data upon completion:

```json
{
  "success": true,
  "employee_info": {
    "employee_id": "EMP-2026-001",
    "full_name": "Jane Smith",
    "first_name": "Jane",
    "last_name": "Smith",
    "start_date": "2026-01-20",
    "job_title": "Senior Software Engineer",
    "department": "Engineering",
    "office_location": "Seattle Office",
    "manager": "John Doe",
    "manager_email": "john.doe@company.com"
  },
  "accounts_created": {
    "active_directory": {
      "created": true,
      "username": "jsmith",
      "user_principal_name": "jsmith@company.local",
      "distinguished_name": "CN=Jane Smith,OU=Engineering,OU=Users,DC=company,DC=local",
      "account_enabled": true,
      "password_set": true,
      "password_never_expires": false,
      "must_change_password": true
    },
    "microsoft365": {
      "created": true,
      "user_principal_name": "jane.smith@company.com",
      "object_id": "a1b2c3d4-e5f6-7890-abcd-ef1234567890",
      "mailbox_created": true,
      "mailbox_size_gb": 50,
      "onedrive_provisioned": true,
      "teams_enabled": true
    },
    "psa_contact": {
      "created": true,
      "contact_id": "12345",
      "company_name": "Company Name",
      "contact_type": "Employee"
    },
    "vpn_account": {
      "created": true,
      "username": "jsmith",
      "access_level": "Full VPN Access"
    }
  },
  "licenses_assigned": [
    {
      "sku_id": "6fd2c87f-b296-42f0-b197-1e91e994b900",
      "sku_name": "Office 365 E3",
      "assigned": true
    },
    {
      "sku_id": "b05e124f-c7cc-45a0-a6aa-8cf78c946968",
      "sku_name": "Microsoft Defender for Office 365 (Plan 1)",
      "assigned": true
    }
  ],
  "group_memberships": {
    "active_directory": [
      {
        "group_name": "Engineering Department",
        "group_dn": "CN=Engineering Department,OU=Groups,DC=company,DC=local",
        "added": true
      },
      {
        "group_name": "All Staff",
        "group_dn": "CN=All Staff,OU=Groups,DC=company,DC=local",
        "added": true
      },
      {
        "group_name": "VPN Users",
        "group_dn": "CN=VPN Users,OU=Security Groups,DC=company,DC=local",
        "added": true
      }
    ],
    "microsoft365": [
      {
        "group_name": "Engineering Team",
        "group_id": "group-123-456",
        "group_type": "Microsoft 365",
        "added": true
      },
      {
        "group_name": "eng-team@company.com",
        "group_id": "group-789-012",
        "group_type": "Distribution List",
        "added": true
      }
    ],
    "teams": [
      {
        "team_name": "Engineering Department",
        "team_id": "team-abc-123",
        "channels_added": ["General", "Development", "Code Reviews"],
        "added": true
      }
    ]
  },
  "shared_resource_access": {
    "shared_mailboxes": [
      {
        "mailbox": "eng-support@company.com",
        "permission_level": "Full Access",
        "granted": true
      }
    ],
    "sharepoint_sites": [
      {
        "site_name": "Engineering Documentation",
        "site_url": "https://company.sharepoint.com/sites/engineering",
        "permission_level": "Member",
        "granted": true
      }
    ],
    "shared_drives": [
      {
        "drive_path": "\\\\fileserver\\Engineering",
        "permission_level": "Read/Write",
        "granted": true
      }
    ]
  },
  "equipment_assigned": {
    "laptop": {
      "model": "Dell Latitude 7450",
      "serial_number": "PENDING",
      "status": "Ticket Created",
      "ticket_id": "INC-2026-001"
    },
    "monitors": {
      "quantity": 2,
      "model": "Dell UltraSharp 27\"",
      "status": "Ticket Created"
    },
    "peripherals": {
      "keyboard": "Standard Wireless",
      "mouse": "Standard Wireless",
      "headset": "USB Headset",
      "status": "Ticket Created"
    }
  },
  "notifications_sent": {
    "welcome_email": {
      "sent": true,
      "recipient": "jane.smith@company.com",
      "sent_timestamp": "2026-01-13T15:30:00Z",
      "contains": ["credentials", "first_day_instructions", "it_contact_info"]
    },
    "manager_notification": {
      "sent": true,
      "recipient": "john.doe@company.com",
      "sent_timestamp": "2026-01-13T15:30:30Z"
    },
    "it_team_notification": {
      "sent": true,
      "recipients": ["it-team@company.com"],
      "sent_timestamp": "2026-01-13T15:31:00Z",
      "checklist_attached": true
    }
  },
  "temporary_password": {
    "generated": true,
    "password": "REDACTED",
    "expires": "2026-01-27T23:59:59Z",
    "must_change_on_login": true,
    "delivery_method": "Secure welcome email"
  },
  "onboarding_checklist": {
    "checklist_id": "CHK-2026-001",
    "total_tasks": 15,
    "completed_tasks": 12,
    "pending_tasks": 3,
    "pending_items": [
      "Physical equipment delivery",
      "Badge/access card creation",
      "Parking pass assignment"
    ]
  },
  "audit_trail": {
    "workflow_id": "workflow-run-12345",
    "initiated_by": "hr.admin@company.com",
    "initiated_timestamp": "2026-01-13T15:25:00Z",
    "completed_timestamp": "2026-01-13T15:31:30Z",
    "total_duration_seconds": 390,
    "all_steps_successful": true
  },
  "next_steps": [
    "IT to prepare laptop with user profile (Ticket INC-2026-001)",
    "Facilities to create access badge",
    "Manager to schedule Day 1 orientation meeting",
    "IT to verify all access on start date"
  ]
}
```

## Data Structure Details

### Success Indicators
- `success`: Boolean indicating whether the workflow completed successfully
- `employee_info`: Complete employee information used for onboarding

### Accounts Created
- **active_directory**: Local AD account details, distinguished name, and password policy
- **microsoft365**: Cloud account details, mailbox, OneDrive, and Teams status
- **psa_contact**: PSA system contact record information
- **vpn_account**: VPN/network access credentials and permissions

### Licenses Assigned
Array of all Microsoft 365 licenses assigned to the user with SKU details and assignment status

### Group Memberships
- **active_directory**: Local AD security and distribution groups
- **microsoft365**: Cloud-based Microsoft 365 and distribution groups
- **teams**: Microsoft Teams teams and channels the user was added to

### Shared Resource Access
- **shared_mailboxes**: Shared/departmental mailboxes with permission levels
- **sharepoint_sites**: SharePoint sites and document libraries with access levels
- **shared_drives**: Network file shares and mapped drives

### Equipment Assigned
Details of hardware assigned or tickets created for equipment provisioning including models, serial numbers, and status

### Notifications Sent
Confirmation of all automated communications sent to the employee, manager, and IT team

### Temporary Password
Information about the generated password, expiration, and delivery method (password value is redacted in logs)

### Onboarding Checklist
Summary of automated and manual tasks with completion status

### Audit Trail
Complete workflow execution details for compliance and troubleshooting

## Error Handling

If the workflow encounters errors, the returned data includes detailed error information:

```json
{
  "success": false,
  "partial_completion": true,
  "employee_info": {
    "full_name": "Jane Smith",
    "email_address": "jane.smith@company.com"
  },
  "completed_steps": [
    "active_directory_account_creation",
    "group_membership_assignment",
    "psa_contact_creation"
  ],
  "failed_steps": [
    {
      "step": "microsoft365_license_assignment",
      "error": {
        "type": "LICENSE_UNAVAILABLE",
        "message": "No available Office 365 E3 licenses in tenant",
        "code": "ERR-LIC-001",
        "timestamp": "2026-01-13T15:28:45Z"
      },
      "impact": "User account created but not licensed. Manual license assignment required.",
      "remediation": "Purchase additional licenses or assign from available pool"
    }
  ],
  "rollback_performed": false,
  "manual_intervention_required": true,
  "support_ticket_created": {
    "ticket_id": "INC-2026-002",
    "assigned_to": "IT Admin Team",
    "priority": "High"
  }
}
```

Common error types:
- `ACCOUNT_ALREADY_EXISTS`: Username or email already in use
- `LICENSE_UNAVAILABLE`: No licenses available to assign
- `GROUP_NOT_FOUND`: Specified group does not exist
- `MANAGER_NOT_FOUND`: Manager email address not found in system
- `INTEGRATION_ERROR`: External system integration failure
- `VALIDATION_FAILED`: Input validation errors
- `PERMISSION_DENIED`: Insufficient permissions to perform action
- `START_DATE_INVALID`: Start date is in the past or too far in future

## Best Practices

1. **Pre-Board Early**: Run the workflow 1-3 days before start date to allow for account propagation and equipment preparation
2. **Use Role Templates**: Create standardized templates for common roles to ensure consistency
3. **Test Thoroughly**: Always test with non-production accounts before using in production
4. **Monitor License Pool**: Set up alerts for low license availability
5. **Secure Password Delivery**: Use secure methods to deliver temporary passwords (encrypted email, password management system)
6. **Validate Manager Information**: Ensure manager email addresses are correct for proper hierarchy
7. **Document Custom Requirements**: Maintain documentation for special access needs by role/department
8. **Schedule Follow-Up**: Set reminders to verify successful login on Day 1
9. **Track Metrics**: Monitor onboarding time, error rates, and employee feedback
10. **Regular Audits**: Periodically review group memberships and access patterns to ensure templates are current
11. **Offboarding Integration**: Pair with offboarding workflow for complete lifecycle management
12. **Compliance**: Ensure the workflow meets regulatory requirements for access provisioning and audit trails
