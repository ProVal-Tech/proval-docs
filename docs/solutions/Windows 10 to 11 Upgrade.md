---
id: 'ff998a72-b705-497c-a96b-15116f62b2a8'
slug: /ff998a72-b705-497c-a96b-15116f62b2a8
title: 'Windows 10 to 11 Upgrade'
title_meta: 'Windows 10 to 11 Upgrade'
keywords: ['windows', 'upgrade', 'installation', 'compatibility', 'customfield', 'policy', 'task']
description: 'This document outlines a solution for identifying Windows 10 computers that are compatible with Windows 11 and facilitating their upgrade. It includes details on custom fields, device groups, tasks, and policies necessary for the upgrade process, as well as backup options in case of policy failure.'
tags: ['installation', 'windows']
draft: false
unlisted: false
---

## Purpose

The solution aims to identify Windows 10 computers that are compatible with Windows 11 for an upgrade. It initiates the upgrade to Windows 11 for compatible computers.

**Note:** The solution employs a policy and package to automatically upgrade compatible Windows 10 computers. In cases where the upgrade policy fails, the [Windows 11 Installer (Beta)](/docs/96cec9d2-d276-47a5-a1c5-d79d561c192a) task can serve as a backup script to facilitate the upgrade.

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
| [Enable Windows 11 Installation](/docs/2567ed9c-49da-40f2-b566-9d6e8d2f87b8) | Flag | Company | Mark this custom field to enable Windows 11 installation for the Windows 10 machines of the company. |
| [Exclude Windows 11 Installation](/docs/bb84e821-38c5-4b39-ad4c-894eef47bf79) | Flag | Site | Mark this custom field to exclude the endpoints of this site from the Windows 10 to 11 upgrade. |
| [Exclude Windows 11 Installation](/docs/c3f83443-09cb-43ef-9c21-501d7f13314e) | Flag | Endpoint | Mark this custom field to exclude the endpoint from the Windows 10 to 11 upgrade process. |
| [Windows 11 Compatible](/docs/99719e54-ce8f-4b76-93f4-cc832a3b88cf) | Dropdown | Endpoint | `Yes`: Compatible. `No`: Incompatible. `NA`: Not Checked yet. Updated by the [Windows 11 Compatibility Validation](/docs/007d88ec-68b1-45fa-8d95-9c279218ac3c) task. |
| [Windows 11 Incompatibility Base](/docs/7894870c-b7e8-44e0-806c-c948f151fc49) | Text Box | Endpoint | Stores the result returned by the [Windows 11 Compatibility Validation](/docs/007d88ec-68b1-45fa-8d95-9c279218ac3c) task for the incompatible machines. |

#### Device Groups

| Content | Type | Description |
| ------- | ---- | ----------- |
| [Windows 10 Machines](/docs/8d5c2d6a-5bb8-4720-bd11-4fa7396fbf7a) | Dynamic | Windows 10 machines. The [Windows 11 Compatibility Validation](/docs/007d88ec-68b1-45fa-8d95-9c279218ac3c) task will be scheduled against this group. |
| [Windows 11 Compatible Machines](/docs/9bfa70b2-a410-45d7-a8cc-a75c8e90c6f5) | Dynamic | Houses the Windows 10 computers that are compatible with the Windows 11 upgrade. It is a view-only group. |
| [Upgrade Enabled Windows 11 Compatible Machines](/docs/9c422249-e949-4bcd-83ea-2c91b8365a96) | Dynamic | A group of Windows 10 machines that are compatible with Windows 11 installation and upgrade, enabled through the custom fields. |
| [Windows 11 Incompatible Machines](/docs/6b52f66a-4b64-4d36-9f9f-74379510cf68) | Dynamic | A group of Windows 10 computers that are not compatible with Windows 11. |

#### Tasks

