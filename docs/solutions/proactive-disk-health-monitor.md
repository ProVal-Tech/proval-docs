---
id: 'acd55d90-1704-440c-a92e-795c230ecf9a'
slug: /acd55d90-1704-440c-a92e-795c230ecf9a
title: 'Proactive Disk Health Monitor'
title_meta: 'Proactive Disk Health Monitor'
keywords: ['crystaldiskinfo', 'disk', 'health', 'monitoring', 'smart', 'ssd', 'hdd']
description: 'A comprehensive NinjaOne solution that proactively monitors physical disk health using CrystalDiskInfo, captures deep S.M.A.R.T. attributes, and automates ConnectWise Manage ticketing for degraded or failing drives.'
tags: ['performance', 'report', 'software', 'hardware']
draft: false
unlisted: false
last_update:
  date: 2026-08-06
---

## Purpose

The **Proactive Disk Health Monitor** solution provides an automated mechanism to detect and manage physical disk degradation on Windows workstations and laptops. Instead of waiting for a catastrophic drive failure or a blue screen of death, this solution leverages deep S.M.A.R.T. (Self-Monitoring, Analysis, and Reporting Technology) data to identify failing drives early.

When a drive enters a Caution or Bad state, the solution evaluates the device context (such as device age and storage capacity) and automatically generates a detailed support ticket in ConnectWise Manage, complete with hardware replacement recommendations.

> **Important Limitation:** This solution is designed strictly for physical Windows workstations and laptops. It will automatically skip virtual machines. It is also not recommended for enterprise servers, as hardware RAID controllers typically hide physical disks from the operating system, preventing S.M.A.R.T. data collection.

## How It Works

The solution operates using a seamless three-part workflow:

1. **Audit (The Data Collection):** The [CrystalDiskInfo Audit](/docs/7f4b28d1-c65e-4b9a-a8f2-4d9c73e6b5a8) automation runs daily on eligible physical Windows devices. It downloads and executes the [Get-CrystalDiskInfo](/docs/b08e9cd3-931f-4c70-a084-6193fe3702fb) agnostic script to gather deep S.M.A.R.T. data, formats it into HTML tables, and populates the device custom fields.
2. **Evaluation (The Logic):** The audit script reads the [cPVAL Crystal Disk Alert Mode](/docs/72297da9-ba7f-443f-a21a-f56afc638a3e) custom field to determine the alerting behavior. If a drive is in a Caution or Bad state and matches the configured thresholds, it generates a comprehensive HTML ticket payload and checks the [cPVAL Crystal Disk Alert Required](/docs/1e6d84a9-b25c-4d7f-a3b6-7f4e92c8d5a1) checkbox. If the drive recovers, it clears the alert state.
3. **Alerting (The Action):** The [CrystalDiskInfo - Ticket Required](/docs/2d8e63b4-a97c-4f1e-b6d9-5c3f81a7e4d6) compound condition detects the checked box and runs the [CrystalDiskInfo Alert](/docs/4a7c95e2-b83f-4d6c-9b1e-6f2a84d7c3e5) evaluation script. If the script exits with code 1, it triggers the [CrystalDiskInfo](/docs/8e5a26c9-d47b-4f3e-a9c6-2b8f74d1e5a3) ConnectWise Manage ticket template to create a support ticket.

## Key Capabilities

* **Deep S.M.A.R.T. Parsing:** Captures and highlights problematic S.M.A.R.T. attributes for both SATA and NVMe drives, dynamically adapting columns based on the drive interface.
* **Context-Aware Recommendations:** Evaluates device age (via BIOS date) and OS drive free space to recommend whether a simple drive replacement or a full device refresh is more cost-effective.
* **Granular Alerting Modes:** Allows administrators to opt in or out of alerting at the Organization, Location, or Device level, with options to include or exclude replacement recommendations.
* **Fleet-Wide Dashboard:** Automatically groups audited devices into a dedicated NinjaOne group for quick, fleet-wide review of drive health statuses and data collection times.
* **PSA Integration:** Seamlessly creates and closes ConnectWise Manage tickets when drives degrade or recover, keeping the service board clean of stale hardware alerts.

---

## Associated Content

### Custom Fields

