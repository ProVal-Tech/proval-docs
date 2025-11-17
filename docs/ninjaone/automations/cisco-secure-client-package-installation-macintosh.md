---
id: '33918565-04a9-436e-84ff-f29cbdd27949'
slug: /33918565-04a9-436e-84ff-f29cbdd27949
title: 'Cisco Secure Client - Package Installation [Macintosh]'
title_meta: 'Cisco Secure Client - Package Installation [Macintosh]'
keywords: ['install', 'cisco', 'secure', 'client', 'vpn']
description: 'Attempts to install the modules selected in "cPVAL Cisco Secure Client Modules" using the installer specified in "cPVAL Cisco Secure Client Mac Source," provided as either a download URL or a local file path. Applicable for Mac systems.'
tags: ['installation', 'networking', 'security', 'software']
draft: false
unlisted: false
---

## Overview

Attempts to install the modules selected in [cPVAL Cisco Secure Client Modules](/docs/e6eb3845-8c47-4791-95d6-a9138e457df9) custom field using the installer specified in [cPVAL Cisco Secure Client Mac Source](/docs/e1fd56d1-def8-41e6-95bf-41c4817a6323) custom field, provided as either a download URL or a local file path. Applicable for Mac systems.

> **Note:** *Mandatory custom fields must be set before running the automation.*

## Custom Fields

| Field Name | Type | Mandatory | Description | Available Options |
| ---------- | ---- | --------- | ----------- | ----------------- |
| [cPVAL Cisco Secure Client Modules](/docs/e6eb3845-8c47-4791-95d6-a9138e457df9) | Multi-select | Yes | Use this field to specify which modules should be installed. Selecting "All" installs every module and overrides individual selections. If Umbrella is selected (or "All" is used), the Umbrella UserID, Fingerprint, and OrgID must also be provided. | <ul><li>All</li><li>Core-VPN</li><li>Umbrella</li><li>Diagnostic And Reporting Tool</li><li>Network Visibility Module</li><li>ISE Posture</li><li>ThousandEyes Endpoint</li><li>Zero Trust Access</li><li>Start Before Login *(Windows Only)*</li><li>Network Access Manager *(Windows Only)*</li><li>VPN Posture *(Windows Only)*</li><li>Duo *(Mac Only)*</li><li>Fireamp *(Mac Only)*</li><li>Secure Firewall Posture *(Mac Only)*</li></ul> |
| [cPVAL Cisco Secure Client Mac Source](/docs/e1fd56d1-def8-41e6-95bf-41c4817a6323) | Text | Yes | Provide the download URL or local file path for the **.dmg** installer used on Mac (e.g., `\tmp\cisco-secure-client.dmg`). Supports HTTP/HTTPS and local paths. | |
| [cPVAL Cisco Secure Client Umbrella UserID](/docs/e2073d81-d1dc-4b70-84db-6713358ddfae) | Text | Conditional (Required when “All” or “Umbrella” selected) | Umbrella UserID for your organization. | |
| [cPVAL Cisco Secure Client Umbrella Fingerprint](/docs/0bbcbadf-6663-4bd4-87d3-b6f83c5ca598) | Text | Conditional (Required when “All” or “Umbrella” selected) | Umbrella Fingerprint for your organization. | |
| [cPVAL Cisco Secure Client Umbrella OrgID](/docs/2ec6d35c-b9fe-4791-9ba8-3783b0e912bd) | Text | Conditional (Required when “All” or “Umbrella” selected) | Umbrella OrgID for your organization. | |

> **Note:** **Umbrella** requires **Core‑VPN**. To install **Umbrella**, ensure both **Core‑VPN** and **Umbrella** are selected in [cPVAL Cisco Secure Client Modules](/docs/e6eb3845-8c47-4791-95d6-a9138e457df9).

## Sample Run

![Image1](../../../static/img/docs/33918565-04a9-436e-84ff-f29cbdd27949/image1.webp)

## Dependencies

- [Bash Script: Install-Cisco_Secure_Client](https://contentrepo.net/repo/script/install-cisco_secure_client.sh)
- [Custom Field: cPVAL Cisco Secure Client Modules](/docs/e6eb3845-8c47-4791-95d6-a9138e457df9)
- [Custom Field: cPVAL Cisco Secure Client MAC Source](/docs/e1fd56d1-def8-41e6-95bf-41c4817a6323)
- [Custom Field: cPVAL Cisco Secure Client Umbrella UserID](/docs/e2073d81-d1dc-4b70-84db-6713358ddfae)
- [Custom Field: cPVAL Cisco Secure Client Umbrella Fingerprint](/docs/0bbcbadf-6663-4bd4-87d3-b6f83c5ca598)
- [Custom Field: cPVAL Cisco Secure Client Umbrella OrgID](/docs/2ec6d35c-b9fe-4791-9ba8-3783b0e912bd)
- [Solution: Cisco Secure Client](/docs/b6926fc9-732f-4a5e-a42d-eae36c61c033)

## Automation Setup/Import

[Automation Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/scripts/cisco-secure-client-package-installation-macintosh.ps1)

## Output

- Activity Details  
