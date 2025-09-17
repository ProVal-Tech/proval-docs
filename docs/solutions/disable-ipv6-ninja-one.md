---
id: '1e9dee40-965f-4b6c-a9cf-4cb45162d5ac'
slug: /1e9dee40-965f-4b6c-a9cf-4cb45162d5ac
title: 'Disable IPv6'
title_meta: 'Disable IPv6'
keywords: ['disable-ipv6', 'ipv6', 'security', 'network', 'network-adapter', 'device-standard']
description: 'A comprehensive solution for managing IPv6 protocol settings across Windows devices with granular control through custom fields and automated enforcement.'
tags: ['networking', 'security']
draft: false
unlisted: false
---

## Purpose

This solution provides centralized management of IPv6 protocol settings across Windows devices within the organization. It enables automated disabling of IPv6 on targeted devices while maintaining the flexibility to exclude specific clients, locations, or devices through custom field configuration. The solution includes remediation scripts and manual override capabilities for complete control over IPv6 protocol management.

## Associated Content

### Custom Field

| Name | Example | Type | Level | Required | Purpose |
|------|---------|------|-------|----------|---------|
| [cPVAL Disable IPv6](/docs/060ad5d8-ee1d-4ee2-a92d-7dbc14121bc6) | Windows Workstation and Server | Dropdown | Organization, Location, Device | Yes | Controls IPv6 disablement based on selected operating system |

### Automation Scripts

| Name | Purpose |
|------|---------|
| [Get IPv6 Enabled Adapters](/docs/eace3666-d7f3-41f5-a819-df7056a94e5f) | Detection script that checks if IPv6 is enabled on any network adapter |
| [Disable IPv6](/docs/44ab6bd7-fe4f-4c1a-a743-9db643091d3d) | Remediation script that disables IPv6 protocol binding on all network adapters |
| [Enable IPv6](/docs/9149e3e9-027a-4666-9283-d17b26816234) | Manual script to re-enable IPv6 protocol binding (for reversal) |

### Compound Conditions

| Name | Purpose |
|------|---------|
| [Disable IPv6 Windows Workstation](/docs/2471a88f-d339-497b-a9c2-1f30f83bcdd9) | Applies IPv6 disablement to Windows workstations based on custom field settings |
| [Disable IPv6 Windows Server](/docs/79b177eb-4421-48b2-b47c-9163ceebcf78) | Applies IPv6 disablement to Windows servers based on custom field settings |

## Implementation

### Step 1: Create the Custom Field

Create the [cPVAL Disable IPv6](/docs/060ad5d8-ee1d-4ee2-a92d-7dbc14121bc6) custom field under `SETTINGS → Custom Fields` with the following configuration:

- **Definition Scope:** Organization, Location, Device
- **Type:** Dropdown
- **Options:** None, Windows Workstation and Windows Server, Windows Workstation, Windows Server
- **Default Value:** (Empty)
- **Tab Name:** Device Standards

### Step 2: Import Automation Scripts

Import the required automation scripts:

1. **[Get IPv6 Enabled Adapters](/docs/eace3666-d7f3-41f5-a819-df7056a94e5f)** - Detection script
2. **[Disable IPv6](/docs/44ab6bd7-fe4f-4c1a-a743-9db643091d3d)** - Remediation script  
3. **[Enable IPv6](/docs/9149e3e9-027a-4666-9283-d17b26816234)** - Manual reversal script

### Step 3: Configure Compound Conditions

Create two compound conditions targeting the appropriate device policies:

**For Windows Workstations:**

- **Name:** [Disable IPv6 Windows Workstation](/docs/2471a88f-d339-497b-a9c2-1f30f83bcdd9)
- **Policy:** `Windows Workstation [Default]`
- **Logic:** Runs when IPv6 is detected AND custom field specifies Workstation inclusion

**For Windows Servers:**

- **Name:** [Disable IPv6 Windows Server](/docs/79b177eb-4421-48b2-b47c-9163ceebcf78)
- **Policy:** `Windows Server [Default]`
- **Logic:** Runs when IPv6 is detected AND custom field specifies Server inclusion

### Step 4: Set Organizational Default

Configure the organizational-level custom field to establish default behavior:

- Set to appropriate value based on organizational policies
- Use location and device-level settings for exceptions and overrides

## FAQ

**Q: What happens if I need to exclude specific devices from IPv6 disablement?**  
A: Set the device-level custom field to "None" for any devices that should retain IPv6 functionality.

**Q: How does the solution handle different organizational units?**  
A: The custom field supports three levels of configuration - Organization, Location, and Device - allowing for granular control.

**Q: What if disabling IPv6 causes network connectivity issues?**  
A: Use the [Enable IPv6](/docs/9149e3e9-027a-4666-9283-d17b26816234) script to manually re-enable IPv6 on affected devices.

**Q: How often does the solution check for IPv6 status?**  
A: The compound conditions run continuously, checking for IPv6-enabled adapters and applying remediation when needed.

**Q: Can I disable IPv6 for workstations but not servers?**  
A: Yes, set the custom field to "Windows Workstation" only at the desired configuration level.

**Q: What permissions are required for this solution?**  
A: The custom field requires Read/Write permissions for both technicians and automation systems.

**Note:** Disabling IPv6 may affect network connectivity in environments that rely on IPv6 functionality. Test thoroughly before widespread deployment.