| Name | Type | Level | Purpose |
| :--- | :--- | :--- | :--- |
| [cPVAL Crystal Disk Alert Mode](/docs/72297da9-ba7f-443f-a21a-f56afc638a3e) | Dropdown | Org, Loc, Dev | Controls the automated alerting behavior and determines if tickets are generated for Bad or Caution drive statuses. |
| [cPVAL Crystal Disk Health Status](/docs/3f8a1c2e-9b47-4d5a-a6e3-1c9d84b2f7a5) | Text | Device | Auto-populated comma-separated summary of each physical disk health status. |
| [cPVAL Crystal Disk Basic Info](/docs/8d2b6f41-c73e-4a92-b5d8-6e1f3a9c4b27) | WYSIWYG | Device | Auto-populated HTML table showing essential specifications for each physical disk. |
| [cPVAL Crystal Disk SMART Info](/docs/5a9e3d76-f184-4c2b-9a6d-2b7e85c3d1f4) | WYSIWYG | Device | Auto-populated HTML table of detailed S.M.A.R.T. attributes. Problematic attributes are highlighted in red. |
| [cPVAL Crystal Disk Data Collection Time](/docs/c47b9e25-a63d-4f81-8c5e-9d2a64f7b3c8) | Text | Device | Auto-populated timestamp of the last successful audit run. |
| [cPVAL Crystal Disk Alert Required](/docs/1e6d84a9-b25c-4d7f-a3b6-7f4e92c8d5a1) | Checkbox | Device | Auto-populated flag indicating whether a disk health alert ticket is required. |
| [cPVAL Crystal Disk Alert Content](/docs/9b3f7c52-d81a-4e6c-b94f-3a8d75e2c6b9) | WYSIWYG | Device | Auto-populated HTML payload used as the reference for the ticket body when an alert is required. |

### Automations

| Name | Platform | Purpose |
| :--- | :--- | :--- |
| [CrystalDiskInfo Audit](/docs/7f4b28d1-c65e-4b9a-a8f2-4d9c73e6b5a8) | Windows | Audits disk health, populates custom fields, and generates the HTML alert payload if a drive is degraded. |
| [CrystalDiskInfo Alert](/docs/4a7c95e2-b83f-4d6c-9b1e-6f2a84d7c3e5) | Windows | Reads the alert state and returns a concise plain-text summary to trigger ConnectWise Manage ticketing. |

### Compound Conditions

| Name | Platform | Purpose |
| :--- | :--- | :--- |
| [CrystalDiskInfo - Audit Eligible Devices](/docs/6c1a94e7-f52b-4a8d-9e3c-8b5d26f4a7e2) | Windows Workstation | Runs the audit automation daily on opted-in physical workstations. |
| [CrystalDiskInfo - Ticket Required](/docs/2d8e63b4-a97c-4f1e-b6d9-5c3f81a7e4d6) | Windows Workstation | Evaluates the alert state and triggers the ConnectWise Manage ticket template when a degraded disk is detected. |

### Group

| Name | Purpose |
| :--- | :--- |
| [cPVAL Disk Health Status Overview](/docs/b59d37f6-e24a-4c8b-8d7f-1a6e93c5b2d4) | Dynamically groups all audited physical Windows devices to display drive health status, data collection time, and alert state for fleet-wide review. |

### ConnectWise Manage Ticket Template

| Name | Purpose |
| :--- | :--- |
| [CrystalDiskInfo](/docs/8e5a26c9-d47b-4f3e-a9c6-2b8f74d1e5a3) | Defines the board, priority, and lifecycle rules for creating and closing disk health tickets in ConnectWise Manage. |

---

## Implementation

### Step 1: Create the Custom Fields

Create all seven custom fields under `SETTINGS > Custom Fields` as described in their respective documents. Ensure the [cPVAL Crystal Disk Alert Mode](/docs/72297da9-ba7f-443f-a21a-f56afc638a3e) dropdown is created at the Organization, Location, and Device levels. The remaining six fields are strictly Device-level and should be added to the "CrystalDiskInfo" custom tab on the Windows Desktops and Laptops role.

### Step 2: Create the Automations

Create both automation scripts into NinjaOne:

1. [CrystalDiskInfo Audit](/docs/7f4b28d1-c65e-4b9a-a8f2-4d9c73e6b5a8)
2. [CrystalDiskInfo Alert](/docs/4a7c95e2-b83f-4d6c-9b1e-6f2a84d7c3e5)

### Step 3: Create the Compound Conditions

Create the two compound conditions and attach them to the appropriate default agent policies:

1. [CrystalDiskInfo - Audit Eligible Devices](/docs/6c1a94e7-f52b-4a8d-9e3c-8b5d26f4a7e2): Attach to your `Windows Workstation Policy [Default]`. This runs the audit every 24 hours.
2. [CrystalDiskInfo - Ticket Required](/docs/2d8e63b4-a97c-4f1e-b6d9-5c3f81a7e4d6): Attach to your `Windows Workstation Policy [Default]`. This evaluates the alert state every 4 hours.

