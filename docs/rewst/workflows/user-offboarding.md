---
id: 'f7e3a9d1-5b2c-4e8f-9a7d-3c6e1f8b4d2a'
slug: /f7e3a9d1-5b2c-4e8f-9a7d-3c6e1f8b4d2a
title: 'User Offboarding Automation'
title_meta: 'User Offboarding Automation'
keywords: ['offboarding', 'user termination', 'deprovisioning', 'automation', 'active directory', 'office365', 'microsoft365', 'security', 'workflow']
description: 'Automate the complete user offboarding process including account deactivation, access revocation, data backup, license reclamation, and exit procedures. Ensure secure and compliant employee departures.'
tags: ['offboarding', 'office365', 'active directory', 'security', 'automation']
draft: false
unlisted: false
---

# Summary

This workflow automates the entire user offboarding process, orchestrating account deactivation, access revocation, and data preservation across multiple systems including Active Directory, Microsoft 365, and various business applications. The solution disables user accounts, revokes access permissions, backs up critical data, reclaims licenses, transfers mailbox ownership, documents asset returns, and generates comprehensive exit reports. By automating these security-critical tasks, the workflow ensures consistent offboarding procedures, eliminates unauthorized access risks, maintains compliance with data retention policies, and reclaims resources efficiently while protecting sensitive company information.

# Usage

## Prerequisites

Before using this workflow, ensure the following requirements are met:

1. **Active Directory Integration**: Configure Active Directory integration in Rewst with the following permissions:
   - User account disable/modify permissions
   - Group membership management
   - Organizational Unit (OU) move permissions
   - Account attribute modification rights

2. **Microsoft 365 Integration**: Configure the Microsoft Graph API integration with the necessary permissions:
   - `User.ReadWrite.All` - To manage user accounts and settings
   - `Directory.ReadWrite.All` - To manage directory objects and groups
   - `Group.ReadWrite.All` - To remove from security and distribution groups
   - `Mail.ReadWrite` - To configure mailbox forwarding and delegation
   - `Sites.ReadWrite.All` - To transfer SharePoint/OneDrive ownership
   - `License.ReadWrite.All` - To reclaim and reassign licenses

3. **Additional Integrations** (as applicable):
   - **PSA System**: For closing contact records and creating final billing
   - **HR System**: For confirming termination details and exit dates
   - **Asset Management**: For tracking equipment returns
   - **Access Control**: For badge/physical access deactivation
   - **VPN/Network Access**: For credential revocation
   - **Business Applications**: For disabling accounts in LOB systems

4. **Organizational Variables**: Configure the following organizational variables in your Rewst environment:
   - `ad_disabled_users_ou`: OU path for disabled accounts
   - `offboarding_retention_days`: Days to retain data before deletion
   - `mailbox_conversion_method`: `shared_mailbox` or `forward_only`
   - `mailbox_delegation_default`: Default mailbox delegate (usually manager)
   - `onedrive_retention_days`: OneDrive retention period
   - `license_reclaim_immediate`: Reclaim licenses immediately or after retention
   - `security_notification_recipients`: Security team email addresses
   - `it_offboarding_checklist_template`: Template ID for manual tasks
   - `exit_interview_required`: Whether exit interview is mandatory

5. **Data Retention Policies**: Configure:
   - Email retention and archival rules
   - OneDrive/SharePoint data transfer procedures
   - Personal file backup locations
   - Compliance and legal hold requirements
   - Data deletion schedules

## Configuration Steps

1. Import the workflow into your Rewst environment
2. Configure all required integrations (AD, Microsoft 365, PSA, HR, etc.)
3. Set up the organizational variables listed above
4. Define data retention and transfer policies
5. Configure manager notification templates
6. Set up asset return tracking procedures
7. Define security group removal sequences
8. Configure license reclamation rules
9. Set up exit documentation templates
10. Test the workflow with test accounts before production use

## Workflow Inputs

