---
id: '42fcda71-e3ed-40e2-92e0-c0eb80e42e2d'
title: 'Microsoft OneDrive - (Group PoliciesRedirect Folder)'
title_meta: 'Microsoft OneDrive - (Group PoliciesRedirect Folder)'
keywords: ['onedrive', 'group', 'policies', 'windows', 'folders', 'redirect', 'configuration']
description: 'This document outlines the implementation of group policies to redirect Windows known folders such as Desktop, Documents, Pictures, Screenshots, and Camera Roll to Microsoft OneDrive, along with other related group policy recommendations.'
tags: ['onedrive', 'setup', 'windows']
draft: false
unlisted: false
---

## Purpose

This document implements options for group policies to redirect Windows known folders (Desktop, Documents, Pictures, Screenshots, and Camera Roll) to Microsoft OneDrive, along with other group policy recommendations.

## Associated Content

| Content                                                                 | Type               | Function                                                                                                                |
|-------------------------------------------------------------------------|--------------------|-------------------------------------------------------------------------------------------------------------------------|
| [M365TenantId](<../vsa/variables/M365TenantId.md>)                    | Managed Variable    | This managed variable is used to store the partner's Microsoft 365 TenantId.                                         |
| [Microsoft OneDrive - (Group Policies/Redirect Folder)](<../vsa/procedures/Microsoft OneDrive - (Group PoliciesRedirect Folder).md>) | Agent Procedure     | This agent procedure is used to implement group policies to redirect Windows known folders (Desktop, Documents, Pictures, Screenshots, and Camera Roll) to Microsoft OneDrive. |

## Implementation

1. Create the following dependencies in the partner's VSA:  
   - [Managed Variable - M365TenantId](<../vsa/variables/M365TenantId.md>)

2. Export the following content from ProVal's VSA and follow the necessary implementation steps within each document:  
   - [Agent Procedure - Microsoft OneDrive - (Group Policies/Redirect Folder)](<../vsa/procedures/Microsoft OneDrive - (Group PoliciesRedirect Folder).md>)




