---
id: '3cdcd628-ba11-4cfe-b31e-66128af63856'
slug: /3cdcd628-ba11-4cfe-b31e-66128af63856
title: 'Enable UAC - Workstations'
title_meta: 'Enable UAC - Workstations'
keywords: ['uac', 'setting', 'windows']
description: 'Triggers Enable UAC and Set Level automation on Windows workstations where UAC setting is enabled through the cPVAL Enable UAC Setting Custom Field'
tags: ['windows']
draft: false
unlisted: false
last_update:
  date: 2026-10-08
---

## Summary

Triggers the [Automation - Enable UAC and Set Level](/docs/1e92329a-e461-4299-a762-2fd19bf48e40) on Windows workstations where UAC setting is enabled through the [Custom Field - cPVAL Enable UAC Setting](/docs/43bb3115-51f9-4523-9de9-1f948478f214) 

## Details

- **Name:** `Enable UAC - Workstations`
- **Description:** `Triggers 'Enable UAC and Set Level' automation on Windows workstations where UAC setting is enabled through the 'cPVAL Enable UAC Setting' Custom Field`  
- **Recommended Agent Policy:** `Windows Workstation [Default]`

## Dependencies

- [Custom Field - cPVAL Enable UAC Setting](/docs/43bb3115-51f9-4523-9de9-1f948478f214) 
- [Automation - Enable UAC and Set Level](/docs/1e92329a-e461-4299-a762-2fd19bf48e40)
- [Solution - Enable UAC Settings](/docs/01c2c7d9-7ce9-4e09-981b-b18e55ed2cbf)

## Compound Condition Creation 

- [Compound Condition Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/compound-conditions/enable-uac-workstations.toml)

## Changelog

### 2026-10-08

- Initial version of the document