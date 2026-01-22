---
id: 'b8d4f2a6-7e3c-4b9a-8d5f-6a9c3e7b2d4f'
slug: /b8d4f2a6-7e3c-4b9a-8d5f-6a9c3e7b2d4f
title: 'Microsoft 365 Environment Audit'
title_meta: 'Microsoft 365 Environment Audit'
keywords: ['microsoft365', 'office365', 'audit', 'security', 'compliance', 'assessment', 'best practices', 'workflow']
description: 'Perform comprehensive security and compliance audits of Microsoft 365 environments. Assess configuration, identify vulnerabilities, evaluate license usage, and generate detailed audit reports with recommendations.'
tags: ['microsoft365', 'office365', 'security', 'compliance', 'audit']
draft: false
unlisted: false
---

# Summary

This workflow performs comprehensive security, compliance, and configuration audits of Microsoft 365 environments. The solution systematically evaluates tenant settings, user accounts, security policies, conditional access rules, license allocation, data protection measures, sharing configurations, and compliance posture against industry best practices and security frameworks. The workflow identifies vulnerabilities, misconfigurations, unused licenses, overprivileged accounts, and compliance gaps while generating detailed reports with prioritized remediation recommendations. By automating these assessments, organizations can maintain robust security postures, ensure compliance with regulatory requirements, optimize license spending, and proactively address security risks before they lead to incidents.

# Usage

## Prerequisites

Before using this workflow, ensure the following requirements are met:

1. **Microsoft 365 Integration**: Configure the Microsoft Graph API integration in Rewst with comprehensive permissions:
   - `Directory.Read.All` - To read directory and organizational data
   - `User.Read.All` - To read user accounts and profiles
   - `Group.Read.All` - To read groups and memberships
   - `Policy.Read.All` - To read conditional access and security policies
   - `SecurityEvents.Read.All` - To read security events and alerts
   - `AuditLog.Read.All` - To access audit logs
   - `Organization.Read.All` - To read tenant configuration
   - `Domain.Read.All` - To read domain information
   - `RoleManagement.Read.All` - To read admin role assignments
   - `Application.Read.All` - To read app registrations and permissions
   - `Reports.Read.All` - To read usage reports
   - `IdentityRiskEvent.Read.All` - To read identity protection data
   - `ThreatAssessment.Read.All` - To read threat assessment results

2. **Security & Compliance Integration**: Configure Security & Compliance Center access:
   - Compliance administrator read permissions
   - DLP policy read access
   - Retention policy read access
   - eDiscovery case read access

3. **Organizational Variables**: Configure the following organizational variables in your Rewst environment:
   - `audit_frequency`: How often audits should run (`daily`, `weekly`, `monthly`)
   - `audit_report_recipients`: Email addresses for audit report distribution
   - `security_baseline`: Security framework to audit against (`CIS`, `NIST`, `ISO27001`, `Custom`)
   - `compliance_requirements`: Regulatory requirements (`HIPAA`, `GDPR`, `SOC2`, `PCI-DSS`)
   - `alert_on_critical_findings`: Send immediate alerts for critical issues
   - `remediation_auto_create_tickets`: Auto-create tickets for findings
   - `license_optimization_enabled`: Include license optimization analysis
   - `include_usage_analytics`: Include user activity and adoption metrics

4. **Audit Scope Configuration**: Define what to audit:
   - Tenant-level settings
   - Security and compliance policies
   - User accounts and permissions
   - Guest user access
   - Admin role assignments
   - Application permissions
   - Device management policies
   - Data protection and DLP
   - Sharing and external collaboration
   - Email security (Exchange Online Protection)
   - License allocation and usage

5. **Benchmarking Standards**: Configure baseline standards:
   - Password policies
   - MFA requirements
   - Conditional access policies
   - Data retention policies
   - External sharing restrictions
   - Admin account security
   - Application consent policies

## Configuration Steps

