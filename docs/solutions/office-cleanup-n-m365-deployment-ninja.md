---
id: 'f5efe485-4c55-4fe0-88db-05c06305b101'
slug: /f5efe485-4c55-4fe0-88db-05c06305b101
title: 'Office Cleanup and M365 Deployment'
title_meta: 'Office Cleanup and M365 Deployment'
keywords: ["Microsoft", "Office", "C2R", '365', 'install', 'xml', 'configuration']
description: 'The Purpose of this solution is to provide a single solution to uninstall any version of Office and to install M365 apps'
tags: ['application', 'setup', 'software', 'windows','microsoft365','office','uninstallation']
draft: false
unlisted: false
last_update:
  date: 2026-30-04
---

## Purpose

The Purpose of this solution is to provide a single solution to uninstall any version of Office and to install M365 apps

## Associated Content

| Content                                             | Type                                                      | Function                                               |
|-----------------------------------------------------|-----------------------------------------------------------|--------------------------------------------------------|
| [cPVAL Enable Office Cleanup and M365 Deployment](/docs/d39593cb-e6d1-4a2d-b2b0-6ef1e2148a15)    | Custom Field | Custom field to enable/disable the office cleanup and M365 Deployment.  |
| [cPVAL Office Versions to Uninstall](/docs/d39593cb-e6d1-4a2d-b2b0-6ef1e2148a15)    | Custom Field | Custom field to specify the Office Version that needs to be Uninstalled. If this custom field is blank on all device,location and Organization level, [Script - Office Cleanup and M365 Deployment](/docs/de0e7e1f-6f29-41b2-9d65-164b2e2c4431) will use the script parameter  `Versions to Uninstall`, if its also blank, script will uninstall all installed versions.  |
| [cPVAL Xmlpath](/docs/d85663d1-97b3-4365-9cc8-99d8a2c20cbf)    | Custom Field | Custom Field to specify XML file to be used for Microsoft 365 installation. If this custom field is blank on all device,location and Organization level, [Script - Office Cleanup and M365 Deployment](/docs/de0e7e1f-6f29-41b2-9d65-164b2e2c4431) will use the script parameter `XMLPath`, if its also blank, script will use the default configuration. |
| [Office Cleanup and M365 Deployment](/docs/d39593cb-e6d1-4a2d-b2b0-6ef1e2148a15)    | Script | This Script uninstalls any version of Office and installs M365 apps  |
| [Execute - Office Cleanup and M365 Deployment](/docs/e3c064d1-452d-465f-a8d5-e09858fd6aad)    | Compound condition | Executes the [Script - Office Cleanup and M365 Deployment](/docs/de0e7e1f-6f29-41b2-9d65-164b2e2c4431) only when 'cPVAL Enable Office Cleanup and M365 Deployment' is enabled. |


## Implementation


- Create the following custom fields using the implementation instruction provided in the document.
  - [cPVAL Enable Office Cleanup and M365 Deployment](/docs/d39593cb-e6d1-4a2d-b2b0-6ef1e2148a15) 
  - [cPVAL Office Versions to Uninstall](/docs/d39593cb-e6d1-4a2d-b2b0-6ef1e2148a15) 
  - [cPVAL Xmlpath](/docs/d85663d1-97b3-4365-9cc8-99d8a2c20cbf)
- Create the script [Office Cleanup and M365 Deployment](/docs/d39593cb-e6d1-4a2d-b2b0-6ef1e2148a15) using the implementation instruction provided in the document.
- Create the compound condition [Execute - Office Cleanup and M365 Deployment](/docs/e3c064d1-452d-465f-a8d5-e09858fd6aad)   using the implementation instruction provided in the document.

## Changelog

### 2026-30-04

- Initial version of the document