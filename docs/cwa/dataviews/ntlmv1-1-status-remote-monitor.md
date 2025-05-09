---
id: '5a6640f6-f0cb-4231-845f-e48c9445aa22'
slug: /5a6640f6-f0cb-4231-845f-e48c9445aa22
title: 'NTLMv1.1 Status Remote Monitor'
title_meta: 'NTLMv1.1 Status Remote Monitor'
keywords: ['ntlm', 'security', 'endpoint', 'detection', 'protocol']
description: 'This document outlines a dataview designed to check the status of NTLMv1.1 on endpoints, highlighting the security risks associated with its use and providing implementation steps for monitoring. It emphasizes the importance of disabling NTLMv1.1 to protect sensitive information from unauthorized access.'
tags: ['networking', 'security']
draft: false
unlisted: false
---

## Summary

This dataview is designed to reveal whether NTLMv1.1 is currently enabled on the endpoint. NTLMv1.1 has been deprecated due to security concerns, as credential theft remains a significant risk when legacy protocols are active. It is strongly advised that machines do not have NTLMv1.1 enabled, as its inherent security vulnerabilities can potentially facilitate unauthorized access and compromise sensitive information.

## Dependencies

- [Import - Remote Monitor - NTLMv1.1 Detection](/docs/8e107867-6d8d-4b6c-aa10-20f8da59fdca)
- [EPM - Security - Script - Disable NTLMv1.1](/docs/2be0669b-3c87-4594-81f4-112c7411f513)

## Columns

| Column                     | Description                                             |
|---------------------------|---------------------------------------------------------|
| Clientid                  | Client ID                                              |
| Locationid                | Location ID                                            |
| Computerid                | Computer ID                                            |
| Client                    | Client Name                                           |
| Location                  | Location Name                                         |
| Computer                  | Computer Name                                         |
| Operating System          | Operating System                                       |
| Last Logged In User       | Last Logged In User                                   |
| Last Contact              | Last Contact with RMM                                 |
| NTLMv1.1 Status           | Displays if NTLMv1.1 is enabled or not on the server  |
| Information Update Time    | Time when the SMB1 Status data was fetched            |

## Implementation

- Apply and import the remote monitors to the Managed Windows Computers group.
- Import the dataview.