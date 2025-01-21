---
id: 'ff998a72-b705-497c-a96b-15116f62b2a8'
title: 'Windows 10 to Windows 11 Upgrade Solution'
title_meta: 'Windows 10 to Windows 11 Upgrade Solution'
keywords: ['windows', 'upgrade', 'installation', 'compatibility', 'customfield', 'policy', 'task']
description: 'This document outlines a solution for identifying Windows 10 computers that are compatible with Windows 11 and facilitating their upgrade. It includes details on custom fields, device groups, tasks, and policies necessary for the upgrade process, as well as backup options in case of policy failure.'
tags: ['installation', 'windows']
draft: false
unlisted: false
---

## Purpose

The solution aims to identify Windows 10 computers that are compatible with Windows 11 for an upgrade. It initiates the upgrade to Windows 11 for compatible computers.

**Note:** The solution employs a policy and package to automatically upgrade compatible Windows 10 computers. In cases where the upgrade policy fails, the [Windows 11 Installer (Beta)](https://proval.itglue.com/DOC-5078775-15835365) task can serve as a backup script to facilitate the upgrade.

## Upgrade Notice: 9-November-2024

The solution has been updated to use a policy for the Windows 10 to Windows 11 upgrade. Remove the following content before going through the solution:

- **Custom Field:** Windows 11 Upgrade Failed
- **Custom Field:** Windows 11 Upgrade RunTime
- **Group:** Windows 11 Compatibility Check Enabled
- **Task:** Windows 11 Installation Validation
- **Monitor:** Windows 11 Installation Failed

## Associated Content

#### Custom Fields

| Content | Type | Level | Function |
| ------- | ---- | ----- | -------- |
| [Enable Windows 11 Installation](<../cwrmm/custom-fields/Company - Enable Windows 11 Installation.md>) | Flag | Company | Mark this custom field to enable Windows 11 installation for the Windows 10 machines of the company. |
| [Exclude Windows 11 Installation](<../cwrmm/custom-fields/Site - Exclude Windows 11 Installation.md>) | Flag | Site | Mark this custom field to exclude the endpoints of this site from the Windows 10 to 11 upgrade. |
| [Exclude Windows 11 Installation](<../cwrmm/custom-fields/Endpoint - Exclude Windows 11 Installation.md>) | Flag | Endpoint | Mark this custom field to exclude the endpoint from the Windows 10 to 11 upgrade process. |
| [Windows 11 Compatible](<../cwrmm/custom-fields/Endpoint - Windows 11 Compatible.md>) | Dropdown | Endpoint | `Yes`: Compatible. `No`: Incompatible. `NA`: Not Checked yet. Updated by the [Windows 11 Compatibility Validation](<../cwrmm/tasks/Windows 11 Compatibility Validation.md>) task. |
| [Windows 11 Incompatibility Base](<../cwrmm/custom-fields/Endpoint - Windows 11 incompatibility Base.md>) | Text Box | Endpoint | Stores the result returned by the [Windows 11 Compatibility Validation](<../cwrmm/tasks/Windows 11 Compatibility Validation.md>) task for the incompatible machines. |

#### Device Groups

| Content | Type | Description |
| ------- | ---- | ----------- |
| [Windows 10 Machines](<../cwrmm/groups/Windows 10 Machines.md>) | Dynamic | Windows 10 machines. The [Windows 11 Compatibility Validation](<../cwrmm/tasks/Windows 11 Compatibility Validation.md>) task will be scheduled against this group. |
| [Windows 11 Compatible Machines](<../cwrmm/groups/Windows 11 Compatible Machines.md>) | Dynamic | Houses the Windows 10 computers that are compatible with the Windows 11 upgrade. It is a view-only group. |
| [Upgrade Enabled Windows 11 Compatible Machines](<../cwrmm/groups/Upgrade Enabled Windows 11 Compatible Machines.md>) | Dynamic | A group of Windows 10 machines that are compatible with Windows 11 installation and upgrade, enabled through the custom fields. |
| [Windows 11 Incompatible Machines](<../cwrmm/groups/Windows 11 incompatible machines.md>) | Dynamic | A group of Windows 10 computers that are not compatible with Windows 11. |

#### Tasks

| Content | Type | Description |
| ------- | ---- | ----------- |
| [Windows 11 Compatibility Validation](<../cwrmm/tasks/Windows 11 Compatibility Validation.md>) | Script Editor | Verifies if a Windows 10 PC is compatible with Windows 11. Scheduled to run monthly against [Windows 10 Machines](<../cwrmm/groups/Windows 10 Machines.md>). |

#### Policies

| Content | Type | Description |
| ------- | ---- | ----------- |
| [Install Windows 11](https://proval.itglue.com/DOC-5078775-18002003) | OS Patching Desktop | Policy to enable Windows 11 installation for Windows 10 machines. |

#### Packages

| Content | Type | Description |
| ------- | ---- | ----------- |
| [Install Windows 11](https://proval.itglue.com/DOC-5078775-18002769) | Policy Group | Enables Windows 11 installation for compatible Windows 10 computers. |

#### Optional Tasks

| Content | Type | Description |
| ------- | ---- | ----------- |
| [Windows 11 Installer (Beta)](https://proval.itglue.com/DOC-5078775-15835365) | Script Editor | This task can be used as a backup plan in case of Windows 11 installation policy failure. Installs Windows 11 on a compatible Windows 10 computer. The default nature of the script is to restart the computer to complete the upgrade. However, the `NoReboot` parameter provides an option to suppress the reboot. The computer should be rebooted at the earliest convenience to complete the upgrade. |

## Implementation

1. Create the following custom fields:
   - [Enable Windows 11 Installation](<../cwrmm/custom-fields/Company - Enable Windows 11 Installation.md>)
   - Site - [Exclude Windows 11 Installation](<../cwrmm/custom-fields/Site - Exclude Windows 11 Installation.md>)
   - Endpoint - [Exclude Windows 11 Installation](<../cwrmm/custom-fields/Endpoint - Exclude Windows 11 Installation.md>)
   - [Windows 11 Compatible](<../cwrmm/custom-fields/Endpoint - Windows 11 Compatible.md>)
   - [Windows 11 Incompatibility Base](<../cwrmm/custom-fields/Endpoint - Windows 11 incompatibility Base.md>)

2. Create the following device groups:
   - [Windows 10 Machines](<../cwrmm/groups/Windows 10 Machines.md>)
   - [Windows 11 Compatible Machines](<../cwrmm/groups/Windows 11 Compatible Machines.md>)
   - [Upgrade Enabled Windows 11 Compatible Machines](<../cwrmm/groups/Upgrade Enabled Windows 11 Compatible Machines.md>)
   - [Windows 11 Incompatible Machines](<../cwrmm/groups/Windows 11 incompatible machines.md>)

3. Create and deploy the following task:
   - [Windows 11 Compatibility Validation](<../cwrmm/tasks/Windows 11 Compatibility Validation.md>)

4. Create the following optional task:
   - [Windows 11 Installer (Beta)](https://proval.itglue.com/DOC-5078775-15835365)

5. Create the following policy:
   - [Install Windows 11](https://proval.itglue.com/DOC-5078775-18002003)

   **Note of Caution:**
   - This policy document is just for reference.
   - Do not create a new policy if a patch policy already exists and enable the `OS Upgrade` in the same policy.
   - Making a separate patch policy group just for upgrading the OS while leaving the rest of the patching off will override the existing patch policy for that machine, and that machine won't receive any patches EXCEPT for the OS upgrade.

6. Create the following policy group:
   - [Install Windows 11](https://proval.itglue.com/DOC-5078775-18002769)

   **Note of Caution:**
   - This policy group document is just for reference.
   - Use the existing policy in conjunction with the policy group if you have not created a new one.
   - The end goal here is to apply an `OS Upgrade` enabled policy against the [Upgrade Enabled Windows 11 Compatible Machines](<../cwrmm/groups/Upgrade Enabled Windows 11 Compatible Machines.md>) group.
