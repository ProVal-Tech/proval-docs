---
id: 'b6bf288a-a1f5-4d76-9973-1ecfca5521a5'
slug: /b6bf288a-a1f5-4d76-9973-1ecfca5521a5
title: 'Security - Stale Bitlocker Data'
title_meta: 'Security - Stale Bitlocker Data'
keywords: ['bitlocker', 'audit', 'monitor', 'encryption', 'script']
description: 'This document outlines a method to detect Windows computers where the BitLocker audit script has not executed in the past month and initiates its execution. It also details the necessary roles for Windows servers to support BitLocker and provides links to related SQL scripts for role import in Automate.'
tags: ['encryption', 'security', 'windows']
draft: false
unlisted: false
---

## Summary

This document detects Windows computers where the [SEC - Encryption - Script - Bitlocker - Audit](/docs/d7d933e3-9668-4de9-9f44-7452198ab85a) script has not executed at least once in the past month and initiates its execution.

*Note:* For Windows servers to be eligible for BitLocker, the following roles must be enabled on the server:

- *Windows Server BitLocker*
- *Windows Server BitLocker-Utilities*
- *Windows Server BitLocker-RemoteAdminTool*

*Run the SQL provided in the document below from RAWSQL to import these roles into Automate:*  
[CWM - Automate - Roles - BitLocker](/docs/1650f6a6-2a4b-4c8c-9818-3f91ffe1805f)

## Dependencies

- [SEC - Encryption - Custom Table - plugin_proval_bitlocker_audit](/docs/bb3eaac8-80f6-43b9-90f1-75886c06bf14)  
- [SEC - Encryption - Script - Bitlocker - Audit](/docs/d7d933e3-9668-4de9-9f44-7452198ab85a)  
- [Internal Monitor - ProVal - Production - Security - Stale BitLocker Data](/docs/b6bf288a-a1f5-4d76-9973-1ecfca5521a5)  

## Target

Global  

## Alert Template

**Name**: `△ CUSTOM - Execute Script - Bitlocker - Audit`  

*Available for import within the ProSync Plugin.*

Note: Ensure the presence of the [SEC - Encryption - Custom Table - plugin_proval_bitlocker_audit](/docs/bb3eaac8-80f6-43b9-90f1-75886c06bf14) table and the [SEC - Encryption - Script - Bitlocker - Audit](/docs/d7d933e3-9668-4de9-9f44-7452198ab85a) script in the environment before creating the monitor set and importing the alert template.