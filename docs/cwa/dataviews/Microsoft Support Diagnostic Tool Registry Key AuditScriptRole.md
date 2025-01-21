---
id: 'c9b50925-af78-47f8-b637-434d2c185f40'
title: 'Workaround for Microsoft Support Diagnostic Tool Vulnerability'
title_meta: 'Workaround for Microsoft Support Diagnostic Tool Vulnerability'
keywords: ['workaround', 'microsoft', 'vulnerability', 'msdt', 'script', 'monitor']
description: 'This document provides a comprehensive overview of the workaround for the Microsoft Support Diagnostic Tool (MSDT) vulnerability, detailing its dependencies, tracking progress, and the status of associated registry keys.'
tags: ['registry', 'security', 'vulnerability', 'windows']
draft: false
unlisted: false
---

## Summary

This dataview tracks the progress of the [Workaround - Microsoft Support Diagnostic Tool Vulnerability [Param][Autofix][DV]](<../scripts/Workaround - Microsoft Support Diagnostic Tool Vulnerability.md>) script and the [ProVal - Development - Workaround - Microsoft Support Diagnostic Tool Vulnerability [G]](<../monitors/Microsoft Support Diagnostic Tool Vulnerability G.md>) monitor set.

## Dependencies

- [MS-MSDT Registry Key](<../roles/MS-MSDT Registry Key.md>)
- [ProVal - Development - Workaround - Microsoft Support Diagnostic Tool Vulnerability [G]](<../monitors/Microsoft Support Diagnostic Tool Vulnerability G.md>)
- [Workaround - Microsoft Support Diagnostic Tool Vulnerability [Param][Autofix][DV]](<../scripts/Workaround - Microsoft Support Diagnostic Tool Vulnerability.md>)
- [CVE-2022-30190 MSDT - Workarounds](<../../solutions/CVE-2022-30190 MSDT Vulnerability - Workarounds.md>)

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