1. Import the workflow into your Rewst environment
2. Configure the required Microsoft Graph API integration with all necessary permissions
3. Set up the organizational variables listed above
4. Define your security baseline and compliance requirements
5. Configure audit scope and depth
6. Set up report templates and formatting preferences
7. Configure alert thresholds for critical findings
8. Define remediation ticket creation rules
9. Set up report distribution lists
10. Schedule the workflow for regular execution
11. Test the workflow with a pilot tenant before production use

## Workflow Inputs

The workflow can be executed with the following input parameters:

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `tenant_id` | String | No | Specific tenant to audit (for MSP environments) |
| `audit_scope` | Array | No | Specific audit categories to run (defaults to all) |
| `security_baseline` | String | No | Security framework to compare against |
| `include_remediation` | Boolean | No | Include detailed remediation steps. Default: `true` |
| `deep_scan` | Boolean | No | Perform deep analysis (slower, more thorough). Default: `false` |
| `compare_to_previous` | Boolean | No | Compare to last audit results. Default: `true` |
| `include_usage_data` | Boolean | No | Include user activity and license usage. Default: `true` |
| `export_format` | String | No | Report format (`pdf`, `html`, `excel`, `json`). Default: `pdf` |
| `send_report_email` | Boolean | No | Email report to recipients. Default: `true` |
| `create_tickets` | Boolean | No | Auto-create tickets for findings. Default: `false` |
| `focus_areas` | Array | No | Prioritize specific areas (`security`, `compliance`, `licensing`, `all`) |

## Execution

### Scheduled Audit (Recommended)
Configure the workflow to run on a regular schedule:
1. Set up monthly comprehensive audits
2. Schedule weekly security-focused quick scans
3. Run quarterly compliance assessments
4. Execute on-demand for pre-audit preparations

### Manual Trigger
1. Navigate to the workflow in the Rewst platform
2. Click "Run Workflow"
3. Select audit scope and parameters
4. Review the configuration and click "Execute"
5. Monitor progress and review results

### Pre-Assessment Trigger
Run before compliance audits or security assessments:
1. Schedule 1-2 weeks before external audit
2. Review findings and remediate critical issues
3. Generate evidence and documentation
4. Re-run audit to verify remediation

### Event-Driven Trigger
Configure automatic audits when:
- Major tenant configuration changes are detected
- New admin accounts are created
- Critical security alerts are raised
- Post-incident security reviews

### API Trigger
Integrate with compliance dashboards or SIEM systems by calling the Rewst API endpoint with audit parameters.

## Audit Categories

### 1. Tenant Configuration Audit
- Tenant basic information and domain verification
- Organization-wide sharing settings
- Default user permissions
- Guest access policies
- External collaboration settings
- Mobile device management settings
- Modern authentication configuration
- Legacy authentication protocols status

### 2. Security Policies Audit
- Conditional access policies review
- Multi-factor authentication enforcement
- Password policies and expiration settings
- Self-service password reset configuration
- Account lockout policies
- Named locations configuration
- Terms of use policies
- Security defaults status

### 3. Identity & Access Management
- User account security posture
- Inactive and stale accounts identification
- Accounts without MFA
- Password never expires accounts
- Accounts with weak passwords (sign-in risk)
- Guest user accounts and permissions
- Orphaned accounts (no manager)
- Service accounts and their usage

### 4. Privileged Access Audit
- Admin role assignments and usage
- Privileged Identity Management (PIM) configuration
- Emergency access (break-glass) accounts
- Admin account MFA enforcement
- Admin account sign-in activity
- Privileged access workstation usage
- Just-in-time access policies

### 5. Application & API Permissions
- Enterprise applications registered
- App permissions and consent grants
- High-risk application permissions
- Unused applications
- OAuth token usage
- Service principal permissions
- API permissions requiring admin consent

### 6. Data Protection & DLP
- Data Loss Prevention (DLP) policies
- Sensitivity labels configuration
- Information protection policies
- Azure Information Protection deployment
- Encryption status (email, files)
- Retention policies and labels
- Records management configuration

