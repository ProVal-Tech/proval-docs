---
id: 'e3c064d1-452d-465f-a8d5-e09858fd6aad'
slug: /e3c064d1-452d-465f-a8d5-e09858fd6aad
title: 'Execute - Office Cleanup and M365 Deployment'
title_meta: 'Execute - Office Cleanup and M365 Deployment'
keywords: ["Microsoft", "Office", "C2R", '365', 'install', 'xml', 'configuration']
description: 'Executes the script `Office Cleanup and M365 Deployment` where solution is enabled.'
tags: ['application', 'setup', 'software', 'windows','microsoft365','office','uninstallation']
draft: false
unlisted: false
last_update:
  date: 2026-30-04
---

## Summary
Executes the [Script - Office Cleanup and M365 Deployment](/docs/de0e7e1f-6f29-41b2-9d65-164b2e2c4431) only when custom field [cPVAL Enable Office Cleanup and M365 Deployment](/docs/d39593cb-e6d1-4a2d-b2b0-6ef1e2148a15) is set to `Enable`.

## Details

- **Name:** `Execute - Office Cleanup and M365 Deployment`
- **Description:** `Executes the script 'Office Cleanup and M365 Deployment' only when 'cPVAL Enable Office Cleanup and M365 Deployment' is set to Enable.`
- **Recommended Agent Policies:** `Windows Workstations`

## Dependencies

- [Solution: Office Cleanup and M365 Deployment](/docs/f5efe485-4c55-4fe0-88db-05c06305b101)

## Compound Condition Creation 

- [Compound Condition Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/compound-conditions/execute-office-cleanup-n-m365-deployment.toml)

## Changelog

### 2026-30-04

- Initial version of the document