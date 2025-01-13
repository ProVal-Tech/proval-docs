---
id: 'cwa-webroot-keycode-verification'
title: 'Webroot Keycode Verification Script'
title_meta: 'Webroot Keycode Verification Script'
keywords: ['webroot', 'keycode', 'verification', 'audit', 'monitor']
description: 'This document provides an overview of the Webroot Keycode Verification Script, which collects the hashed keycode from a machine and compares it with the keycode set up in the Webroot plugin. It details how to review results in Dataview and create tickets for keycode mismatches.'
tags: ['webroot', 'audit', 'script', 'monitor', 'edf']
draft: false
unlisted: false
---
## Summary

This script collects the Webroot hashed keycode from the machine and further matches it with the keycode setup in the Webroot plugin and the keycode present on the machine. We can either review the results in the [Dataview - Webroot KeyCode Audit [Script]](https://proval.itglue.com/DOC-5078775-8105261), or this also creates a ticket for a keycode mismatch with the [Monitor - Execute Script - Webroot Keycode Verification](https://proval.itglue.com/DOC-5078775-14989291), when the monitor has a ticket category set.

## Sample Run

![Sample Run](../../../static/img/Webroot-Keycode-Verification/image_1.png)

## Dependencies

Webroot SecureAnyWhere with Utility Plugin  
![Dependencies](../../../static/img/Webroot-Keycode-Verification/image_2.png)

## EDFs

| **Name**                     | **Level** | **Required** | **Description**                                      |
|------------------------------|-----------|--------------|------------------------------------------------------|
| Webroot Encrypted KeyCode    | Computer  | True         | Stores keycode grabbed from computer                  |
| Webroot KeyCode Status       | Computer  | True         | Stored keycode's status either `KeyCode Matched` or `KeyCode Not Matched` |

## Output

- Script log
- EDF
- Dataview



