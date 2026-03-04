---
id: '6fd800b5-4356-491b-8fcd-c646952c92c4'
slug: /6fd800b5-4356-491b-8fcd-c646952c92c4
title: 'Organizational Variables - Auto Generation'
title_meta: 'Organizational Variables - Auto Generation'
keywords: ['rewst', 'organizational variables', 'configuration', 'automation', 'workflow']
description: 'Automatically generate essential organizational variables for seamless integration with other workflow solutions.'
tags: ['rewst', 'automation', 'configuration']
draft: false
unlisted: false
---

# Summary

This workflow automatically creates and maintains a standardized set of organizational variables used across Rewst workflows. It ensures consistent configuration values, reduces manual setup time, and provides a reliable foundation for other integrations and automations. The workflow can be run during initial environment setup or any time you need to verify and repair missing or outdated variables.

# Usage

## Prerequisites

Before using this workflow, ensure the following requirements are met:

1. **Rewst Admin Access**: You must have permissions to create and edit organizational variables.
2. **Variable Standards**: Define the list of variables required by your environment or workflow library.
3. **Optional Integrations**: If you want environment-specific values (e.g., PSA, RMM, Azure), ensure those integrations are configured.

## Configuration Steps

1. Import the workflow into your Rewst environment.
2. Review the default variable list and adjust names or defaults to match your standards.
3. Configure any environment-specific values or secrets.
4. Run the workflow in `preview` mode to review changes.
5. Execute the workflow to create or update variables.

## Workflow Inputs

The workflow accepts the following input parameters:

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `mode` | String | No | `create`, `update`, or `sync`. Default: `sync` |
| `overwrite_existing` | Boolean | No | Overwrite existing variable values. Default: `false` |
| `variable_scope` | String | No | Scope of variables to manage (e.g., `global`, `integration`). Default: `global` |
| `variable_set` | Array | No | Array of variable definitions to create or update |
| `dry_run` | Boolean | No | Preview changes without applying them. Default: `false` |

## Execution

### Manual Trigger
1. Navigate to the workflow in the Rewst platform.
2. Click "Run Workflow".
3. Choose `mode` and optional overrides.
4. Review the summary and click "Execute".

### Scheduled Execution
Run the workflow on a schedule (e.g., weekly) to detect and repair missing or drifted variables.

### API Trigger
Call the workflow via the Rewst API to automate variable creation during onboarding or tenant provisioning.

## Post-Execution Steps

After successful completion:
1. Review the generated variables and confirm their values.
2. Test dependent workflows to ensure they read the new variables.
3. Update any environment-specific secrets or credentials.

# Returned Data

The workflow returns the following data upon completion:

```json
{
  "success": true,
  "mode": "sync",
  "timestamp": "2026-01-22T10:30:00Z",
  "statistics": {
    "variables_checked": 25,
    "variables_created": 8,
    "variables_updated": 3,
    "variables_skipped": 14,
    "errors": 0
  },
  "created": [
    {
      "name": "psa_base_url",
      "value": "https://psa.example.com",
      "scope": "global",
      "status": "created"
    }
  ],
  "updated": [
    {
      "name": "rmm_api_key",
      "scope": "integration",
      "status": "updated"
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
| `mode` | String | The selected run mode (`create`, `update`, `sync`) |
| `timestamp` | String | ISO 8601 timestamp of the workflow execution |
| `statistics` | Object | Summary statistics for the operation |
| `created` | Array | Variables that were created during this run |
| `updated` | Array | Variables that were updated during this run |
| `errors` | Array | Any errors encountered during execution |
| `warnings` | Array | Non-critical warnings or notices |

## Error Handling

If the workflow encounters errors, the response will include detailed error information:

```json
{
  "success": false,
  "errors": [
    {
      "code": "VariableCreateFailed",
      "message": "Unable to create variable: name already exists",
      "timestamp": "2026-01-22T10:30:15Z"
    }
  ]
}
```

Common error codes:
- `VariableCreateFailed`: Failed to create a variable
- `VariableUpdateFailed`: Failed to update an existing variable
- `InvalidVariableName`: Variable name does not meet naming requirements
- `InvalidVariableValue`: Variable value format is invalid
- `PermissionDenied`: User lacks permission to manage organizational variables
