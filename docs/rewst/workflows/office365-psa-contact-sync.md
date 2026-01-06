---
id: '6638786e-5cc9-4f6b-bd00-1ff441e01069'
slug: /6638786e-5cc9-4f6b-bd00-1ff441e01069
title: 'Office 365 to PSA Contact Sync'
title_meta: 'Office 365 to PSA Contact Sync'
keywords: ['office365', 'microsoft365', 'psa', 'contact sync', 'automation', 'contact records', 'workflow']
description: 'Automatically generate PSA contact records for every active Office 365 user with our streamlined solution. Enhance your system accuracy and efficiency by ensuring up-to-date contact records for all active users in Office 365.'
tags: ['office365', 'microsoft365', 'psa']
draft: false
unlisted: false
---

# Summary

This workflow automatically generates and maintains PSA (Professional Services Automation) contact records for all active Office 365 users. The solution continuously synchronizes user data from Microsoft 365 to your PSA system, ensuring that contact information remains accurate and up-to-date. By automating this process, the workflow eliminates manual data entry, reduces synchronization errors, and maintains consistent contact records across both platforms.

# Usage

## Prerequisites

Before using this workflow, ensure the following requirements are met:

1. **Microsoft 365 Integration**: Configure the Microsoft Graph API integration in Rewst with the necessary permissions:
   - `User.Read.All` - To read user profile information
   - `Directory.Read.All` - To access directory data
   - `Organization.Read.All` - To read organization details

2. **PSA Integration**: Configure your PSA system integration (ConnectWise Manage, Autotask, etc.) with the following permissions:
   - Contact creation and update permissions
   - Company/account read access
   - API access enabled

3. **Organizational Variables**: Configure the following organizational variables in your Rewst environment:
   - `psa_default_company_id`: The default company/account ID in your PSA system
   - `psa_contact_type`: The contact type to assign (e.g., `Employee`, `User`)
   - `office365_sync_enabled`: Boolean to enable/disable automatic sync
   - `office365_sync_filter`: Optional filter for which users to sync (e.g., department, location)

4. **Field Mapping**: Define how Office 365 user properties map to PSA contact fields in the workflow configuration

## Configuration Steps

1. Import the workflow into your Rewst environment
2. Configure the required Microsoft 365 and PSA integrations
3. Set up the organizational variables listed above
4. Customize the field mapping to match your PSA system's contact schema
5. Configure the sync schedule (recommended: daily or on-demand)
6. Set up exclusion rules for service accounts or inactive users
7. Test the workflow with a small subset of users before full deployment

## Workflow Inputs

The workflow can be executed with the following optional input parameters:

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `sync_mode` | String | No | `full` (all users) or `incremental` (changes only). Default: `incremental` |
| `company_id` | String | No | Specific PSA company ID to sync users to |
| `department_filter` | String | No | Only sync users from specific department(s) |
| `office_location_filter` | String | No | Only sync users from specific location(s) |
| `user_principal_names` | Array | No | Specific users to sync (for targeted updates) |
| `skip_disabled_users` | Boolean | No | Exclude disabled/inactive users. Default: `true` |
| `update_existing` | Boolean | No | Update existing contacts or skip them. Default: `true` |
| `dry_run` | Boolean | No | Preview changes without making updates. Default: `false` |

## Execution

### Scheduled Execution (Recommended)
1. Configure the workflow to run on a schedule (e.g., daily at 2:00 AM)
2. Use `incremental` sync mode to only process changed users
3. Monitor the workflow execution logs for any errors or conflicts

### Manual Trigger
1. Navigate to the workflow in the Rewst platform
2. Click "Run Workflow"
3. Select sync options (full or incremental)
4. Review the configuration and click "Execute"

### Event-Driven Trigger
Configure the workflow to trigger when:
- A new user is created in Office 365
- User information is updated in Office 365
- A user is enabled/disabled

### API Trigger
Integrate with external systems by calling the Rewst API endpoint for this workflow with the required parameters in JSON format.

## Post-Execution Steps