### 7. Compliance & Legal Hold
- Compliance center configuration
- eDiscovery cases and holds
- Legal hold policies
- Audit log retention settings
- Content search capabilities
- Compliance score and recommendations
- Regulatory compliance status

### 8. Email Security (Exchange Online)
- Exchange Online Protection (EOP) configuration
- Anti-spam policies
- Anti-malware policies
- Anti-phishing policies
- Safe Links and Safe Attachments (Defender for Office 365)
- Mail flow rules (transport rules)
- DKIM, SPF, DMARC configuration
- Mailbox auditing settings

### 9. SharePoint & OneDrive Security
- External sharing settings
- Anonymous link policies
- Sharing permissions review
- Site collection access
- Guest access to sites
- Device access policies
- OneDrive sync restrictions
- Storage quota and usage

### 10. Teams Security & Governance
- Teams creation policies
- Guest access in Teams
- External access configuration
- Meeting policies and settings
- Messaging policies
- Private channel usage
- App permissions in Teams
- Teams data retention

### 11. Device & Endpoint Management
- Intune enrollment status
- Device compliance policies
- Conditional access for devices
- Mobile application management (MAM)
- Device encryption requirements
- Enrolled device inventory
- Non-compliant devices
- Mobile device wipe policies

### 12. License Management & Optimization
- Total licenses purchased vs assigned
- Unused and unassigned licenses
- License cost optimization opportunities
- Licensing compliance (over-assigned)
- User licensing gaps
- Service plan assignments
- License expiration tracking
- Cost per user analysis

## Post-Execution Steps

After the workflow completes successfully:

1. **Review Audit Report**:
   - Examine executive summary and risk score
   - Review critical and high-priority findings
   - Analyze trends compared to previous audits
   - Identify quick wins and long-term initiatives

2. **Prioritize Remediation**:
   - Address critical security vulnerabilities immediately
   - Create remediation plan for high-priority items
   - Schedule fixes for medium and low-priority issues
   - Document accepted risks and compensating controls

3. **Create Action Items**:
   - Generate tickets for remediation tasks
   - Assign owners to each finding
   - Set deadlines based on risk severity
   - Track remediation progress

4. **Implement Changes**:
   - Apply recommended security configurations
   - Enable missing security controls
   - Remove excessive permissions
   - Reclaim unused licenses

5. **Document & Report**:
   - Share findings with stakeholders
   - Update security documentation
   - Present results to management
   - Maintain audit trail for compliance

6. **Schedule Follow-Up**:
   - Re-audit after remediation
   - Verify fixes were effective
   - Update baseline configurations
   - Plan next audit cycle

# Returned Data

The workflow returns the following comprehensive audit data upon completion:

