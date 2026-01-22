---
id: '4a6ff801-b394-42a5-b77b-75c61c44c67d'
slug: /4a6ff801-b394-42a5-b77b-75c61c44c67d
title: 'IT Glue - Client Record Deletion'
title_meta: 'IT Glue - Client Record Deletion'
keywords: ['itglue', 'client deletion', 'documentation', 'automation', 'workflow']
description: 'Automatically remove client records from IT Glue with our efficient deletion process. Keep your documentation platform organized and up-to-date by seamlessly deleting outdated client data from IT Glue.'
tags: ['itglue', 'automation', 'documentation']
draft: false
unlisted: false
---

# Summary

This workflow automatically removes client records from IT Glue to keep documentation clean and current. It validates targets, confirms dependencies, and executes a controlled deletion process to prevent stale or duplicate client data from cluttering the platform. The workflow can be triggered manually, scheduled, or driven by upstream system events (PSA/RMM offboarding).

# Usage

## Prerequisites

Before using this workflow, ensure the following requirements are met:

1. **IT Glue Integration**: Configure the IT Glue API integration in Rewst with permissions to read and delete organizations.
2. **Deletion Policy**: Define criteria for when a client should be removed (e.g., inactive status, offboarding completed).
3. **Dependency Review**: Decide how to handle attached assets, documents, and related configurations prior to deletion.

## Configuration Steps

1. Import the workflow into your Rewst environment.
2. Configure IT Glue API credentials and base URL.
3. Define the deletion criteria (status, tags, last activity, etc.).
4. Configure optional safeguards (approval step, dry-run, or soft-delete).
5. Test against a non-production client record before full deployment.

## Workflow Inputs

The workflow accepts the following input parameters:

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `org_id` | String | Conditional | IT Glue organization ID to delete (required if `org_name` not provided) |
| `org_name` | String | Conditional | IT Glue organization name to delete (required if `org_id` not provided) |
| `confirm_delete` | Boolean | No | Explicit confirmation to proceed with deletion. Default: `false` |
| `dry_run` | Boolean | No | Preview affected records without deleting. Default: `false` |
| `force_delete` | Boolean | No | Bypass dependency checks. Default: `false` |
| `reason` | String | No | Reason for deletion (stored in logs/audit) |

## Execution

### Manual Trigger
1. Navigate to the workflow in the Rewst platform.
2. Click "Run Workflow".
3. Provide `org_id` or `org_name`.
4. Set `confirm_delete` to true and execute.

### Scheduled Execution
Schedule the workflow to remove clients that meet defined offboarding criteria (e.g., monthly cleanup).

### Event-Driven Trigger
Trigger the workflow when a client is marked inactive in a PSA or RMM system.

### API Trigger
Call the workflow via the Rewst API to integrate with external offboarding or compliance processes.

## Post-Execution Steps

After successful completion:
1. Verify the organization was removed from IT Glue.
2. Confirm any related records were handled per your policy.
3. Review audit logs for deletion confirmation.

# Returned Data

The workflow returns the following data upon completion:

```json
{
  "success": true,
  "org_id": "123456",
  "org_name": "Example Client",
  "deleted": true,
  "timestamp": "2026-01-22T10:30:00Z",
  "dependency_check": {
    "assets_found": 12,
    "configs_found": 4,
    "documents_found": 7,
    "blocked": false
  },
  "warnings": [],
  "errors": []
}
```

## Return Data Fields

| Field | Type | Description |
|-------|------|-------------|
| `success` | Boolean | Indicates whether the workflow completed successfully |
| `org_id` | String | The IT Glue organization ID that was targeted |
| `org_name` | String | The IT Glue organization name that was targeted |
| `deleted` | Boolean | Whether the organization was deleted |
| `timestamp` | String | ISO 8601 timestamp of the operation |
| `dependency_check` | Object | Summary of dependent items found before deletion |
| `warnings` | Array | Non-critical warnings or notices |
| `errors` | Array | Any errors encountered during execution |

## Error Handling

If the workflow encounters errors, the response will include detailed error information:

```json
{
  "success": false,
  "errors": [
    {
      "code": "OrganizationNotFound",
      "message": "No organization matches the provided identifier",
      "timestamp": "2026-01-22T10:30:15Z"
    }
  ]
}
```

Common error codes:
- `OrganizationNotFound`: The specified organization could not be found
- `DeletionBlocked`: Deletion blocked due to dependencies or policy
- `PermissionDenied`: Insufficient API permissions
- `InvalidIdentifier`: Missing or invalid organization identifier
- `ITGlueConnectionError`: Unable to reach IT Glue API
