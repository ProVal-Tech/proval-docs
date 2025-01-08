---
id: 'cwa-windows-10-patching-summary'
title: 'Windows 10 Patching Summary'
title_meta: 'Windows 10 Patching Summary'
keywords: ['windows', 'patching', 'compliance', 'support', 'computers', 'clients', 'plugins']
description: 'A thorough examination of Windows 10 computers and their patching status for each client, including details on supported and unsupported systems, patch compliance, and the status of approved, denied, ignored, installed, missing, and failed patches.'
tags: ['windows', 'patching', 'compliance', 'support', 'clients', 'software']
draft: false
unlisted: false
---
## Summary

A thorough examination of Windows 10 computers and their patching for each client.

## Requirements

1. [SEC - Windows Patching - Custom Table - plugin_proval_windows_os_support](https://proval.itglue.com/DOC-5078775-7780690) must be present in order to make this dataview to work.

## Columns

| Column                             | Description                                                                                      |
|------------------------------------|--------------------------------------------------------------------------------------------------|
| Client Name                        | Name of the Client                                                                               |
| #Windows 10 Computers              | Total number of the Windows 10 Computers.                                                       |
| #Windows 10 in Patching            | Total number of the Windows 10 Computers with a patch policy applied.                          |
| #Supported Windows 10              | Total number of the Supported Windows 10 computers. It is calculated on the basis of the SupportMainstreamEnd, SupportEnterpriseEnd and SupportLTSBEnd columns of the `plugin_proval_windows_os_support` table. |
| #Unsupported Windows 10            | Total number of the Unsupported Windows 10 computers.                                           |
| Supported Windows 10 Compliance     | Patch Compliance for the Supported Windows 10 computers.                                        |
| UnSupported Windows 10 Compliance   | Patch Compliance for the UnSupported Windows 10 computers.                                      |
| #Approved Patches Windows 10       | Total Number of the approved patches for Windows 10 computers.                                  |
| #Denied Patches Windows 10         | Total Number of the denied patches for Windows 10 computers.                                    |
| #Ignored Patches Windows 10        | Total Number of the ignored patches for Windows 10 computers.                                   |
| #Installed Patches Windows 10      | Total Number of the installed patches for Windows 10 computers.                                 |
| #Missing patches Windows 10        | Total Number of the missing patches for Windows 10 computers.                                   |
| #Failed patches Windows 10         | Total Number of the Failed patches for Windows 10 computers.                                    |
| Windows 10 Patch Compliance         | Avg patch compliance for all the Windows 10 computers.                                         |