```json
{
  "success": true,
  "audit_id": "AUDIT-M365-2026-001",
  "audit_metadata": {
    "audit_date": "2026-01-13T16:00:00Z",
    "audit_duration_minutes": 23,
    "audit_type": "comprehensive",
    "security_baseline": "CIS Microsoft 365 Foundations Benchmark v2.0",
    "auditor": "Automated System",
    "tenant_id": "contoso.onmicrosoft.com",
    "tenant_name": "Contoso Corporation"
  },
  "executive_summary": {
    "overall_security_score": 72,
    "security_score_change": -3,
    "previous_audit_date": "2025-12-13T16:00:00Z",
    "total_findings": 47,
    "critical_findings": 3,
    "high_findings": 8,
    "medium_findings": 18,
    "low_findings": 18,
    "recommendations_addressed": 12,
    "new_issues_detected": 5,
    "risk_level": "Medium",
    "compliance_status": "Partial",
    "license_optimization_savings": "$4,250/month"
  },
  "tenant_information": {
    "tenant_id": "12345678-abcd-1234-abcd-123456789abc",
    "tenant_name": "Contoso Corporation",
    "primary_domain": "contoso.com",
    "domains_count": 3,
    "verified_domains": ["contoso.com", "contoso.net"],
    "tenant_region": "North America",
    "tenant_creation_date": "2020-03-15",
    "tenant_type": "Commercial",
    "total_users": 450,
    "licensed_users": 385,
    "guest_users": 67,
    "deleted_users_in_recycle": 12
  },
  "security_findings": {
    "critical": [
      {
        "finding_id": "SEC-CRIT-001",
        "category": "Identity & Access",
        "title": "Admin Accounts Without MFA",
        "description": "3 administrator accounts do not have multi-factor authentication enabled",
        "risk_level": "Critical",
        "affected_items": [
          "admin@contoso.com",
          "it.admin@contoso.com",
          "backup.admin@contoso.com"
        ],
        "compliance_impact": ["SOC2", "ISO27001"],
        "cis_control": "CIS 2.1.1",
        "remediation": {
          "priority": 1,
          "effort": "Low",
          "steps": [
            "Enable MFA for each admin account immediately",
            "Configure conditional access to require MFA for admin roles",
            "Register authentication methods for each admin"
          ],
          "auto_remediation_available": false
        },
        "references": [
          "https://learn.microsoft.com/en-us/azure/active-directory/authentication/tutorial-enable-azure-mfa"
        ]
      },
      {
        "finding_id": "SEC-CRIT-002",
        "category": "Data Protection",
        "title": "No DLP Policies Configured",
        "description": "No Data Loss Prevention policies are configured to protect sensitive data",
        "risk_level": "Critical",
        "compliance_impact": ["GDPR", "HIPAA", "PCI-DSS"],
        "remediation": {
          "priority": 2,
          "effort": "Medium",
          "steps": [
            "Create DLP policies for credit card numbers, SSN, and PII",
            "Configure policies to block sharing of sensitive content",
            "Enable policy tips to educate users",
            "Test policies before full enforcement"
          ],
          "auto_remediation_available": false
        }
      },
      {
        "finding_id": "SEC-CRIT-003",
        "category": "Email Security",
        "title": "Missing DMARC Policy",
        "description": "DMARC is not configured, leaving email vulnerable to spoofing attacks",
        "risk_level": "Critical",
        "affected_domains": ["contoso.com", "contoso.net"],
        "remediation": {
          "priority": 3,
          "effort": "Low",
          "steps": [
            "Create DMARC TXT record in DNS",
            "Start with policy=none for monitoring",
            "Review DMARC reports weekly",
            "Progress to policy=quarantine then policy=reject"
          ],
          "auto_remediation_available": false
        }
      }
    ],
    "high": [
      {
        "finding_id": "SEC-HIGH-001",
        "category": "Identity & Access",
        "title": "45 Inactive User Accounts",
        "description": "45 user accounts have not signed in for 90+ days but remain enabled",
        "risk_level": "High",
        "affected_count": 45,
        "security_risk": "Increased attack surface, potential unauthorized access",
        "remediation": {
          "priority": 4,
          "effort": "Medium",
          "steps": [
            "Review list of inactive accounts with HR/managers",
            "Disable accounts for departed employees",
            "Remove licenses from inactive accounts",
            "Set up automated workflow to disable accounts after 90 days"
          ],
          "auto_remediation_available": true
        }
      },
      {
        "finding_id": "SEC-HIGH-002",
        "category": "Conditional Access",
        "title": "Limited Conditional Access Policies",
        "description": "Only 2 conditional access policies configured. Missing policies for common scenarios",
        "risk_level": "High",
        "missing_policies": [
          "Block legacy authentication",
          "Require MFA for all users",
          "Require compliant devices",
          "Block access from untrusted locations"
        ],
        "remediation": {
          "priority": 5,
          "effort": "Medium",
          "auto_remediation_available": false
        }
      }
    ],
    "medium": [
      {
        "finding_id": "SEC-MED-001",
        "category": "Guest Access",
        "title": "67 Guest Users with Excessive Permissions",
        "description": "External guest users have access to sensitive SharePoint sites and Teams",
        "risk_level": "Medium",
        "affected_count": 67,
        "remediation": {
          "priority": 10,
          "effort": "High",
          "steps": [
            "Review guest access permissions",
            "Remove guests from sensitive sites",
            "Implement access reviews for guest users",
            "Set guest account expiration policies"
          ]
        }
      }
    ],
    "low": [
      {
        "finding_id": "SEC-LOW-001",
        "category": "User Settings",
        "title": "Self-Service Password Reset Not Enabled",
        "description": "SSPR not configured, increasing helpdesk burden",
        "risk_level": "Low",
        "impact": "Operational efficiency",
        "remediation": {
          "priority": 20,
          "effort": "Low"
        }
      }
    ]
  },
  "compliance_assessment": {
    "overall_compliance_score": 68,
    "frameworks": {
      "CIS_Benchmark": {
        "score": 72,
        "controls_evaluated": 45,
        "controls_passed": 32,
        "controls_failed": 13,
        "compliance_percentage": 71.1
      },
      "NIST_CSF": {
        "score": 65,
        "maturity_level": "Level 2 - Risk Informed",
        "gaps": ["Identity Management", "Data Security"]
      },
      "GDPR": {
        "score": 70,
        "compliant_controls": 14,
        "non_compliant_controls": 6,
        "key_gaps": [
          "Data retention policies incomplete",
          "Subject access request process not automated"
        ]
      },
      "HIPAA": {
        "score": 62,
        "compliant": false,
        "critical_gaps": [
          "Audit logging incomplete",
          "Encryption not enforced for all data",
          "Access controls insufficient"
        ]
      }
    },
    "audit_logging": {
      "enabled": true,
      "retention_days": 90,
      "recommended_retention_days": 365,
      "unified_audit_log": "enabled",
      "mailbox_auditing": "enabled"
    },
    "data_retention": {
      "policies_configured": 3,
      "coverage_percentage": 45,
      "gaps": [
        "No retention policy for Teams chats",
        "SharePoint retention incomplete"
      ]
    }
  },
  "identity_access_analysis": {
    "total_users": 450,
    "enabled_users": 438,
    "disabled_users": 12,
    "cloud_only_users": 320,
    "synced_users": 130,
    "guest_users": 67,
    "mfa_statistics": {
      "mfa_registered": 342,
      "mfa_not_registered": 96,
      "mfa_enforcement_percentage": 78.1,
      "mfa_capable_but_not_enforced": 43
    },
    "privileged_accounts": {
      "total_admin_accounts": 12,
      "global_admins": 4,
      "global_admins_recommended": 2,
      "privileged_role_assignments": 28,
      "admin_accounts_without_mfa": 3,
      "admin_sign_in_last_30_days": 9,
      "inactive_admin_accounts": 1,
      "emergency_access_accounts": 1,
      "emergency_accounts_mfa_excluded": true
    },
    "risky_accounts": {
      "high_risk": 2,
      "medium_risk": 8,
      "accounts_with_sign_in_risk": 15,
      "accounts_requiring_password_reset": 6
    },
    "stale_accounts": {
      "never_signed_in": 8,
      "inactive_30_days": 23,
      "inactive_60_days": 34,
      "inactive_90_days": 45,
      "inactive_180_days": 67
    },
    "password_policies": {
      "password_expiration_enabled": false,
      "password_expiration_days": "never",
      "password_complexity_enforced": true,
      "banned_password_protection": true,
      "lockout_threshold": 10,
      "lockout_duration_minutes": 60
    }
  },
  "application_permissions_analysis": {
    "total_applications": 87,
    "enterprise_applications": 62,
    "app_registrations": 25,
    "high_risk_permissions": [
      {
        "app_name": "Third Party CRM Integration",
        "app_id": "app-12345",
        "permissions": [
          "Mail.ReadWrite.All",
          "Files.ReadWrite.All",
          "User.Read.All"
        ],
        "risk_level": "High",
        "last_used": "2026-01-10",
        "recommendation": "Review if all permissions are necessary"
      }
    ],
    "unused_applications": 12,
    "consent_policies": {
      "user_consent_enabled": true,
      "admin_consent_required": false,
      "recommendation": "Restrict user consent for high-risk permissions"
    }
  },
  "email_security_assessment": {
    "exchange_online_protection": {
      "anti_spam_enabled": true,
      "anti_malware_enabled": true,
      "anti_phishing_enabled": true,
      "safe_attachments_enabled": false,
      "safe_links_enabled": false,
      "recommendation": "Enable Defender for Office 365"
    },
    "email_authentication": {
      "spf_configured": true,
      "dkim_enabled": true,
      "dmarc_configured": false,
      "domains_without_dmarc": ["contoso.com", "contoso.net"]
    },
    "mail_flow_rules": {
      "total_rules": 15,
      "rules_forwarding_externally": 2,
      "rules_requiring_review": 3
    },
    "mailbox_auditing": {
      "enabled_by_default": true,
      "mailboxes_with_auditing": 385,
      "mailboxes_without_auditing": 0
    }
  },
  "sharepoint_onedrive_security": {
    "external_sharing": {
      "sharepoint_sharing_level": "Anyone",
      "onedrive_sharing_level": "Anyone",
      "anonymous_links_enabled": true,
      "risk_assessment": "High",
      "recommendation": "Restrict sharing to authenticated users only"
    },
    "sites_analysis": {
      "total_sites": 124,
      "sites_with_external_sharing": 87,
      "sites_with_anonymous_links": 34,
      "sites_requiring_review": 34
    },
    "onedrive_usage": {
      "total_onedrive_accounts": 385,
      "average_storage_used_gb": 15.3,
      "accounts_over_80_percent": 23,
      "total_storage_allocated_tb": 19.25,
      "total_storage_used_tb": 5.89
    },
    "device_access": {
      "unmanaged_device_access": "allowed",
      "download_on_unmanaged": "allowed",
      "recommendation": "Restrict access from unmanaged devices"
    }
  },
  "teams_security_assessment": {
    "teams_creation_policy": "All users can create teams",
    "guest_access_enabled": true,
    "external_access_enabled": true,
    "total_teams": 156,
    "teams_with_guests": 42,
    "private_channels": 78,
    "meetings_security": {
      "lobby_bypass": "everyone",
      "anonymous_join": true,
      "recommendation": "Require authentication for meeting join"
    }
  },
  "license_optimization": {
    "total_licenses_purchased": 500,
    "total_licenses_assigned": 385,
    "unused_licenses": 115,
    "license_types": [
      {
        "sku_name": "Office 365 E3",
        "purchased": 400,
        "assigned": 320,
        "unused": 80,
        "cost_per_license": 20,
        "monthly_waste": "$1,600",
        "annual_waste": "$19,200"
      },
      {
        "sku_name": "Office 365 E5",
        "purchased": 50,
        "assigned": 35,
        "unused": 15,
        "cost_per_license": 35,
        "monthly_waste": "$525",
        "annual_waste": "$6,300"
      },
      {
        "sku_name": "Microsoft 365 Business Premium",
        "purchased": 50,
        "assigned": 30,
        "unused": 20,
        "cost_per_license": 22,
        "monthly_waste": "$440",
        "annual_waste": "$5,280"
      }
    ],
    "optimization_opportunities": {
      "total_monthly_savings": "$2,565",
      "total_annual_savings": "$30,780",
      "recommendations": [
        "Reduce E3 licenses by 80 (assign to users or reduce purchase)",
        "Consider downgrading 15 E5 users to E3 if they don't use advanced features",
        "Review Business Premium licenses for inactive users"
      ]
    },
    "users_without_licenses": 53,
    "users_with_multiple_licenses": 8
  },
  "usage_analytics": {
    "active_users_30_days": 362,
    "active_users_percentage": 94.0,
    "teams_active_users": 340,
    "sharepoint_active_users": 298,
    "exchange_active_users": 385,
    "onedrive_active_users": 312,
    "adoption_insights": {
      "teams_adoption": "High (88%)",
      "sharepoint_adoption": "Medium (77%)",
      "onedrive_adoption": "High (81%)",
      "yammer_adoption": "Low (12%)"
    }
  },
  "device_endpoint_security": {
    "intune_enrolled_devices": 342,
    "compliant_devices": 298,
    "non_compliant_devices": 44,
    "device_types": {
      "windows": 245,
      "ios": 67,
      "android": 30
    },
    "compliance_policies": {
      "total_policies": 5,
      "windows_policy": true,
      "ios_policy": true,
      "android_policy": true
    },
    "conditional_access_device_policies": 3
  },
  "recommendations_summary": {
    "quick_wins": [
      {
        "recommendation": "Enable MFA for all admin accounts",
        "impact": "Critical security improvement",
        "effort": "Low",
        "estimated_time": "1 hour"
      },
      {
        "recommendation": "Configure DMARC for email domains",
        "impact": "Prevent email spoofing",
        "effort": "Low",
        "estimated_time": "30 minutes"
      },
      {
        "recommendation": "Reduce unused licenses",
        "impact": "Save $2,565/month",
        "effort": "Low",
        "estimated_time": "2 hours"
      }
    ],
    "long_term_initiatives": [
      {
        "recommendation": "Implement comprehensive DLP policies",
        "impact": "Data protection and compliance",
        "effort": "High",
        "estimated_time": "2-4 weeks"
      },
      {
        "recommendation": "Deploy Defender for Office 365",
        "impact": "Advanced threat protection",
        "effort": "Medium",
        "estimated_time": "1 week"
      },
      {
        "recommendation": "Review and optimize guest access",
        "impact": "Reduce external access risks",
        "effort": "High",
        "estimated_time": "2 weeks"
      }
    ]
  },
  "audit_trail": {
    "workflow_run_id": "audit-m365-12345",
    "initiated_by": "system_scheduler",
    "initiated_timestamp": "2026-01-13T16:00:00Z",
    "completed_timestamp": "2026-01-13T16:23:00Z",
    "duration_minutes": 23,
    "report_generated": true,
    "report_location": "\\\\reports\\m365-audit\\2026-01\\audit-2026-01-13.pdf"
  }
}
```

