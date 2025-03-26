---
id: 'c4e6e974-94df-4a7f-940e-6ba95d49d4cd'
slug: /c4e6e974-94df-4a7f-940e-6ba95d49d4cd
title: 'Azure AD Connect Version Audit'
title_meta: 'Azure AD Connect Version Audit'
keywords: ['azure', 'audit', 'version', 'scan', 'policy']
description: 'This document outlines the policy for scheduling scans of server endpoints for Azure AD Connect software, ensuring the version number is gathered effectively. It includes dependencies, details of the policy, and relevant configurations for implementation.'
tags: ['report', 'software', 'windows']
draft: false
unlisted: false
---

# Summary

Policy to schedule the scan of server endpoints for Azure AD Connect software and gather the version number.

# Dependencies

- [SWM - Software Configuration - Policy - Azure AD Connect Version Audit](/docs/c4e6e974-94df-4a7f-940e-6ba95d49d4cd)
- [SWM - Software Configuration - Report Part - Azure AD Connect Version Audit](/docs/04af5f51-5656-4086-b2d2-94cb62388831)
- [SWM - Software Configuration - View - xPVAL Azure AD Connect Version](/docs/c5607e81-8d80-4096-a9d8-76b39ba71db3)
- [SWM - Software Configuration - Custom Field - xPVAL Azure AD Connect Version](/docs/cce3e0b2-3fe2-43d2-ba22-ca7885d4729a)
- [SWM - Software Configuration - Agent Procedure - Azure AD Connect Version Audit](/docs/ee5f96bd-884f-4b2e-af03-9aece0e37d67)
- [SWM - Software Configuration - Report - Azure AD Connect Version Audit](https://proval.itglue.com/5078775/docs/9853843)

# Details

**Policy Name:** Azure AD Connect Version Audit  
**Policy Description:** Policy to schedule the scan of server endpoints for Azure AD Connect software and gather the version number  
**Applied View:** All Servers  
**Assigned Organizations / Machine Groups:** None  
**Assigned Machines:** None  

**Policy Objects Active:**
- **Policy Object Name:** Agent Procedures
  - **Policy Object Settings**
    - **Policy Object Members:** Azure AD Connect Version Audit
      - **Policy Object Member Settings:** Schedule: Weekly, Midnight, Do not skip if offline

### Export Attachment

Attach the content XML VSA Export to this document.



