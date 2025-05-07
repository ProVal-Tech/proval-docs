---
id: 'c9b50925-af78-47f8-b637-434d2c185f40'
slug: /c9b50925-af78-47f8-b637-434d2c185f40
title: 'Microsoft Support Diagnostic Tool Registry Key AuditScriptRole'
title_meta: 'Microsoft Support Diagnostic Tool Registry Key AuditScriptRole'
keywords: ['workaround', 'microsoft', 'vulnerability', 'msdt', 'script', 'monitor']
description: 'This document provides a comprehensive overview of the workaround for the Microsoft Support Diagnostic Tool (MSDT) vulnerability, detailing its dependencies, tracking progress, and the status of associated registry keys.'
tags: ['registry', 'security', 'vulnerability', 'windows']
draft: false
unlisted: false
---

## Summary

This dataview tracks the progress of the [Workaround - Microsoft Support Diagnostic Tool Vulnerability [Param][Autofix][DV]](/docs/af9266ed-a796-49b5-b497-944836e23b8c) script and the [ProVal - Development - Workaround - Microsoft Support Diagnostic Tool Vulnerability [G]](/docs/74e11590-49e4-445b-a380-18d2914f9f3f) monitor set.

## Dependencies

- [MS-MSDT Registry Key](/docs/174939f4-d7d5-4c92-9813-308db2c2b0c3)
- [ProVal - Development - Workaround - Microsoft Support Diagnostic Tool Vulnerability [G]](/docs/74e11590-49e4-445b-a380-18d2914f9f3f)
- [Workaround - Microsoft Support Diagnostic Tool Vulnerability [Param][Autofix][DV]](/docs/af9266ed-a796-49b5-b497-944836e23b8c)
- [CVE-2022-30190 MSDT - Workarounds](/docs/7736f421-bfd6-41c0-ba75-5eba3bc82f78)

## Columns

| Column                        | Description                                                                                                                                                                                                                                          |
|-------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| computerid                   | Computer ID                                                                                                                                                                                                                                         |
| Client Name                  | Client Name                                                                                                                                                                                                                                          |
| Location Name                | Location Name                                                                                                                                                                                                                                        |
| Computer Name                | Computer Name                                                                                                                                                                                                                                        |
| Operating System             | Operating System                                                                                                                                                                                                                                     |
| lastcontact                  | Last contact time                                                                                                                                                                                                                                    |
| MS-MSDT Registry Status      | Value of the script state, indicating the MS-MSDT Registry Status.                                                                                                                                                                                |
| MS-MSDT Registry Key Role    | Indicates whether the role is active, inactive, or if it's never detected. Active: The registry key is currently present on the computer. Inactive: The registry key was once present on the computer, but the script has removed it. Not Detected: Either the registry key was never present on the computer or the computer is not accepting the role. |

