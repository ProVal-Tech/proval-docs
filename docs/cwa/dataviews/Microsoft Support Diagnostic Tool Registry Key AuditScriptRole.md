---
id: 'cwa-workaround-microsoft-support-diagnostic-tool-vulnerability'
title: 'Workaround for Microsoft Support Diagnostic Tool Vulnerability'
title_meta: 'Workaround for Microsoft Support Diagnostic Tool Vulnerability'
keywords: ['workaround', 'microsoft', 'vulnerability', 'msdt', 'script', 'monitor']
description: 'This document provides a comprehensive overview of the workaround for the Microsoft Support Diagnostic Tool (MSDT) vulnerability, detailing its dependencies, tracking progress, and the status of associated registry keys.'
tags: ['monitoring', 'security', 'windows', 'registry', 'vulnerability', 'development']
draft: false
unlisted: false
---
## Summary

This dataview tracks the progress of the [Workaround - Microsoft Support Diagnostic Tool Vulnerability [Param][Autofix][DV]](https://proval.itglue.com/DOC-5078775-10072208) script and [ProVal - Development - Workaround - Microsoft Support Diagnostic Tool Vulnerability [G]](https://proval.itglue.com/DOC-5078775-10072205) monitor set.

## Dependencies

- [MS-MSDT Registry Key](https://proval.itglue.com/DOC-5078775-10072204)
- [ProVal - Development - Workaround - Microsoft Support Diagnostic Tool Vulnerability [G]](https://proval.itglue.com/DOC-5078775-10072205)
- [Workaround - Microsoft Support Diagnostic Tool Vulnerability [Param][Autofix][DV]](https://proval.itglue.com/DOC-5078775-10072208)
- [CVE-2022-30190 MSDT - Workarounds](https://proval.itglue.com/DOC-5078775-10073331)

## Columns

| Column                        | Description                                                                                              |
|-------------------------------|----------------------------------------------------------------------------------------------------------|
| computerid                   | computerid                                                                                               |
| Client Name                  | Client Name                                                                                              |
| Location Name                | Location Name                                                                                            |
| Computer Name                | Computer Name                                                                                            |
| Operating System             | Operating System                                                                                         |
| lastcontact                  | lastcontact                                                                                              |
| MS-MSDT Registry Status      | Value of the script state, MS-MSDT Registry Status                                                     |
| MS-MSDT Registry Key Role    | Whether the role is active, inactive, or if it's never detected. <br> Active: The registry key is currently present on the computer. <br> Inactive: The registry key was once present on the computer, but the script had removed that. <br> Not Detected: Either the registry key was not present on the computer from the very beginning or somehow the computer is not accepting the role. |



