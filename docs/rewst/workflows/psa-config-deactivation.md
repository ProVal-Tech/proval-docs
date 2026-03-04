---
id: '2088783a-198c-4844-92d0-147735e5f721'
slug: /2088783a-198c-4844-92d0-147735e5f721
title: 'PSA - Offboarded Client Configuration Deactivation'
title_meta: 'PSA - Offboarded Client Configuration Deactivation'
keywords: ['psa', 'offboarding', 'configuration management', 'automation', 'workflow']
description: 'Automatically list all PSA configurations for offboarded clients and set them to inactive. Simplify client offboarding and ensure accurate configuration management with our automated PSA config deactivation process.'
tags: ['psa', 'automation', 'offboarding']
draft: false
unlisted: false
---

# Summary

This workflow identifies all PSA configurations tied to offboarded clients, lists them for review, and sets them to inactive. It streamlines client offboarding by ensuring configuration data is properly deactivated, reducing clutter and preventing billing or management errors. The workflow supports manual, scheduled, and event-driven execution and includes safeguards such as dry runs and approval steps.

# Usage

## Prerequisites

Before using this workflow, ensure the following requirements are met:

1. **PSA Integration**: Configure your PSA system integration (ConnectWise Manage, Autotask, HaloPSA, etc.) with permissions to read and update configurations.
2. **Offboarding Criteria**: Define what qualifies a client as offboarded (status, tag, contract end date, etc.).
3. **Audit Policy**: Decide whether to log deactivation details or require approvals before changes.

## Configuration Steps

1. Import the workflow into your Rewst environment.
2. Configure the PSA integration credentials and base URL.
3. Define offboarding filters (status, tags, or contract conditions).
4. Configure any optional safeguards (approval step, dry-run, or partial scope).
5. Test against a single offboarded client before enabling broad execution.

## Workflow Inputs

The workflow accepts the following input parameters:

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `client_id` | String | Conditional | PSA client/company ID to process (required if `client_name` not provided) |
| `client_name` | String | Conditional | PSA client/company name to process (required if `client_id` not provided) |
| `offboarded_statuses` | Array | No | Client statuses treated as offboarded |
| `dry_run` | Boolean | No | Preview changes without applying them. Default: `false` |
| `require_approval` | Boolean | No | Require approval before deactivation. Default: `false` |
| `include_archived` | Boolean | No | Include archived configs in the listing. Default: `false` |
| `reason` | String | No | Reason for deactivation (stored in logs/audit) |

## Execution

### Manual Trigger
1. Navigate to the workflow in the Rewst platform.
2. Click "Run Workflow".
3. Provide `client_id` or `client_name`.
4. Review the configuration list and execute.

### Scheduled Execution
Schedule the workflow to run after offboarding windows (e.g., nightly or weekly) to deactivate configs for recently offboarded clients.

### Event-Driven Trigger
Trigger the workflow when a client status changes to an offboarded state in the PSA.

### API Trigger
Call the workflow via the Rewst API for integration with external offboarding systems.

## Post-Execution Steps

After successful completion:
1. Review the list of deactivated configurations.
2. Confirm configs are inactive in the PSA.
3. Verify no active billing or alerts are tied to the deactivated configs.

# Returned Data

The workflow returns the following data upon completion:

```json
{
  "success": true,
  "client_id": "12345",
  "client_name": "Example Client",
  "timestamp": "2026-01-22T10:30:00Z",
  "statistics": {
    "configs_found": 18,
    "configs_deactivated": 18,
    "configs_skipped": 0,
    "errors": 0
  },
  "configs": [
    {
      "config_id": "9876",
      "config_name": "Firewall - HQ",
      "status": "inactive",
      "previous_status": "active"
    }
  ],
  "warnings": [],
  "errors": []
}
```

## Return Data Fields

| Field | Type | Description |
|-------|------|-------------|
| `success` | Boolean | Indicates whether the workflow completed successfully |
| `client_id` | String | PSA client/company ID processed |
| `client_name` | String | PSA client/company name processed |
| `timestamp` | String | ISO 8601 timestamp of the operation |
| `statistics` | Object | Summary of the deactivation operation |
| `statistics.configs_found` | Integer | Number of configurations found |
| `statistics.configs_deactivated` | Integer | Number of configurations set to inactive |
| `statistics.configs_skipped` | Integer | Number of configurations skipped |
| `statistics.errors` | Integer | Number of configurations that failed to update |
| `configs` | Array | List of configurations processed with status details |
| `warnings` | Array | Non-critical warnings or notices |
| `errors` | Array | Any errors encountered during execution |

## Error Handling

If the workflow encounters errors, the response will include detailed error information:

```json
{
  "success": false,
  "errors": [
    {
      "code": "ConfigUpdateFailed",
      "message": "Unable to deactivate configuration",
      "timestamp": "2026-01-22T10:30:15Z",
      "config_id": "9876"
    }
  ]
}
```

Common error codes:
- `ClientNotFound`: The specified client could not be found
- `ConfigNotFound`: No configurations were found for the client
- `ConfigUpdateFailed`: Unable to update configuration status
- `PermissionDenied`: Insufficient PSA API permissions
- `PSAConnectionError`: Unable to reach PSA API
