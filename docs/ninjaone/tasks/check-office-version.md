---
id: '792aa256-6311-4240-88cd-3d8a7aa81e59'
slug: /792aa256-6311-4240-88cd-3d8a7aa81e59
title: 'Check Office Version'
title_meta: 'Check Office Version'
keywords: ['microsoft','365','Version','Office']
description: 'This is used to check the office version and update the Custom Field.'
tags:  ['office365', 'software', 'update']
draft: false
unlisted: false
last_update:
  date: 2026-05-27
---

## Summary

This task runs the script [Get Office Version](/docs/9224179e-e14d-4fe2-95a3-a2304e31e108) to check Office version details and updates the custom fields.

## Dependencies

- [Solution - Get Office Version](/docs/19ca26a2-c4f1-4ce1-99a2-b8d37dccfa04) 
- [Get Office Version](/docs/9224179e-e14d-4fe2-95a3-a2304e31e108)
- [cPVAL Office Version](/docs/4216d707-95cc-414c-8fa5-73fa9606fa97)
- [cPVAL Office Bitness](/docs/90a2e646-9424-4c8c-b408-e89ccc62c47e)
- [cPVAL Office Edition](/docs/4fad4211-7766-4d7a-af20-8d00123d2fa1) 
- [cPVAL Office Install Type](/docs/03640b47-4b59-4f8e-b8cf-dc20841345ba)  
- [cPVAL M365 Apps Installed](/docs/20fb97b5-2032-4f47-ad06-584799c6f192)


## Details

| Name       | Description | Allow Groups | Repeats | Recur every | Start At | Ends | Targets | Automations |
| ---------- | ----------- | ------------ | ------- | ----------- | -------- | ---- | ------- | ----------- |
| Check Office Version | This task runs the script "Get Office Version" to check Office version details and updates the custom fields. | `Yes` | `Weekly` | `Every 1 Week` | `05/26/2026` | `never` | [cPVAL Windows Workstations](/docs/6c0a75ba-68b7-47a5-acb8-17ef303f9422), [cPVAL Windows Servers](/docs/c73e004e-6a9c-40e4-8e74-babb4b729256) | Get Office Version |

## Task Creation

[Task Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/tasks/check-office-version.toml)

## Changelog

### 2026-05-27

- Initial Version of document.
