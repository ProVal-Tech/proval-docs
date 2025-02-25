---
id: '1a32292b-df11-46ef-997f-7ad70f59061f'
title: 'Enable Bitlocker Feature'
title_meta: 'Enable Bitlocker Feature'
keywords: ['bitlocker', 'encryption', 'windows', 'server', 'monitor']
description: 'This document outlines the process to enable various BitLocker features on Windows servers, including the necessary utilities and tools for drive encryption. It provides detailed instructions for setting up a monitor to ensure these features are installed and functioning correctly.'
tags: ['encryption', 'setup', 'windows']
draft: false
unlisted: false
---

## Summary

This monitor enables the following BitLocker features on the Windows server if they are not already installed:

- BitLocker Drive Encryption Administration Utilities
- BitLocker Recovery Password Viewer
- BitLocker Drive Encryption Tools

## Details

**Suggested "Limit to"**: Windows Servers  
**Suggested Alert Style**: Once  
**Suggested Alert Template**: Default Do Nothing  

Insert the details of the monitor in the table below.

| Check Action | Server Address | Check Type | Check Value | Comparator   | Interval | Result                                                  |
|--------------|----------------|------------|-------------|--------------|----------|---------------------------------------------------------|
| System       | 127.0.0.1     | Run File   | **REDACTED**    | State Based  | 21600    | ![Result Image](../../../static/img/Enable-Bitlocker-Feature/image_1.png) |

## Target

Windows Servers

## How to Import

[Import - Remote Monitor - Enable BitLocker Feature](<./Import- Enable Bitlocker Feature.md>)