---
id: 'rmm-windows-11-upgrade'
title: 'Windows 10 to Windows 11 Upgrade Solution'
title_meta: 'Windows 10 to Windows 11 Upgrade Solution'
keywords: ['windows', 'upgrade', 'installation', 'compatibility', 'customfield', 'policy', 'task']
description: 'This document outlines a solution for identifying Windows 10 computers that are compatible with Windows 11 and facilitating their upgrade. It includes details on custom fields, device groups, tasks, and policies necessary for the upgrade process, as well as backup options in case of policy failure.'
tags: ['upgrade', 'windows', 'policy', 'task', 'customfield', 'compatibility', 'installation']
draft: false
unlisted: false
---
## Purpose

The solution aims to identify Windows 10 computers that are compatible with Windows 11 for an upgrade. Initiate the upgrade to Windows 11 for compatible computers.

**Note:** The solution employs a policy and package to automatically upgrade compatible Windows 10 computers. In cases where the upgrade policy fails, the [Windows 11 Installer (Beta)](https://proval.itglue.com/DOC-5078775-15835365) task can serve as a backup script to facilitate the upgrade.

## Upgrade Notice: 9-November-2024

The solution has been updated to use policy for Windows 10 to Windows 11 upgrade. Remove the following content before going through the solution:

- **Custom Field:** Windows 11 Upgrade Failed
- **Custom Field:** Windows 11 Upgrade RunTime
- **Group:** Windows 11 Compatibility Check Enabled
- **Task:** Windows 11 Installation Validation
- **Monitor:** Windows 11 Installation Failed

## Associated Content

#### Custom Field

| Content | Type | Level | Function |
| ------- | ---- | ----- | -------- |
| [Enable Windows 11 Installation](https://proval.itglue.com/DOC-5078775-15835788) | Flag | Company | Mark this custom field to enable Windows 11 installation for the Windows 10 machines of the company. |
| [Exclude Windows 11 Installation](https://proval.itglue.com/DOC-5078775-15835797) | Flag | Site | Mark this custom field to exclude the endpoints of this site from the Windows 10 to 11 |
| [Exclude Windows 11 Installation](https://proval.itglue.com/DOC-5078775-15835791) | Flag | Endpoint | Mark this custom field to exclude the endpoint from the Windows 10 to 11 upgrade process. |
| [Windows 11 Compatible](https://proval.itglue.com/DOC-5078775-15835398) | Dropdown | Endpoint | `Yes`: Compatible.<br>`No`: Incompatible<br>`NA`: Not Checked yet.<br>Updated by the [Windows 11 Compatibility Validation](https://proval.itglue.com/DOC-5078775-15835244) task. |
| [Windows 11 incompatibility Base](https://proval.itglue.com/DOC-5078775-15835397) | Text Box | Endpoint | Stores the result returned by the [Windows 11 Compatibility Validation](https://proval.itglue.com/DOC-5078775-15835244) task for the incompatible machines. |

#### Device Group

| Content | Type | Description |
| ------- | ---- | ----------- |
| [Windows 10 Machines](https://proval.itglue.com/DOC-5078775-15835802) | Dynamic | Windows 10 machines.<br>[Windows 11 Compatibility Validation](https://proval.itglue.com/DOC-5078775-15835244) task will be scheduled against this group. |
| [Windows 11 Compatible Machines](https://proval.itglue.com/DOC-5078775-15835387) | Dynamic | Houses the Windows 10 computers which are compatible with Windows 11 upgrade. It is a view only group. |
| [Upgrade Enabled Windows 11 Compatible Machines](https://proval.itglue.com/DOC-5078775-15835385) | Dynamic | A group of Windows 10 machines that are compatible with Windows 11 installation and upgrade has been enabled through the custom fields. |
| [Windows 11 incompatible machines](https://proval.itglue.com/DOC-5078775-15835389) | Dynamic | A group of windows 10 computers which are not compatible with Windows 11. |

#### Task

| Content | Type | Description |
| ------- | ---- | ----------- |
| [Windows 11 Compatibility Validation](https://proval.itglue.com/DOC-5078775-15835244) | Script Editor | Verifies if a Windows 10 PC is compatible with Windows 11. Scheduled to run monthly against [Windows 10 Machines](https://proval.itglue.com/DOC-5078775-15835802). |

#### Policy

| Content | Type | Description |
| ------- | ---- | ----------- |
| [Install Windows 11](https://proval.itglue.com/DOC-5078775-18002003) | OS Patching Desktop | Policy to enable Windows 11 installation for Windows 10 machines. |

#### Package

| Content | Type | Description |
| ------- | ---- | ----------- |
| [Install Windows 11](https://proval.itglue.com/DOC-5078775-18002769) | Policy Group | Enables Windows 11 installation for compatible Windows 10 computers. |

#### Optional Task

| Content | Type | Description |
| ------- | ---- | ----------- |
| [Windows 11 Installer (Beta)](https://proval.itglue.com/DOC-5078775-15835365) | Script Editor | This task can be used as a backup plan in case of windows 11 installation policy failure. Installs Windows 11 on a compatible Windows 10 computer. The default nature of the script is to restart the computer to complete the upgrade. Although, the `NoReboot` parameter provides an option to suppress the reboot. However, the computer should be rebooted at the earliest convenience to complete the upgrade. |

## Implementation

1. Create the following custom fields:
   - [Enable Windows 11 Installation](https://proval.itglue.com/DOC-5078775-15835788)
   - Site - [Exclude Windows 11 Installation](https://proval.itglue.com/DOC-5078775-15835797)
   - Endpoint - [Exclude Windows 11 Installation](https://proval.itglue.com/DOC-5078775-15835791)
   - [Windows 11 Compatible](https://proval.itglue.com/DOC-5078775-15835398)
   - [Windows 11 incompatibility Base](https://proval.itglue.com/DOC-5078775-15835397)

2. Create the following device groups:
   - [Windows 10 Machines](https://proval.itglue.com/DOC-5078775-15835802)
   - [Windows 11 Compatible Machines](https://proval.itglue.com/DOC-5078775-15835387)
   - [Upgrade Enabled Windows 11 Compatible Machines](https://proval.itglue.com/DOC-5078775-15835385)
   - [Windows 11 incompatible machines](https://proval.itglue.com/DOC-5078775-15835389)

3. Create and deploy the following tasks:
   - [Windows 11 Compatibility Validation](https://proval.itglue.com/DOC-5078775-15835244)

4. Create the following task:
   - [Windows 11 Installer (Beta)](https://proval.itglue.com/DOC-5078775-15835365)

5. Create the following policy:
   - [Install Windows 11](https://proval.itglue.com/DOC-5078775-18002003)

   **Note of Caution:**
   - This policy document is just for reference.
   - Do not create a new policy if a patch policy already exists and enable the `OS Upgrade` in the same policy.
   - Making a separate patch policy group just for upgrading the OS and leaving the rest of the patching off, that will override the existing patch policy for that machine and then that machine won't get any patches EXCEPT for the OS upgrade.

6. Create the following policy group:
   - [Install Windows 11](https://proval.itglue.com/DOC-5078775-18002769)

   **Note of Caution:**
   - This policy group document is just for reference.
   - Use the existing policy in conjunction with the policy group if you have not created a new one.
   - The end goal here is to apply a `OS Upgrade` enabled policy against the [Upgrade Enabled Windows 11 Compatible Machines](https://proval.itglue.com/DOC-5078775-15835385) group.




