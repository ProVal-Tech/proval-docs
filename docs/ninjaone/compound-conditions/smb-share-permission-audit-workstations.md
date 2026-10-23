---
id: '728b7519-dd3f-4e98-9f24-32b981bc00b3'
slug: /728b7519-dd3f-4e98-9f24-32b981bc00b3
title: 'SMB Share Permission Audit - Workstations'
title_meta: 'SMB Share Permission Audit - Workstations'
keywords: ['SMB', 'Share', 'Permissions', 'Audit']
description: 'Triggers the SMB Permission Audit automation to Collects SMB share permissions and stores the details as an HTML table in the cPVAL SMB Share Details WYSIWYG custom field.'
tags: ['auditing', 'custom-fields', 'report', 'knowledge-base', 'smb']
draft: false
unlisted: false
last_update:
  date: 2026-10-23
---

## Summary

Triggers the SMB Permission Audit automation to Ccollect SMB share permissions and store the details as an HTML table in the [cPVAL SMB Share Details](/docs/751a00ed-8de0-4146-8722-75629788411b) WYSIWYG custom field.

## Details

- **Name:** `SMB Share Permission Audit - Workstations`
- **Description:** `Triggers the SMB Permission Audit automation to Collects SMB share permissions and stores the details as an HTML table in the cPVAL SMB Share Details WYSIWYG custom field.`
- **Recommended Agent Policies:** `Windows Workstation policy`

## Dependencies

* [Custom Field: cPVAL SMB Folder Audit](/docs/c0a7d30e-785c-4b9a-9f71-f9386e026c29)
* [Solution: SMB Share Permission Audit](/docs/a1a0fea8-a255-45e3-98c6-1bbe094f5693)
* [Automation: SMB Share Permissions Audit [Windows]](/docs/1e4a0ce1-e3a0-47b1-8574-4be31b24bc2a)

## Compound Condition Creation 

- [Compound Condition Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/compound-conditions/smb-share-permission-audit-workstations.toml)

## Changelog

### 2026-10-23

- Initial version of the document
