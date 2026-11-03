---
id: '96566a96-f339-4055-82e2-761bedaf6a5f'
slug: /96566a96-f339-4055-82e2-761bedaf6a5f
title: 'AD Recycle Bin'
title_meta: 'AD Recycle Bin'
keywords: ['active-directory', 'recycle', 'bin', 'domain', 'controllers']
description: 'Enables the Active Directory Recycle Bin on domain controllers in NinjaOne based on custom field selection and tracks which domain controllers have it enabled.'
tags: ['active-directory', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-10-29
---

## Purpose

This solution enables the Active Directory Recycle Bin on domain controllers managed in NinjaOne. With the Recycle Bin enabled, deleted Active Directory objects such as users, groups, and organizational units can be restored with all their attributes and group memberships, instead of being rebuilt by hand or recovered from a system state backup.

Administrators choose where the feature should be enabled with the [Custom Field : cPVAL Enable AD Recycle Bin](/docs/eb9a619c-3a91-4832-ad9d-2734840a200e) custom field. The [Compound Condition : AD - Enable AD Recycle Bin](/docs/d0e9c568-145f-4ee5-b545-ff4bbb022f84) then runs the [Automation : Active Directory - Enable AD Recycle Bin](/docs/afd7cc1e-9518-4eef-9685-7f2653248b8f) on domain controllers where the feature is not yet enabled. The automation records the result in [Custom Field : cPVAL AD Recycle Bin State](/docs/e107ce39-7a0c-42ef-92b4-2951d9f02f20), and the [Group : cPVAL AD Recycle Bin Enabled DCs](/docs/85769404-508e-4e88-a40f-127b1e3de881) lists the domain controllers where it is enabled.

**Platform:** `NinjaOne`

### Key Capabilities

- **Automated enablement** – Enables the Active Directory Recycle Bin without anyone signing in to a domain controller.
- **Custom field control** – The enable field can be set at the Organization, Location, or Device level, so the feature can be turned on for a whole client and excluded for specific locations or devices.
- **Runs only when needed** – The compound condition skips domain controllers where the Recycle Bin is already recorded as enabled, so the automation does not run again after it succeeds.
- **State tracking** – The current Recycle Bin state is stored on each device, and a group lists every domain controller where it is enabled.

### Important Caveats & Behavior

- **Depends on Server Roles Detection** – The compound condition identifies domain controllers using [Custom Field : cPVAL Roles Detected](/docs/e9ec73dd-98b1-4436-a027-4ee8906f7cba), which is populated by [Solution - Server Roles Detection and Grouping for NinjaOne](/docs/56ed4b40-11ce-4f8d-b1ca-c897d2c496e6). That solution must be implemented and enabled in the client environment, or no domain controllers will be targeted.
- **Enabling cannot be undone** – Once the Active Directory Recycle Bin is enabled in a forest, Microsoft provides no way to disable it. Confirm with the client before setting the field to `Enable`.
- **Forest-wide change** – The Recycle Bin is a forest-wide feature. Enabling it from one domain controller enables it for every domain in the forest.
- **Infrastructure Master only** – The automation acts on the domain controller that holds the Infrastructure Master role. That is the device where the state is recorded and that appears in the group.
- **Forest functional level** – The forest functional level must be Windows Server 2008 R2 or higher.
- **No recovery of earlier deletions** – Objects deleted before the Recycle Bin was enabled cannot be restored through it.
- **Retention window** – Deleted objects can be restored only within the deleted object lifetime, which is 180 days by default.

## How It Works

1. [Solution - Server Roles Detection and Grouping for NinjaOne](/docs/56ed4b40-11ce-4f8d-b1ca-c897d2c496e6) detects the roles installed on each Windows server and stores them in [Custom Field : cPVAL Roles Detected](/docs/e9ec73dd-98b1-4436-a027-4ee8906f7cba).
2. [Custom Field : cPVAL Enable AD Recycle Bin](/docs/eb9a619c-3a91-4832-ad9d-2734840a200e) is set to `Enable` at the Organization, Location, or Device level.
3. [Compound Condition : AD - Enable AD Recycle Bin](/docs/d0e9c568-145f-4ee5-b545-ff4bbb022f84) finds Windows domain controllers (servers where [Custom Field : cPVAL Roles Detected](/docs/e9ec73dd-98b1-4436-a027-4ee8906f7cba) contains `Active Directory Domain Services`) where the enable field is `Enable` and [Custom Field : cPVAL AD Recycle Bin State](/docs/e107ce39-7a0c-42ef-92b4-2951d9f02f20) is not `Enable`.
4. The compound condition runs [Automation : Active Directory - Enable AD Recycle Bin](/docs/afd7cc1e-9518-4eef-9685-7f2653248b8f), which enables the Recycle Bin on the Infrastructure Master.
5. The automation writes the result to [Custom Field : cPVAL AD Recycle Bin State](/docs/e107ce39-7a0c-42ef-92b4-2951d9f02f20).
6. Domain controllers where the state is `Enable` appear in [Group : cPVAL AD Recycle Bin Enabled DCs](/docs/85769404-508e-4e88-a40f-127b1e3de881) and are no longer targeted by the compound condition.

## Prerequisites

- [Solution - Server Roles Detection and Grouping for NinjaOne](/docs/56ed4b40-11ce-4f8d-b1ca-c897d2c496e6) implemented and enabled in the client environment
- Windows domain controllers running Windows Server 2008 R2 or later
- Forest functional level of Windows Server 2008 R2 or higher
- PowerShell 5.1 on the domain controllers
- Client approval to enable the Recycle Bin, since the change cannot be reversed

## Associated Content

### Custom Fields

| Name | Level | Type | Purpose |
|---|---|---|---|
| [cPVAL Enable AD Recycle Bin](/docs/eb9a619c-3a91-4832-ad9d-2734840a200e) | Organization, Location, Device | Drop-down | Controls whether the Recycle Bin should be enabled. Options are `Enable` and `Disable`. |
| [cPVAL AD Recycle Bin State](/docs/e107ce39-7a0c-42ef-92b4-2951d9f02f20) | Device | Text | Stores whether the Recycle Bin is enabled on the domain controller. Updated by the [Active Directory - Enable AD Recycle Bin](/docs/afd7cc1e-9518-4eef-9685-7f2653248b8f). |

### Automation

| Name | Purpose |
|---|---|
| [Active Directory - Enable AD Recycle Bin](/docs/afd7cc1e-9518-4eef-9685-7f2653248b8f) | Enables the Active Directory Recycle Bin on the Infrastructure Master and updates the  [cPVAL AD Recycle Bin State](/docs/e107ce39-7a0c-42ef-92b4-2951d9f02f20). |

### Compound Condition

| Name | Type | Purpose |
|---|---|---|
| [AD - Enable AD Recycle Bin](/docs/d0e9c568-145f-4ee5-b545-ff4bbb022f84) | Compound Condition | Executes  [Automation : Active Directory - Enable AD Recycle Bin](/docs/afd7cc1e-9518-4eef-9685-7f2653248b8f) on Windows domain controllers where [Custom Field : cPVAL Enable AD Recycle Bin](/docs/eb9a619c-3a91-4832-ad9d-2734840a200e) is set to Enable and [Custom Field : cPVAL AD Recycle Bin State](/docs/e107ce39-7a0c-42ef-92b4-2951d9f02f20) is not set to Enable, to enable the Active Directory Recycle Bin on the Domain server. |

### Group

| Name | Type | Purpose |
|---|---|---|
| [cPVAL AD Recycle Bin Enabled DCs](/docs/85769404-508e-4e88-a40f-127b1e3de881) | Dynamic | Lists the Infrastructure Masters where the Active Directory Recycle Bin is enabled. |

### Dependencies

| Name | Type | Purpose |
|---|---|---|
| [Server Roles Detection and Grouping for NinjaOne](/docs/56ed4b40-11ce-4f8d-b1ca-c897d2c496e6) | Solution | Detects the roles installed on Windows servers and stores them in [Custom Field : cPVAL Roles Detected](/docs/e9ec73dd-98b1-4436-a027-4ee8906f7cba). The [AD - Enable AD Recycle Bin](/docs/d0e9c568-145f-4ee5-b545-ff4bbb022f84) uses this field to identify domain controllers. |

## Implementation

### Step 1: Implement the Server Roles Detection Solution

Implement and enable [Solution - Server Roles Detection and Grouping for NinjaOne](/docs/56ed4b40-11ce-4f8d-b1ca-c897d2c496e6) in the client environment, if it is not already in place. Confirm that [Custom Field : cPVAL Roles Detected](/docs/e9ec73dd-98b1-4436-a027-4ee8906f7cba) is populated on the domain controllers and contains `Active Directory Domain Services`.

### Step 2: Create the Custom Fields

Create both custom fields in NinjaOne.

- [Custom Field : cPVAL Enable AD Recycle Bin](/docs/eb9a619c-3a91-4832-ad9d-2734840a200e)
- [Custom Field : cPVAL AD Recycle Bin State](/docs/e107ce39-7a0c-42ef-92b4-2951d9f02f20)

### Step 3: Create the Automation

Create the automation and set it to run as `System`.

- [Automation : Active Directory - Enable AD Recycle Bin](/docs/afd7cc1e-9518-4eef-9685-7f2653248b8f)

### Step 4: Create the Compound Condition

Create the compound condition and add it to the `Windows Server Policy [Default]` agent policy, or to the policy your domain controllers use.

- [Compound Condition : AD - Enable AD Recycle Bin](/docs/d0e9c568-145f-4ee5-b545-ff4bbb022f84)

### Step 5: Create the Group

Create the group to list the domain controllers where the Recycle Bin is enabled.

- [Group : cPVAL AD Recycle Bin Enabled DCs](/docs/85769404-508e-4e88-a40f-127b1e3de881)

### Step 6: Enable the Recycle Bin

After the client approves the change, set [Custom Field : cPVAL Enable AD Recycle Bin](/docs/eb9a619c-3a91-4832-ad9d-2734840a200e) to `Enable` at the Organization, Location, or Device level. Set it to `Disable` at a lower level to exclude a location or device.

You'll know it worked when [Custom Field : cPVAL AD Recycle Bin State](/docs/e107ce39-7a0c-42ef-92b4-2951d9f02f20) shows `Enable` on the Infrastructure Master and the device appears in [Group : cPVAL AD Recycle Bin Enabled DCs](/docs/85769404-508e-4e88-a40f-127b1e3de881).

## FAQ

### Q: Can I disable the Recycle Bin after it is enabled?

> No. Microsoft does not support disabling the Active Directory Recycle Bin once it is enabled. Setting [Custom Field : cPVAL Enable AD Recycle Bin](/docs/eb9a619c-3a91-4832-ad9d-2734840a200e) to `Disable` only stops the solution from targeting the device. It does not turn the feature off.

### Q: Why does only one domain controller show the state as Enable?

> The automation acts on the domain controller that holds the Infrastructure Master role, so the state is recorded there. The feature itself applies to the whole forest, so every domain controller in the forest benefits from it.

### Q: Will the automation keep running after the Recycle Bin is enabled?

> No. The compound condition only targets domain controllers where [Custom Field : cPVAL AD Recycle Bin State](/docs/e107ce39-7a0c-42ef-92b4-2951d9f02f20) is not `Enable`.

### Q: Can I restore objects deleted before the Recycle Bin was enabled?

> No. Only objects deleted after the Recycle Bin is enabled can be restored through it, and only within the deleted object lifetime (180 days by default).

### Q: The state field is still blank. What should I check?

> - Confirm [Custom Field : cPVAL Enable AD Recycle Bin](/docs/eb9a619c-3a91-4832-ad9d-2734840a200e) resolves to `Enable` on the device.
> - Confirm [Solution - Server Roles Detection and Grouping for NinjaOne](/docs/56ed4b40-11ce-4f8d-b1ca-c897d2c496e6) is enabled and [Custom Field : cPVAL Roles Detected](/docs/e9ec73dd-98b1-4436-a027-4ee8906f7cba) contains `Active Directory Domain Services` on the device.
> - Confirm the compound condition is added to the agent policy assigned to the domain controller.
> - Confirm the device holds the Infrastructure Master role.
> - Confirm the forest functional level is Windows Server 2008 R2 or higher.
> - Review the Activity Details of the device for the automation output.

## Changelog

### 2026-10-29

- Initial version of the document
