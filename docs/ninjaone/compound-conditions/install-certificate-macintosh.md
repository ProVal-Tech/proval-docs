---
id: 'bb552db9-554d-4b72-9492-bf644aadda6e'
slug: /bb552db9-554d-4b72-9492-bf644aadda6e
title: 'Install Certificate - Macintosh'
title_meta: 'Install Certificate - Macintosh'
keywords: ['certificate', 'windows', 'mac', 'install', 'root', 'trusted', 'keychain', 'location']
description: 'Triggers the `Install Certificate - Macintosh` automation on Macintosh where certification installation is enabled for Macintosh from `cPVAL Enable Certificate Deployment` custom field.'
tags: ['installation', 'security', 'setup']
draft: false
unlisted: false
last_update:
  date: 2026-09-28
---

## Summary
Triggers the [Automation - Install Certificate - Macintosh](/docs/c4cb39c2-2b84-44d4-985a-90e297c5c85e) on Macintosh where certification installation is enabled for Macintosh using [Custom Field - cPVAL Enable Certificate Deployment](/docs/d4f25ab4-f6e9-4f70-a4b5-a7fa61c2e69e).

## Details

- **Name:** `Install Certificate - Macintosh`
- **Description:** `Triggers the 'Install Certificate - Macintosh' automation on Macintosh where certification installation is enabled for Macintosh from 'cPVAL Enable Certificate Deployment' custom field.`  
- **Recommended Agent Policy:** `MAC Policy`

## Dependencies

- [Automation - Install Certificate - Macintosh](/docs/c4cb39c2-2b84-44d4-985a-90e297c5c85e)
- [Custom Field - cPVAL Enable Certificate Deployment](/docs/d4f25ab4-f6e9-4f70-a4b5-a7fa61c2e69e)
- [Solution - Install Certificates - Windows/Mac](/docs/12034de3-aa3a-4f6c-89da-a6f229e6fbec)

## Compound Condition Creation 

- [Compound Condition Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/compound-conditions/install-certificate-macintosh.toml)

## Changelog

### 2026-09-28

- Initial version of the document