## Report Formats

The workflow can generate reports in multiple formats:

### PDF Report (Default)
- Executive summary with risk scoring
- Detailed findings by category
- Remediation roadmap with priorities
- Visual charts and graphs
- Compliance framework mapping

### HTML Report
- Interactive dashboard
- Clickable findings with details
- Trend analysis graphs
- Exportable data tables

### Excel Workbook
- Multiple tabs by category
- Sortable and filterable data
- Remediation tracking worksheet
- License optimization calculator

### JSON Export
- Complete audit data
- Machine-readable format
- Integration with SIEM/compliance platforms
- API consumption

## Best Practices

1. **Regular Audits**: Schedule monthly comprehensive audits and weekly security scans
2. **Baseline Configuration**: Establish security baselines and track deviations
3. **Prioritize Remediation**: Focus on critical and high-risk findings first
4. **Track Progress**: Compare audit results over time to measure improvement
5. **Stakeholder Communication**: Share results with security, compliance, and management teams
6. **Automated Remediation**: Implement automated fixes for common misconfigurations
7. **Compliance Mapping**: Align findings to regulatory requirements
8. **License Optimization**: Act on license recommendations to reduce costs
9. **Documentation**: Maintain audit reports for compliance and audit purposes
10. **Continuous Improvement**: Refine audit scope based on findings and evolving threats
11. **Pre-Audit Preparation**: Run audits before official compliance assessments
12. **Remediation Verification**: Re-audit after fixes to confirm effectiveness
13. **Security Awareness**: Use findings to identify training needs
14. **Change Management**: Document approved exceptions and compensating controls
15. **Integration**: Feed audit data into dashboards and SIEM platforms
