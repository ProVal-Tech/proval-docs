---
id: 'b3dea728-9b29-4d6c-81ee-bf88b38602b7'
slug: /b3dea728-9b29-4d6c-81ee-bf88b38602b7
title: 'Clients - Windows 10 Audit'
title_meta: 'Clients - Windows 10 Audit'
keywords: ['windows', 'patching', 'compliance', 'support', 'computers', 'clients', 'plugins']
description: 'A thorough examination of Windows 10 computers and their patching status for each client, including details on supported and unsupported systems, patch compliance, and the status of approved, denied, ignored, installed, missing, and failed patches.'
tags: ['compliance', 'patching', 'software', 'windows']
draft: false
unlisted: false
---

## Summary

A thorough examination of Windows 10 computers and their patching status for each client.

## Requirements

1. [SEC - Windows Patching - Custom Table - plugin_proval_windows_os_support](/docs/938cd822-f6a3-4ee3-add2-62b407e45622) must be present for this dataview to work.

## Columns

| Column                             | Description                                                                                      |
|------------------------------------|--------------------------------------------------------------------------------------------------|
| Client Name                        | Name of the Client                                                                               |
| # Windows 10 Computers             | Total number of Windows 10 Computers.                                                           |
| # Windows 10 in Patching           | Total number of Windows 10 Computers with a patch policy applied.                              |
| # Supported Windows 10             | Total number of Supported Windows 10 computers. This is calculated based on the SupportMainstreamEnd, SupportEnterpriseEnd, and SupportLTSBEnd columns of the `plugin_proval_windows_os_support` table. |
| # Unsupported Windows 10           | Total number of Unsupported Windows 10 computers.                                               |
| Supported Windows 10 Compliance     | Patch Compliance for the Supported Windows 10 computers.                                        |
| Unsupported Windows 10 Compliance   | Patch Compliance for the Unsupported Windows 10 computers.                                      |
| # Approved Patches Windows 10      | Total number of approved patches for Windows 10 computers.                                      |
| # Denied Patches Windows 10        | Total number of denied patches for Windows 10 computers.                                        |
| # Ignored Patches Windows 10       | Total number of ignored patches for Windows 10 computers.                                       |
| # Installed Patches Windows 10     | Total number of installed patches for Windows 10 computers.                                     |
| # Missing Patches Windows 10       | Total number of missing patches for Windows 10 computers.                                       |
| # Failed Patches Windows 10        | Total number of failed patches for Windows 10 computers.                                        |
| Windows 10 Patch Compliance         | Average patch compliance for all Windows 10 computers.                                          |