After the workflow completes successfully:
1. Review the sync summary to verify the number of contacts created/updated
2. Check the PSA system to ensure contact records are present and accurate
3. Validate that contact-to-company associations are correct
4. Review any errors or warnings for users that failed to sync
5. Update exclusion rules if needed based on sync results

# Returned Data

The workflow returns the following data upon completion:

```json
{
  "success": true,
  "sync_mode": "incremental",
  "sync_timestamp": "2026-01-06T10:30:00Z",
  "statistics": {
    "total_office365_users": 150,
    "users_processed": 15,
    "contacts_created": 8,
    "contacts_updated": 7,
    "contacts_skipped": 0,
    "errors": 0
  },
  "created_contacts": [
    {
      "office365_id": "user-object-id-1",
      "user_principal_name": "john.doe@contoso.com",
      "display_name": "John Doe",
      "psa_contact_id": "12345",
      "psa_company_id": "100",
      "status": "created"
    }
  ],
  "updated_contacts": [
    {
      "office365_id": "user-object-id-2",
      "user_principal_name": "jane.smith@contoso.com",
      "display_name": "Jane Smith",
      "psa_contact_id": "12346",
      "psa_company_id": "100",
      "status": "updated",
      "changed_fields": ["phone", "job_title"]
    }
  ],
  "errors": [],
  "warnings": []
}
```

## Return Data Fields

| Field | Type | Description |
|-------|------|-------------|
| `success` | Boolean | Indicates whether the workflow completed successfully |
| `sync_mode` | String | The sync mode used (`full` or `incremental`) |
| `sync_timestamp` | String | ISO 8601 timestamp of when the sync was performed |
| `statistics` | Object | Summary statistics of the sync operation |
| `statistics.total_office365_users` | Integer | Total number of active users in Office 365 |
| `statistics.users_processed` | Integer | Number of users evaluated in this sync |
| `statistics.contacts_created` | Integer | Number of new PSA contact records created |
| `statistics.contacts_updated` | Integer | Number of existing contacts updated |
| `statistics.contacts_skipped` | Integer | Number of users skipped (already up-to-date) |
| `statistics.errors` | Integer | Number of users that failed to sync |
| `created_contacts` | Array | List of newly created contacts with details |
| `updated_contacts` | Array | List of updated contacts with changed fields |
| `errors` | Array | Any errors encountered during execution |
| `warnings` | Array | Non-critical warnings or notices |

## Error Handling

If the workflow encounters errors, the response will include detailed error information:

```json
{
  "success": false,
  "errors": [
    {
      "user_principal_name": "problem.user@contoso.com",
      "code": "ContactCreationFailed",
      "message": "Unable to create contact: duplicate email address in PSA system",
      "timestamp": "2026-01-06T10:30:15Z",
      "psa_error": "Duplicate contact email"
    }
  ],
  "warnings": [
    {
      "user_principal_name": "partial.user@contoso.com",
      "code": "MissingPhoneNumber",
      "message": "User missing phone number, contact created without phone",
      "timestamp": "2026-01-06T10:30:20Z"
    }
  ]
}
```

Common error codes:
- `ContactCreationFailed`: Unable to create contact in PSA system
- `ContactUpdateFailed`: Unable to update existing contact
- `DuplicateContact`: Contact already exists with conflicting information
- `MissingCompanyID`: Unable to determine which company to associate the contact with
- `InvalidFieldMapping`: Data format mismatch between Office 365 and PSA
- `PermissionDenied`: Insufficient permissions for PSA or Microsoft 365 API
- `UserDataIncomplete`: Required user fields are missing from Office 365
- `PSAConnectionError`: Unable to connect to PSA system API

## Best Practices

1. **Initial Sync**: Run a full sync with `dry_run: true` first to review what will be created
2. **Scheduling**: Schedule incremental syncs daily to keep contact data current
3. **Exclusions**: Configure filters to exclude service accounts, shared mailboxes, and test users
4. **Monitoring**: Set up alerts for sync failures or high error rates
5. **Data Quality**: Ensure Office 365 user profiles are complete before syncing
6. **Deduplication**: Review PSA system for duplicate contacts before enabling automatic sync
