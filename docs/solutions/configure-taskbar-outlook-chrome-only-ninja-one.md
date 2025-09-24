---
id: '8efbc9f2-0812-40c2-8583-a563049c7762'
slug: /8efbc9f2-0812-40c2-8583-a563049c7762
title: 'Configure Taskbar Outlook Chrome Only'
title_meta: 'Configure Taskbar Outlook Chrome Only'
keywords: ['chrome', 'outlook', 'taskbar', 'pin-chrome', 'pin-outlook', 'taskbar-pin', 'standardization']
description: 'A comprehensive solution for standardizing the Windows taskbar layout by ensuring only Google Chrome and New Outlook are pinned, removing all other applications. Managed through granular custom field controls and automated enforcement.'
tags: ['windows', 'setup', 'application']
draft: false
unlisted: false
---

## Purpose

This solution provides centralized management of the Windows taskbar layout across organizational devices. It enables automated pinning of Google Chrome and New Outlook to the taskbar for the currently logged-in user, while removing all other pinned items. The solution is restricted to Windows Workstation systems and offers flexibility through multi-level custom field configuration, ensuring a standardized user experience.

## Associated Content

### Custom Field

| Name | Example | Type | Level | Required | Purpose |
|------|---------|------|-------|----------|---------|
| [cPVAL Configure Taskbar Outlook Chrome Only](/docs/6c8e4e35-3db7-4ff0-8d3c-ec8d0b04e82f) | Windows Workstation | Dropdown | Organization, Location, Device | Yes | Controls taskbar pinning of Chrome and Outlook based on selected option |

### Automation Scripts

| Name | Purpose |
|------|---------|
| [Check Taskbar Pin Chrome and Outlook](/docs/36b9d578-a66a-49db-8b42-6c5507ae8c79) | Detection script that validates only Chrome and Outlook are pinned to the taskbar |
| [Pin Chrome and Outlook to Taskbar](/docs/0229b8df-4fd3-4b30-923c-34ff7f656f8e) | Remediation script that pins Chrome and Outlook while removing other pinned items |

### Compound Conditions

| Name | Purpose |
|------|---------|
| [Configure Taskbar Outlook Chrome Only](/docs/0b21bc06-3e82-4d45-939a-cf2d2425251c) | Triggers the pinning script on workstations where Chrome and Outlook are not pinned correctly |

## Implementation

### Step 1: Create the Custom Field

Create the [cPVAL Configure Taskbar Outlook Chrome Only](/docs/6c8e4e35-3db7-4ff0-8d3c-ec8d0b04e82f) custom field under `SETTINGS → Custom Fields` with the following configuration:

- **Definition Scope:** Organization, Location, Device
- **Type:** Dropdown
- **Options:** None, Windows Workstation
- **Default Value:** (Empty)
- **Tab Name:** Device Standards

### Step 2: Import Automation Scripts

Import the required automation scripts:

1. **[Check Taskbar Pin Chrome and Outlook](/docs/36b9d578-a66a-49db-8b42-6c5507ae8c79)** - Detection script that monitors the taskbar state
2. **[Pin Chrome and Outlook to Taskbar](/docs/0229b8df-4fd3-4b30-923c-34ff7f656f8e)** - Remediation script that configures the taskbar pins

### Step 3: Configure Compound Condition

Create the compound condition to target the appropriate device policy:

- **Name:** [Configure Taskbar Outlook Chrome Only](/docs/0b21bc06-3e82-4d45-939a-cf2d2425251c)
- **Policy:** `Windows Workstation [Default]`
- **Logic:** Runs when the taskbar pinning does not meet the standard (Chrome and Outlook not pinned or other apps present) AND the custom field is set to "Windows Workstation"

### Step 4: Set Organizational Default

Configure the organizational-level custom field to establish default behavior:

- Set to "Windows Workstation" to enforce the standard taskbar layout across all workstations.
- Use location and device-level settings for granular exceptions and overrides by selecting "None".

## FAQ

**Q: What happens if a user has other applications pinned to their taskbar?**  
A: The remediation script will remove all existing pinned items before pinning Chrome and Outlook, ensuring a clean, standardized layout.

**Q: How does the solution handle different organizational units or specific user needs?**  
A: The custom field supports three levels of configuration - Organization, Location, and Device. Set the field to "None" at the Location or Device level to exclude specific groups or individual machines from this standardization.

**Q: What if the Pin script runs but the applications are not found on the device?**  
A: The script is designed to pin the applications only if they are installed on the system. If they are not installed, the taskbar will be cleared of other pins, but Chrome and Outlook will not be added.

**Q: How often does the solution check the taskbar configuration?**  
A: The compound condition runs continuously, monitoring the taskbar state and applying remediation when the defined standard is not met.

**Q: Does this affect all user profiles on a device?**  
A: The script acts on the taskbar of the user who is logged in at the time the script is executed. It will need to run under each user's profile to configure their individual taskbar.

**Q: Can I customize which applications are pinned?**  
A: This specific solution is designed to pin only Chrome and Outlook. Customizing the pinned applications would require modifying the underlying automation scripts.

**Note:** This automation modifies user profile settings. It is recommended to communicate changes to users, especially if they are accustomed to a different taskbar layout.
