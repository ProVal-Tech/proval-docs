---
id: 'cd0e2e09-299b-40df-a619-6babf4cd2436'
slug: /cd0e2e09-299b-40df-a619-6babf4cd2436
title: 'Disable Defender - Server'
title_meta: 'Disable Defender - Server'
keywords: ['security','antivirus','defender','other av']
description: 'This compound condition will detect the servers where the disable defender has failed.'
tags: ['security','antivirus']
draft: false
unlisted: false
last_update:
  date: 2026-06-17
---

## Summary

This compound condition will run the script [Disable Defender Vs Supported AV](/docs/54c6d331-9974-4267-bfb4-13d1f16e8d9c) and creates a ticket if it fails to disable Defender.

## Details

- **Name:** `Disable Defender`
- **Description:** `This compound condition will run the script "Disable Defender Vs Supported AV" and creates a ticket if it fails to disable Defender.`
- **Recommended Agent Policies:** `Windows Server Policy`

## Dependencies

- [Solution - Disable Defender](/docs/496a399f-7746-4cc6-9c31-476193d5ee9e)

## Compound Condition Creation 

- [Compound Condition Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/compound-conditions/disable-defender-server.toml)


## Changelog

### 2026-06-17

- Initial version of the document
