---
id: 'vsa-redirect-windows-known-folders-onedrive'
title: 'Redirect Windows Known Folders to OneDrive Using Group Policies'
title_meta: 'Redirect Windows Known Folders to OneDrive Using Group Policies'
keywords: ['onedrive', 'group', 'policies', 'windows', 'folders', 'redirect', 'configuration']
description: 'This document outlines the implementation of group policies to redirect Windows known folders such as Desktop, Documents, Pictures, Screenshots, and Camera Roll to Microsoft OneDrive, along with other related group policy recommendations.'
tags: ['configuration', 'windows', 'onedrive', 'setup']
draft: false
unlisted: false
---
## Purpose

Implements options for group policies to redirect Windows known folders (Desktop, Documents, Pictures, Screenshots, and Camera Roll) to Microsoft OneDrive, and other group policy recommendations.

## Associated Content

| Content                                                                 | Type               | Function                                                                                                                |
|-------------------------------------------------------------------------|--------------------|-------------------------------------------------------------------------------------------------------------------------|
| [M365TenantId](https://proval.itglue.com/DOC-5078775-16749907)        | Managed Variable    | This managed variable is used to store the partner's Microsoft 365 TenantId.                                         |
| [Microsoft OneDrive - (Group Policies/Redirect Folder)](https://proval.itglue.com/DOC-5078775-16749544) | Agent Procedure     | This agent procedure is used to implements group policies to redirect Windows known folders (Desktop, Documents, Pictures, Screenshots, and Camera Roll) to Microsoft OneDrive. |

## Implementation

1. Create the following dependencies in the partner's VSA:  
   - [Managed Variable - M365TenantId](https://proval.itglue.com/DOC-5078775-16749907)

2. Export the following content from ProVal's VSA, and follow the necessary implementation steps within each document:  
   - [Agent Procedure - Microsoft OneDrive - (Group Policies/Redirect Folder)](https://proval.itglue.com/DOC-5078775-16749544)


