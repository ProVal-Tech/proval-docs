---
id: 'cwa-windows-11-compatibility-check'
title: 'Windows 11 Compatibility Check'
title_meta: 'Windows 11 Compatibility Check'
keywords: ['windows', 'upgrade', 'compatibility', 'secureboot', 'memory', 'cpu', 'osdisk', 'tpm']
description: 'This document outlines the purpose and structure of a custom table that stores data gathered by the Windows 11 Compatibility Check script. It details the dependencies and the specific columns used to assess whether a machine is eligible for an upgrade to Windows 11.'
tags: ['windows', 'database', 'configuration', 'report', 'performance']
draft: false
unlisted: false
---
## Purpose

The custom table stores the data gathered by the [Windows - Check Windows 11 Compatibility](https://proval.itglue.com/DOC-5078775-8355447) script.

## Dependencies

[SEC - Windows Patching - Script - Windows - Check Windows 11 Compatibility](https://proval.itglue.com/DOC-5078775-8355447)

## Tables

#### plugin_proval_windows11_readiness

| Column      | Type     | Explanation                                                                                     |
|-------------|----------|-------------------------------------------------------------------------------------------------|
| Computerid  | INT      | To Store the Computerid.                                                                        |
| Capable     | TINYINT  | To depict whether the machine is up-gradable to windows 11 or not. 0 = capable and 1 = not capable. |
| Secureboot  | TINYINT  | Secureboot is enabled or not. 0 = disabled and 1 = enabled.                                   |
| Memory      | TINYINT  | Physical Memory is meeting the upgrade criteria or not. 0 = failed and 1 = pass.              |
| CPU         | TINYINT  | Processor is supported for the Windows 11 upgrade or not. 0 = failed and 1 = pass.           |
| OSDisk      | TINYINT  | Drive Size of OS drive is compatible with the windows 11 upgrade or not. 0 = failed and 1 = pass. |
| TPM         | TINYINT  | TPM version is compatible with the windows 11 upgrade or not. 0 = failed and 1 = pass.      |
| LastRan     | DATETIME | Timestamp for the collected data.                                                               |