The workflow expects the following input parameters:

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `employee_email` | String | Yes | Email address or username of departing employee |
| `employee_id` | String | No | Employee ID from HR system |
| `termination_date` | String | Yes | Effective termination date (ISO 8601 format: YYYY-MM-DD) |
| `last_working_day` | String | No | Last physical day in office (defaults to termination date) |
| `termination_type` | String | Yes | `voluntary`, `involuntary`, `retirement`, `contract_end` |
| `manager_email` | String | Yes | Manager's email for data transfer and notifications |
| `reason_for_leaving` | String | No | Departure reason for records |
| `company_name` | String | No | Company name for MSP environments |
| `immediate_disable` | Boolean | No | Disable account immediately vs on termination date. Default: `false` |
| `revoke_vpn_access` | Boolean | No | Revoke VPN/remote access. Default: `true` |
| `convert_mailbox_to_shared` | Boolean | No | Convert mailbox to shared mailbox. Default: `true` |
| `mailbox_delegate` | String | No | Email of person to receive mailbox access (defaults to manager) |
| `onedrive_transfer_to` | String | No | Email of person to receive OneDrive access |
| `equipment_to_return` | Array | No | List of equipment assigned to employee |
| `maintain_email_forwarding` | Boolean | No | Forward emails to delegate. Default: `true` |
| `forwarding_duration_days` | Number | No | Days to maintain forwarding. Default: 90 |
| `reclaim_licenses_immediately` | Boolean | No | Reclaim licenses immediately. Default: `false` |
| `backup_user_data` | Boolean | No | Create backup of user data. Default: `true` |
| `backup_location` | String | No | Storage location for user data backup |
| `notify_security_team` | Boolean | No | Send notification to security team. Default: `true` |
| `exit_interview_completed` | Boolean | No | Whether exit interview is complete. Default: `false` |

## Execution

### HR System Integration (Recommended)
Configure automatic workflow triggers when:
- An employee status changes to "Terminated" or "Inactive" in HR system
- A termination date is set or updated
- An offboarding request is submitted

### Scheduled Pre-Processing
Run the workflow on a schedule to process scheduled terminations:
1. Query HR system for upcoming terminations
2. Process accounts on their effective termination date
3. Send reminders for upcoming offboardings requiring preparation

### Form Trigger
Create a form in Rewst for HR or managers to submit:
1. Navigate to the offboarding form
2. Fill in employee information and termination details
3. Specify data transfer recipients and special requirements
4. Submit the form to trigger the workflow

### Manual Trigger
1. Navigate to the workflow in the Rewst platform
2. Click "Run Workflow"
3. Enter employee information and termination details
4. Review the configuration and click "Execute"
5. Monitor the workflow progress

### API Trigger
Integrate with external HR or ticketing systems by calling the Rewst API endpoint with employee data in JSON format.

## Offboarding Process Flow

The workflow executes the following steps in sequence:

### Phase 1: Initial Security Actions (Immediate)
1. **Account Lockout**: Disable Active Directory account (if immediate disable requested)
2. **Session Termination**: Force logout from all active sessions
3. **VPN Revocation**: Disable VPN and remote access credentials
4. **Multi-Factor Authentication**: Disable MFA/authenticator apps
5. **Security Token Revocation**: Invalidate all access tokens and refresh tokens
6. **Password Reset**: Reset password to random unrecoverable value
7. **Mobile Device Wipe**: Initiate remote wipe on company mobile devices

### Phase 2: Access Revocation
8. **Group Membership Removal**: Remove from all AD and Microsoft 365 groups
9. **Distribution List Removal**: Remove from all distribution and mail-enabled groups
10. **Security Group Removal**: Revoke access to shared resources, folders, and applications
11. **SharePoint Permissions**: Remove from all SharePoint sites and libraries
12. **Teams Membership**: Remove from all Teams teams and channels
13. **Admin Role Removal**: Revoke any admin or elevated privileges
14. **Shared Mailbox Access**: Remove delegated access to shared mailboxes
15. **Calendar Sharing**: Revoke calendar sharing permissions
16. **Application Access**: Disable accounts in business applications (CRM, ERP, etc.)

