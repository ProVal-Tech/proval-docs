---
id: '5ed671db-6295-42ed-9f44-cd0b4203c4e4'
slug: /5ed671db-6295-42ed-9f44-cd0b4203c4e4
title: 'Webroot KeyCode AuditScript'
title_meta: 'Webroot KeyCode AuditScript'
keywords: ['webroot', 'keycode', 'verification', 'dataview', 'status']
description: 'This document provides a dataview that displays the Webroot hashed keycode present on a machine, its status, and whether it matches the keycode setup under the Webroot plugin or with the EDF "Webroot site Keycode". It includes dependencies and a detailed description of the columns available in the dataview.'
tags: ['webroot']
draft: false
unlisted: false
---

## Summary

This dataview shows the Webroot hashed keycode present on the machine, the status of the keycode, and whether it matches the keycode setup under the Webroot plugin or with the EDF "Webroot site Keycode".

## Dependencies

- [EPM - Data Collection - Script - Webroot Keycode Verification](<../scripts/Webroot Keycode Verification.md>)
- [EPM - Data Collection - Script - Webroot Keycode Verification [EDF]](<../scripts/Webroot Keycode Verification EDF.md>)

## Columns

| Column               | Description                                                            |
|---------------------|------------------------------------------------------------------------|
| Computer Name       | Displays the computer name.                                           |
| Client Name         | Displays the client name.                                             |
| Location Name       | Displays the location name.                                           |
| OS                  | Displays the operating system.                                        |
| Encrypted Keycode   | Displays the currently present Webroot encrypted keycode.             |
| KeyCode Status      | Displays the keycode status, indicating whether it matches the keycode setup under the Webroot plugin. |



