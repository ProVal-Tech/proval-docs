---
id: 'fd6fcda6-9a87-4275-b6eb-1a8f8f63099d'
slug: /fd6fcda6-9a87-4275-b6eb-1a8f8f63099d
title: 'DNS Filter Agent Deployment'
title_meta: 'DNS Filter Agent Deployment'
keywords: ['dns', 'filter', 'agent', 'installation', 'windows', 'macintosh']
description: 'The purpose of this solution is to automatically deploy the DNS filter to windows and Mac agents on CWRMM platform.'
tags: ['installation', 'dns']
draft: false
unlisted: false
---

## Purpose


The purpose of this solution is to automatically deploy the DNS filter to windows and Mac agents on CW RMM platform.


## Associated Content

| Content                                             | Type                                                      | Function                                               |
|-----------------------------------------------------|-----------------------------------------------------------|--------------------------------------------------------|
| [Deploy DNSFilter Agent](/docs/501dcdec-33ab-45de-8a5d-4f35839762d4)   | Custom Field | Custom Field to enable DNSFilter Deployment Solution. |
| [DNSFilter Deployment Key](/docs/b4038e72-ef58-4e35-8b7b-cfe0e2536c87)   | Custom Field | Custom Field to fill in Deployment Key for deploying the DNSFilter Agent. |
| [Exclude DNSFilter deployment](/docs/7c9e982b-6081-4a03-a8dd-b44d079118ca)   | Custom Field | Custom Field for DNSFilter Deployment exclusion at Site/Endpoint. |
| [DNSFilter Agent Deployment](/docs/03c4255b-097a-406f-822f-a237228dbeed)   | Group | Group of machines where DNSFilter Agent deployment is enabled for windows and MAC machines. |
| [Install DNSFilter Agent](/docs/5f0490f8-c2ce-4afe-92a0-d75699150a24)   | Task | Deploys DNSFilter Agent on both windows and MAC machines. |

## Implementation

1. Create the following custom fields:  
    - [Deploy DNSFilter Agent](/docs/501dcdec-33ab-45de-8a5d-4f35839762d4)
    - [DNSFilter Deployment Key](/docs/b4038e72-ef58-4e35-8b7b-cfe0e2536c87) 
    - [Exclude DNSFilter deployment](/docs/7c9e982b-6081-4a03-a8dd-b44d079118ca)  
   **Note:** The above document has multiple custom fields, and it is required to create each one for the solution to work properly.

2. Create the following device groups:  
    - [DNSFilter Agent Deployment](/docs/03c4255b-097a-406f-822f-a237228dbeed)  

3. Create and deploy the following tasks:  
    - [Install DNSFilter Agent](/docs/5f0490f8-c2ce-4afe-92a0-d75699150a24)  