### Phase 3: Data Preservation and Transfer
17. **Email Backup**: Export mailbox to PST or archive location
18. **OneDrive Backup**: Download and archive OneDrive contents
19. **SharePoint Files**: Transfer owned files to manager or designated person
20. **Teams Files**: Transfer ownership of Teams files and channels
21. **Personal Files**: Backup desktop and documents folders (if synced)
22. **Application Data**: Export data from business applications
23. **Mailbox Conversion**: Convert mailbox to shared mailbox (if configured)
24. **Mailbox Delegation**: Grant manager full access to mailbox
25. **Email Forwarding**: Set up automatic email forwarding to delegate
26. **OneDrive Transfer**: Grant manager access to OneDrive files
27. **Out of Office**: Set automated out-of-office reply with contact info

### Phase 4: License and Resource Reclamation
28. **License Removal**: Unassign Microsoft 365 licenses
29. **Software License**: Reclaim software licenses (Adobe, CAD, etc.)
30. **Phone System**: Deactivate phone extensions or lines
31. **Credit Card**: Deactivate company credit cards
32. **Subscriptions**: Cancel personal subscriptions or services

### Phase 5: Asset Management
33. **Equipment Tracking**: Create asset return ticket or checklist
34. **Badge Deactivation**: Disable physical access badges
35. **Key Return**: Track return of office keys or access cards
36. **Parking Pass**: Deactivate parking permits
37. **Mobile Device**: Track return of company phones/tablets
38. **Computer/Laptop**: Track return of workstation equipment

### Phase 6: Administrative Cleanup
39. **PSA Contact Update**: Update contact status to "Inactive" or "Former Employee"
40. **HR System Update**: Confirm offboarding completion in HR system
41. **Organization Chart**: Remove from org chart and reporting structure
42. **Email Signature**: Update signature to reflect no longer with company
43. **Directory Cleanup**: Move account to disabled users OU

### Phase 7: Notifications and Documentation
44. **Manager Notification**: Send summary to manager with data access details
45. **IT Notification**: Alert IT team of asset returns and manual tasks
46. **Security Notification**: Notify security team of high-risk terminations
47. **Payroll Notification**: Notify payroll of equipment deductions if applicable
48. **Exit Report**: Generate comprehensive offboarding report
49. **Compliance Documentation**: Create audit trail for compliance

### Phase 8: Scheduled Deletion (Post-Retention)
50. **Account Deletion**: Delete AD/365 account after retention period
51. **Data Deletion**: Permanently delete archived data per policy
52. **License Reassignment**: Make reclaimed licenses available for new users

## Post-Execution Steps

After the workflow completes successfully:

1. **Verify Account Status**:
   - Confirm Active Directory account is disabled or deleted
   - Verify Microsoft 365 account is blocked from sign-in
   - Check that all access tokens are revoked
   - Ensure VPN access is terminated

2. **Validate Data Transfer**:
   - Verify manager has access to mailbox
   - Confirm OneDrive files are accessible to delegate
   - Check email forwarding is working
   - Test out-of-office message

3. **Asset Return Tracking**:
   - Follow up on equipment return status
   - Verify physical access badge is returned
   - Confirm all company property is accounted for
   - Document any missing or damaged items

4. **License Verification**:
   - Confirm licenses were reclaimed
   - Check license pool availability increased
   - Verify no orphaned licenses remain assigned

5. **Final Documentation**:
   - Review offboarding report for completeness
   - File documentation for compliance/audit
   - Update any internal tracking systems
   - Close offboarding ticket or task

# Returned Data

The workflow returns the following data upon completion:

