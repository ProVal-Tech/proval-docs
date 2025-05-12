---
id: '0805aaf6-831e-403d-ad41-03fa7573f86b'
slug: /0805aaf6-831e-403d-ad41-03fa7573f86b
title: 'SentinelOne Management Server Discrepancy'
title_meta: 'SentinelOne Management Server Discrepancy'
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
| [SentinelOne Site Key](/docs/0c2128f8-2f99-47e7-a0ff-82b854ff2701) | Custom Field  | Stores the Site Key for the SentinelOne installation.                                                  |
| [Computer Level S1 Mgmt Server](/docs/cd0a8207-62e5-41ea-9df9-f9d475ee8866) | Custom Field  | Stores the computer-level SentinelOne Management Server.                                              |
| [Client Level S1 Mgmt Server](/docs/c92218fb-8d9d-45a7-a15b-107ada8141b8) | Custom Field  | Stores the client-level SentinelOne Management Server.                                                |
| [S1 Mgmt Server Discrepancy](/docs/c600a6e2-bd09-4172-8784-d969838eea23) | Custom Field  | Indicates whether the SentinelOne Management Server detected at the computer differs from what is set for the Client in ConnectWise RMM (Yes/No). |
| [SentinelOne Management Console Validation](/docs/36cc3fe0-538d-49f8-ba2d-1c09c35df079) | Task          | Validates whether the SentinelOne Management Server detected at the computer differs from what is set for the Client in ConnectWise RMM. |
| [SentinelOne Installed](/docs/9bed886f-fa13-4389-932e-47c62482db0d) | Dynamic Group | Contains the Windows machines where the Sentinel Agent is installed.                                   |
| [S1 Management Server Discrepancy](/docs/820319b1-66c6-43b0-be35-136ac4c82ccd) | Dynamic Group | Contains computers with a different SentinelOne Management Server than configured for the Client in ConnectWise RMM. |

## Implementation

1. Create the following Custom Fields:  
   - [SentinelOne Site Key](/docs/0c2128f8-2f99-47e7-a0ff-82b854ff2701)  (**Do not create this field for partners using a different custom field for storing the SentinelOne Site Key**)  
   - [Computer Level S1 Mgmt Server](/docs/cd0a8207-62e5-41ea-9df9-f9d475ee8866)  
   - [Client Level S1 Mgmt Server](/docs/c92218fb-8d9d-45a7-a15b-107ada8141b8)  
   - [S1 Mgmt Server Discrepancy](/docs/c600a6e2-bd09-4172-8784-d969838eea23)  

2. Create the following Groups:  
   - [SentinelOne Installed](/docs/9bed886f-fa13-4389-932e-47c62482db0d) (**Do not create this group for partners using a different group for computers with the `Sentinel Agent` application installed**)  
   - [S1 Management Server Discrepancy](/docs/820319b1-66c6-43b0-be35-136ac4c82ccd)  

3. Create and schedule this task:  
   - [SentinelOne Management Console Validation](/docs/36cc3fe0-538d-49f8-ba2d-1c09c35df079)  