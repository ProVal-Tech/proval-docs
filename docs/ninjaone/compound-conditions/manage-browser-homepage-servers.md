---
id: '3557a5e1-91f2-4a2b-983c-bf79332ee3ec'
slug: /3557a5e1-91f2-4a2b-983c-bf79332ee3ec
title: 'Manage Browser Homepage - Servers'
title_meta: 'Manage Browser Homepage - Servers'
keywords: ['homepage', 'browsers', 'configuration', 'set', 'remove', 'replace']
description: 'Triggers the `Browser - Homepage - Manage` automation on Windows servers where deployment is enabled for windows servers from `cPVAL Enable Browser Manage` custom field.'
tags: ['chrome', 'edge', 'firefox', 'setup']
draft: false
unlisted: false
last_update:
  date: 2026-10-01
---

## Summary

Triggers the [Automation - Browser - Homepage - Manage](/docs/13d8ac16-33d9-4bf4-b7cb-d8db932c8da6) on Windows servers where deployment is enabled for windows servers from [Custom Field - cPVAL Enable Browser Manage](/docs/d63f2f2f-d39d-4bcd-8eb5-c4bbbb67b750).

## Details

- **Name:** `Manage Browser Homepage - Servers`
- **Description:** `Triggers the 'Browser - Homepage - Manage' automation on Windows servers where deployment is enabled for windows servers from 'cPVAL Enable Browser Manage' custom field.`  
- **Recommended Agent Policy:** `Windows Servers [Default]`

## Dependencies

- [Automation - Browser - Homepage - Manage](/docs/13d8ac16-33d9-4bf4-b7cb-d8db932c8da6) 
- [Custom Field - cPVAL Enable Browser Manage](/docs/d63f2f2f-d39d-4bcd-8eb5-c4bbbb67b750)
- [Solution - Browser - HomePage - Manage](/docs/3197b1ea-9250-4373-9d21-6124a0b72ec6)

## Compound Condition Creation 

- [Compound Condition Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/compound-conditions/manage-browser-homepage-servers.toml)

## Changelog

### 2026-10-01

- Initial version of the document