```json
{
  "success": true,
  "offboarding_id": "OFFBOARD-2026-001",
  "employee_info": {
    "employee_id": "EMP-2024-123",
    "full_name": "John Smith",
    "email": "john.smith@company.com",
    "department": "Sales",
    "job_title": "Account Executive",
    "manager": "Jane Doe",
    "manager_email": "jane.doe@company.com",
    "termination_date": "2026-01-15",
    "last_working_day": "2026-01-15",
    "termination_type": "voluntary",
    "employment_duration": "2 years, 3 months"
  },
  "account_actions": {
    "active_directory": {
      "account_disabled": true,
      "disabled_timestamp": "2026-01-13T16:00:00Z",
      "account_moved_to_ou": "OU=Disabled Users,DC=company,DC=local",
      "password_reset": true,
      "sessions_terminated": true,
      "account_expiration_set": "2026-04-15",
      "scheduled_deletion_date": "2026-04-15"
    },
    "microsoft365": {
      "account_blocked": true,
      "blocked_timestamp": "2026-01-13T16:00:05Z",
      "sign_in_blocked": true,
      "sessions_revoked": true,
      "mfa_disabled": true,
      "mobile_devices_wiped": 2,
      "mailbox_size_gb": 12.4,
      "onedrive_size_gb": 8.7
    },
    "vpn_access": {
      "revoked": true,
      "credentials_deleted": true,
      "active_sessions_terminated": 0
    },
    "business_applications": {
      "crm_account": {
        "name": "Salesforce",
        "disabled": true
      },
      "erp_account": {
        "name": "NetSuite",
        "disabled": true
      },
      "project_management": {
        "name": "Jira",
        "disabled": true
      }
    }
  },
  "group_memberships_removed": {
    "active_directory_groups": [
      {
        "group_name": "Sales Department",
        "group_dn": "CN=Sales Department,OU=Groups,DC=company,DC=local",
        "removed": true
      },
      {
        "group_name": "VPN Users",
        "group_dn": "CN=VPN Users,OU=Security Groups,DC=company,DC=local",
        "removed": true
      },
      {
        "group_name": "Salesforce Access",
        "group_dn": "CN=Salesforce Access,OU=Security Groups,DC=company,DC=local",
        "removed": true
      }
    ],
    "microsoft365_groups": [
      {
        "group_name": "Sales Team",
        "group_type": "Microsoft 365 Group",
        "removed": true
      },
      {
        "group_name": "sales@company.com",
        "group_type": "Distribution List",
        "removed": true
      }
    ],
    "teams_removed": [
      {
        "team_name": "Sales Department",
        "team_id": "team-123-456",
        "owner_transferred": true,
        "new_owner": "jane.doe@company.com"
      },
      {
        "team_name": "Q1 Sales Push",
        "team_id": "team-789-012",
        "removed": true
      }
    ],
    "sharepoint_sites_removed": 8,
    "total_permissions_revoked": 47
  },
  "data_preservation": {
    "email_backup": {
      "backed_up": true,
      "backup_location": "\\\\backup-server\\offboarding\\2026\\john.smith",
      "backup_size_gb": 12.4,
      "backup_format": "PST",
      "backup_timestamp": "2026-01-13T16:15:00Z",
      "verification_hash": "sha256:abc123..."
    },
    "onedrive_backup": {
      "backed_up": true,
      "backup_location": "\\\\backup-server\\offboarding\\2026\\john.smith\\OneDrive",
      "backup_size_gb": 8.7,
      "file_count": 1243,
      "backup_timestamp": "2026-01-13T16:30:00Z"
    },
    "mailbox_conversion": {
      "converted_to_shared": true,
      "shared_mailbox_name": "Former - John Smith",
      "shared_mailbox_email": "former-john.smith@company.com",
      "delegates_granted": [
        {
          "delegate": "jane.doe@company.com",
          "permission_level": "Full Access",
          "granted": true
        }
      ]
    },
    "email_forwarding": {
      "enabled": true,
      "forward_to": "jane.doe@company.com",
      "forwarding_expires": "2026-04-13",
      "maintain_copy_in_mailbox": true
    },
    "onedrive_transfer": {
      "ownership_transferred": true,
      "transferred_to": "jane.doe@company.com",
      "access_granted_timestamp": "2026-01-13T16:32:00Z"
    },
    "out_of_office": {
      "enabled": true,
      "message": "John Smith is no longer with the company. For assistance, please contact Jane Doe at jane.doe@company.com.",
      "start_date": "2026-01-15",
      "end_date": "perpetual"
    }
  },
  "licenses_reclaimed": [
    {
      "sku_id": "6fd2c87f-b296-42f0-b197-1e91e994b900",
      "sku_name": "Office 365 E3",
      "removed": true,
      "removed_timestamp": "2026-01-13T16:35:00Z"
    },
    {
      "sku_id": "b05e124f-c7cc-45a0-a6aa-8cf78c946968",
      "sku_name": "Microsoft Defender for Office 365 (Plan 1)",
      "removed": true,
      "removed_timestamp": "2026-01-13T16:35:02Z"
    },
    {
      "license_type": "Adobe Creative Cloud",
      "vendor": "Adobe",
      "removed": true,
      "license_pool_updated": true
    }
  ],
  "assets_tracking": {
    "equipment_to_return": [
      {
        "asset_type": "Laptop",
        "asset_tag": "LAP-12345",
        "model": "Dell Latitude 7450",
        "serial_number": "ABC123XYZ",
        "status": "Return ticket created",
        "ticket_id": "AST-2026-001",
        "expected_return_date": "2026-01-15"
      },
      {
        "asset_type": "Mobile Phone",
        "asset_tag": "PHN-67890",
        "model": "iPhone 14 Pro",
        "serial_number": "IMEI123456789",
        "status": "Remote wipe initiated",
        "wipe_timestamp": "2026-01-13T16:02:00Z"
      },
      {
        "asset_type": "Monitor",
        "asset_tag": "MON-11111",
        "model": "Dell UltraSharp 27\"",
        "quantity": 2,
        "status": "Return pending"
      }
    ],
    "access_credentials": {
      "building_access_badge": {
        "badge_id": "BADGE-5678",
        "deactivated": true,
        "return_required": true,
        "status": "Pending return"
      },
      "parking_pass": {
        "pass_id": "PARK-123",
        "deactivated": true,
        "return_required": true
      },
      "office_keys": {
        "key_set_id": "KEY-789",
        "quantity": 3,
        "return_required": true,
        "status": "Pending return"
      }
    },
    "company_credit_card": {
      "card_last_four": "4567",
      "deactivated": true,
      "final_statement_pending": true
    }
  },
  "notifications_sent": {
    "manager_notification": {
      "sent": true,
      "recipient": "jane.doe@company.com",
      "subject": "Offboarding Complete - John Smith",
      "sent_timestamp": "2026-01-13T16:40:00Z",
      "includes": [
        "mailbox_access_instructions",
        "onedrive_access_instructions",
        "data_retention_policy",
        "asset_return_status"
      ]
    },
    "it_team_notification": {
      "sent": true,
      "recipients": ["it-team@company.com"],
      "sent_timestamp": "2026-01-13T16:40:30Z",
      "checklist_attached": true,
      "pending_tasks": [
        "Collect returned equipment",
        "Verify equipment condition",
        "Update asset inventory"
      ]
    },
    "security_team_notification": {
      "sent": true,
      "recipients": ["security@company.com"],
      "sent_timestamp": "2026-01-13T16:40:45Z",
      "risk_level": "standard",
      "special_monitoring_required": false
    },
    "hr_notification": {
      "sent": true,
      "recipient": "hr@company.com",
      "sent_timestamp": "2026-01-13T16:41:00Z",
      "exit_documentation_attached": true
    },
    "employee_notification": {
      "sent": false,
      "reason": "Account disabled before notification could be sent"
    }
  },
  "psa_updates": {
    "contact_record": {
      "contact_id": "12345",
      "status_updated": "Inactive - Former Employee",
      "last_updated": "2026-01-13T16:38:00Z"
    },
    "offboarding_ticket": {
      "created": true,
      "ticket_id": "OFFBOARD-2026-001",
      "status": "In Progress - Pending Asset Returns",
      "assigned_to": "IT Team"
    }
  },
  "compliance_documentation": {
    "offboarding_report_generated": true,
    "report_location": "\\\\compliance\\offboarding\\2026\\john.smith\\report.pdf",
    "data_retention_policy_applied": true,
    "retention_period_days": 90,
    "scheduled_deletion_date": "2026-04-15",
    "audit_trail_created": true,
    "audit_trail_id": "AUDIT-OFFBOARD-2026-001"
  },
  "summary": {
    "total_accounts_disabled": 6,
    "total_groups_removed": 15,
    "total_permissions_revoked": 47,
    "total_licenses_reclaimed": 3,
    "total_assets_pending_return": 6,
    "data_backup_size_gb": 21.1,
    "estimated_cost_savings_annual": "$2,340.00",
    "offboarding_completion_percentage": 95,
    "pending_manual_tasks": 3,
    "estimated_completion_date": "2026-01-16"
  },
  "audit_trail": {
    "workflow_run_id": "offboard-12345-run-001",
    "initiated_by": "hr.admin@company.com",
    "initiated_timestamp": "2026-01-13T15:55:00Z",
    "completed_timestamp": "2026-01-13T16:42:00Z",
    "total_duration_minutes": 47,
    "all_critical_steps_successful": true,
    "manual_follow_up_required": true
  }
}
```

