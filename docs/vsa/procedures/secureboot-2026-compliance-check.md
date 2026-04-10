---
id: '6e3a2154-42ba-471c-8cd5-379e95b3732f'
slug: /6e3a2154-42ba-471c-8cd5-379e95b3732f
title: 'SecureBoot 2026 Compliance Check'
title_meta: 'SecureBoot 2026 Compliance Check'
keywords: ['certificates','compliance','secureboot']
description: 'This script evaluates whether a Windows device is prepared for the upcoming Microsoft Secure Boot certificate transition scheduled for 2026. Microsoft is replacing legacy Secure Boot certificates with updated 2023-era certificates (KEK and DB). Devices that do not contain these updated certificates may be considered at risk once older certificates expire.'
tags: ['auditing','certificates','secureboot']
draft: false
unlisted: false
last_update:
  date: 2026-04-10
---

## Summary

This script evaluates whether a Windows device is prepared for the upcoming Microsoft Secure Boot certificate transition scheduled for 2026. Microsoft is replacing legacy Secure Boot certificates with updated 2023-era certificates (KEK and DB). Devices that do not contain these updated certificates may be considered at risk once older certificates expire.

The script performs the following checks:

- Verifies that Secure Boot is enabled.
- Checks for presence of:
  - Microsoft Corporation KEK 2K CA 2023
  - Windows UEFI CA 2023 (DB certificate)
- Determines overall readiness status:
  - Ready  → Secure Boot enabled + both 2023 certificates present
  - Risk   → Secure Boot enabled but 2023 certificates missing
  - N/A    → Secure Boot disabled or not supported
- Outputs a compact compliance string.
- Optionally writes the result to a VSA RMM Custom field.

## Dependencies

PowerShell 5.0+
MicrosoftC2RRepair.ps1
[cpval-secureboot-check](/docs/a79ce245-02ad-425d-81cb-d2fbfdc88820)
[remediation-secureboot-2026-compliance](/docs/28fa1216-33bf-481d-941b-c1e6e1978e44)
[secureboot-remediation-audit-solution](/docs/cf6ea3e7-854f-4046-bfdd-6f284feb20f8)

## Implementation

1.Export the agent procedure from ProVal's VSA RMM instance.
Name: `SecureBoot 2026 Compliance Check`

![Image 1](../../../static/img/docs/6e3a2154-42ba-471c-8cd5-379e95b3732f/Export_check.webp) 
The export will download the necessary XML file.

2.`Import` this XML file into the partner's VSA RMM instance. 
![Image 2](../../../static/img/docs/6e3a2154-42ba-471c-8cd5-379e95b3732f/Import_Check.webp)

3.Export the Secureboot.ps1 from the ProVal's Internal VSA. This is also placed under the below path:
`Manage Files` > `Shared Files` > `PVAL` > `Secureboot.ps1`
![Image 3](../../../static/img/docs/6e3a2154-42ba-471c-8cd5-379e95b3732f/Managefiles_ps1.webp)

4.Map the `Secureboot.ps1` into the 10th step of the script in the client's environment.
![Image 4](../../../static/img/docs/6e3a2154-42ba-471c-8cd5-379e95b3732f/Mapping_ps1.webp)

5.To `Execute`Select the agent procedure and click on run now and then submit.
![Image 5](../../../static/img/docs/6e3a2154-42ba-471c-8cd5-379e95b3732f/Execute_Check.webp)
![Image 6](../../../static/img/docs/6e3a2154-42ba-471c-8cd5-379e95b3732f/Submit_check.webp)

## Output

Agent Procedure History Log

![Image 7](../../../static/img/docs/6e3a2154-42ba-471c-8cd5-379e95b3732f/Procedure_history_log.webp)

Custom Field

![Image 8](../../../static/img/docs/6e3a2154-42ba-471c-8cd5-379e95b3732f/customfield_update.webp)

## Changelog

### 2026-04-10

- Initial version of the document