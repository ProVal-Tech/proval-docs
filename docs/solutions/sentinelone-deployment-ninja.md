---
id: '0e01e6d8-e332-4a72-aa56-e2386b214ab0'
slug: /0e01e6d8-e332-4a72-aa56-e2386b214ab0
title: 'SentinelOne Automation'
title_meta: 'SentinelOne Automation'
keywords: ['sentinelone', 's1', 'security', 'deployment', 'uninstallation']
description: 'This solution comprises of the SentinelOne deployment and uninstallation automation.'
tags: ['antivirus', 'auditing']
draft: false
unlisted: false
last_update:
  date: 2026-06-03
---

## Purpose

This solution comprises of the SentinelOne deployment and uninstallation automation.

## Associated Content

| Content                                             | Type                                                      | Function                                               |
|-----------------------------------------------------|-----------------------------------------------------------|--------------------------------------------------------|
| [cPVAL SentinelOne Key](/docs/44561301-d22b-4013-86af-d1842773d2ca)     | Custom field | This custom field at the organization level stores the Sentinel Site Key. The Site Key is used for organizing and managing endpoints based on their physical or logical network location within the organization. |
| [cPVAL SentinelOne Deployment](/docs/e5070ddb-4f7f-4624-bd3e-f0cd6ab67d4f)     | Custom field | This assists with performing the SentinelOne deployment/uninstallation based on the selected option. |
| [SentinelOne Deployment](/docs/4e0f294f-9ecf-42a2-9832-497d4305360e)     | Script | This script deploys the SentinelOne agent on Windows machines. |
| [SentinelOne Uninstall](/docs/5b5a3254-de28-4ea1-8a7a-4f5d465ce7f1)     | Script| This script uninstalls the SentinelOne agent from a Windows system. It dynamically detects the SentinelOne agent''s installation directory and executes the uninstallation process. |
| [SentinelOne Deployment Workstation](/docs/f5485d98-2d4a-4018-b4a5-aabd2836a57a)     | Compound Conditions | This performs the Sentinel Deployment to the Windows or windows workstations where the exclusion is not checked and SentinelOne is not installed. |
| [SentinelOne Deployment Server](/docs/0ca473eb-9c5f-4c11-88a3-52f3bb634d52)     | Compound Conditions | This performs the Sentinel Deployment to the Windows or windows Servers where the exclusion is not checked and SentinelOne is not installed. |
| [SentinelOne Uninstall Workstation](/docs/6c947f3c-a994-49dc-a7a2-9f7d240a8692)     | Compound Conditions | This performs the Sentinel uninstallation to the Windows or windows workstations where the sentinel deployment custom field is set to `Uninstall` and SentinelOne is installed. |
| [SentinelOne Uninstall Server](/docs/230eeb73-2c26-4814-abc0-110053d6d913)     | Compound Conditions | This performs the Sentinel Deployment to the Windows or windows servers where the exclusion is not checked and SentinelOne is not installed. |

## Implementation

- Create the Custom field [cPVAL SentinelOne Key](/docs/44561301-d22b-4013-86af-d1842773d2ca).
- Create the Custom field [cPVAL SentinelOne Deployment](/docs/e5070ddb-4f7f-4624-bd3e-f0cd6ab67d4f)
- Create the Custom field [cPVAL SentinelOne Deployment Exclude](/docs/414c6ee7-591e-4595-9336-4524730274f2)
- Create the script [SentinelOne Deployment](/docs/4e0f294f-9ecf-42a2-9832-497d4305360e)
- Create the script [SentinelOne Uninstall](/docs/5b5a3254-de28-4ea1-8a7a-4f5d465ce7f1)
- Create the compound conditions [SentinelOne Deployment Workstation](/docs/f5485d98-2d4a-4018-b4a5-aabd2836a57a)
- Create the compound conditions [SentinelOne Deployment Server](/docs/0ca473eb-9c5f-4c11-88a3-52f3bb634d52) 
- Create the compound conditions [SentinelOne Uninstall Workstation](/docs/6c947f3c-a994-49dc-a7a2-9f7d240a8692)
- Create the compound conditions [SentinelOne Uninstall Server](/docs/230eeb73-2c26-4814-abc0-110053d6d913)
- Set the deployment value in the custom field at the `Organization`, `Location`, or `Device` level for the automation deployment.
- Once, it is set the deployment and uninstall compound condition will run the automation based on the value selected in the Custom field [cPVAL SentinelOne Deployment](/docs/e5070ddb-4f7f-4624-bd3e-f0cd6ab67d4f).


## Changelog

### 2026-06-03

- Added Uninstall option to the `cPVAL SentinelOne Deployment` custom field and changed its scope to location and computer. Location and machine can be excluded from the solution, using this custom field only.
- Removed `cPVAL SentinelOne Deployment Exclude` Custom Field as exclusions is handled by `cPVAL SentinelOne Deployment` custom field.
- Improvised [SentinelOne Deployment](/docs/4e0f294f-9ecf-42a2-9832-497d4305360e) to validate the S1 key, to make sure the custom field has it, and also signed the PS1.
- Updated the uninstallation script and renamed it from `Remove SentinelOne` to `SentinelOne Uninstall`.
- Added compound conditions for automatic installation and uninstallation.
- Updated the documents as per our new template

### 2026-06-02

- Initial version of the document