---
id: 'b3cbbe5c-f1a6-4f9f-99b7-9b0dbbca574e'
slug: /b3cbbe5c-f1a6-4f9f-99b7-9b0dbbca574e
title: 'cPVAL DUO FAILOPEN'
title_meta: 'cPVAL DUO FAILOPEN'
keywords: ['duo', 'mfa', 'security', 'auto-deploy']
description: 'This determines the behavior when Duo''s service cannot be reached. If enabled, the system will allow the user to log in (fail open). If disabled, the system will deny access (fail closed). The default is to fail closed.'
tags: ['security', 'software']
draft: false
unlisted: false
last_update:
  date: 2026-05-28
---

## Summary

This determines the behavior when Duo's service cannot be reached. If enabled, the system will allow the user to log in (fail open). If disabled, the system will deny access (fail closed). The default is to fail closed.

## Details

| Label | Field Name | Definition Scope | Type | Option Value | Default Value | Required  | Technician Permission | Automation Permission | API Permission | Description | Tool Tip | Footer Text |  Custom Field Tab Name | 
| ----- | ---------- | ---------------- | ---- | ------------ | ------------- | --------- | --------------------- | --------------------- | -------------- | ----------- | -------- | ----------- | -------- |
| cPVAL DUO FAILOPEN | cpvalDuoFailopen | Organization | drop-down | `All`, `Windows`, `Windows Workstations`, `Windows Servers`, `Macintosh`, `Disabled` | `Disabled` | False | Editable | Read/Write | Read/Write | This determines the behavior when Duo's service cannot be reached. If enabled, the system will allow the user to log in (fail open). If disabled, the system will deny access (fail closed). The default is to fail closed. | Select the platform to enable DUO FailOpen | DUO FAILOPEN | DUO |


## Dependencies

- [Solution - Duo Deployment](/docs/a11cd829-a491-4cb1-a7c1-3f56fa8c7557)

## Custom Field Creation

- [Custom Field Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/custom-fields/cpval-duo-failopen.toml)

## Sample Screenshot

![Image5](../../../static/img/docs/b3cbbe5c-f1a6-4f9f-99b7-9b0dbbca574e/image4.webp)

## Changelog

### 2026-05-28

* Updated the documentation to align with the new documentation format and standards.

### 2025-04-14

- Initial version of the document
