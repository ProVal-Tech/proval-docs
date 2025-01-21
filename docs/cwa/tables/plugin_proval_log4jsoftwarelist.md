---
id: 'f78c8a37-448e-4a52-b475-412b0625edde'
title: 'Log4J Affected Applications Information'
title_meta: 'Log4J Affected Applications Information'
keywords: ['log4j', 'applications', 'vulnerability', 'software', 'security']
description: 'This document stores information about applications that may be affected by Log4J vulnerabilities, including supplier details, product names, affected versions, current status, and relevant links for further information.'
tags: ['database', 'security', 'software']
draft: false
unlisted: false
---

## Purpose

This document stores information from [NCSC-NL's GitHub repository](https://github.com/NCSC-NL/log4shell/blob/main/software/README.md) about applications that may be affected by Log4J vulnerabilities.

## Dependencies

- [SEC - Endpoint Protection - Script - Import Log4Shell Table](<../scripts/Import Log4Shell Table.md>)
- [SEC - Endpoint Protection - Agnostic - Import-Log4JTable](<../../powershell/Import-Log4JTable.md>)

## Tables

#### plugin_proval_log4jsoftwarelist

| Column   | Type    | Explanation                                      |
|----------|---------|--------------------------------------------------|
| Supplier | VARCHAR | The supplier of the application.                 |
| Product  | VARCHAR | The name of the application.                      |
| Version  | VARCHAR | The affected versions of the application.        |
| Status   | VARCHAR | The current vulnerable status of the application. |
| Notes    | VARCHAR | Any notes about the application.                  |
| Links    | VARCHAR | Links regarding the application's vulnerability.  |

