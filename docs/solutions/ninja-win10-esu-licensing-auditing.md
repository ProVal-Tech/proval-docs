---
id: 'f1ae37d6-7fa7-414c-8550-1ae9ea11b987'
slug: /f1ae37d6-7fa7-414c-8550-1ae9ea11b987
title: 'Windows 10 ESU Licensing & Auditing'
title_meta: 'Windows 10 ESU Licensing & Auditing'
keywords: ['ESU', 'License', 'Extended', 'Windows 10']
description: 'This solution built to explain the ESU licensing audit and license activation in Ninja RMM'
tags: ['licensing', 'windows', 'extensions']
draft: false
unlisted: false
---

## Purpose

This solution built to explain the ESU licensing audit and license activation in Ninja RMM.
The Windows 10 Extended Security Updates program provides critical security patches for up to three years beyond the official end of support date. It’s intended for systems that cannot be upgraded immediately due to hardware, software compatibility, or organizational constraints. 

Refer to the articles:  
- https://learn.microsoft.com/en-us/windows/whats-new/enable-extended-security-updates
- https://www.systemcenterdudes.com/deploy-windows-10-extended-security-update-key-with-intune-or-sccm

## Associated Content

#### Audit Content

| Content                                             | Type                                                      | Function                                               |
|-----------------------------------------------------|-----------------------------------------------------------|--------------------------------------------------------|
| [CF - cpval ESU Status](/docs/b4d0f4a1-7891-4315-875e-01fc96b17d59)      | Custom Fields | These custom fields built to store the ESU licensing and auditing status at different levels. |
| [Script - ESU License Activation Detection](/docs/2110ef0d-ceaf-4b38-a4ff-647fe66e1015)      | Script | This script performs the checks for the ESU license activation detection and stores the info in the device custom field `cPVAL ESU Status` |
| [Groups - Win10 cpval ESU Status](/docs/85bd58c3-9a63-4d35-a4ce-cff4d2feae26)      | Groups | This contains the list of Windows 10 devices where the ESU is activated/ not activated/ or script failed record in three different groups.|

#### Automation Content

| Content                                             | Type                                                      | Function                                               |
|-----------------------------------------------------|-----------------------------------------------------------|--------------------------------------------------------|
| [Script - Windows 10 Extended Security Update](/docs/ba4df182-e419-4377-819f-ef55c34b0380)    | Script | The Windows 10 Extended Security Updates program provides critical security patches for up to three years beyond the official end of support date. It’s intended for systems that cannot be upgraded immediately due to hardware, software compatibility, or organizational constraints. Referred to the articles: https://learn.microsoft.com/en-us/windows/whats-new/enable-extended-security-updates, https://www.systemcenterdudes.com/deploy-windows-10-extended-security-update-key-with-intune-or-sccm/ |

## Implementation

This solution is built to perform the Windows 10 ESU licensing and auditing.

#### Auditing
- Import the custom fields [CF - cpval ESU Status](/docs/b4d0f4a1-7891-4315-875e-01fc96b17d59)
- Import the groups [Groups - Win10 cpval ESU Status](/docs/85bd58c3-9a63-4d35-a4ce-cff4d2feae26)
- Import the [Script - ESU License Activation Detection](/docs/2110ef0d-ceaf-4b38-a4ff-647fe66e1015) 

Schedule the [Script - ESU License Activation Detection](/docs/2110ef0d-ceaf-4b38-a4ff-647fe66e1015) to the Windows 10 group in the partners environment weekly or bi-weekly. The script stores the info in the device custom field [CF - cpval ESU Status](/docs/b4d0f4a1-7891-4315-875e-01fc96b17d59) and according to the output it will reflect in the [Groups - Win10 cpval ESU Status](/docs/85bd58c3-9a63-4d35-a4ce-cff4d2feae26).

#### Licensing
- Import the [Script - Windows 10 Extended Security Update](/docs/ba4df182-e419-4377-819f-ef55c34b0380)

Schedule the script on-demand as it requires to have the ESU license Key and ESU year for which the license is purchased.
The license key and license number of year(s) can be either provided at the Device/location/organization custom fields level or during the script execution.
