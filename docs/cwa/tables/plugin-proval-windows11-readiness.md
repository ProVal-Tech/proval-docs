---
id: '74cca89e-effd-4af7-a73a-53a30b91c8a7'
slug: /74cca89e-effd-4af7-a73a-53a30b91c8a7
title: 'plugin_proval_windows11_readiness'
title_meta: 'plugin_proval_windows11_readiness'
keywords: ['windows', 'upgrade', 'compatibility', 'secureboot', 'memory', 'cpu', 'osdisk', 'tpm']
description: 'This document outlines the purpose and structure of a custom table that stores data gathered by the Windows 11 Compatibility Check script. It details the dependencies and the specific columns used to assess whether a machine is eligible for an upgrade to Windows 11.'
tags: ['database', 'performance', 'report', 'windows']
draft: false
unlisted: false
---

## Purpose

The custom table stores the data gathered by the [Windows - Check Windows 11 Compatibility](/docs/318a9cfd-251b-4b47-8d18-aabc3af6b41c) script.

## Dependencies

[SEC - Windows Patching - Script - Windows - Check Windows 11 Compatibility](/docs/318a9cfd-251b-4b47-8d18-aabc3af6b41c)

## Tables

#### plugin_proval_windows11_readiness

| Column      | Type     | Explanation                                                                                     |
|-------------|----------|-------------------------------------------------------------------------------------------------|
| Computerid  | INT      | Stores the Computer ID.                                                                         |
| Capable     | TINYINT  | Indicates whether the machine is upgradable to Windows 11 or not. 0 = capable, 1 = not capable. |
| Secureboot  | TINYINT  | Indicates whether Secure Boot is enabled. 0 = disabled, 1 = enabled.                          |
| Memory      | TINYINT  | Indicates whether the physical memory meets the upgrade criteria. 0 = failed, 1 = pass.       |
| CPU         | TINYINT  | Indicates whether the processor is supported for the Windows 11 upgrade. 0 = failed, 1 = pass.|
| OSDisk      | TINYINT  | Indicates whether the OS drive size is compatible with the Windows 11 upgrade. 0 = failed, 1 = pass. |
| TPM         | TINYINT  | Indicates whether the TPM version is compatible with the Windows 11 upgrade. 0 = failed, 1 = pass. |
| LastRan     | DATETIME | Timestamp for the collected data.                                                               |


