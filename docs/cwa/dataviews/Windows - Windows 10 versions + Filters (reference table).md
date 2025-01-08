---
id: 'cwa-windows-10-build-info'
title: 'Windows 10 Build Information and Patch Policies'
title_meta: 'Windows 10 Build Information and Patch Policies'
keywords: ['windows', 'patch', 'policy', 'build', 'support', 'rmm']
description: 'This document provides a comprehensive overview of Windows 10 build information and patch policies, detailing the dependencies, columns, and key metrics related to the management and support of Windows 10 systems within an RMM environment.'
tags: ['windows', 'patch', 'policy', 'support', 'rmm']
draft: false
unlisted: false
---
## Summary

This dataview contains information about Windows 10 build information and patch policies.

## Dependencies

[SEC - Windows Patching - Custom Table - plugin_proval_windows_os_support](https://proval.itglue.com/DOC-5078775-8194868) (table)

## Columns

| Column                    | Description                                          |
|---------------------------|------------------------------------------------------|
| Client                    | Client Name                                         |
| Location                  | Location Name                                       |
| Computer                  | Computer Name                                       |
| ReleaseId                 | Computer windows 10 build info                      |
| Last Contact              | Last contact with RMM                               |
| Online Last 30 Days       | Whether online from last 30 days or not            |
| Has Patch Policy          | Patch policy applied via CW Automate or not         |
| LastPatched               | When agent was last patched via CW Automate         |
| Operating System          | Operating System                                    |
| Last Logged In User       | Last Logged In User                                 |
| Days Since Last Patched   | Days Since Last Contact With RMM                    |
| Supported Till            | Support End Date                                    |
| Is EOL                   | 'Yes' or 'No', depending on the support end date   |


