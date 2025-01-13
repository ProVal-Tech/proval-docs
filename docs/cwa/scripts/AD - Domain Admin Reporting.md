---
id: 'cwa-admin-group-audit'
title: 'Admin Group Audit for Active Directory'
title_meta: 'Admin Group Audit for Active Directory'
keywords: ['audit', 'active-directory', 'admin', 'group', 'changes']
description: 'This script provides auditing functionality for members of Admin groups in Active Directory, allowing for optional alerts regarding any changes made to these groups. It is designed to run on a Domain Controller and can help maintain security and compliance by tracking modifications to critical administrative roles.'
tags: ['active-directory', 'audit', 'security', 'notification', 'configuration']
draft: false
unlisted: false
---
## Summary

The script provides auditing for members of Admin groups in Active Directory and optionally sends an alert about changes to those groups.

Time Saved by Automation: 5 Minutes

## Sample Run

![Sample Run](../../../static/img/AD---Domain-Admin-Reporting/image_1.png)

## Dependencies

- Must be a Domain Controller (and part of the Domain Controllers' Group)

## Variables

- `@NewBaseline@` -> Updates the comparison list of Domain Admins
- `@DomAdminsFresh@` -> the list of new Domain Admins
- `@EntAdminsFresh@` -> list of Enterprise Admins
- `@SchemaAdminsFresh@` -> list of Domain Schema Admins

#### User Parameters

| Name         | Example | Required | Description                                           |
|--------------|---------|----------|-------------------------------------------------------|
| NewBaseLine  | 1       | False    | Setting this to 1 will set the baseline with the new members. |

#### Script States

| Name                   | Example          | Description                                         |
|------------------------|------------------|-----------------------------------------------------|
| DomAdminsMemeber       | User1,User2      | Shows the current Domain Admins since the script ran last |
| EntAdminsMembers       | User1,User2      | Shows the current Enterprise Admins since the script ran last |
| SchemaAdminsMembers    | User1,User2      | Shows the current Domain Schema Admins since the script ran last |

## Process

1. This script prompts you for if you want to refresh the baseline for the Domain Controller
2. Runs through several shell commands and pulls the new lists and stores the corresponding information in the script states
3. At each section of Domain, Schema, Enterprise admin checks compares the original list to the new baseline check, and optionally tickets for any changes.
   - If no changes, just log in Automate's script logs

## Output

- Script log
- Script state
- Ticket (optionally)




