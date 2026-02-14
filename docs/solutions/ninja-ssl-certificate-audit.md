---
id: 'cf5acc69-183c-4838-9484-2f3d9a247877'
slug: /cf5acc69-183c-4838-9484-2f3d9a247877
title: 'SSL Certificate Audit'
title_meta: 'SSL Certificate Audit'
keywords: ['certificates', 'audit', 'expiration', 'status', 'thumbprint', 'issuer', 'subject', 'client', 'computer']
description: 'This Script pulls any and all certificates in the personal certificate repository on windows machines that it is run on.'
tags: ['windows']
draft: false
unlisted: false
---

## Purpose

The purpose of this solution is to pull any and all certificates in the personal certificate repository on windows machines

## Associated Content

| Content                                             | Type                                                      | Function                                               |
|-----------------------------------------------------|-----------------------------------------------------------|--------------------------------------------------------|
| [Custom field - cPVAL SSL certificate Audit](/docs/350874e6-7bef-4bff-8fce-f2772acab495)    | Custom Field | List of all SSL certificates in the personal certificate repository. This Data is populated by `SSL Certificate Audit` automation. |
| [Custom field - cPVAL Enable SSL Cert Audit](/docs/87e79b06-8bb4-4902-8a0c-0a626dfb11ab)    | Custom Field | Custom Field to enable SSL Certificates Audit |
| [Automation - SSL Certificate Audit](/docs/3c9e2ed2-f805-4da9-85fb-7fa1d1d146f5)    | Automation | This Script pulls any and all certificates in the personal certificate repository on windows machines that it is run on. |
| [Compound Condition - SSL Audit - Servers](/docs/e38129a0-21bf-45fc-b6da-528312973aa0)    | Compound Condition | This compound condition performs SSL Certificate Audit once per day on Windows servers |
| [Compound Condition - SSL Audit - Workstations](/docs/d6082c07-16ba-4b32-8eee-c01384378ac7)    | Compound Condition | This compound condition performs SSL Certificate Audit once per day on Windows Workstations |

## Implementation

- Create the below Custom Fields using the implementation instruction provided in the documents.
    - [Custom field - cPVAL SSL certificate Audit](/docs/350874e6-7bef-4bff-8fce-f2772acab495) 
    - [Custom field - cPVAL Enable SSL Cert Audit](/docs/87e79b06-8bb4-4902-8a0c-0a626dfb11ab)
- Create the [Automation - SSL Certificate Audit](/docs/3c9e2ed2-f805-4da9-85fb-7fa1d1d146f5) using the implementation instruction provided in the document.
- Create the below Compound Conditions using the implementation instruction provided in the documents.
    - [Compound Condition - SSL Audit - Servers](/docs/e38129a0-21bf-45fc-b6da-528312973aa0) 
    - [Compound Condition - SSL Audit - Workstations](/docs/d6082c07-16ba-4b32-8eee-c01384378ac7)