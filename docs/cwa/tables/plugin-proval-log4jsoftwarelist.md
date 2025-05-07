---
id: 'f78c8a37-448e-4a52-b475-412b0625edde'
slug: /f78c8a37-448e-4a52-b475-412b0625edde
title: 'plugin_proval_log4jsoftwarelist'
title_meta: 'plugin_proval_log4jsoftwarelist'
keywords: ['log4j', 'applications', 'vulnerability', 'software', 'security']
description: 'This document stores information about applications that may be affected by Log4J vulnerabilities, including supplier details, product names, affected versions, current status, and relevant links for further information.'
tags: ['database', 'security', 'software']
draft: false
unlisted: false
---

## Purpose

This document stores information from NCSC-NL's GitHub repository about applications that may be affected by Log4J vulnerabilities.

## Dependencies

- [SEC - Endpoint Protection - Script - Import Log4Shell Table](/docs/c3342117-53c8-48de-9831-27cd7da77c00)
- [SEC - Endpoint Protection - Agnostic - Import-Log4JTable](/docs/a9db2857-d76e-4c63-8916-80ed141dc5b5)

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