> **Note:** For ticketing to work, the Notifications section in the Ticket Required compound condition must be configured to use the [CrystalDiskInfo](/docs/8e5a26c9-d47b-4f3e-a9c6-2b8f74d1e5a3) ticket template.

### Step 4: Create the Device Group

Create the [cPVAL Disk Health Status Overview](/docs/b59d37f6-e24a-4c8b-8d7f-1a6e93c5b2d4) device group to automatically collect any device that has been successfully audited. Add the Health Status, Alert Required, and Data Collection Time fields as columns in this group for a quick fleet-wide dashboard.

### Step 5: Configure the ConnectWise Manage Ticket Template

Create and configure the [CrystalDiskInfo](/docs/8e5a26c9-d47b-4f3e-a9c6-2b8f74d1e5a3) ticket template in NinjaOne. Verify the Board, Status, Priority, and Team assignments with your partner or consultant, as these values vary from environment to environment.

### Step 6: Set the Alert Mode

Set [cPVAL Crystal Disk Alert Mode](/docs/72297da9-ba7f-443f-a21a-f56afc638a3e) at the organization level to the desired enforcement mode.

**Recommended rollout order:**

1. Start with `Audit Only` to collect baseline S.M.A.R.T. data across your fleet without generating any tickets.
2. Review the [cPVAL Disk Health Status Overview](/docs/b59d37f6-e24a-4c8b-8d7f-1a6e93c5b2d4) group to identify devices with Caution or Bad drives.
3. Move to `Alerting With Recommendation` once you are ready to automate ticket creation for degraded drives.

---

## Comprehensive FAQs

### General Usage

**Q. What does this solution actually do?**  
**A:** It reads the deep S.M.A.R.T. attributes of physical hard drives and SSDs on Windows workstations. If a drive starts failing or degrading, it automatically creates a ticket in ConnectWise Manage with all the technical details and replacement recommendations.

**Q. Does this work on servers or virtual machines?**  
**A:** No. The audit script automatically skips virtual machines. It is also not recommended for enterprise servers because hardware RAID controllers hide the physical disks from the operating system, making S.M.A.R.T. data inaccessible.

**Q. Why does the ConnectWise Manage ticket only contain a summary?**  
**A:** ConnectWise Manage tickets have a strict character limit (roughly 1150 characters) and cannot render complex HTML tables. The ticket body provides a brief summary and directs the technician to review the [cPVAL Crystal Disk Alert Content](/docs/9b3f7c52-d81a-4e6c-b94f-3a8d75e2c6b9) WYSIWYG custom field in NinjaOne, which contains the fully formatted HTML report with color-coded S.M.A.R.T. attributes.

**Q. What happens when a drive recovers or is replaced?**  
**A:** The [CrystalDiskInfo Audit](/docs/7f4b28d1-c65e-4b9a-a8f2-4d9c73e6b5a8) script runs daily. If the drive health returns to "Good", or if the failing drive is replaced and the new drive is healthy, the script automatically unchecks the [cPVAL Crystal Disk Alert Required](/docs/1e6d84a9-b25c-4d7f-a3b6-7f4e92c8d5a1) box, clears the alert content, and the compound condition automatically closes the associated ConnectWise Manage ticket.

### Alerting & Configuration

**Q. What are the different Alert Modes?**  
**A:**

* `Disable`: Opts the device/location/org out of automated monitoring.
* `Audit Only`: Collects data but never creates tickets.
* `Alerting With Recommendation`: Creates tickets for Bad and Caution drives, including hardware replacement advice.
* `Alerting Without Recommendation`: Creates tickets for Bad and Caution drives, but omits the replacement advice.
* `Alert for Bad Status Only...`: Only creates tickets when a drive is completely failing (Bad), ignoring early warnings (Caution).

**Q. Which Alert Mode setting wins if values are different at multiple levels?**  
**A:** NinjaOne uses a strict hierarchy. The Device level overrides the Location level, and the Location level overrides the Organization level.

**Q. How does the solution determine device age for replacement recommendations?**  
**A:** The audit script queries the BIOS release date via WMI to calculate the approximate age of the machine. If the device is older than the configured `Device Age Threshold` script variable (default 5 years), the ticket will recommend quoting a full device replacement rather than just swapping the drive.

**Q. Can I edit the HTML tables in the WYSIWYG custom fields manually?**  
**A:** You can, but you should not. The automation overwrites these fields on the next scheduled run. They are strictly read-only for technicians.

---

## Changelog

### 2026-08-06

- Initial version of the document.
