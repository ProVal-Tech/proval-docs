---
id: '0ebb7e89-d2d8-40d4-ba1e-330ab20f86cd'
slug: /0ebb7e89-d2d8-40d4-ba1e-330ab20f86cd
title: 'Windows User Profiles'
title_meta: 'Windows User Profiles'
keywords: ['user-profiles', 'local-users', 'local-admin', 'profile-size', 'custom-field', 'audit', 'cw-rmm']
description: 'Audits the user profiles and local user accounts on Windows machines and stores each user''s local account, local administrator, profile size, and enabled status in a CW RMM custom field.'
tags: ['auditing', 'report', 'security', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-10-22
---

## Purpose

The **Windows User Profiles** solution audits the user profiles and local user accounts on your Windows machines and stores the results in the [User Profiles](/docs/e390856a-cc1c-4dde-93e4-f714f2d08258) custom field. For each user, the field shows the username, whether it's a local account, whether it has local administrator rights, the profile size in MB, and whether the account is enabled.

Use it to:

- See who has local administrator rights on each machine, including rights granted through nested groups.
- Find large profiles before a disk cleanup.
- Spot enabled local accounts, such as an active built-in Administrator account.

The solution's task runs the [Get-UserProfiles](/docs/dee76265-9071-47bb-9262-d656dd8b5c6d) script, which only reads information and changes nothing on the machine:

- **Targeting:** The [Windows Machines (Non‑DC)](/docs/aa76fac8-dac7-44d9-897d-d0f6f15609dc) group selects Windows 10, Windows 11, and Windows Server 2016 or later machines that are not domain controllers. The task also checks this itself and fails on any other machine.
- **Collection:** The script is downloaded from ProVal's content repository, and its digital signature is verified before it runs.
- **Storage:** The results are written to the custom field in a compact, comma-separated format. The [User Profiles](/docs/e390856a-cc1c-4dde-93e4-f714f2d08258) custom field document explains how to read the value.
- **Character limit:** The custom field holds at most 999 characters written by automation. On machines with many users, whole entries are dropped from the end of the list so the value always fits. The task log always shows the complete list.
- **Safe failures:** If any step fails, the task stops and the custom field keeps its previous value instead of being cleared or overwritten with partial data.

## Associated Content

### Group

| Name | Purpose |
|---|---|
| [Windows Machines (Non‑DC)](/docs/aa76fac8-dac7-44d9-897d-d0f6f15609dc) | Dynamic group of Windows 10, Windows 11, and Windows Server 2016 or later machines, excluding domain controllers. |

### Task

| Name | Purpose |
|---|---|
| [User Profile - Get Information](/docs/aeb4ccec-bf76-436d-8b0c-cd3ec3d39131) | Runs the user profile audit and stores the results in the User Profiles custom field. |

### Custom Field

| Name | Level | Type | Purpose |
|---|---|---|---|
| [User Profiles](/docs/e390856a-cc1c-4dde-93e4-f714f2d08258) | Endpoint | Textarea | Stores the audit results for each machine. |

### Script

| Name | Purpose |
|---|---|
| [Get-UserProfiles](/docs/dee76265-9071-47bb-9262-d656dd8b5c6d) | The script the task downloads and runs to collect the user information. |

## Implementation

Follow these steps in order to deploy the solution.

### Step 1: Create the Custom Field

Create the [User Profiles](/docs/e390856a-cc1c-4dde-93e4-f714f2d08258) custom field under `SETTINGS` ➞ `Custom Fields` as an **Endpoint** level **Textarea** field.

### Step 2: Create the Dynamic Group

Create the [Windows Machines (Non‑DC)](/docs/aa76fac8-dac7-44d9-897d-d0f6f15609dc) group under `ENDPOINTS` ➞ `Groups` as a dynamic group.

### Step 3: Create the Task

Create the [User Profile - Get Information](/docs/aeb4ccec-bf76-436d-8b0c-cd3ec3d39131) task under `AUTOMATION` ➞ `Tasks`. Its last step writes the output to the **User Profiles** custom field, so the custom field from Step 1 must exist first.

### Step 4: Schedule the Task

Schedule the task against the [Windows Machines (Non‑DC)](/docs/aa76fac8-dac7-44d9-897d-d0f6f15609dc) group, following the [Schedule Task](/docs/aeb4ccec-bf76-436d-8b0c-cd3ec3d39131#schedule-task) section of the task document.

### Upgrading From the Previous Version

If the earlier version of this solution is already deployed, update each component:

1. **Custom field:** Change the **User Profiles** custom field type from **Text** to **Textarea**. A Text field holds only 255 characters, which isn't enough for most machines.
2. **Group:** Remove the **Available** criterion and add the **OS Version** criterion, as shown in the [group document](/docs/aa76fac8-dac7-44d9-897d-d0f6f15609dc).
3. **Task:** Replace all existing rows in the task with the five rows described in the [task document](/docs/aeb4ccec-bf76-436d-8b0c-cd3ec3d39131).

## FAQ

### Q: How do I read the value in the custom field?

> Each user is one entry in the format `Username,LocalAccount,LocalAdmin,ProfileSize,Enabled|`, where `1` means yes and `0` means no, and the profile size is in MB. For example, `CONTOSO\jdoe,0,1,20480.75,1|` is a domain user with local administrator rights and a 20 GB profile. See the [User Profiles](/docs/e390856a-cc1c-4dde-93e4-f714f2d08258) custom field document for the full details.

### Q: Why are some users missing from the custom field?

> CW RMM accepts at most 999 characters when automation writes to a Textarea custom field, and longer values make the task fail. When the data is longer, the task drops whole entries from the end of the list until it fits. Local accounts without a profile, such as Guest, are listed last, so they are dropped first. The task log shows a warning with both the stored value and the complete list.

### Q: Why do domain and Entra ID accounts always show as enabled?

> Only local accounts can be checked on the machine itself. Domain and Microsoft Entra ID accounts are managed outside the machine, so their enabled value is always `1`. Check those accounts in Active Directory or the Microsoft Entra admin center.

### Q: Why does a username end with (Inferred)?

> The machine couldn't look up the account, usually because it was deleted or the domain controller couldn't be reached. The name is then taken from the profile folder, such as `C:\Users\jdoe`.

### Q: A user has administrator rights, but the field shows 0 for local admin. Why?

> The rights most likely come from a Microsoft Entra ID role, such as Global Administrator. These roles appear in the local Administrators group in a form the machine can't look inside. Check the user's roles in the Microsoft Entra admin center.

### Q: Why isn't the custom field updating?

> The custom field is only updated when every step of the task succeeds. Check the task's script log for the error. Common causes are a machine that is a domain controller or runs a Windows version older than Windows 10 or Windows Server 2016, or blocked access to `contentrepo.net` or the PowerShell Gallery.

### Q: Why does the task take several minutes on some machines?

> The profile size is measured by reading every file in every profile. Machines with many or large profiles take longer.

### Q: What are the prerequisites for running the task?

> Windows 10, Windows 11, or Windows Server 2016 or later, PowerShell 5.1, and internet access to `contentrepo.net` and the PowerShell Gallery. The task runs as SYSTEM through CW RMM.

## Changelog

### 2026-10-22

- **Task:** Replaced the task logic with five rows. The task now verifies the downloaded script's signature, shows the script log, and stops without touching the custom field if anything fails.
- **Character Limit:** Values longer than 999 characters are now shortened by dropping whole entries from the end of the list, and the task log shows the complete data.
- **Custom Field:** Changed the **User Profiles** custom field from **Text** to **Textarea** to store up to 999 characters instead of 255.
- **Group:** Removed the **Available** criterion and added an **OS Version** criterion, so the group targets Windows 10, Windows 11, and Windows Server 2016 or later machines, online or offline.
- Rewrote the document and added the upgrade steps and FAQ.

### 2026-03-11

- Initial version of the document