## Data Structure Details

### Success Indicators
- `success`: Boolean indicating whether offboarding workflow completed successfully
- `offboarding_id`: Unique identifier for this offboarding process
- `employee_info`: Complete employee information and termination details

### Account Actions
- **active_directory**: Local AD account status, OU movement, and scheduled deletion
- **microsoft365**: Cloud account status, session revocations, and device wipes
- **vpn_access**: VPN credential revocation and session termination
- **business_applications**: Status of accounts in various business systems

### Group Memberships Removed
Complete list of all AD groups, Microsoft 365 groups, Teams, and SharePoint sites the user was removed from, including ownership transfers

### Data Preservation
- **email_backup**: Mailbox backup details including location, size, and verification
- **onedrive_backup**: OneDrive content backup information
- **mailbox_conversion**: Shared mailbox conversion and delegation details
- **email_forwarding**: Email forwarding configuration and expiration
- **onedrive_transfer**: OneDrive ownership transfer details
- **out_of_office**: Automated reply configuration

### Licenses Reclaimed
Array of all licenses (Microsoft 365, Adobe, etc.) removed from the user with timestamps

### Assets Tracking
- **equipment_to_return**: All company equipment assigned to employee with return status
- **access_credentials**: Physical badges, keys, and passes to be returned
- **company_credit_card**: Corporate credit card deactivation status

