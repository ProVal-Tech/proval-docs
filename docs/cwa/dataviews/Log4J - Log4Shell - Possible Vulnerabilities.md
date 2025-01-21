---
id: '44ae65f5-ca26-409d-bdcc-ad294544fc90'
title: 'Log4J/Log4Shell Vulnerability Report'
title_meta: 'Log4J/Log4Shell Vulnerability Report'
keywords: ['log4j', 'vulnerability', 'security', 'software', 'endpoint']
description: 'This document provides a comprehensive report on potential Log4J/Log4Shell vulnerabilities, detailing affected applications based on a curated list from GitHub. It includes dependencies for endpoint protection and outlines the relevant columns for tracking vulnerabilities.'
tags: ['report', 'security', 'software', 'vulnerability']
draft: false
unlisted: false
---

## Summary

This document displays potential Log4J/Log4Shell vulnerabilities based on the following list: [NCSC-NL Log4Shell Software List](https://github.com/NCSC-NL/log4shell/blob/main/software/README.md)

## Dependencies

- [SEC - Endpoint Protection - Agnostic - Import-Log4JTable](<../../powershell/Import-Log4JTable.md>)
- [SEC - Endpoint Protection - Script - Import Log4Shell Table](<../scripts/Import%20Log4Shell%20Table.md>)
- [SEC - Endpoint Protection - Custom Table - plugin_proval_log4jsoftwarelist](<../tables/plugin_proval_log4jsoftwarelist.md>)

## Columns

| Column        | Description                                                                                              |
|---------------|----------------------------------------------------------------------------------------------------------|
| ComputerID    | The ID of the affected computer.                                                                         |
| Client        | The name of the computer's client.                                                                       |
| Computer      | The name of the affected computer.                                                                        |
| InstalledName | The name of the possibly affected application as it appears in the Automate database.                    |
| Supplier      | The supplier of the possibly affected application as it appears in the GitHub table.                     |
| Product       | The name of the possibly affected application as it appears in the GitHub table.                         |
| Status        | The status of the application as of the last run of [SEC - Endpoint Protection - Script - Import Log4Shell Table](<../scripts/Import%20Log4Shell%20Table.md>) |
| Links         | Links to information about the affected application.                                                    |

