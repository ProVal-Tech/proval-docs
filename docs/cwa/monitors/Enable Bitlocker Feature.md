---
id: 'cwa-enable-bitlocker-feature'
title: 'Enable Bitlocker Feature on Windows Server'
title_meta: 'Enable Bitlocker Feature on Windows Server'
keywords: ['bitlocker', 'encryption', 'windows', 'server', 'monitor']
description: 'This document outlines the process to enable various BitLocker features on Windows servers, including the necessary utilities and tools for drive encryption. It provides detailed instructions for setting up a monitor to ensure these features are installed and functioning correctly.'
tags: ['encryption', 'monitoring', 'windows', 'server', 'setup']
draft: false
unlisted: false
---
## Summary

This Monitor enables the below Bitlocker feature on the Windows server if it's not already installed.

- BitLocker Drive Encryption Administration Utilities
- BitLocker Recovery Password Viewer
- BitLocker Drive Encryption Tools

## Details

**Suggested "Limit to"**: Windows Servers  
**Suggested Alert Style**: Once  
**Suggested Alert Template**: Default Do Nothing  

Insert the details of the monitor in the below table.

| Check Action | Server Address | Check Type | Check Value | Comparator | Interval | Result |
|--------------|----------------|------------|-------------|------------|----------|--------|
| System       | 127.0.0.1     | Run File   | REDACTED    | State Based | 21600    | ![Result Image](5078775/docs/14612201/images/21132305) |

## Target

Windows Servers

## How to Import

[Import - Remote Monitor - Enable Bitlocker Feature](https://proval.itglue.com/DOC-5078775-14612313)


