---
id: '9882903a-a467-4136-bb9e-7e2c8f25ae01'
slug: /9882903a-a467-4136-bb9e-7e2c8f25ae01
title: 'TLS Version Audit'
title_meta: 'TLS Version Audit'
keywords: ['tls', 'audit']
description: 'This solution is built to audit the tls version audit.'
tags: ['tls', 'audit']
draft: false
unlisted: false
last_update:
  date: 2026-04-15
---

## Purpose

This solution is built to audit the installed TLS Client and Server protocol versions and stores the data is custom fields.

## Associated Content

| Content                                             | Type                                                      | Function                                               |
|-----------------------------------------------------|-----------------------------------------------------------|--------------------------------------------------------|
| [TLS Enabled List Audit](/docs/a19fe079-7179-4bdd-9572-248e1a48fb53)    | Script | This script gathers information about the TLS Client and Server protocol versions installed on an endpoint and stores the data in custom fields. |
| [cPVAL TLS Client Enabled](/docs/c7b4badf-49a8-40b7-a6a0-db908b1c0694) | Custom Field | This stores the installed and enabled TLS Client versions on an endpoint. |
| [cPVAL TLS Server Enabled](/docs/0c4cb75a-bc62-4d44-9701-812237e94a36) | Custom Field | This stores the installed and enabled TLS Server versions on an endpoint. |
| [Enabled TLS Version Audit](/docs/c5ae7def-4145-4f7b-82eb-8f4bfda66c41) | Group | This group shows the agents where the [TLS Enabled List Audit](/docs/a19fe079-7179-4bdd-9572-248e1a48fb53) script is executed to collect the enabled TLS versions list. |

## Implementation

- Create the [Custom field - cPVAL TLS Client Enabled](/docs/c7b4badf-49a8-40b7-a6a0-db908b1c0694)
- Create the [Custom field - cPVAL TLS Server Enabled](/docs/0c4cb75a-bc62-4d44-9701-812237e94a36)
- Create the [Group - Enabled TLS Version Audit](/docs/c5ae7def-4145-4f7b-82eb-8f4bfda66c41)
- Create the [Script - TLS Enabled List Audit](/docs/a19fe079-7179-4bdd-9572-248e1a48fb53) 
- Schedule the script to the target organization/location/group to collect the detail.

## Changelog

### 2026-04-15

- Initial version of the document