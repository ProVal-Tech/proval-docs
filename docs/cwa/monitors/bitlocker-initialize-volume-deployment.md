---
id: '925adfc5-e119-4c56-937a-a31c3e171371'
slug: /925adfc5-e119-4c56-937a-a31c3e171371
title: 'Bitlocker - Initialize Volume Deployment'
title_meta: 'Bitlocker - Initialize Volume Deployment'
keywords: ['bitlocker', 'encryption', 'monitor', 'windows', 'workstation']
description: 'This document outlines an internal monitor designed to detect unsupported Windows workstation operating systems that have not been updated regarding BitLocker encryption status. It checks for specific conditions related to the key protector ID, protection status, and configuration settings, ensuring compliance and proper execution of the associated BitLocker initialization script.'
tags: ['encryption', 'security', 'windows']
draft: false
unlisted: false
---

## Summary

This internal monitor detects online supported Windows workstation operating systems (Windows 10/11) that have not been updated in the `plugin_proval_bitlocker_audit` table in the last 7 days and do not have the key protector ID and protection status set. It also checks if the location-EDF 'BitLocker Encryption Automation - Enable [Wks]' is set to either "AllDrive" or "SystemDrive" from the dropdown option, and that the computer-EDF 'BitLocker Enable Exclude' is not checked. 

The monitor ensures that the [Script - Bitlocker - Volume - Initialize [Autofix,Param] - Wrapper](/docs/85513764-8240-40fb-be86-7be910ea62cf) is run once every 7 days on the detected agents to avoid multiple reiteration attempts. It excludes agents where the script has failed to initialize the BitLocker setup 2 times, which is recorded in the script state as 'Bitlocker_Enable_Fail_Count'.

## Dependencies

- [Script - Bitlocker - Volume - Initialize [Autofix,Param] - Wrapper](/docs/85513764-8240-40fb-be86-7be910ea62cf)  
- △ Custom - Execute Script - Bitlocker - Volume - Initialize [Autofix] - Wrapper  

## Target

Global


