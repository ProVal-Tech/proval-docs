---
id: '265e1888-ce5f-4d44-a5c4-6a64d578eb98'
slug: /265e1888-ce5f-4d44-a5c4-6a64d578eb98
title: 'Enable Defender'
title_meta: 'Enable Defender'
keywords: ['antivirus', 'windows', 'security', 'defender']
description: 'This solution contains the automation to enable the defender and provide an option to create a ticket for failure.'
tags: ['antivirus', 'windows', 'security']
draft: false
unlisted: false
last_update:
  date: 2026-10-12
---

## Purpose

This solution contains the automation to enable the defender and provide an option to create a ticket for failure.

## Associated Content

| Content                                             | Type                                                      | Function                                               |
|-----------------------------------------------------|-----------------------------------------------------------|--------------------------------------------------------|
| [cPVAL Enable Defender Only](/docs/0f8717c5-1ceb-4941-a73e-6e00efdb8cae)     | Custom Field | This custom field is required to be set to enable defender only without ticket creation on failure. |
| [cPVAL Enable Defender With Ticket On Failure](/docs/79e87b45-f26b-4a49-b5be-da58c743dccd)     | Custom Field | This custom field requires enabling Defender with ticket creation on failure. |
| [cPVAL Defender Enable Status](/docs/56b73bb4-bc25-4335-9d99-c4f3dfe0509d)     | Custom Field | This custom field stores the success or failure of the Enable Defender automation. |
| [Enable Defender](/docs/51524601-539b-437b-a885-424fc59da0e5)     | Script | Enables / repairs Microsoft Defender Antivirus when Webroot or another active AV is not present. |
| [Create Ticket for Enable Defender Failure - Server](/docs/3b070dda-67e6-4c3a-9668-efd9ec269fc2)     | Compound Condition | This compound condition is used to create a ticket if the Enable Defender Automation fails on a Windows server and the custom field [cPVAL Enable Defender With Ticket On Failure](/docs/79e87b45-f26b-4a49-b5be-da58c743dccd)  is set to either `Windows` or `Windows Server`. |
| [Create Ticket for Enable Defender Failure - Workstation](/docs/924f71e0-3d47-474c-b4f2-2218e6d0af8f)     | Compound Condition | This compound condition is used to create a ticket if the Enable Defender Automation fails on a Windows workstation and the custom field [cPVAL Enable Defender With Ticket On Failure](/docs/79e87b45-f26b-4a49-b5be-da58c743dccd)  is set to either `Windows` or `Windows Workstation` |
| [Enable Defender - Workstation](/docs/81ca93ab-6803-4691-a2f3-c0f4aab3be1e)     | Compound Condition | This compound condition is used to run automation to enable Defender on the Windows workstation if the custom field [cPVAL Enable Defender Only](/docs/0f8717c5-1ceb-4941-a73e-6e00efdb8cae) or [cPVAL Enable Defender With Ticket On Failure](/docs/79e87b45-f26b-4a49-b5be-da58c743dccd)  is set to `Windows` or `Windows Workstation`. |
| [Enable Defender - Server](/docs/f44c5231-75d9-4067-8460-aee0e3900700)     | Compound Condition | This compound condition is used to run automation to enable Defender on the Windows server if the custom field [cPVAL Enable Defender Only](/docs/0f8717c5-1ceb-4941-a73e-6e00efdb8cae) or [cPVAL Enable Defender With Ticket On Failure](/docs/79e87b45-f26b-4a49-b5be-da58c743dccd)  is set to `Windows` or `Windows Server`. |

## Implementation

1. Create the below custom fields:
    - [cPVAL Enable Defender Only](/docs/0f8717c5-1ceb-4941-a73e-6e00efdb8cae)
    - [cPVAL Enable Defender With Ticket On Failure](/docs/79e87b45-f26b-4a49-b5be-da58c743dccd)
    - [cPVAL Defender Enable Status](/docs/56b73bb4-bc25-4335-9d99-c4f3dfe0509d)
2. Create the script [Enable Defender](/docs/51524601-539b-437b-a885-424fc59da0e5) 
3. Create the below compound conditions:
    - [Enable Defender - Workstation](/docs/81ca93ab-6803-4691-a2f3-c0f4aab3be1e)
    - [Enable Defender - Server](/docs/f44c5231-75d9-4067-8460-aee0e3900700) 
    - [Create Ticket for Enable Defender Failure - Workstation](/docs/924f71e0-3d47-474c-b4f2-2218e6d0af8f)
    - [Create Ticket for Enable Defender Failure - Server](/docs/3b070dda-67e6-4c3a-9668-efd9ec269fc2)
4. Enable the custom fields as per your requirement
5. Enable both the compound conditions.

## FAQs

**Q1. What is the difference between `cPVAL Enable Defender Only` and `cPVAL Enable Defender With Ticket On Failure`?**

**A:**  **cPVAL Enable Defender Only** triggers the Defender enablement automation without creating a ticket if the automation fails. This option is suitable when you want Defender enabled but do not require failure notifications through ticketing.

 **cPVAL Enable Defender With Ticket On Failure** not only triggers the Defender enablement automation but also creates a ticket if the automation fails, allowing technicians to investigate and remediate the issue.

**Q2. Do I need to enable both `cPVAL Enable Defender Only` and `cPVAL Enable Defender With Ticket On Failure`?**

**A:** No. Either enable `cPVAL Enable Defender Only` when no ticket is required. Or enable `cPVAL Enable Defender With Ticket On Failure` to generate a ticket.


**Q3. What should I do if I want a ticket if Defender fails to enable for Server but do not want a ticket if it fails for workstations?**

**A:** Select `Windows Workstation` from the drop-down for `cPVAL Enable Defender Only` and select `Windows Server` for `cPVAL Enable Defender With Ticket On Failure` at client or site as per your requirement.

**Q4. How do I enable Microsoft Defender on Windows devices using this automation?**

**A:** To enable Microsoft Defender, configure either cPVAL Enable Defender Only or cPVAL Enable Defender With Ticket On Failure with one of the supported values: Windows (applies to both servers and workstations)
Windows Server (applies only to servers)
Windows Workstation (applies only to workstations)

The appropriate compound condition **Enable Defender - Server** or **Enable Defender - Workstation** will then execute the `Enable Defender` script on eligible devices.

**Q5: What role do the compound conditions play in the Defender automation workflow?** 

**A:** The compound conditions act as decision points that determine whether the automation should run and whether a failure ticket should be created.

The workflow is as follows:
- A supported value is configured in either `cPVAL Enable Defender Only` or `cPVAL Enable Defender With Ticket On Failure`.
- The applicable compound condition (`Enable Defender - Server` or `Enable Defender - Workstation`) evaluates the device type and initiates the Enable Defender script.
- The automation result is written to `cPVAL Defender Enable Status`.
- If the automation fails and ticketing is enabled, the appropriate ticket creation compound condition (`Create Ticket for Enable Defender Failure - Server` or `Create Ticket for Enable Defender Failure - Workstation`) generates a service ticket.

## Changelog

### 2026-10-12

- Initial version of the document