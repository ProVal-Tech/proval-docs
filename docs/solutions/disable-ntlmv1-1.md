---
id: '94b6df2a-8565-4118-b2e7-35a3fe7206dc'
slug: /94b6df2a-8565-4118-b2e7-35a3fe7206dc
title: 'Disable NTLMv1.1'
title_meta: 'Disable NTLMv1.1'
keywords: ['ntlm', 'protocol', 'windows', 'security', 'domain']
description: 'The purpose of this solution is to audit the NTLM v1.1 status and disable it on Windows machines where it is enabled.'
tags: ['networking', 'security', 'windows']
draft: false
unlisted: false
---

## Purpose

The purpose of this NinjaOne solution is to audit the NTLM v1.1 status and disable it on Windows machines where it is enabled.

## Associated Content

| Content                                             | Type                                                      | Function                                               |
|-----------------------------------------------------|-----------------------------------------------------------|--------------------------------------------------------|
| [cPVAL NTLMv1.1 Status](/docs/61a0c2de-fefe-4726-b24e-957a2582117c)  | Custom Field | Displays if NTLMv1.1 is enabled or not on windows machines |
| [Check NTLMv1.1 Status ](/docs/597320a1-4278-490d-ad99-0127cace9424)  | Automation | Verifies whether NTLM v1.1 is enabled on the target machine. |
| [Disable NTLMv1.1 ](/docs/6d899921-3e52-4d4f-9f9e-742242b8171a)  | Automation | Disables the NTLMv1.1 protocol on the target Windows machine. |
| [cPVAL Machines with NTLMv1.1 Enabled ](/docs/e71c93ac-51cc-49a5-8120-b846b1697849)  | Group | This includes the machines where NTLMv1.1 is enabled. |
| [Disable NTLMv1.1 ](/docs/2fa3b191-0fe1-4bb9-95fe-517b40794441)  |  Task | It executes [Disable NTLMv1.1 ](/docs/6d899921-3e52-4d4f-9f9e-742242b8171a) automation on targeted machines to disable NTLMv1.1 protocol. |
| [Check NTLMv1.1 Status Server ](/docs/f8a02c86-0bec-4a7c-97ab-91e418254024)  | Scheduled Automation | This runs "Check NTLMv1.1 Status" automation on windows server.
| [Check NTLMv1.1 Status Workstations](/docs/0b4b6dcc-6bde-4766-bf7f-60d146b2fbf9)  | Scheduled Automation | This runs "Check NTLMv1.1 Status" automation on windows workstations.|

## Implementation

- Create the [Custom Field - cPVAL NTLMv1.1 Status](/docs/61a0c2de-fefe-4726-b24e-957a2582117c) using the implementation instruction provided in the document.
- Create the below automations as per the implementation instruction provided in the documents.
    - [Check NTLMv1.1 Status ](/docs/597320a1-4278-490d-ad99-0127cace9424)
    - [Disable NTLMv1.1 ](/docs/6d899921-3e52-4d4f-9f9e-742242b8171a) 
- Create the [Group - cPVAL Machines with NTLMv1.1 Enabled ](/docs/e71c93ac-51cc-49a5-8120-b846b1697849) using the implementation instruction provided in the document.
- Create the below Scheduled Automations as per the implementation instruction provided in the documents.
    - [Check NTLMv1.1 Status Server ](/docs/f8a02c86-0bec-4a7c-97ab-91e418254024)
    - [Check NTLMv1.1 Status Workstations](/docs/0b4b6dcc-6bde-4766-bf7f-60d146b2fbf9)
- Create the [Task - Disable NTLMv1.1 ](/docs/2fa3b191-0fe1-4bb9-95fe-517b40794441) using the implementation instruction provided in the document.