---
id: 'fecda0ff-5a3e-4cc5-b6a7-fd37732aa2e9'
slug: /fecda0ff-5a3e-4cc5-b6a7-fd37732aa2e9
title: 'BitLocker Key Backup'
title_meta: 'BitLocker Key Backup'
keywords: ['bitlocker', 'bitlocker-status', 'recovery-key', 'bitlocker-audit', 'recovery-password', 'backup', 'domain']
description: 'The solution outlines the process of backing up BitLocker recovery keys to Active Directory or Azure Active Directory using CW RMM.'
tags: ['bitlocker', 'security', 'auditing']
draft: false
unlisted: false
---

## Purpose

This solution outlines the complete process for automatically backing up BitLocker recovery keys to Active Directory or Azure Active Directory using ConnectWise RMM. It utilizes custom fields, dynamic groups, and automated tasks to ensure BitLocker recovery keys are properly backed up and their status is tracked.

## Associated Content

### Custom Fields

| Name | Example | Type | Level | Required | Purpose |
|------|---------|------|-------|----------|---------|
| [Enable BitLocker Key Backup](/docs/14c8ed9d-5357-432d-a8f2-8d522ac9f991) | Windows Workstation and Server | Dropdown | COMPANY | Yes | Select OS to enable automatic BitLocker key backup. |
| [Disable BitLocker Key Backup (Site)](/docs/f164c9c8-effe-48ce-9cd3-bc0b8a5e7025) |  | Flag | SITE | No | Prevents BitLocker key backup at specific sites. |
| [Disable BitLocker Key Backup (Endpoint)](/docs/6c9022a4-43db-49f3-8f89-ae27d8e340a4) |  | Flag | ENDPOINT | No | Prevents BitLocker key backup on specific endpoints. |
| [BitLocker Key Backup Status](/docs/362c3958-f97e-4f40-bd1d-89cbfed9b17f) |  | Text Box | ENDPOINT | Yes | Displays the result of the most recent BitLocker key backup attempt. |

### Groups

| Name | Purpose |
|------|---------|
| [BitLocker Key Backup Enabled](/docs/72e98ffa-ed78-4986-a655-99bb4ad3f2a9) | Dynamic group targeting devices where BitLocker key backup is enabled. |
| [BitLocker Key Backup Failed](/docs/2e46432a-eb14-4da0-803a-aec15892a6ec) | Group of machines where BitLocker key backup failed. |
| [BitLocker Key Backup Successful](/docs/5cedafdb-6a2f-4ec5-9c46-869986eb186e) | Group of machines where BitLocker key backup was successful. |
| [BitLocker Key Missing](/docs/819b7ac8-aa64-41b8-84d0-2123df0ef68e) | Group of machines where BitLocker recovery keys were not found. |

### Task

| Name | Purpose |
|------|---------|
| [BitLocker Recovery Key Backup](/docs/b469ea90-0c1b-421b-89e2-be5c91501035) | Script that backs up BitLocker recovery keys to Active Directory or Azure AD. |

## Implementation

### Step 1: Create the Required Custom Fields

Create all the custom fields listed above under `SETTINGS → Custom Fields` in CW RMM:

- [Enable BitLocker Key Backup](/docs/14c8ed9d-5357-432d-a8f2-8d522ac9f991)
- [Disable BitLocker Key Backup (Site)](/docs/f164c9c8-effe-48ce-9cd3-bc0b8a5e7025)
- [Disable BitLocker Key Backup (Endpoint)](/docs/6c9022a4-43db-49f3-8f89-ae27d8e340a4)
- [BitLocker Key Backup Status](/docs/362c3958-f97e-4f40-bd1d-89cbfed9b17f)

### Step 2: Create the Dynamic Groups

Create the dynamic groups under `ENDPOINTS → Groups`:

- [BitLocker Key Backup Enabled](/docs/72e98ffa-ed78-4986-a655-99bb4ad3f2a9)
- [BitLocker Key Backup Failed](/docs/2e46432a-eb14-4da0-803a-aec15892a6ec)
- [BitLocker Key Backup Successful](/docs/5cedafdb-6a2f-4ec5-9c46-869986eb186e)
- [BitLocker Key Missing](/docs/819b7ac8-aa64-41b8-84d0-2123df0ef68e)

### Step 3: Create and Schedule the Task

- Create the [BitLocker Recovery Key Backup](/docs/b469ea90-0c1b-421b-89e2-be5c91501035) task under `AUTOMATION → Tasks` and schedule it to run daily against the [BitLocker Key Backup Enabled](/docs/72e98ffa-ed78-4986-a655-99bb4ad3f2a9) group.

### Step 4: Configure Monitoring and Alerting

Use the status groups to monitor backup success and failure rates:

- Monitor [BitLocker Key Backup Failed](/docs/2e46432a-eb14-4da0-803a-aec15892a6ec) for devices needing attention
- Monitor [BitLocker Key Missing](/docs/819b7ac8-aa64-41b8-84d0-2123df0ef68e) for devices without recoverable keys
- Track [BitLocker Key Backup Successful](/docs/5cedafdb-6a2f-4ec5-9c46-869986eb186e) for compliance reporting

## FAQ

**Q: What happens if a device is excluded at the site or endpoint level?**  
A: Devices or sites flagged for exclusion will not have their BitLocker keys backed up automatically. However, the backup task can be executed manually if needed.

**Q: How often does the solution attempt to backup BitLocker keys?**  
A: The task is designed to run daily, but this can be adjusted based on your organizational requirements.

**Q: Can I trigger the backup manually?**  
A: Yes, the BitLocker Recovery Key Backup task can be run on demand independent of the schedule.

**Q: Where are the recovery keys backed up to?**  
A: The keys are backed up to either Active Directory or Azure Active Directory, depending on your environment configuration.

**Q: What OSes are supported for automatic backup?**  
A: Supported OS selection is controlled by the [Enable BitLocker Key Backup](/docs/14c8ed9d-5357-432d-a8f2-8d522ac9f991) custom field (Windows Workstation, Windows Server, Both, or Disabled).

**Q: How can I verify if keys were successfully backed up?**  
A: Check the [BitLocker Key Backup Status](/docs/362c3958-f97e-4f40-bd1d-89cbfed9b17f) custom field on each endpoint or monitor the [BitLocker Key Backup Successful](/docs/5cedafdb-6a2f-4ec5-9c46-869986eb186e) group.
