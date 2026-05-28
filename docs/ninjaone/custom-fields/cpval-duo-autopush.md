---
id: '3ce9e690-2bf1-4e78-9e66-04960f3f1b25'
slug: /3ce9e690-2bf1-4e78-9e66-04960f3f1b25
title: 'cPVAL DUO AUTOPUSH'
title_meta: 'cPVAL DUO AUTOPUSH'
keywords: ['duo', 'mfa', 'security', 'auto-deploy']
description: 'If enabled, this option will automatically send a push request to the user''s device when they attempt to log in. The default value is blank, which requires the user to manually request the push.'
tags: ['security', 'software']
draft: false
unlisted: false
last_update:
  date: 2026-05-28
---

## Summary

If enabled, this option will automatically send a push request to the user's device when they attempt to log in. The default value is blank, which requires the user to manually request the push.

## Details

| Label | Field Name | Definition Scope | Type | Option Value | Default Value | Required  | Technician Permission | Automation Permission | API Permission | Description | Tool Tip | Footer Text | Custom Field Tab Name |
| ----- | ---------- | ---------------- | ---- | ------------ | ------------- | --------- | --------------------- | --------------------- | -------------- | ----------- | -------- | ----------- | ----- | 
| cPVAL DUO AUTOPUSH | cpvalDuoAutopush | Organization | drop-down | `All`, `Windows`, `Windows Workstations`, `Windows Servers`, `Macintosh`, `Disabled` | `Disabled` | False | Editable | Read/Write | Read/Write | If enabled, this option will automatically send a push request to the user's device when they attempt to log in. The default value is blank, which requires the user to manually request the push. | Select the platform to enable DUO AutoPush | DUO AUTOPUSH | DUO | 

## Dependencies

- [Solution - Duo Deployment](/docs/a11cd829-a491-4cb1-a7c1-3f56fa8c7557)

## Custom Field Creation

- [Custom Field Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/custom-fields/cpval-duo-autopush.toml)

## Sample Screenshot

## Example

![Image5](../../../static/img/docs/3ce9e690-2bf1-4e78-9e66-04960f3f1b25/image5.webp)

## Changelog

### 2026-05-28

* Updated the documentation to align with the new documentation format and standards.

### 2025-04-14

- Initial version of the document
