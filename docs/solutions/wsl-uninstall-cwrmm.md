---
id: 'cc418b50-c30e-4319-950e-ffa6347dd74e'
slug: /cc418b50-c30e-4319-950e-ffa6347dd74e
title: 'CVE-2025-24084 - WSL Uninstall'
title_meta: 'CVE-2025-24084 - WSL Uninstall'
keywords: ['vulnerability', 'cve', 'wsl']
description: 'Detects and removes Windows Subsystem for Linux (WSL) and related components only when WSL is present'
tags: ['vulnerability', 'cve']
draft: false
unlisted: false
last_update:
  date: 2026-09-17
---

## Purpose

The WSL Uninstallation solution is designed to automate the detection and removal of Windows Subsystem for Linux (WSL) and related components from supported Windows endpoints through the ConnectWise RMM platform. It identifies machines that are configured for WSL uninstallation and removes WSL only when it is detected on the endpoint.

The solution uses centralized configuration through ConnectWise RMM custom fields to control WSL uninstallation behavior, including target Windows operating system selection and exclusions at the site and endpoint level.

**Supported CVE Article:** [CVE-2025-24084
Security Vulnerability](https://msrc.microsoft.com/update-guide/vulnerability/CVE-2025-24084)

### Key Capabilities

1. **Automated WSL Detection and Removal**  
Detects whether Windows Subsystem for Linux (WSL) is present and removes it when the endpoint is targeted for uninstallation.

2. **Centralized Uninstallation Configuration**  
Uses ConnectWise RMM custom fields to centrally manage WSL uninstallation settings, including:
    - Target Windows Operating System
    - WSL Uninstallation Enablement
    - Site-Level Exclusions
    - Endpoint-Level Exclusions

3. **Site and Endpoint-Level Exclusions**  
Provides the ability to exclude specific sites or individual endpoints from WSL uninstallation without changing the global configuration.

4. **WSL Component Detection**  
Detects WSL by checking for the WSL command and relevant Windows registry configuration before attempting removal.

5. **Automated WSL Removal**  
Removes Windows Subsystem for Linux and related WSL components from targeted endpoints when WSL is detected.

6. **Conditional Remediation**  
The uninstallation monitor only performs remediation when WSL is detected, preventing unnecessary changes on endpoints where WSL is not installed.

7. **Windows Platform Support**  
Supports WSL detection and uninstallation on supported Windows operating systems configured through the **Enable WSL Uninstallation** custom field.

## Associated Content

| Content                                             | Type                                                      | Function                                               |
|-----------------------------------------------------|-----------------------------------------------------------|--------------------------------------------------------|
| [Enable WSL Uninstallation](/docs/003a7133-7521-4490-a403-a12e143dc4e3)     | Custom Field | Custom field to select the target windows operating system for WSL Uninstallation. |
| [Exclude_WSL_Uninstall_Site](/docs/c46dea32-bc90-40cb-a0f3-8c1987d0bd79)     | Custom Field | Custom Field to exclude Site from WSL Uninstallation. |
| [Exclude_WSL_Uninstall_Endpoint](/docs/1a13ab2f-073b-4e95-b285-50e8cfee1969)     | Custom Field | Custom Field to exclude Endpoint from WSL Uninstallation. |
| [Machines Opted for WSL Uninstallation](/docs/20ee6606-49f4-489f-9f36-d3ee34ed71d9)     | Group | This group contains machines that are opted for WSL Uninstallation. |
| [CVE-2025-24084 - WSL Uninstall](/docs/b63666c3-5c0c-430b-b8c2-7e937c9109fe)     | Monitor | Detects and removes Windows Subsystem for Linux (WSL) and related components only when WSL is present. |

## Implementation

### Step 1: Create the Following Custom Fields

Create all the custom fields listed below in ConnectWise RMM. These are required for the solution to function correctly.

- [Enable WSL Uninstallation](/docs/003a7133-7521-4490-a403-a12e143dc4e3)   
- [Exclude_WSL_Uninstall_Site](/docs/c46dea32-bc90-40cb-a0f3-8c1987d0bd79)  
- [Exclude_WSL_Uninstall_Endpoint](/docs/1a13ab2f-073b-4e95-b285-50e8cfee1969) 

### Step 2: Configure WSL Uninstallation

Configure the [Enable WSL Uninstallation](/docs/003a7133-7521-4490-a403-a12e143dc4e3) custom field at the Company level and select the supported Windows operating system(s) that should be targeted for WSL uninstallation.

Use the [Exclude_WSL_Uninstall_Site](/docs/c46dea32-bc90-40cb-a0f3-8c1987d0bd79) and [Exclude_WSL_Uninstall_Endpoint](/docs/1a13ab2f-073b-4e95-b285-50e8cfee1969) custom fields when specific sites or endpoints should be excluded from the solution.

### Step 3: Create the Group

Create the dynamic group that will automatically target machines configured for WSL uninstallation.

- [Machines Opted for WSL Uninstallation](/docs/20ee6606-49f4-489f-9f36-d3ee34ed71d9) 

### Step 4: Create the Monitor

Set up the WSL uninstallation monitor that will run on the targeted endpoints.

- [CVE-2025-24084 - WSL Uninstall](/docs/b63666c3-5c0c-430b-b8c2-7e937c9109fe)



## FAQ

### Q: How does the WSL Uninstallation solution work?

> The solution evaluates the WSL uninstallation settings configured through ConnectWise RMM custom fields and identifies machines that are configured for WSL removal. The **CVE-2025-24084 - WSL Uninstall** monitor then detects WSL and removes it when it is present on the targeted endpoint.

### Q: Which devices are targeted for WSL uninstallation?

>Devices are targeted based on the configured Windows operating system, WSL uninstallation settings, and exclusion rules. Machines must meet the configured criteria and must not be excluded through the **Exclude_WSL_Uninstall_Site** or **Exclude_WSL_Uninstall_Endpoint** custom fields.

### Q: Which operating systems are supported?

> The solution targets Windows operating systems selected through the **Enable WSL Uninstallation** custom field. The solution is intended for supported Windows endpoints where Windows Subsystem for Linux can be installed.

### Q: What configuration is required for WSL uninstallation?

> The **Enable WSL Uninstallation** custom field must be configured with the appropriate target Windows operating system. Site- or endpoint-level exclusions can also be configured when specific machines should not be remediated.

### Q: How can I exclude a specific site from WSL uninstallation?

> Use the **Exclude_WSL_Uninstall_Site** custom field to exclude an entire site from WSL uninstallation. Endpoints within an excluded site will not be targeted by the solution.

### Q: How can I exclude an individual endpoint from WSL uninstallation?

> Use the **Exclude_WSL_Uninstall_Endpoint** custom field on the specific endpoint to prevent WSL uninstallation on that machine.

### Q: What happens if WSL is not installed?

> The monitor detects whether WSL is present before attempting remediation. If WSL is not detected, no WSL uninstallation is performed.

### Q: What happens if WSL is already removed?

> If WSL and the related components are not detected on the endpoint, the monitor does not perform unnecessary removal actions.

### Q: Will the solution remove WSL from every Windows machine?

> No. Only machines that meet the configured operating system, enablement, group, and exclusion criteria are targeted for WSL uninstallation.

### Q: When will changes to the WSL custom fields take effect?

> Changes made to the WSL uninstallation custom fields will take effect when the **CVE-2025-24084 - WSL Uninstall** monitor and associated group evaluation run again.

### Q: Does the solution require administrator privileges?

> Yes. Administrative privileges are required to remove Windows Subsystem for Linux and its associated Windows components successfully.

### Q: What happens if the WSL uninstallation fails?

> The monitor will return an error if WSL or its related components cannot be removed successfully.

## Changelog

### 2026-09-17

- Initial version of the document
