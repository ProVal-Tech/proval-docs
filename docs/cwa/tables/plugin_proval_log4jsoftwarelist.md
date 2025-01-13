---
id: 'cwa-log4j-affected-applications'
title: 'Log4J Affected Applications Information'
title_meta: 'Log4J Affected Applications Information'
keywords: ['log4j', 'applications', 'vulnerability', 'software', 'security']
description: 'This document stores information about applications that may be affected by Log4J vulnerabilities, including supplier details, product names, affected versions, current status, and relevant links for further information.'
tags: ['software', 'security', 'database']
draft: false
unlisted: false
---
## Purpose

Stores information from [https://github.com/NCSC-NL/log4shell/blob/main/software/README.md](https://github.com/NCSC-NL/log4shell/blob/main/software/README.md) about Log4J possibly affected applications.

## Dependencies

- [SEC - Endpoint Protection - Script - Import Log4Shell Table](https://proval.itglue.com/DOC-5078775-8855626)
- [SEC - Endpoint Protection - Agnostic - Import-Log4JTable](https://proval.itglue.com/DOC-5078775-8854610)

## Tables

#### plugin_proval_log4jsoftwarelist

| Column   | Type    | Explanation                                      |
|----------|---------|--------------------------------------------------|
| Supplier | VARCHAR | The supplier of the application.                 |
| Product  | VARCHAR | The name of the application.                      |
| Version  | VARCHAR | The affected versions of the application.        |
| Status   | VARCHAR | The current vulnerable status of the application. |
| Notes    | VARCHAR | Any notes about the application                   |
| Links    | VARCHAR | Links about the application's vulnerability.      |



