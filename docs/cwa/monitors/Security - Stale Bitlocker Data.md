---
id: 'b6bf288a-a1f5-4d76-9973-1ecfca5521a5'
title: 'Detect BitLocker Script Execution'
title_meta: 'Detect BitLocker Script Execution'
keywords: ['bitlocker', 'audit', 'monitor', 'encryption', 'script']
description: 'This document outlines a method to detect Windows computers where the BitLocker audit script has not executed in the past month and initiates its execution. It also details the necessary roles for Windows servers to support BitLocker and provides links to related SQL scripts for role import in Automate.'
tags: ['encryption', 'security', 'windows']
draft: false
unlisted: false
---

## Summary

This document detects Windows computers where the [SEC - Encryption - Script - Bitlocker - Audit](<../scripts/Bitlocker - Audit.md>) script has not executed at least once in the past month and initiates its execution.

*Note:* For Windows servers to be eligible for BitLocker, the following roles must be enabled on the server:

- *Windows Server BitLocker*
- *Windows Server BitLocker-Utilities*
- *Windows Server BitLocker-RemoteAdminTool*

*Run the SQL provided in the document below from RAWSQL to import these roles into Automate:*  
[CWM - Automate - Roles - BitLocker](https://proval.itglue.com/DOC-5078775-17817010)

## Dependencies

- [SEC - Encryption - Custom Table - plugin_proval_bitlocker_audit](<../tables/plugin_proval_bitlocker_audit.md>)  
- [SEC - Encryption - Script - Bitlocker - Audit](<../scripts/Bitlocker - Audit.md>)  
- [Internal Monitor - ProVal - Production - Security - Stale BitLocker Data](<./Security - Stale Bitlocker Data.md>)  

## Target

Global  

## Alert Template

**Name**: `△ CUSTOM - Execute Script - Bitlocker - Audit`  

*Available for import within the ProSync Plugin.*

Note: Ensure the presence of the [SEC - Encryption - Custom Table - plugin_proval_bitlocker_audit](<../tables/plugin_proval_bitlocker_audit.md>) table and the [SEC - Encryption - Script - Bitlocker - Audit](<../scripts/Bitlocker - Audit.md>) script in the environment before creating the monitor set and importing the alert template.
