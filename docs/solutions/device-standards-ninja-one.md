---
id: 'a0c383d4-699a-4bb8-af7f-c2a007747182'
slug: /a0c383d4-699a-4bb8-af7f-c2a007747182
title: 'Device Standards'
title_meta: 'Device Standards'
keywords: ['device-standards', 'standardization', 'configuration-management', 'windows-configuration', 'enterprise-standards']
description: 'A comprehensive framework for implementing and maintaining standardized device configurations across the organization. This solution package includes multiple sub-solutions for managing taskbar settings, bloatware removal, firewall policies, IPv6 settings, and power management.'
tags: ['windows', 'setup']
draft: false
unlisted: false
---

## Purpose

This solution provides a centralized framework for implementing and maintaining standardized device configurations across organizational devices. The Device Standards package consolidates multiple configuration management solutions into a cohesive framework, enabling consistent enforcement of organizational policies while maintaining flexibility through granular custom field controls. This approach ensures uniform user experience, enhanced security posture, and simplified management across all Windows devices.

## Associated Solutions

The Device Standards framework includes the following comprehensive solutions:

### [Configure Taskbar Outlook Chrome Only](/docs/8efbc9f2-0812-40c2-8583-a563049c7762)

Standardizes the Windows taskbar layout by ensuring only Google Chrome and New Outlook are pinned, removing all other applications.

**Key Components:**

- **Custom Field:** [cPVAL Configure Taskbar Outlook Chrome Only](/docs/6c8e4e35-3db7-4ff0-8d3c-ec8d0b04e82f)
- **Automation:** [Check Taskbar Pin Chrome and Outlook](/docs/36b9d578-a66a-49db-8b42-6c5507ae8c79), [Pin Chrome and Outlook to Taskbar](/docs/0229b8df-4fd3-4b30-923c-34ff7f656f8e)
- **Compound Condition:** [Configure Taskbar Outlook Chrome Only](/docs/0b21bc06-3e82-4d45-939a-cf2d2425251c)

### [Remove Bloatware](/docs/9912c1d2-27b8-449a-8d54-d5e24b436721)

Identifies and removes specified bloatware (potentially unwanted applications) from Windows systems.

**Key Components:**

- **Custom Fields:** [cPVAL Remove Bloatware](/docs/4eef200f-a609-4993-9533-b7fce30b29ef), [cPVAL Bloatware to Remove](/docs/b3a55fe5-d7aa-4976-bf57-c46799ef4548)
- **Automation:** [Find Bloatware](/docs/1c79c2ef-4053-4956-85be-f9c0d87c37ed), [Remove Bloatware](/docs/e921882d-f1f2-492a-8cd0-58d37eba5d35)
- **Compound Conditions:** [Remove Bloatware Windows Workstation](/docs/b6723ac1-0617-4be9-958f-385c77b52bc5), [Remove Bloatware Windows Server](/docs/4d9d3ca7-9dd9-4630-8c9a-f3da24f28b8c)

### [Turn off Windows Firewall](/docs/202f2907-e8e5-4d65-9823-e70749cef708)

Manages Windows Firewall settings with centralized control and automated enforcement.

**Key Components:**

- **Custom Field:** [cPVAL Turn off Windows Firewall](/docs/48a340ed-d4aa-4949-9862-89e0737c5c95)
- **Automation:** [Get Windows Firewall Status](/docs/835251c6-1c07-4e24-9806-6071107fa8d3), [Disable Windows Firewall](/docs/f13721f2-1a61-4ae8-bec3-1e008927dfac), [Enable Windows Firewall](/docs/e3232f95-af1e-4c98-8fe4-5f09e77c6635)
- **Compound Conditions:** [Turn off Windows Firewall Windows Workstation](/docs/cd5cfdc6-69b2-41bd-be00-3e00547f284b), [Turn off Windows Firewall Windows Server](/docs/d43b6332-798c-43ea-b9e2-d774a1cd04e9)

### [Disable IPv6](/docs/1e9dee40-965f-4b6c-a9cf-4cb45162d5ac)

Provides centralized management of IPv6 protocol settings across Windows devices.

**Key Components:**

