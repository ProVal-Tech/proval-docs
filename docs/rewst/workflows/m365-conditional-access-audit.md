---
id: 'a8b2c4d6-1e3f-4a5b-9c7d-5e6f7a8b9c0d'
slug: /a8b2c4d6-1e3f-4a5b-9c7d-5e6f7a8b9c0d
title: 'Microsoft 365 Conditional Access Policies Audit'
title_meta: 'Microsoft 365 Conditional Access Policies Audit'
keywords: ['microsoft365', 'conditional access', 'audit', 'security', 'policies', 'compliance', 'automation', 'workflow']
description: 'Automatically audit Microsoft 365 Conditional Access policies for compliance, misconfigurations, and security gaps. Generate detailed reports with remediation recommendations.'
tags: ['microsoft365', 'security', 'compliance', 'audit']
draft: false
unlisted: false
---

# Summary

This workflow performs a targeted audit of Microsoft 365 Conditional Access policies, evaluating their configuration against security best practices and organizational requirements. The solution examines all active, disabled, and report-only policies, identifies gaps in coverage, detects misconfigurations, validates MFA enforcement, checks for legacy authentication blocks, and assesses device compliance requirements. The audit generates a comprehensive report with a security score, detailed findings, and actionable remediation recommendations to strengthen the organization's identity security posture.

# Usage

## Prerequisites

Before using this workflow, ensure the following requirements are met:

1. **Microsoft Graph API Integration**: Configure with the following permissions:
   - `Policy.Read.All` - To read conditional access policies
   - `Directory.Read.All` - To read directory data
   - `User.Read.All` - To read user and group memberships
   - `Application.Read.All` - To read application registrations

2. **Organizational Variables**:
   - `ca_audit_baseline`: Security baseline to audit against (`CIS`, `NIST`, `Custom`)
   - `ca_audit_report_recipients`: Email addresses for report distribution
   - `ca_audit_alert_on_critical`: Send immediate alerts for critical findings
   - `ca_required_policies`: List of policies that must exist

## Workflow Inputs

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `tenant_id` | String | No | Specific tenant to audit |
| `include_disabled_policies` | Boolean | No | Include disabled policies in audit. Default: `true` |
| `include_report_only` | Boolean | No | Include report-only policies. Default: `true` |
| `security_baseline` | String | No | Framework to audit against. Default: `CIS` |
| `compare_to_previous` | Boolean | No | Compare to last audit. Default: `true` |
| `send_report` | Boolean | No | Email report to recipients. Default: `true` |

## Execution

### Scheduled Execution (Recommended)
- Run weekly or monthly as part of security compliance program
- Schedule before compliance reviews

### Event-Driven Trigger
- Trigger when conditional access policy changes are detected
- Run after admin role changes

## Audit Process Flow

1. **Policy Enumeration**: Retrieve all conditional access policies
2. **Policy Analysis**: Evaluate each policy configuration and scope
3. **Gap Detection**: Identify missing recommended policies
4. **MFA Coverage**: Validate MFA enforcement across user populations
5. **Legacy Auth Check**: Verify legacy authentication is blocked
6. **Device Compliance**: Assess device-based access requirements
7. **Location Policies**: Review named locations and geo-blocking
8. **Application Coverage**: Check application-specific policies
9. **Admin Protection**: Verify privileged role protections
10. **Report Generation**: Create detailed audit report with scoring
11. **Comparison**: Compare findings to previous audit results
12. **Notification**: Distribute report to stakeholders

# Returned Data

```json
{
  "success": true,
  "audit_summary": {
    "security_score": 68,
    "score_change": -5,
    "total_policies": 12,
    "active_policies": 8,
    "disabled_policies": 2,
    "report_only_policies": 2,
    "critical_findings": 2,
    "high_findings": 4,
    "medium_findings": 6,
    "low_findings": 3
  },
  "required_policies_status": {
    "block_legacy_auth": { "exists": true, "enabled": true, "compliant": true },
    "require_mfa_all_users": { "exists": true, "enabled": true, "compliant": true },
    "require_mfa_admins": { "exists": true, "enabled": true, "compliant": true },
    "block_untrusted_locations": { "exists": false, "enabled": false, "compliant": false },
    "require_compliant_devices": { "exists": true, "enabled": false, "compliant": false },
    "require_approved_apps": { "exists": false, "enabled": false, "compliant": false }
  },
  "critical_findings": [
    {
      "finding": "No policy blocks access from untrusted locations",
      "risk": "Attackers can authenticate from any geographic location",
      "remediation": "Create a conditional access policy with named locations to block high-risk countries"
    },
    {
      "finding": "Device compliance policy is disabled",
      "risk": "Unmanaged and non-compliant devices can access corporate resources",
      "remediation": "Enable the existing device compliance conditional access policy"
    }
  ],
  "mfa_coverage": {
    "users_covered_by_mfa_policy": 420,
    "users_not_covered": 30,
    "admin_accounts_with_mfa_policy": 11,
    "admin_accounts_without_mfa_policy": 1,
    "coverage_percentage": 93.3
  },
  "policy_details": [
    {
      "policy_name": "Require MFA for All Users",
      "state": "enabled",
      "users_targeted": "All Users",
      "exclusions": ["Emergency Access Account"],
      "grant_controls": ["MFA"],
      "applications": "All Applications",
      "conditions": {},
      "assessment": "Compliant"
    }
  ]
}
```
