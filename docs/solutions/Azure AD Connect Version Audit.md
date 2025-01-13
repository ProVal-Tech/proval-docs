---
id: 'vsa-azure-ad-connect-version-audit'
title: 'Azure AD Connect Version Audit'
title_meta: 'Azure AD Connect Version Audit'
keywords: ['azure', 'ad', 'connect', 'version', 'audit']
description: 'This document provides comprehensive information regarding the servers that have Azure AD Connect software installed, including the specific versions of the software. It outlines associated content such as policies, procedures, and reports related to the Azure AD Connect Version Audit, along with implementation steps for setting up the necessary configurations.'
tags: ['configuration', 'report', 'software', 'security']
draft: false
unlisted: false
---
## Purpose

To provide the most information possible as to what servers have Azure AD Connect software installed, and what version is installed.

## Associated Content

| Content                                                                                       | Type            | Function                                               |
|-----------------------------------------------------------------------------------------------|-----------------|-------------------------------------------------------|
| [SWM - Software Configuration - Policy - Azure AD Connect Version Audit](https://proval.itglue.com/DOC-5078775-9853853) | Policy          | Schedules the Procedure against a Server View         |
| [SWM - Software Configuration - Agent Procedure - Azure AD Connect Version Audit](https://proval.itglue.com/DOC-5078775-9853848) | Agent Procedure  | Pulls Version data from the endpoint and saves to a CF |
| [SWM - Software Configuration - Report - Azure AD Connect Version Audit](https://proval.itglue.com/DOC-5078775-9853843) | Report          | Pulls a report of all endpoints with a valid version number in the CF |
| [SWM - Software Configuration - Report Part - Azure AD Connect Version Audit](https://proval.itglue.com/DOC-5078775-9853854) | Report Part     | Build the report                                      |
| [SWM - Software Configuration - Custom Field - xPVAL Azure AD Connect Version](https://proval.itglue.com/DOC-5078775-9853852) | Custom Field - Machine | Contains the version data                        |
| [SWM - Software Configuration - View - xPVAL Azure AD Connect Version](https://proval.itglue.com/DOC-5078775-9853845) | View            | Filters Agents view by endpoints with a valid version in the CF |

## Implementation

- Create the CF xPVAL Azure AD Connect Version Audit
- Import the View xPVAL Azure AD Connect Version Audit
- Import the Procedure Azure AD Connect Version Audit
- Import the Policy Azure AD Connect Version Audit
- Import the Report Azure AD Connect Version Audit



