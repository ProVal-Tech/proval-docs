---
id: 'c02dffe5-9db7-4a86-8b39-8c6a6b9fc17d'
slug: /c02dffe5-9db7-4a86-8b39-8c6a6b9fc17d
title: 'Install Certificate - Servers'
title_meta: 'Install Certificate - Servers'
keywords: ['certificate', 'windows', 'mac', 'install', 'root', 'trusted', 'keychain', 'location']
description: 'Triggers the `Install Certificate - Windows` automation on Windows Servers where certification installation is enabled for windows Servers from `cPVAL Enable Certificate Deployment` custom field.'
tags: ['installation', 'security', 'setup']
draft: false
unlisted: false
last_update:
  date: 2026-09-28
---

## Summary
Triggers the [Automation - Install Certificate - Windows](/docs/3f49f6d9-758b-49d6-b425-7e816270aab2) on Windows Servers where certification installation is enabled for windows Servers using [Custom Field - cPVAL Enable Certificate Deployment](/docs/d4f25ab4-f6e9-4f70-a4b5-a7fa61c2e69e).

## Details

- **Name:** `Install Certificate - Servers`
- **Description:** `Triggers the 'Install Certificate - Windows' automation on Windows Servers where certification installation is enabled for windows Servers from 'cPVAL Enable Certificate Deployment' custom field.`  
- **Recommended Agent Policy:** `Windows Servers [Default]`

## Dependencies

- [Automation - Install Certificate - Windows](/docs/3f49f6d9-758b-49d6-b425-7e816270aab2)
- [Custom Field - cPVAL Enable Certificate Deployment](/docs/d4f25ab4-f6e9-4f70-a4b5-a7fa61c2e69e)
- [Solution - Install Certificates - Windows/Mac](/docs/12034de3-aa3a-4f6c-89da-a6f229e6fbec)

## Compound Condition Creation 

- [Compound Condition Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/compound-conditions/install-certificate-servers.toml)

## Changelog

### 2026-09-28

- Initial version of the document