### Notifications Sent
Confirmation of all automated communications to manager, IT, security, HR, and the employee

### PSA Updates
Contact record status changes and offboarding ticket creation

### Compliance Documentation
Reports, audit trails, and data retention policy details

### Summary
High-level metrics including completion percentage, cost savings, and pending tasks

## Error Handling

If the workflow encounters errors during offboarding:

```json
{
  "success": false,
  "partial_completion": true,
  "offboarding_id": "OFFBOARD-2026-001",
  "employee_info": {
    "full_name": "John Smith",
    "email": "john.smith@company.com"
  },
  "completed_steps": [
    "active_directory_account_disable",
    "session_termination",
    "vpn_revocation",
    "group_membership_removal"
  ],
  "failed_steps": [
    {
      "step": "mailbox_backup",
      "error": {
        "type": "BACKUP_STORAGE_UNAVAILABLE",
        "message": "Cannot connect to backup storage location",
        "code": "ERR-BACKUP-001",
        "timestamp": "2026-01-13T16:15:00Z"
      },
      "impact": "Email data not backed up. Mailbox still accessible for manual backup.",
      "remediation": "Verify backup storage is online and retry backup process",
      "critical": true
    },
    {
      "step": "onedrive_transfer",
      "error": {
        "type": "PERMISSION_DENIED",
        "message": "Insufficient permissions to transfer OneDrive ownership",
        "code": "ERR-PERM-002",
        "timestamp": "2026-01-13T16:32:00Z"
      },
      "impact": "OneDrive files not transferred to manager. Manual transfer required.",
      "remediation": "Grant SharePoint admin permissions and retry",
      "critical": false
    }
  ],
  "critical_failures": 1,
  "account_disabled": true,
  "data_at_risk": true,
  "manual_intervention_required": true,
  "escalation": {
    "escalated_to": "it.manager@company.com",
    "escalation_ticket": "ESC-2026-001",
    "priority": "High",
    "reason": "Data backup failure requires immediate attention"
  },
  "rollback_available": false,
  "recommended_actions": [
    "Manually backup mailbox before proceeding",
    "Verify backup storage connectivity",
    "Complete OneDrive transfer manually",
    "Do not delete account until data is secured"
  ]
}
```

