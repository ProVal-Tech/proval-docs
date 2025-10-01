---
id: '9912c1d2-27b8-449a-8d54-d5e24b436721'
slug: /9912c1d2-27b8-449a-8d54-d5e24b436721
title: 'Remove Bloatware'
title_meta: 'Remove Bloatware'
keywords: ['bloatware', 'pua', 'remove-pua', 'remove-bloatware', 'uninstallation', 'application-management']
description: 'A comprehensive solution for identifying and removing specified bloatware (potentially unwanted applications) from Windows systems. Managed through granular custom field controls and automated enforcement across workstations and servers.'
tags: ['windows', 'security', 'application', 'uninstallation']
draft: false
unlisted: false
---

## Purpose

This solution provides centralized management for removing bloatware (potentially unwanted applications) from organizational devices. It enables automated detection and removal of specified applications through a configurable list, offering flexibility through multi-level custom field configuration. The solution supports both Windows Workstation and Server environments, ensuring clean system configurations across the enterprise.

## Associated Content

### Custom Fields

| Name | Example | Type | Level | Required | Purpose |
|------|---------|------|-------|----------|---------|
| [cPVAL Remove Bloatware](/docs/4eef200f-a609-4993-9533-b7fce30b29ef) | Windows Workstation and Windows Server | Dropdown | Organization, Location, Device | Yes | Controls bloatware removal based on selected operating system |
| [cPVAL Bloatware to Remove](/docs/b3a55fe5-d7aa-4976-bf57-c46799ef4548) | Microsoft.Print3D, Microsoft.RemoteDesktop | Multi-line | Organization, Location, Device | Yes | Defines the comma-separated list of applications to be removed |

### Automation Scripts

| Name | Purpose |
|------|---------|
| [Find Bloatware](/docs/1c79c2ef-4053-4956-85be-f9c0d87c37ed) | Detection script that identifies specified bloatware applications installed on the system |
| [Remove Bloatware](/docs/e921882d-f1f2-492a-8cd0-58d37eba5d35) | Remediation script that uninstalls the specified bloatware applications |

### Compound Conditions

| Name | Purpose |
|------|---------|
| [Remove Bloatware Windows Workstation](/docs/b6723ac1-0617-4be9-958f-385c77b52bc5) | Applies bloatware removal to Windows workstations based on custom field settings |
| [Remove Bloatware Windows Server](/docs/4d9d3ca7-9dd9-4630-8c9a-f3da24f28b8c) | Applies bloatware removal to Windows servers based on custom field settings |

## Implementation

### Step 1: Create the Custom Fields

Create the required custom fields under `SETTINGS → Custom Fields` with the following configurations:

**[cPVAL Remove Bloatware](/docs/4eef200f-a609-4993-9533-b7fce30b29ef):**

- **Definition Scope:** Organization, Location, Device
- **Type:** Dropdown
- **Options:** None, Windows Workstation and Windows Server, Windows Workstation, Windows Server
- **Default Value:** (Empty)
- **Tab Name:** Device Standards

**[cPVAL Bloatware to Remove](/docs/b3a55fe5-d7aa-4976-bf57-c46799ef4548):**

- **Definition Scope:** Organization, Location, Device
- **Type:** Multi-line
- **Default Value:** (Empty)
- **Tab Name:** Device Standards

### Step 2: Import Automation Scripts

Import the required automation scripts:

1. **[Find Bloatware](/docs/1c79c2ef-4053-4956-85be-f9c0d87c37ed)** - Detection script that monitors for specified bloatware applications
2. **[Remove Bloatware](/docs/e921882d-f1f2-492a-8cd0-58d37eba5d35)** - Remediation script that removes detected bloatware

### Step 3: Configure Compound Conditions

Create two compound conditions targeting the appropriate device policies:

**For Windows Workstations:**

- **Name:** [Remove Bloatware Windows Workstation](/docs/b6723ac1-0617-4be9-958f-385c77b52bc5)
- **Policy:** `Windows Workstation [Default]`
- **Logic:** Runs when specified bloatware is detected AND custom field specifies Workstation inclusion

**For Windows Servers:**

- **Name:** [Remove Bloatware Windows Server](/docs/4d9d3ca7-9dd9-4630-8c9a-f3da24f28b8c)
- **Policy:** `Windows Server [Default]`
- **Logic:** Runs when specified bloatware is detected AND custom field specifies Server inclusion

### Step 4: Define Bloatware List and Set Organizational Default

Configure the organizational-level custom fields to establish default behavior:

1. Set **[cPVAL Remove Bloatware](/docs/4eef200f-a609-4993-9533-b7fce30b29ef)** to appropriate value based on organizational policies
2. Populate **[cPVAL Bloatware to Remove](/docs/b3a55fe5-d7aa-4976-bf57-c46799ef4548)** with a comma-separated list of applications to target
3. Use location and device-level settings for granular exceptions and overrides

## FAQ

**Q: What format should I use for the bloatware list?**  
A: Enter application names as a comma-separated list (e.g., "Microsoft.Print3D, Microsoft.RemoteDesktop, Microsoft.SkypeApp"). Use the exact AppxPackage or AppxProvisionedPackage names.

**Q: How can I exclude specific devices from bloatware removal?**  
A: Set the device-level [cPVAL Remove Bloatware](/docs/4eef200f-a609-4993-9533-b7fce30b29ef) custom field to "None" for any devices that should be excluded from this automation.

**Q: What happens if an application in the list isn't installed on a device?**  
A: The script will simply skip that application and continue with others in the list. No error will occur.

**Q: How does the solution handle different organizational units with different needs?**  
A: The custom fields support three levels of configuration - Organization, Location, and Device - allowing for tailored bloatware policies across different departments or teams.

**Q: Can I remove bloatware from workstations but not servers?**  
A: Yes, set the [cPVAL Remove Bloatware](/docs/4eef200f-a609-4993-9533-b7fce30b29ef) custom field to "Windows Workstation" only at the desired configuration level.

**Q: How often does the solution check for bloatware?**  
A: The compound conditions run continuously, monitoring for specified bloatware applications and applying remediation when detected.

**Important Note:** Carefully test your bloatware list before widespread deployment. Ensure you are not removing applications that are required for business operations or user productivity. Always maintain the ability to quickly reverse the removal if needed.
