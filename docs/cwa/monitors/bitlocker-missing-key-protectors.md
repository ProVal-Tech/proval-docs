---
id: '2609502c-8a9d-4e8d-98cb-e1b6f7fb2fdb'
slug: /2609502c-8a9d-4e8d-98cb-e1b6f7fb2fdb
title: 'Bitlocker - Missing Key Protectors'
title_meta: 'Bitlocker - Missing Key Protectors'
keywords: ['bitlocker', 'encryption', 'monitor', 'key', 'protectors']
description: 'This document outlines a monitor set that detects computers where Bitlocker is enabled and the drive is fully encrypted but lacks any key protectors. It utilizes data from the Bitlocker Audit script and provides guidance on scheduling and dependencies for effective monitoring.'
tags: ['encryption', 'security']
draft: false
unlisted: false
---

## Summary

The monitor set detects computers where Bitlocker is enabled and the drive is fully encrypted but does not have any key protectors.

It works based on the data gathered by the [SEC - Encryption - Script - Bitlocker - Audit](/docs/d7d933e3-9668-4de9-9f44-7452198ab85a) script. Therefore, the [SEC - Encryption - Script - Bitlocker - Audit](/docs/d7d933e3-9668-4de9-9f44-7452198ab85a) script should be running regularly in the partner’s environment.

The script can be scheduled from a group, or it can be scheduled from the [CWM - Automate - Internal Monitor - ProVal - Production - Security - Stale Bitlocker Data](/docs/b6bf288a-a1f5-4d76-9973-1ecfca5521a5) monitor set.

## Dependencies

- [SEC - Encryption - Script - Bitlocker - Audit](/docs/d7d933e3-9668-4de9-9f44-7452198ab85a)
- [SEC - Encryption - Script - Bitlocker - Volume - Add Recovery Password [Autofix]](/docs/c2c817db-9667-4e18-864c-11ef0775282c)

## Target

Global

## Alert Template

**Name:** `△ Custom - Execute Script - Bitlocker - Volume - Add Recovery Password`

The script [SEC - Encryption - Script - Bitlocker - Volume - Add Recovery Password [Autofix]](/docs/c2c817db-9667-4e18-864c-11ef0775282c) should be imported before creating or importing the alert template, as the alert template should run this.