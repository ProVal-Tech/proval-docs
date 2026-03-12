---
id: '862f9638-4600-46c2-8894-af488273c1c7'
slug: /862f9638-4600-46c2-8894-af488273c1c7
title: 'TPM Version Audit'
title_meta: 'TPM Version Audit'
keywords: ['tpm', 'audit', 'encryption', 'security']
description: 'The purpose of this solution is to fetch the TPM version on windows machines.'
tags: ['database', 'encryption', 'security', 'windows']
draft: False
unlisted: false
last_update:
  date: 2026-03-12
---

## Purpose

The purpose of this solution is to fetch the TPM version on windows machines.

## Associated Content

| Content                                             | Type                                                      | Function                                               |
|-----------------------------------------------------|-----------------------------------------------------------|--------------------------------------------------------|
| [Custom field - cPVAL TPM Version](/docs/0c7cef51-69c6-4129-aff4-34a73f1cb28e)  | Custom Field | Displays the enabled TPM version for the device.|
| [Automation - Get TPM Version ](/docs/b30479c4-f701-4558-bc9f-91920f125e6d)  | Automation |  Retrieves the TPM version if it is enabled on the Windows device. |
| [Group - cPVAL TPM Version Audit](/docs/243e33db-2ee9-4c89-a3cf-1c5a1c84680e)  | Group | This includes machines where `cPVAL TPM Version` Custom Field is populated by `Get TPM Version` Script. |
| [Scheduled Automation - TPM Version Audit Workstations](/docs/4e26329a-9b34-4330-975b-f8adc71d9449)  | Scheduled Automation | Executes `Get TPM Version` script on windows workstations |
| [Scheduled Automation - TPM Version Audit Servers](/docs/c50a99fa-f648-4d2e-9223-62bee5485a9b)  | Scheduled Automation |  Executes `Get TPM Version` script on windows Servers |


## Implementation

- Create the [Custom field - cPVAL TPM Version](/docs/0c7cef51-69c6-4129-aff4-34a73f1cb28e) using the implementation instruction provided in the document.
- Create the [Automation - Get TPM Version ](/docs/b30479c4-f701-4558-bc9f-91920f125e6d) using the implementation instruction provided in the document.
- Create the[Group - cPVAL TPM Version Audit](/docs/243e33db-2ee9-4c89-a3cf-1c5a1c84680e) using the implementation instruction provided in the document.
- Create the below Scheduled Automations as per the implementation instruction provided in the documents.
    - [Scheduled Automation - TPM Version Audit Workstations](/docs/4e26329a-9b34-4330-975b-f8adc71d9449) 
    - [Scheduled Automation - TPM Version Audit Servers](/docs/c50a99fa-f648-4d2e-9223-62bee5485a9b)


## Changelog

### 2026-03-12

- Initial version of the document
