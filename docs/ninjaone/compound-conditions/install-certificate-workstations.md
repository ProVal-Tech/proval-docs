---
id: 'fe460488-617b-4fc6-944e-5f8cf4c76516'
slug: /fe460488-617b-4fc6-944e-5f8cf4c76516
title: 'Install Certificate - Workstations'
title_meta: 'Install Certificate - Workstations'
keywords: ['certificate', 'windows', 'mac', 'install', 'root', 'trusted', 'keychain', 'location']
description: 'Triggers the `Install Certificate - Windows` automation on Windows Workstations where certification installation is enabled for windows workstations from `cPVAL Enable Certificate Deployment` custom field.'
tags: ['installation', 'security', 'setup']
draft: false
unlisted: false
last_update:
  date: 2026-09-28
---

## Summary
Triggers the [Automation - Install Certificate - Windows](/docs/3f49f6d9-758b-49d6-b425-7e816270aab2) on Windows Workstations where certification installation is enabled for windows workstations using [Custom Field - cPVAL Enable Certificate Deployment](/docs/d4f25ab4-f6e9-4f70-a4b5-a7fa61c2e69e).

## Details

- **Name:** `Install Certificate - Workstations`
- **Description:** `Triggers the 'Install Certificate - Windows' automation on Windows Workstations where certification installation is enabled for windows workstations from 'cPVAL Enable Certificate Deployment' custom field.`  
- **Recommended Agent Policy:** `Windows Workstation [Default]`

## Dependencies

- [Automation - Install Certificate - Windows](/docs/3f49f6d9-758b-49d6-b425-7e816270aab2)
- [Custom Field - cPVAL Enable Certificate Deployment](/docs/d4f25ab4-f6e9-4f70-a4b5-a7fa61c2e69e)
- [Solution - Install Certificates - Windows/Mac](/docs/12034de3-aa3a-4f6c-89da-a6f229e6fbec)

## Compound Condition Creation 

- [Compound Condition Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/compound-conditions/install-certificate-workstations.toml)

## Changelog

### 2026-09-28

- Initial version of the document