- **Custom Field:** [cPVAL Disable IPv6](/docs/060ad5d8-ee1d-4ee2-a92d-7dbc14121bc6)
- **Automation:** [Get IPv6 Enabled Adapters](/docs/eace3666-d7f3-41f5-a819-df7056a94e5f), [Disable IPv6](/docs/44ab6bd7-fe4f-4c1a-a743-9db643091d3d), [Enable IPv6](/docs/9149e3e9-027a-4666-9283-d17b26816234)
- **Compound Conditions:** [Disable IPv6 Windows Workstation](/docs/2471a88f-d339-497b-a9c2-1f30f83bcdd9), [Disable IPv6 Windows Server](/docs/79b177eb-4421-48b2-b47c-9163ceebcf78)

### [Disable Sleep](/docs/a34e3293-b46a-485d-ae72-c30d235a2531)

Manages sleep settings across Windows devices with granular control through custom fields.

**Key Components:**

- **Custom Field:** [cPVAL Disable Sleep](/docs/b0c22386-feb6-427c-b1fd-e29a9c4863a3)
- **Automation:** [Get Sleep Status](/docs/49127c19-f3b2-4006-9d48-ccd01290eafa), [Disable Sleep](/docs/21947d80-a91f-4b2a-9109-addee4e16b91), [Enable Sleep](/docs/aa641c2c-bac8-47a5-aee9-0891c5f5330c)
- **Compound Conditions:** [Disable Sleep Windows Workstation](/docs/01e513a0-0764-4d2d-ae60-871e42010526), [Disable Sleep Windows Server](/docs/047f1fc9-f296-42c0-bad6-3498b9160609)

## Implementation

Import and configure the required solutions based on organizational needs:

- [Configure Taskbar Outlook Chrome Only](/docs/8efbc9f2-0812-40c2-8583-a563049c7762) - For standardized taskbar layouts
- [Remove Bloatware](/docs/9912c1d2-27b8-449a-8d54-d5e24b436721) - For cleaning unwanted applications
- [Turn off Windows Firewall](/docs/202f2907-e8e5-4d65-9823-e70749cef708) - For centralized firewall management
- [Disable IPv6](/docs/1e9dee40-965f-4b6c-a9cf-4cb45162d5ac) - For IPv6 protocol management
- [Disable Sleep](/docs/a34e3293-b46a-485d-ae72-c30d235a2531) - For power management control

Each solution can be implemented independently or as part of a comprehensive device standardization strategy.

## FAQ

**Q: Why should we implement device standards across our organization?**  
A: Device standards ensure consistency, improve security, reduce support overhead, and provide a predictable user experience. Standardized configurations make troubleshooting easier and help maintain compliance with organizational policies.

**Q: How do we decide which solutions to implement?**  
A: Start by assessing your organizational needs. Consider factors like security requirements, user productivity needs, compliance mandates, and existing IT policies. Implement solutions that address your specific pain points and align with your overall IT strategy.

**Q: Can we customize these solutions to meet our specific requirements?**  
A: Yes, each solution offers granular control through custom fields that can be configured at organization, location, or device levels. This allows for tailored policies while maintaining overall standardization.

**Q: How do these solutions handle exceptions for specific devices or departments?**  
A: The custom field configuration allows for exceptions at multiple levels. You can set organization-wide defaults, then override them for specific locations or individual devices as needed.

**Q: What's the difference between implementing these solutions individually vs. as a package?**  
A: While each solution works independently, implementing them as a package provides comprehensive device standardization. The integrated approach ensures consistent management patterns and reduces configuration conflicts.

**Q: How often should we review and update our device standards?**  
A: Regular reviews are recommended—typically quarterly or whenever there are significant changes in organizational requirements, security threats, or software updates.

**Q: What happens if a solution causes unexpected issues on some devices?**  
A: Each solution includes reversal scripts and the ability to quickly exclude affected devices through custom field settings. This allows for rapid remediation without affecting other devices.

**Q: Can we add our own custom solutions to this framework?**   
A: Yes, the Device Standards framework is designed to be extensible. You can develop additional standardization solutions following the same pattern and incorporate them into your overall device management strategy.

**Q: How do these solutions handle different versions of Windows?**  
A: The solutions are designed to work across supported versions of Windows, with logic that adapts to different operating system versions and editions. However, always test in your specific environment before widespread deployment.

**Note:** This framework is designed to be extensible. Additional device standardization solutions can be added in the future to address evolving organizational needs and technological changes.
