---
id: '0f23c8a1-f507-4c1d-9d3f-8e1233653c1e'
slug: /0f23c8a1-f507-4c1d-9d3f-8e1233653c1e
title: 'Manage Browser Homepage - Workstations'
title_meta: 'Manage Browser Homepage - Workstations'
keywords: ['homepage', 'browsers', 'configuration', 'set', 'remove', 'replace']
description: 'Triggers the `Browser - Homepage - Manage` automation on Windows Workstations where deployment is enabled for windows workstations from `cPVAL Enable Browser Manage` custom field.'
tags: ['chrome', 'edge', 'firefox', 'setup']
draft: false
unlisted: false
last_update:
  date: 2026-09-28
---

## Summary
Triggers the [Automation - Browser - Homepage - Manage](/docs/13d8ac16-33d9-4bf4-b7cb-d8db932c8da6) on Windows Workstations where deployment is enabled for windows workstations from [Custom Field - cPVAL Enable Browser Manage](/docs/d63f2f2f-d39d-4bcd-8eb5-c4bbbb67b750).

## Details

- **Name:** `Manage Browser Homepage - Workstations`
- **Description:** `Triggers the 'Browser - Homepage - Manage' automation on Windows Workstations where deployment is enabled for windows workstations from 'cPVAL Enable Browser Manage' custom field.`  
- **Recommended Agent Policy:** `Windows Workstation [Default]`

## Dependencies

- [Automation - Browser - Homepage - Manage](/docs/13d8ac16-33d9-4bf4-b7cb-d8db932c8da6) 
- [Custom Field - cPVAL Enable Browser Manage](/docs/d63f2f2f-d39d-4bcd-8eb5-c4bbbb67b750)
- [Solution - Browser - HomePage - Manage](/docs/3197b1ea-9250-4373-9d21-6124a0b72ec6)

## Compound Condition Creation 

- [Compound Condition Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/compound-conditions/manage-browser-homepage-workstations.toml)

## Changelog

### 2026-09-28

- Initial version of the document
