---
id: 'c813811b-23ea-44d2-9a01-d5e5a8226b05'
slug: /c813811b-23ea-44d2-9a01-d5e5a8226b05
title: 'Disable Defender Failure Detection'
title_meta: 'Disable Defender Failure Detection'
keywords: ['security','antivirus','defender','other av']
description: 'This compound condition will detect the workstations where the disable defender has failed.'
tags: ['security','antivirus']
draft: false
unlisted: false
last_update:
  date: 2026-06-17
---

## Summary

This compound condition will run the script [Disable Defender Vs Supported AV](/docs/54c6d331-9974-4267-bfb4-13d1f16e8d9c) and creates a ticket if it fails to disable Defender.

## Details

- **Name:** `Disable Defender Failure Detection` 
- **Description:** `This compound condition will run the script "Disable Defender Vs Supported AV" and creates a ticket if it fails to disable Defender.`
- **Recommended Agent Policies:** `Windows Workstation Policy`

## Dependencies

- [Solution - Disable Defender](/docs/496a399f-7746-4cc6-9c31-476193d5ee9e)

## Compound Condition Creation 

- [Compound Condition Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/compound-conditions/disable-defender-workstation.toml)


## Changelog

### 2026-06-17

- Initial version of the document
