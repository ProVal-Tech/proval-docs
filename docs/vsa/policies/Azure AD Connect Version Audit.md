---
id: 'c4e6e974-94df-4a7f-940e-6ba95d49d4cd'
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

- [SWM - Software Configuration - Policy - Azure AD Connect Version Audit](https://proval.itglue.com/DOC-5078775-9853853)
- [SWM - Software Configuration - Report Part - Azure AD Connect Version Audit](https://proval.itglue.com/DOC-5078775-9853854)
- [SWM - Software Configuration - View - xPVAL Azure AD Connect Version](https://proval.itglue.com/DOC-5078775-9853845)
- [SWM - Software Configuration - Custom Field - xPVAL Azure AD Connect Version](https://proval.itglue.com/DOC-5078775-9853852)
- [SWM - Software Configuration - Agent Procedure - Azure AD Connect Version Audit](https://proval.itglue.com/DOC-5078775-9853848)
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