Common error types:
- `ACCOUNT_NOT_FOUND`: User account does not exist in system
- `BACKUP_STORAGE_UNAVAILABLE`: Cannot access backup location
- `LICENSE_REMOVAL_FAILED`: Unable to reclaim licenses
- `MAILBOX_CONVERSION_FAILED`: Error converting mailbox to shared
- `PERMISSION_DENIED`: Insufficient permissions for operation
- `MANAGER_NOT_FOUND`: Manager email address invalid or not found
- `DATA_TRANSFER_FAILED`: Unable to transfer ownership of files
- `DEVICE_WIPE_FAILED`: Mobile device wipe command failed
- `INTEGRATION_ERROR`: External system connection failure

## Security Considerations

### Immediate Actions for High-Risk Terminations
For involuntary terminations or security concerns, enable `immediate_disable`:
- Accounts disabled instantly
- All sessions terminated immediately
- Mobile devices wiped remotely
- VPN access revoked
- Physical access disabled
- Security team notified in real-time

### Data Protection
- All sensitive data backed up before account deletion
- Encryption verification on backups
- Access logs maintained for audit
- Compliance with data retention regulations
- Legal hold capabilities for litigation

### Access Revocation Priority
1. Remote access (VPN, RDP)
2. Admin/privileged accounts
3. Financial systems
4. Customer data systems
5. General business applications
6. Email and collaboration tools

## Best Practices

1. **Pre-Offboarding Planning**: Coordinate with HR to receive advance notice of terminations
2. **Manager Involvement**: Ensure managers are prepared to receive data and mailbox access
3. **Data Backup First**: Always backup data before disabling accounts or removing access
4. **Asset Tracking**: Maintain accurate equipment inventory for efficient returns
5. **Scheduled Deletions**: Never delete accounts immediately; use retention periods
6. **Legal Holds**: Check for legal holds or litigation before deleting data
7. **Documentation**: Maintain comprehensive audit trails for compliance
8. **Exit Interviews**: Coordinate with HR for exit interview completion
9. **Knowledge Transfer**: Ensure critical knowledge is transferred before departure
10. **License Optimization**: Use reclaimed licenses for cost savings analysis
11. **Security Reviews**: Conduct security reviews for privileged user offboardings
12. **Phased Approach**: Consider staged access removal for gradual transitions
13. **Communication**: Keep all stakeholders informed throughout the process
14. **Post-Offboarding Audit**: Review completed offboardings for process improvements
15. **Contractor Considerations**: Adjust retention periods for contract workers vs full-time employees
