---
id: '7d261218-6e70-46c2-8d0f-a18bdcab3b07'
slug: /7d261218-6e70-46c2-8d0f-a18bdcab3b07
title: 'TLS Version Audit'
title_meta: 'TLS Version Audit'
keywords: ['tls', 'audit']
description: 'This solution is built to audit the TLS version audit.'
tags: ['tls', 'audit']
draft: false
unlisted: false
last_update:
  date: 2026-06-22
---

## Purpose

This CW RMM solution is built to audit the installed TLS Client and Server protocol versions and stores the data in custom fields.

## Associated Content

| Content                                             | Type                                                      | Function                                               |
|-----------------------------------------------------|-----------------------------------------------------------|--------------------------------------------------------|
| [TLS Enabled List Audit](/docs/a6761909-3f04-43c3-968a-80082b95bff7)    | Task | This script gathers information about the TLS Client and Server protocol versions installed on an endpoint and stores the data in custom fields. |
| [TLS Client Enabled](/docs/846a6d82-1e25-4dba-a945-02f739bf6cdd) | Custom Field | This stores the installed and enabled TLS Client versions on an endpoint. |
| [TLS Server Enabled](/docs/4a4b0032-97c5-435a-ae6a-fc9bf3341d54) | Custom Field | This stores the installed and enabled TLS Server versions on an endpoint. |

## Implementation

- Create the below custom fields as per instructions provided in the documents.
  - [TLS Server Enabled](/docs/4a4b0032-97c5-435a-ae6a-fc9bf3341d54)
  - [TLS Client Enabled](/docs/846a6d82-1e25-4dba-a945-02f739bf6cdd) 
- Create the [TLS Enabled List Audit](/docs/a6761909-3f04-43c3-968a-80082b95bff7) as per instructions provided in the documents.
- Schedule the script to target [Windows Machines](/docs/b0c8b058-2cac-4922-a6a7-1c4275c4be15) to collect the detail.

## Changelog

### 2026-06-22

- Initial version of the document
