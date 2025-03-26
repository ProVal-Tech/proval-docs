---
id: '9030d8fa-886a-4f26-beb3-971afa475eb2'
slug: /9030d8fa-886a-4f26-beb3-971afa475eb2
title: 'Azure AD Connect Version Audit'
title_meta: 'Azure AD Connect Version Audit'
keywords: ['azure', 'ad', 'connect', 'version', 'audit']
description: 'This document provides comprehensive information regarding the servers that have Azure AD Connect software installed, including the specific versions of the software. It outlines associated content such as policies, procedures, and reports related to the Azure AD Connect Version Audit, along with implementation steps for setting up the necessary configurations.'
tags: ['report', 'security', 'software']
draft: false
unlisted: false
---

## Purpose

To provide comprehensive information about which servers have Azure AD Connect software installed and the specific versions that are in use.

## Associated Content

| Content                                                                                       | Type            | Function                                               |
|-----------------------------------------------------------------------------------------------|-----------------|-------------------------------------------------------|
| [SWM - Software Configuration - Policy - Azure AD Connect Version Audit](/docs/c4e6e974-94df-4a7f-940e-6ba95d49d4cd) | Policy          | Schedules the procedure against a server view         |
| [SWM - Software Configuration - Agent Procedure - Azure AD Connect Version Audit](/docs/ee5f96bd-884f-4b2e-af03-9aece0e37d67) | Agent Procedure  | Pulls version data from the endpoint and saves it to a custom field (CF) |
| [SWM - Software Configuration - Report - Azure AD Connect Version Audit](/docs/04af5f51-5656-4086-b2d2-94cb62388831) | Report          | Pulls a report of all endpoints with a valid version number in the CF |
| [SWM - Software Configuration - Report Part - Azure AD Connect Version Audit](/docs/04af5f51-5656-4086-b2d2-94cb62388831) | Report Part     | Builds the report                                      |
| [SWM - Software Configuration - Custom Field - xPVAL Azure AD Connect Version](/docs/cce3e0b2-3fe2-43d2-ba22-ca7885d4729a) | Custom Field - Machine | Contains the version data                        |
| [SWM - Software Configuration - View - xPVAL Azure AD Connect Version](/docs/c5607e81-8d80-4096-a9d8-76b39ba71db3) | View            | Filters agents' view by endpoints with a valid version in the CF |

## Implementation

- Create the custom field (CF) for xPVAL Azure AD Connect Version Audit
- Import the view for xPVAL Azure AD Connect Version Audit
- Import the procedure for Azure AD Connect Version Audit
- Import the policy for Azure AD Connect Version Audit
- Import the report for Azure AD Connect Version Audit



