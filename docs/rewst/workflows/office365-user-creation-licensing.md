---
id: 'e267dba2-8c1c-4986-b40a-6cdf18566168'
slug: /e267dba2-8c1c-4986-b40a-6cdf18566168
title: 'Office 365 - Automated User Creation and Licensing'
title_meta: 'Office 365 - Automated User Creation and Licensing'
keywords: ['office365', 'microsoft365', 'user creation', 'licensing', 'onboarding', 'automation', 'workflow']
description: 'Automatically create new users in Office 365 and assign the appropriate licenses. Simplify user onboarding and ensure efficient license management with our automated Office 365 user creation and licensing solution.'
tags: ['office365', 'microsoft365']
draft: false
unlisted: false
---

# Summary

This workflow automates the creation of new users in Office 365 (Microsoft 365) and assigns the appropriate licenses based on predefined criteria. The solution streamlines the onboarding process by eliminating manual user creation steps, reducing errors, and ensuring consistent license assignment. The workflow can be triggered manually or integrated with other onboarding systems to provide a seamless user provisioning experience.

# Usage

## Prerequisites

Before using this workflow, ensure the following requirements are met:

1. **Microsoft 365 Integration**: Configure the Microsoft Graph API integration in Rewst with the necessary permissions:
   - `User.ReadWrite.All` - To create and manage user accounts
   - `Organization.Read.All` - To read organization information
   - `Directory.ReadWrite.All` - To manage directory objects
   - `License.ReadWrite.All` - To assign and manage licenses

2. **Organizational Variables**: Configure the following organizational variables in your Rewst environment:
   - `office365_default_domain`: The default domain for user principal names (e.g., `contoso.com`)
   - `office365_default_usage_location`: The default usage location for license assignment (e.g., `US`)
   - `office365_password_policy`: Password complexity requirements (optional)

3. **License SKU Mapping**: Create a mapping of job roles or departments to license SKUs that should be assigned

## Configuration Steps

1. Import the workflow into your Rewst environment
2. Configure the required organizational variables listed above
3. Customize the license assignment logic based on your organization's needs
4. Set up any triggers (form submissions, API calls, or integrations) that should initiate the workflow
5. Test the workflow in a non-production environment before deploying

## Workflow Inputs

The workflow expects the following input parameters:

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `first_name` | String | Yes | User's first name |
| `last_name` | String | Yes | User's last name |
| `email` | String | Yes | User's email address or username |
| `display_name` | String | No | Full display name (auto-generated if not provided) |
| `job_title` | String | No | User's job title |
| `department` | String | No | User's department |
| `manager_email` | String | No | Manager's email address for hierarchy assignment |
| `license_sku` | String | Yes | License SKU to assign (e.g., `ENTERPRISEPACK` for E3) |
| `usage_location` | String | No | Two-letter country code (defaults to org variable) |
| `send_welcome_email` | Boolean | No | Whether to send a welcome email with credentials |

## Execution

### Manual Trigger
1. Navigate to the workflow in the Rewst platform
2. Click "Run Workflow"
3. Fill in the required user information
4. Review the configuration and click "Execute"

### Form Trigger
Create a form in Rewst that collects the necessary user information and automatically triggers this workflow upon submission.

### API Trigger
Integrate with HR systems or other onboarding platforms by calling the Rewst API endpoint for this workflow with the required parameters in JSON format.

## Post-Execution Steps

After the workflow completes successfully:
1. Verify the user account was created in the Microsoft 365 admin center
2. Confirm the appropriate licenses were assigned
3. Check that the user received their welcome email (if enabled)
4. Validate any additional group memberships or permissions were applied

# Returned Data

The workflow returns the following data upon completion:

```json
{
  "success": true,
  "user_id": "unique-user-object-id",
  "user_principal_name": "firstname.lastname@contoso.com",
  "display_name": "FirstName LastName",
  "assigned_licenses": [
    {
      "sku_id": "license-sku-id",
      "sku_name": "Office 365 E3",
      "status": "assigned"
    }
  ],
  "created_timestamp": "2026-01-06T10:30:00Z",
  "temporary_password": "TempPass123!",
  "welcome_email_sent": true,
  "errors": []
}
```

## Return Data Fields

| Field | Type | Description |
|-------|------|-------------|
| `success` | Boolean | Indicates whether the workflow completed successfully |
| `user_id` | String | The unique Azure AD object ID for the created user |
| `user_principal_name` | String | The user's sign-in name (UPN) |
| `display_name` | String | The user's display name as it appears in Office 365 |
| `assigned_licenses` | Array | List of licenses assigned to the user with their status |
| `created_timestamp` | String | ISO 8601 timestamp of when the user was created |
| `temporary_password` | String | The temporary password assigned to the user (if applicable) |
| `welcome_email_sent` | Boolean | Whether the welcome email was successfully sent |
| `errors` | Array | Any errors or warnings encountered during execution |

## Error Handling

If the workflow encounters errors, the response will include:

```json
{
  "success": false,
  "errors": [
    {
      "code": "UserAlreadyExists",
      "message": "A user with this email already exists",
      "timestamp": "2026-01-06T10:30:00Z"
    }
  ]
}
```

Common error codes:
- `UserAlreadyExists`: The user account already exists in Azure AD
- `InvalidLicenseSKU`: The specified license SKU is invalid or unavailable
- `InsufficientLicenses`: Not enough licenses available for assignment
- `InvalidUsageLocation`: The usage location is required but not provided or invalid
- `PermissionDenied`: The Rewst integration lacks necessary permissions
