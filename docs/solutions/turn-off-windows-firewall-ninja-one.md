---
id: '202f2907-e8e5-4d65-9823-e70749cef708'
slug: /202f2907-e8e5-4d65-9823-e70749cef708
title: 'Turn off Windows Firewall'
title_meta: 'Turn off Windows Firewall'
keywords: ['disable-windows-firewall', 'windows-firewall', 'security', 'network', 'device-standard', 'firewall-management']
description: 'A comprehensive solution for managing Windows Firewall settings across devices with granular control through custom fields and automated enforcement.'
tags: ['security', 'firewall', 'windows']
draft: false
unlisted: false
---

## Purpose

This solution provides centralized management of Windows Firewall settings across organizational devices. It enables automated disabling of Windows Firewall on targeted devices while maintaining flexibility through multi-level custom field configuration. The solution includes comprehensive monitoring, remediation capabilities, and manual override options for complete firewall management control.

## Associated Content

### Custom Field

| Name | Example | Type | Level | Required | Purpose |
|------|---------|------|-------|----------|---------|
| [cPVAL Turn off Windows Firewall](/docs/48a340ed-d4aa-4949-9862-89e0737c5c95) | Windows Workstation and Server | Dropdown | Organization, Location, Device | Yes | Controls Windows Firewall disablement based on selected operating system |

### Automation Scripts

| Name | Purpose |
|------|---------|
| [Get Windows Firewall Status](/docs/835251c6-1c07-4e24-9806-6071107fa8d3) | Detection script that checks Windows Firewall status across all profiles |
| [Disable Windows Firewall](/docs/f13721f2-1a61-4ae8-bec3-1e008927dfac) | Remediation script that disables Windows Firewall on all profiles |
| [Enable Windows Firewall](/docs/e3232f95-af1e-4c98-8fe4-5f09e77c6635) | Manual script to re-enable Windows Firewall (for reversal) |

### Compound Conditions

| Name | Purpose |
|------|---------|
| [Turn off Windows Firewall Windows Workstation](/docs/cd5cfdc6-69b2-41bd-be00-3e00547f284b) | Applies firewall disablement to Windows workstations based on custom field settings |
| [Turn off Windows Firewall Windows Server](/docs/d43b6332-798c-43ea-b9e2-d774a1cd04e9) | Applies firewall disablement to Windows servers based on custom field settings |

## Implementation

### Step 1: Create the Custom Field

Create the [cPVAL Turn off Windows Firewall](/docs/48a340ed-d4aa-4949-9862-89e0737c5c95) custom field under `SETTINGS → Custom Fields` with the following configuration:

- **Definition Scope:** Organization, Location, Device
- **Type:** Dropdown
- **Options:** None, Windows Workstation and Windows Server, Windows Workstation, Windows Server
- **Default Value:** (Empty)
- **Tab Name:** Device Standards

### Step 2: Import Automation Scripts

Import the required automation scripts:

1. **[Get Windows Firewall Status](/docs/835251c6-1c07-4e24-9806-6071107fa8d3)** - Detection script that monitors firewall state
2. **[Disable Windows Firewall](/docs/f13721f2-1a61-4ae8-bec3-1e008927dfac)** - Remediation script that turns off firewall protection
3. **[Enable Windows Firewall](/docs/e3232f95-af1e-4c98-8fe4-5f09e77c6635)** - Manual reversal script for restoring firewall functionality

### Step 3: Configure Compound Conditions

Create two compound conditions targeting the appropriate device policies:

**For Windows Workstations:**

- **Name:** [Turn off Windows Firewall Windows Workstation](/docs/cd5cfdc6-69b2-41bd-be00-3e00547f284b)
- **Policy:** `Windows Workstation [Default]`
- **Logic:** Runs when Windows Firewall is enabled AND custom field specifies Workstation inclusion

**For Windows Servers:**

- **Name:** [Turn off Windows Firewall Windows Server](/docs/d43b6332-798c-43ea-b9e2-d774a1cd04e9)
- **Policy:** `Windows Server [Default]`
- **Logic:** Runs when Windows Firewall is enabled AND custom field specifies Server inclusion

### Step 4: Set Organizational Default

Configure the organizational-level custom field to establish default behavior:

- Set to appropriate value based on organizational security policies
- Use location and device-level settings for granular exceptions and overrides

## FAQ

**Q: What happens if I need to exclude specific devices from firewall disablement?**  
A: Set the device-level custom field to "None" for any devices that should retain Windows Firewall protection.

**Q: How does the solution handle different organizational units?**  
A: The custom field supports three levels of configuration - Organization, Location, and Device - allowing for tailored firewall policies across the enterprise.

**Q: What if disabling Windows Firewall causes security concerns?**  
A: Use the [Enable Windows Firewall](/docs/e3232f95-af1e-4c98-8fe4-5f09e77c6635) script to manually restore firewall protection on any device.

**Q: How often does the solution check firewall status?**  
A: The compound conditions run continuously, monitoring Windows Firewall state and applying remediation when needed.

**Q: Can I disable firewall for workstations but not servers?**  
A: Yes, set the custom field to "Windows Workstation" only at the desired configuration level.

**Q: Does this affect all firewall profiles?**  
A: Yes, the solution manages all Windows Firewall profiles (Domain, Private, and Public) simultaneously.

**Important Security Note:** Disabling Windows Firewall reduces network security protection. Only implement this solution in environments where alternative security measures (such as network-level firewalls) are in place. Always test thoroughly before widespread deployment and maintain the ability to quickly re-enable protection if needed.