---
id: '0805aaf6-831e-403d-ad41-03fa7573f86b'
title: 'SentinelOne Management Server Discrepancy Detection'
title_meta: 'SentinelOne Management Server Discrepancy Detection'
keywords: ['sentinelone', 'management', 'discrepancy', 'cw', 'rmm']
description: 'This document outlines a solution to identify computers where the installed SentinelOne Management server differs from the configuration set for the Client in ConnectWise RMM. It provides details on associated custom fields, dynamic groups, and implementation steps necessary to validate and manage SentinelOne installations effectively.'
tags: ['security', 'windows']
draft: false
unlisted: false
---
## Purpose

The solution aims to find the computers where the installed SentinelOne Management server is different as set for the Client in CW RMM.

## Associated Content

| Content                                                                 | Type          | Function                                                                                                 |
|-------------------------------------------------------------------------|---------------|---------------------------------------------------------------------------------------------------------|
| [SentinelOne Site Key](<../cwrmm/custom-fields/Company - SentinelOne Site Key.md>) | Custom Field  | Stores Site Key for the SentinelOne installation.                                                      |
| [Computer Level S1 Mgmt Server](<../cwrmm/custom-fields/Endpoint - Computer Level S1 Mgmt Server.md>) | Custom Field  | Stores computer-level SentinelOne Management Server.                                                    |
| [Client Level S1 Mgmt Server](<../cwrmm/custom-fields/Endpoint - Client Level S1 Mgmt Server.md>) | Custom Field  | Stores client-level SentinelOne Management Server.                                                      |
| [S1 Mgmt Server Discrepancy](<../cwrmm/custom-fields/Endpoint - S1 Mgmt Server Discrepancy.md>) | Custom Field  | Is the SentinelOne Management Server detected at the computer different or not as set for the Client in CW RMM? (Yes/No) |
| [SentinelOne Management Console Validation](<../cwrmm/tasks/SentinelOne Management Console Validation.md>) | Task          | Validates whether the SentinelOne Management Server detected at the computer different or not as set for the Client in CW RMM. |
| [SentinelOne Installed](<../cwrmm/groups/SentinelOne Installed.md>) | Dynamic Group | Contains the Windows machines where Sentinel Agent is installed.                                        |
| [S1 Management Server Discrepancy](<../cwrmm/groups/S1 Management Server Discrepancy.md>) | Dynamic Group | Contains computers with the different SentinelOne management server as configured for the client in CW RMM. |

## Implementation

1. Create the following Custom Fields:  
   - [SentinelOne Site Key](<../cwrmm/custom-fields/Company - SentinelOne Site Key.md>)  (**Do not create this field for the partners using a different custom field for storing the SentinelOne Site Key**)  
   - [Computer Level S1 Mgmt Server](<../cwrmm/custom-fields/Endpoint - Computer Level S1 Mgmt Server.md>)  
   - [Client Level S1 Mgmt Server](<../cwrmm/custom-fields/Endpoint - Client Level S1 Mgmt Server.md>)  
   - [S1 Mgmt Server Discrepancy](<../cwrmm/custom-fields/Endpoint - S1 Mgmt Server Discrepancy.md>)  

2. Create the following Groups:  
   - [SentinelOne Installed](<../cwrmm/groups/SentinelOne Installed.md>) (**Do not create this group for the partners using a different group for the computers with the `Sentinel Agent` application installed**)  
   - [S1 Management Server Discrepancy](<../cwrmm/groups/S1 Management Server Discrepancy.md>)  

3. Create and schedule this task:  
   - [SentinelOne Management Console Validation](<../cwrmm/tasks/SentinelOne Management Console Validation.md>)  












