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

The solution aims to find the computers where the installed SentinelOne Management server is different from what is set for the Client in ConnectWise RMM.

## Associated Content

| Content                                                                 | Type          | Function                                                                                                 |
|-------------------------------------------------------------------------|---------------|---------------------------------------------------------------------------------------------------------|
| [SentinelOne Site Key](<../cwrmm/custom-fields/Company - SentinelOne Site Key.md>) | Custom Field  | Stores the Site Key for the SentinelOne installation.                                                  |
| [Computer Level S1 Mgmt Server](<../cwrmm/custom-fields/Endpoint - Computer Level S1 Mgmt Server.md>) | Custom Field  | Stores the computer-level SentinelOne Management Server.                                              |
| [Client Level S1 Mgmt Server](<../cwrmm/custom-fields/Endpoint - Client Level S1 Mgmt Server.md>) | Custom Field  | Stores the client-level SentinelOne Management Server.                                                |
| [S1 Mgmt Server Discrepancy](<../cwrmm/custom-fields/Endpoint - S1 Mgmt Server Discrepancy.md>) | Custom Field  | Indicates whether the SentinelOne Management Server detected at the computer differs from what is set for the Client in ConnectWise RMM (Yes/No). |
| [SentinelOne Management Console Validation](<../cwrmm/tasks/SentinelOne Management Console Validation.md>) | Task          | Validates whether the SentinelOne Management Server detected at the computer differs from what is set for the Client in ConnectWise RMM. |
| [SentinelOne Installed](<../cwrmm/groups/SentinelOne Installed.md>) | Dynamic Group | Contains the Windows machines where the Sentinel Agent is installed.                                   |
| [S1 Management Server Discrepancy](<../cwrmm/groups/S1 Management Server Discrepancy.md>) | Dynamic Group | Contains computers with a different SentinelOne Management Server than configured for the Client in ConnectWise RMM. |

## Implementation

1. Create the following Custom Fields:  
   - [SentinelOne Site Key](<../cwrmm/custom-fields/Company - SentinelOne Site Key.md>)  (**Do not create this field for partners using a different custom field for storing the SentinelOne Site Key**)  
   - [Computer Level S1 Mgmt Server](<../cwrmm/custom-fields/Endpoint - Computer Level S1 Mgmt Server.md>)  
   - [Client Level S1 Mgmt Server](<../cwrmm/custom-fields/Endpoint - Client Level S1 Mgmt Server.md>)  
   - [S1 Mgmt Server Discrepancy](<../cwrmm/custom-fields/Endpoint - S1 Mgmt Server Discrepancy.md>)  

2. Create the following Groups:  
   - [SentinelOne Installed](<../cwrmm/groups/SentinelOne Installed.md>) (**Do not create this group for partners using a different group for computers with the `Sentinel Agent` application installed**)  
   - [S1 Management Server Discrepancy](<../cwrmm/groups/S1 Management Server Discrepancy.md>)  

3. Create and schedule this task:  
   - [SentinelOne Management Console Validation](<../cwrmm/tasks/SentinelOne Management Console Validation.md>)  

