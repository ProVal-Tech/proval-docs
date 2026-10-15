---
id: 'b5c871cf-f8fc-4fde-b20c-5aabd7341ade'
slug: /b5c871cf-f8fc-4fde-b20c-5aabd7341ade
title: 'Get Printer Details'
title_meta: 'Get Printer Details'
keywords: ['printer', 'print']
description: 'This solution is built to fetch the attached Printer Details from the endpoint.'
tags: ['print', 'audit']
draft: false
unlisted: false
last_update:
  date: 2026-10-13
---

## Purpose

This solution is built to fetch the attached Printer Details from the endpoint. 

## Associated Content

| Content                                             | Type                                                      | Function                                               |
|-----------------------------------------------------|-----------------------------------------------------------|--------------------------------------------------------|
| [Get Printer Details](/docs/b97ba03c-ce1a-4337-a42b-d07dabc59412)     | Script | Collects detailed printer information from the local machine and stores it to the [Custom field - cPVAL Printer Details](/docs/4d6e483c-28b6-43ed-a83e-9f503166de5f) in the tabular format. |
| [cPVAL Printer Details](/docs/4d6e483c-28b6-43ed-a83e-9f503166de5f)     | Custom field | This custom field stores the information of the printers fetched using the [Script - Get Printer Details](/docs/b97ba03c-ce1a-4337-a42b-d07dabc59412). |
| [cPVAL Get Printer Details](/docs/0009fe9a-7fce-4edd-8a4f-b202704dc6bf)     | Custom field | Select the options at `Organization`, `Location` or `Device` level to enable or disable auditing of printer details on endpoints. |
| [Get Printer Details Server](/docs/980413bc-e97a-4d6b-92d5-fe19fa69422c)     | Compound Condition | This compound condition is built to deploy the Printer auditing on the Windows servers where the custom field is set to 'Windows' or 'Windows Server'. |
| [Get Printer Details Workstation](/docs/350c2f3e-7c5e-497d-a397-99465e65afe0)     | Compound Condition | This compound condition is built to deploy the Printer auditing on the Windows workstations where the custom field is set to 'Windows' or 'Windows Workstation'. |

## Additional Content

| Content                                             | Type                                                      | Function                                               |
|-----------------------------------------------------|-----------------------------------------------------------|--------------------------------------------------------|
| [WYSIWYG Custom field Report - Organization and Global KB](/docs/67df14cd-3c20-4a40-bb7a-80caae242687/)     | Script | It reads one WYSIWYG custom field from every device through the NinjaOne Public API, merges the table rows from all devices into a single table, adds device details such as the organization, location and last contact to each row, and publishes the result |

## Implementation

- Create the [Custom field - cPVAL Printer Details](/docs/4d6e483c-28b6-43ed-a83e-9f503166de5f) and [Custom field - cPVAL Get Printer Details](/docs/0009fe9a-7fce-4edd-8a4f-b202704dc6bf).
- Create the [Script - Get Printer Details](/docs/b97ba03c-ce1a-4337-a42b-d07dabc59412)
- Create the [Compound Condition - Get Printer Details - Server](/docs/980413bc-e97a-4d6b-92d5-fe19fa69422c) and [Compound Condition - Get Printer Details - Workstation](/docs/350c2f3e-7c5e-497d-a397-99465e65afe0)
- Enable the compound condition to run every 24 hours
- Please schedule the additional script [WYSIWYG Custom field Report - Organization and Global KB](/docs/67df14cd-3c20-4a40-bb7a-80caae242687/) to one computer (please ensure to ask from the partner an internal machine that doesn't go offline) to gather the data from WYSIWYG from all devices and create a single global or organization level report as a `Knowledge Base Articles and Local CSV Files`.
- Note: There are options to create `Knowledge Base Articles`, `Local CSV Files`, or `Knowledge Base Articles and Local CSV Files` with all the device WYSIWYG data output. Please proceed as per the partner's requirement, either one or both.
- Parameters to set in the script [WYSIWYG Custom field Report - Organization and Global KB](/docs/67df14cd-3c20-4a40-bb7a-80caae242687/)

**Run as:** `System`
**Preset parameter:** ""
**Report Output:** `Knowledge Base Articles and Local CSV Files`
**Custom Field Name:** `cPVAL Printer Details`
**Report Scope:** `All Organizations and Global`
**Organization Names:** ""
**Organization KB Article Name:** `Org - Printer Details Audit`
**Organization Folder Name:** `Printer`
**Organization Additional Columns:** `Domain, LastContact, DaysSinceLastContact, DeviceType, OS, OSBuild`
**Organization Exclude Columns:** ""
**Global KB Article Name:** `Global - Printer Details Audit` 
**Global KB Folder Name:** `Printer`
**Global Additional Columns:** `Domain, LastContact, DaysSinceLastContact, DeviceType, OS, OSBuild`
**Global Exclude Columns:** ""
**Local Folder Name:** `Printer`
**Local File Name:** `Get - Printer Details Report`
**Device Category:** `All`
**Group By:** ""
**Sort By:** ""
**Filter:** ""
**Multipart:** true
**Instance URL:** `us2.ninjarmm.com` ## Provide client ninja URL

## Changelog

### 2026-10-13

- Initial version of the document