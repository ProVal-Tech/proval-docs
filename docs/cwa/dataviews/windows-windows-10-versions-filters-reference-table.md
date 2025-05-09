---
id: 'f459645f-0d19-4a73-ad4c-8ddcb3ce4b13'
slug: /f459645f-0d19-4a73-ad4c-8ddcb3ce4b13
title: 'Windows - Windows 10 versions + Filters (reference table)'
title_meta: 'Windows - Windows 10 versions + Filters (reference table)'
keywords: ['windows', 'patch', 'policy', 'build', 'support', 'rmm']
description: 'This document provides a comprehensive overview of Windows 10 build information and patch policies, detailing the dependencies, columns, and key metrics related to the management and support of Windows 10 systems within an RMM environment.'
tags: ['windows']
draft: false
unlisted: false
---

## Summary

This document contains information about Windows 10 build information and patch policies.

## Dependencies

[SEC - Windows Patching - Custom Table - plugin_proval_windows_os_support](/docs/938cd822-f6a3-4ee3-add2-62b407e45622) (table)

## Columns

| Column                    | Description                                          |
|---------------------------|------------------------------------------------------|
| Client                    | Client Name                                         |
| Location                  | Location Name                                       |
| Computer                  | Computer Name                                       |
| ReleaseId                 | Windows 10 build information                        |
| Last Contact              | Last contact with RMM                               |
| Online Last 30 Days       | Whether online in the last 30 days or not          |
| Has Patch Policy          | Patch policy applied via CW Automate or not         |
| Last Patched              | When the agent was last patched via CW Automate     |
| Operating System          | Operating System                                    |
| Last Logged In User       | Last Logged In User                                 |
| Days Since Last Patched   | Days since last contact with RMM                    |
| Supported Till            | Support End Date                                    |
| Is EOL                   | 'Yes' or 'No', depending on the support end date   |