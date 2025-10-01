---
id: 'a34e3293-b46a-485d-ae72-c30d235a2531'
slug: /a34e3293-b46a-485d-ae72-c30d235a2531
title: 'Disable Sleep'
title_meta: 'Disable Sleep'
keywords: ['disable-sleep', 'sleep', 'auto-sleep', 'device-standard', 'power-management']
description: 'A comprehensive solution for managing sleep settings across Windows devices with granular control through custom fields and automated enforcement.'
tags: ['windows', 'setup']
draft: false
unlisted: false
---

## Purpose

This solution provides centralized management of sleep settings across Windows devices within the organization. It enables automated disabling of sleep mode on targeted devices while maintaining the flexibility to exclude specific clients, locations, or devices through custom field configuration. The solution includes remediation scripts and manual override capabilities for complete control over power management settings.

## Associated Content

### Custom Field

| Name | Example | Type | Level | Required | Purpose |
|------|---------|------|-------|----------|---------|
| [cPVAL Disable Sleep](/docs/b0c22386-feb6-427c-b1fd-e29a9c4863a3) | Windows Workstation and Server | Dropdown | Organization, Location, Device | Yes | Controls sleep disablement based on selected operating system |

### Automation Scripts

| Name | Purpose |
|------|---------|
| [Get Sleep Status](/docs/49127c19-f3b2-4006-9d48-ccd01290eafa) | Detection script that checks if auto-sleep is enabled in the current power plan |
| [Disable Sleep](/docs/21947d80-a91f-4b2a-9109-addee4e16b91) | Remediation script that disables sleep by setting "Sleep after" to Never for both AC and DC power |
| [Enable Sleep](/docs/aa641c2c-bac8-47a5-aee9-0891c5f5330c) | Manual script to re-enable sleep with configurable timeouts (for reversal) |

### Compound Conditions

| Name | Purpose |
|------|---------|
| [Disable Sleep Windows Workstation](/docs/01e513a0-0764-4d2d-ae60-871e42010526) | Applies sleep disablement to Windows workstations based on custom field settings |
| [Disable Sleep Windows Server](/docs/047f1fc9-f296-42c0-bad6-3498b9160609) | Applies sleep disablement to Windows servers based on custom field settings |

## Implementation

### Step 1: Create the Custom Field

Create the [cPVAL Disable Sleep](/docs/b0c22386-feb6-427c-b1fd-e29a9c4863a3) custom field under `SETTINGS → Custom Fields` with the following configuration:

- **Definition Scope:** Organization, Location, Device
- **Type:** Dropdown
- **Options:** None, Windows Workstation and Windows Server, Windows Workstation, Windows Server
- **Default Value:** (Empty)
- **Tab Name:** Device Standards

### Step 2: Import Automation Scripts

Import the required automation scripts:

1. **[Get Sleep Status](/docs/49127c19-f3b2-4006-9d48-ccd01290eafa)** - Detection script
2. **[Disable Sleep](/docs/21947d80-a91f-4b2a-9109-addee4e16b91)** - Remediation script  
3. **[Enable Sleep](/docs/aa641c2c-bac8-47a5-aee9-0891c5f5330c)** - Manual reversal script (with configurable AC/DC timeout parameters)

### Step 3: Configure Compound Conditions

Create two compound conditions targeting the appropriate device policies:

**For Windows Workstations:**

- **Name:** [Disable Sleep Windows Workstation](/docs/01e513a0-0764-4d2d-ae60-871e42010526)
- **Policy:** `Windows Workstation [Default]`
- **Logic:** Runs when auto-sleep is detected AND custom field specifies Workstation inclusion

**For Windows Servers:**

- **Name:** [Disable Sleep Windows Server](/docs/047f1fc9-f296-42c0-bad6-3498b9160609)
- **Policy:** `Windows Server [Default]`
- **Logic:** Runs when auto-sleep is detected AND custom field specifies Server inclusion

### Step 4: Set Organizational Default

Configure the organizational-level custom field to establish default behavior:

- Set to appropriate value based on organizational policies
- Use location and device-level settings for exceptions and overrides

## FAQ

**Q: What happens if I need to exclude specific devices from sleep disablement?**  
A: Set the device-level custom field to "None" for any devices that should retain their current sleep settings.

**Q: How does the solution handle different organizational units?**  
A: The custom field supports three levels of configuration - Organization, Location, and Device - allowing for granular control across the enterprise.

**Q: What if disabling sleep causes issues for specific users or applications?**  
A: Use the [Enable Sleep](/docs/aa641c2c-bac8-47a5-aee9-0891c5f5330c) script to manually re-enable sleep with customizable timeout settings.

**Q: How often does the solution check for sleep settings?**  
A: The compound conditions run continuously, monitoring power plan settings and applying remediation when needed.

**Q: Can I disable sleep for workstations but not servers?**  
A: Yes, set the custom field to "Windows Workstation" only at the desired configuration level.

**Q: What parameters does the Enable Sleep script accept?**  
A: The script accepts AC Time Out Seconds and DC Time Out Seconds parameters to configure specific timeout values for AC and battery power.

**Note:** Disabling sleep may affect power management policies and user experience. Consider user workflows and application requirements before widespread deployment.
