---
id: 'cwa-monitor-bitlocker-key-protectors'
title: 'Monitor for Bitlocker Key Protectors'
title_meta: 'Monitor for Bitlocker Key Protectors'
keywords: ['bitlocker', 'encryption', 'monitor', 'key', 'protectors']
description: 'This document outlines a monitor set that detects computers where Bitlocker is enabled and the drive is fully encrypted but lacks any key protectors. It utilizes data from the Bitlocker Audit script and provides guidance on scheduling and dependencies for effective monitoring.'
tags: ['encryption', 'monitoring', 'security', 'script', 'audit']
draft: false
unlisted: false
---
## Summary

The monitor set detects the computer where Bitlocker is enabled, and the drive is fully encrypted but does not have any key protectors.

It works based on the data gathered by the [SEC - Encryption - Script - Bitlocker - Audit](https://proval.itglue.com/DOC-5078775-8943478) script. So the [SEC - Encryption - Script - Bitlocker - Audit](https://proval.itglue.com/DOC-5078775-8943478) script should be running regularly in the partner’s environment.

Either the script can be scheduled from a group or it can be scheduled from the [CWM - Automate - Internal Monitor - ProVal - Production - Security - Stale Bitlocker Data](https://proval.itglue.com/DOC-5078775-12589046) monitor set.

## Dependencies

- [SEC - Encryption - Script - Bitlocker - Audit](https://proval.itglue.com/DOC-5078775-8943478)
- [SEC - Encryption - Script - Bitlocker - Volume - Add Recovery Password [Autofix]](https://proval.itglue.com/DOC-5078775-13808694)

## Target

Global

## Alert Template

**Name:** `△ Custom - Execute Script - Bitlocker - Volume - Add Recovery Password`

The script [SEC - Encryption - Script - Bitlocker - Volume - Add Recovery Password [Autofix]](https://proval.itglue.com/DOC-5078775-13808694) should be imported before creating/importing the alert template as the alert template should run this.