| Content | Type | Description |
| ------- | ---- | ----------- |
| [Windows 11 Compatibility Validation](/docs/007d88ec-68b1-45fa-8d95-9c279218ac3c) | Script Editor | Verifies if a Windows 10 PC is compatible with Windows 11. Scheduled to run monthly against [Windows 10 Machines](/docs/8d5c2d6a-5bb8-4720-bd11-4fa7396fbf7a). |

#### Policies

| Content | Type | Description |
| ------- | ---- | ----------- |
| [Install Windows 11](/docs/4664a942-cb4f-425a-ae16-4615d2b14cae) | OS Patching Desktop | Policy to enable Windows 11 installation for Windows 10 machines. |

#### Packages

| Content | Type | Description |
| ------- | ---- | ----------- |
| [Install Windows 11](/docs/9d9148ad-26f7-45c6-ab6a-37e85dc259e8) | Policy Group | Enables Windows 11 installation for compatible Windows 10 computers. |

#### Optional Tasks

| Content | Type | Description |
| ------- | ---- | ----------- |
| [Windows 11 Installer (Beta)](/docs/96cec9d2-d276-47a5-a1c5-d79d561c192a) | Script Editor | This task can be used as a backup plan in case of Windows 11 installation policy failure. Installs Windows 11 on a compatible Windows 10 computer. The default nature of the script is to restart the computer to complete the upgrade. However, the `NoReboot` parameter provides an option to suppress the reboot. The computer should be rebooted at the earliest convenience to complete the upgrade. |

## Implementation

1. Create the following custom fields:
   - [Enable Windows 11 Installation](/docs/2567ed9c-49da-40f2-b566-9d6e8d2f87b8)
   - Site - [Exclude Windows 11 Installation](/docs/bb84e821-38c5-4b39-ad4c-894eef47bf79)
   - Endpoint - [Exclude Windows 11 Installation](/docs/c3f83443-09cb-43ef-9c21-501d7f13314e)
   - [Windows 11 Compatible](/docs/99719e54-ce8f-4b76-93f4-cc832a3b88cf)
   - [Windows 11 Incompatibility Base](/docs/7894870c-b7e8-44e0-806c-c948f151fc49)

2. Create the following device groups:
   - [Windows 10 Machines](/docs/8d5c2d6a-5bb8-4720-bd11-4fa7396fbf7a)
   - [Windows 11 Compatible Machines](/docs/9bfa70b2-a410-45d7-a8cc-a75c8e90c6f5)
   - [Upgrade Enabled Windows 11 Compatible Machines](/docs/9c422249-e949-4bcd-83ea-2c91b8365a96)
   - [Windows 11 Incompatible Machines](/docs/6b52f66a-4b64-4d36-9f9f-74379510cf68)

3. Create and deploy the following task:
   - [Windows 11 Compatibility Validation](/docs/007d88ec-68b1-45fa-8d95-9c279218ac3c)

4. Create the following optional task:
   - [Windows 11 Installer (Beta)](/docs/96cec9d2-d276-47a5-a1c5-d79d561c192a)

5. Create the following policy:
   - [Install Windows 11](/docs/4664a942-cb4f-425a-ae16-4615d2b14cae)

   **Note of Caution:**
   - This policy document is just for reference.
   - Do not create a new policy if a patch policy already exists and enable the `OS Upgrade` in the same policy.
   - Making a separate patch policy group just for upgrading the OS while leaving the rest of the patching off will override the existing patch policy for that machine, and that machine won't receive any patches EXCEPT for the OS upgrade.

6. Create the following policy group:
   - [Install Windows 11](/docs/9d9148ad-26f7-45c6-ab6a-37e85dc259e8)

   **Note of Caution:**
   - This policy group document is just for reference.
   - Use the existing policy in conjunction with the policy group if you have not created a new one.
   - The end goal here is to apply an `OS Upgrade` enabled policy against the [Upgrade Enabled Windows 11 Compatible Machines](/docs/9c422249-e949-4bcd-83ea-2c91b8365a96) group.



