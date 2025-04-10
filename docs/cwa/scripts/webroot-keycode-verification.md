---
id: '4d3b24f2-a55a-4f57-8cad-1345d1e85060'
slug: /4d3b24f2-a55a-4f57-8cad-1345d1e85060
title: 'Webroot Keycode Verification'
title_meta: 'Webroot Keycode Verification'
keywords: ['webroot', 'keycode', 'verification', 'audit', 'monitor']
description: 'This document provides an overview of the Webroot Keycode Verification Script, which collects the hashed keycode from a machine and compares it with the keycode set up in the Webroot plugin. It details how to review results in Dataview and create tickets for keycode mismatches.'
tags: ['webroot']
draft: false
unlisted: false
---

## Summary

This script collects the Webroot hashed keycode from the machine and matches it with the keycode set up in the Webroot plugin. We can either review the results in the [Dataview - Webroot KeyCode Audit [Script]](/docs/5ed671db-6295-42ed-9f44-cd0b4203c4e4), or it can create a ticket for a keycode mismatch with the [Monitor - Execute Script - Webroot Keycode Verification](/docs/70bf86a4-3ddf-46b1-947d-e2dc580209a5) when the monitor has a ticket category set.

## Sample Run

![Sample Run](../../../static/img/Webroot-Keycode-Verification/image_1.png)

## Dependencies

Webroot SecureAnywhere with Utility Plugin  
![Dependencies](../../../static/img/Webroot-Keycode-Verification/image_2.png)

## EDFs

| **Name**                     | **Level** | **Required** | **Description**                                      |
|------------------------------|-----------|--------------|------------------------------------------------------|
| Webroot Encrypted KeyCode    | Computer  | True         | Stores the keycode grabbed from the computer         |
| Webroot KeyCode Status       | Computer  | True         | Stored keycode's status, either `KeyCode Matched` or `KeyCode Not Matched` |

## Output

- Script log
- EDF
- Dataview



