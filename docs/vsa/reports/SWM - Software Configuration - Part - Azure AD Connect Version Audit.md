---
id: 'af56a1a9-743a-47ac-928a-8bddb0e616ca'
title: 'SWM - Software Configuration - Part - Azure AD Connect Version Audit'
title_meta: 'SWM - Software Configuration - Part - Azure AD Connect Version Audit'
keywords: ['cf', 'azure', 'ad', 'connect', 'version', 'audit']
description: 'This document details the process of gathering configuration field data from the xPVAL Azure AD Connect Version and displays all endpoints that have a valid version. It outlines dependencies, layout specifications, and filtering criteria for effective reporting.'
tags: ['report', 'software', 'windows']
draft: false
unlisted: false
---

# Summary
This document gathers CF data from the xPVAL Azure AD Connect Version and displays all endpoints that have a valid version.

# Dependencies
- [SWM - Software Configuration - Policy - Azure AD Connect Version Audit](<../policies/Azure AD Connect Version Audit.md>)
- [SWM - Software Configuration - Report Part - Azure AD Connect Version Audit](<./Azure AD Connect Version Audit.md>)
- [SWM - Software Configuration - View - xPVAL Azure AD Connect Version](<../views/xPVAL Azure AD Connect Version.md>)
- [SWM - Software Configuration - Custom Field - xPVAL Azure AD Connect Version](<../custom-fields/xPVAL Azure AD Connect Version.md>)
- [SWM - Software Configuration - Agent Procedure - Azure AD Connect Version Audit](<../procedures/Azure AD Connect Version Audit.md>)
- [SWM - Software Configuration - Report - Azure AD Connect Version Audit](https://proval.itglue.com/5078775/docs/9853843)

# Layout
List the report parts used. If custom report parts were designed during report creation, list their properties and attributes:
- **Template Used:** Audit / Machine Summary
- **Data Type (Pie, Bar, Grid, etc):** Grid
- **Columns:** Computer Name, xPVAL Azure AD Connect Version (Alias: Azure AD Connect Version)
- **Ordering and Grouping**
  - **Order By Columns (include whether Aggregate and Sort order are defined):** None
  - **Group By Columns:** Group Name
- **Filtering**
  - **Row Filter Settings (Distinct, Limit Types, Limit Values):** None
  - **Date Filters:** None
  - **Advanced Filters (Field, Operator, Value):**
    - xPVAL Azure AD Connect Version | Not Like | 'Not Installed'
    - xPVAL Azure AD Connect Version | Not Like | ""




