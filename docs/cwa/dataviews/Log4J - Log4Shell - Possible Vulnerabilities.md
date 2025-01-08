---
id: 'cwa-log4j-vulnerabilities'
title: 'Log4J/Log4Shell Vulnerability Report'
title_meta: 'Log4J/Log4Shell Vulnerability Report'
keywords: ['log4j', 'vulnerability', 'security', 'software', 'endpoint']
description: 'This document provides a comprehensive report on potential Log4J/Log4Shell vulnerabilities, detailing affected applications based on a curated list from GitHub. It includes dependencies for endpoint protection and outlines the relevant columns for tracking vulnerabilities.'
tags: ['security', 'software', 'vulnerability', 'endpoint', 'report']
draft: false
unlisted: false
---
## Summary

Displays potential Log4J/Log4Shell vulnerabilities based on this list: [https://github.com/NCSC-NL/log4shell/blob/main/software/README.md](https://github.com/NCSC-NL/log4shell/blob/main/software/README.md)

## Dependencies

- [SEC - Endpoint Protection - Agnostic - Import-Log4JTable](https://proval.itglue.com/DOC-5078775-8854610)
- [SEC - Endpoint Protection - Script - Import Log4Shell Table](https://proval.itglue.com/DOC-5078775-8855626)
- [SEC - Endpoint Protection - Custom Table - plugin_proval_log4jsoftwarelist](https://proval.itglue.com/DOC-5078775-8856668)

## Columns

| Column        | Description                                                                                              |
|---------------|----------------------------------------------------------------------------------------------------------|
| ComputerID    | The ID of the affected computer.                                                                         |
| Client        | The name of the computer's client.                                                                       |
| Computer      | The name of the affected computer.                                                                        |
| InstalledName | The name of the possibly affected application as it appears in the Automate database.                    |
| Supplier      | The supplier of the possibly affected application as it appears in the GitHub table.                     |
| Product       | The name of the possibly affected application as it appears in the GitHub table.                         |
| Status        | The status of the application as of last run of [SEC - Endpoint Protection - Script - Import Log4Shell Table](https://proval.itglue.com/DOC-5078775-8855626) |
| Links         | Links to information about the affected application.                                                    |

