---
id: 'cwa-apply-ignore-role-script'
title: 'Apply or Ignore Role Script'
title_meta: 'Apply or Ignore Role Script for Environment Management'
keywords: ['role', 'monitor', 'agent', 'sql', 'windows']
description: 'This document provides an overview of a script designed to apply or ignore existing roles in your environment, allowing for better control over monitors that depend on these roles. By using this script, you can avoid unnecessary modifications to group monitors and streamline alert actions, ultimately saving time and enhancing efficiency.'
tags: ['configuration', 'windows', 'database', 'script', 'monitoring']
draft: false
unlisted: false
---
## Summary

This script helps to either apply or ignore an existing role in your environment.

This way the monitor which depends on a role to detect machines and perform actions can be controlled. This will help to avoid modification of group monitors to overrides and alert action changes; it just forcefully sets roles to ignore/apply on the agent.

**Time Saved by Automation:** 5 Minutes

## Sample Run

![Sample Run](5078775/docs/8061282/images/11220696)

## Dependencies

- Windows OS

## Variables

- **RoleName** - Set as user parameter at script execution time
- **Action** - Set as user parameter at script execution time
- **Output** - Confirms parameters were set correctly - will exit script on error
- **RoleCheck** - Confirms script executed properly - will exit script on error

#### User Parameters

| Name      | Example                           | Required | Description                                                                 |
|-----------|-----------------------------------|----------|-----------------------------------------------------------------------------|
| RoleName  | Unified Write Filter - Enabled     | True     | Copy and paste the exact same name of the role definitions for the script to work |
| Action    | 1                                 | True     | Integer Value of 1 or 2 (1 = Apply, 2 = Ignore)                           |

## Process

The script executes a PowerShell to confirm parameters are set correctly.

An SQL query is executed against the Automate DB to apply or ignore the role on the agent system. Role changes are confirmed and the script exits successfully or on failure.

## Output

- **Script Log Message**
  
- **Success** - Changes applied for set role name
  
- **Role Missing** - Role name not provided in Parameter
  
- **Action Missing** - Action not provided in Parameter
  
- **Exit with Error** - Script failed to execute properly


