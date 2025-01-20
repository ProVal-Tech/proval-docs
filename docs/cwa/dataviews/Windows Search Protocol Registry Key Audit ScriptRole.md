---
id: '838ecfa5-0526-4c5d-845a-be4f21898c86'
title: 'Workaround for Windows Search Protocol Vulnerability'
title_meta: 'Workaround for Windows Search Protocol Vulnerability'
keywords: ['workaround', 'vulnerability', 'windows', 'search', 'protocol', 'monitor', 'script', 'tracking']
description: 'This document provides a detailed overview of the dataview that tracks the progress of the Workaround for the Windows Search Protocol Vulnerability script and monitor set. It outlines the necessary dependencies and describes the various columns used in the tracking process.'
tags: ['setup', 'vulnerability', 'windows']
draft: false
unlisted: false
---
## Summary

This dataview tracks the progress of the [Workaround - Windows Search Protocol Vulnerability [Param][Autofix][DV]](<../scripts/Workaround - Microsoft Support Diagnostic Tool Vulnerability.md>) script and [ProVal - Development - Workaround - Windows Search Protocol Vulnerability [G]](<../monitors/Workaround - Windows Search Protocol VulnerabilityG.md>) monitor set.

## Dependencies

- [Search-MS Registry Key](<../roles/MS-MSDT Registry Key.md>)
- [ProVal - Development - Workaround - Windows Search Protocol Vulnerability [G]](<../monitors/Workaround - Windows Search Protocol VulnerabilityG.md>)
- [Workaround - Windows Search Protocol Vulnerability [Param][Autofix][DV]](<../scripts/Workaround - Windows Search Protocol Vulnerability.md>)
- [Windows Search Protocol Vulnerability - Workarounds](<../../solutions/Windows Search Protocol Vulnerability - Workarounds.md>)

## Columns

| Column                        | Description                                                                                           |
|-------------------------------|-------------------------------------------------------------------------------------------------------|
| computerid                    | computerid                                                                                           |
| Client Name                   | Client Name                                                                                          |
| Location Name                 | Location Name                                                                                        |
| Computer Name                 | Computer Name                                                                                        |
| Operating System              | Operating System                                                                                     |
| lastcontact                   | lastcontact                                                                                          |
| Search-MS Registry Status      | Value of the script state, Search-MS Registry Status                                                |
| Search-MS Registry Key Role    | Whether the role is active, inactive, or it's never been detected.  Active: The registry key is currently present on the computer.  Inactive: The registry key was once present on the computer, but the script had removed that.  Not Detected: Either the registry key was not present on the computer from the very beginning or somehow the computer is not accepting the role. |














