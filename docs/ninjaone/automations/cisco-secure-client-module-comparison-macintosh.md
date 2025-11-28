---
id: '4c8a8b02-7357-4cac-8f30-c5b0814a655b'
slug: /4c8a8b02-7357-4cac-8f30-c5b0814a655b
title: 'Cisco Secure Client - Module Comparison [Macintosh]'
title_meta: 'Cisco Secure Client - Module Comparison [Macintosh]'
keywords: ['install', 'cisco', 'secure', 'client', 'vpn']
description: 'Compares the number of installed Cisco Secure Client modules with the number of modules selected in the "cPVAL Cisco Secure Client Modules" custom field. Used as a pre-check in compound conditions to determine if installation is required.'
tags: ['installation', 'networking', 'security', 'software']
draft: false
unlisted: false
---

## Overview

Compares the number of installed `Cisco Secure Client` modules with the number of modules selected in the [cPVAL Cisco Secure Client Modules](/docs/e6eb3845-8c47-4791-95d6-a9138e457df9) custom field. Used as a pre-check in compound conditions to determine if installation is required.

## Custom Fields

| Field Name | Type | Mandatory | Description |
| ---------- | ---- | --------- | ----------- |
| [cPVAL Cisco Secure Client Modules](/docs/e6eb3845-8c47-4791-95d6-a9138e457df9) | Multi-select | Yes |This field specifies which modules should be installed. The script compares the count of modules selected in this field with the count of modules currently installed on the system. If "All" is selected, the script compares against all available MacOS modules |

## Sample Run

![Image1](../../../static/img/docs/4c8a8b02-7357-4cac-8f30-c5b0814a655b/image1.webp)

## Dependencies

- [Custom Field: cPVAL Cisco Secure Client Modules](/docs/e6eb3845-8c47-4791-95d6-a9138e457df9)
- [Solution: Cisco Secure Client](/docs/b6926fc9-732f-4a5e-a42d-eae36c61c033)

## Automation Setup/Import

[Automation Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/scripts/cisco-secure-client-module-comparison-macintosh.ps1)

## Output

- Activity Details  
