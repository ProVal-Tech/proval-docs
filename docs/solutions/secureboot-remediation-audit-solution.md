---
id: 'cf6ea3e7-854f-4046-bfdd-6f284feb20f8'
slug: /cf6ea3e7-854f-4046-bfdd-6f284feb20f8
title: 'Secureboot Remediation and Audit Solution'
title_meta: 'Secureboot Remediation and Audit Solution'
keywords: ['certificates','compliance','secureboot','solution']
description: 'This solution checks the Secure Boot status and validates the associated certificates. If the system is using older Secure Boot certificates, the custom fields are updated accordingly. If the system is using updated certificates, the custom fields are updated to reflect the compliant status.'
tags: ['auditing','certificates','secureboot','solution']
draft: false
unlisted: false
last_update:
  date: 2026-04-13
---

## Purpose

This solution checks the Secure Boot status and validates the associated certificates.

## Associated Content

| Content | Type | Function |
| ----------------------------------------------------- | ----------------------------------------------------------- | -------------------------------------------------------- |
| [cPVAL SecureBoot Check](/docs/a79ce245-02ad-425d-81cb-d2fbfdc88820) | `Custom Field` | This custom field shows whether Secure Boot is enabled on the device. |
| [SecureBoot 2026 Compliance Check](/docs/6e3a2154-42ba-471c-8cd5-379e95b3732f) | `Automation` | This script evaluates whether a Windows device is prepared for the upcoming Microsoft Secure Boot certificate transition scheduled for 2026. |
| [Remediation SecureBoot 2026 Compliance](/docs/28fa1216-33bf-481d-941b-c1e6e1978e44) | `Automation` | This script automates the remediation of UEFI Secure Boot certificates required for Windows 2026 compliance. It ensures the system has the latest 2023 UEFI certificates (KEK and db) and configures the system for automatic Microsoft-managed UEFI certificate updates. |



## Implementation

Step 1: Create the Custom Field 
[cPVAL SecureBoot Check](/docs/a79ce245-02ad-425d-81cb-d2fbfdc88820)

Step 2: Import Automation Scripts:
- [SecureBoot 2026 Compliance Check](/docs/6e3a2154-42ba-471c-8cd5-379e95b3732f)
- [Remediation SecureBoot 2026 Compliance](/docs/28fa1216-33bf-481d-941b-c1e6e1978e44)


## FAQ

**Q1. What is the purpose of the Secure Boot Compliance – Audit solution?**

**A.** The solution audits the Secure Boot configuration on Windows devices and validates related Secure Boot certificates. It updates custom fields to reflect whether the device is compliant or using outdated certificates.

**Q2. What information does this solution collect from devices?**
**A.** The solution collects and records the following information:  
- Secure Boot status (enabled or disabled)  
- Windows telemetry status  
- Windows Secure Boot DB certificate status   
- Windows KEK certificate status

This information is stored in custom fields for reporting and compliance monitoring.

**Q3. Why are custom fields used in this solution?**  
**A.** Custom fields allow Secure Boot audit results to be stored directly on each device record. This makes it easier to:
- Filter devices
- Create device groups
- Generate reports
- Monitor compliance across the environment.

**Q4. When should this solution be deployed?**  
**A.** This solution should be deployed across all Windows devices to ensure they are prepared for the 2026 Microsoft Secure Boot certificate transition and to maintain consistent security compliance across the environment.

**Q5. Why is Secure Boot certificate validation important?**  
**A.** Secure Boot certificates ensure that only trusted software can run during the system boot process. Validating these certificates helps maintain system integrity and ensures compatibility with upcoming security updates from Microsoft.

## Changelog

### 2026-04-13

- Initial version of the document