---
id: 'afae9276-7fce-4ed7-af87-c87589653234'
slug: /afae9276-7fce-4ed7-af87-c87589653234
title: 'SMB Share Permission Audit - Server'
title_meta: 'SMB Share Permission Audit - Server'
keywords: ['SMB', 'Share', 'Permissions', 'Audit']
description: 'Triggers the SMB Permission Audit automation to Collects SMB share permissions and stores the details as an HTML table in the cPVAL SMB Share Details WYSIWYG custom field.'
tags: ['auditing', 'custom-fields', 'report', 'knowledge-base', 'smb']
draft: false
unlisted: false
last_update:
  date: 2026-10-21
---

## Summary

Triggers the SMB Permission Audit automation to Collects SMB share permissions and stores the details as an HTML table in the cPVAL SMB Share Details WYSIWYG custom field.

## Details

- **Name:** `SMB Share Permission Audit - Servers`
- **Description:** `Triggers the SMB Permission Audit automation to Collects SMB share permissions and stores the details as an HTML table in the cPVAL SMB Share Details WYSIWYG custom field.`
- **Recommended Agent Policies:** `Windows Server Policy`

## Dependencies

* [Custom Field: cPVAL SMB Folder Audit](/docs/c0a7d30e-785c-4b9a-9f71-f9386e026c29)
* [Audit Report: SMB Share Permission Audit ](/docs/bc81efc9-c4f1-4943-8139-a6a2682fc7e4)
* [Solution: SMB Share Permission Audit - NinjaOne](/docs/a1a0fea8-a255-45e3-98c6-1bbe094f5693)

## Compound Condition Creation 

- [Compound Condition Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/compound-conditions/smb-share-permission-audit-servers.toml)

## Changelog

### 2026-10-21

- Initial version of the document
