---
id: '2609502c-8a9d-4e8d-98cb-e1b6f7fb2fdb'
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

It works based on the data gathered by the [SEC - Encryption - Script - Bitlocker - Audit](<../scripts/Bitlocker - Audit.md>) script. Therefore, the [SEC - Encryption - Script - Bitlocker - Audit](<../scripts/Bitlocker - Audit.md>) script should be running regularly in the partner’s environment.

The script can be scheduled from a group, or it can be scheduled from the [CWM - Automate - Internal Monitor - ProVal - Production - Security - Stale Bitlocker Data](<./Security - Stale Bitlocker Data.md>) monitor set.

## Dependencies

- [SEC - Encryption - Script - Bitlocker - Audit](<../scripts/Bitlocker - Audit.md>)
- [SEC - Encryption - Script - Bitlocker - Volume - Add Recovery Password [Autofix]](<../scripts/Bitlocker - Volume - Add Recovery Password Autofix.md>)

## Target

Global

## Alert Template

**Name:** `△ Custom - Execute Script - Bitlocker - Volume - Add Recovery Password`

The script [SEC - Encryption - Script - Bitlocker - Volume - Add Recovery Password [Autofix]](<../scripts/Bitlocker - Volume - Add Recovery Password Autofix.md>) should be imported before creating or importing the alert template, as the alert template should run this.



