---
id: '9882903a-a467-4136-bb9e-7e2c8f25ae01'
slug: /9882903a-a467-4136-bb9e-7e2c8f25ae01
title: 'Enable TLS Version Audit'
title_meta: 'Enable TLS Version Audit'
keywords: ['tls', 'audit']
description: 'This solution is built to audit the tls version audit.'
tags: ['tls', 'audit']
draft: false
unlisted: false
last_update:
  date: 2026-04-14
---

## Purpose

This solution is built to audit the tls version audit.

## Associated Content

| Content                                             | Type                                                      | Function                                               |
|-----------------------------------------------------|-----------------------------------------------------------|--------------------------------------------------------|
| [Script - TLS Enabled List Audit](/docs/a19fe079-7179-4bdd-9572-248e1a48fb53)    | Script | This PowerShell script shows the list of TLS servers, and client are enabled. |
| [cPVAL TLS Client Enabled](/docs/c7b4badf-49a8-40b7-a6a0-db908b1c0694) | Custom field | This stores the TLS Client Enabled state. |
| [cPVAL TLS Server Enabled](/docs/0c4cb75a-bc62-4d44-9701-812237e94a36) | Custom field | This stores the TLS Server enabled. |
| [cPVAL TLS Details](/docs/37aaa27b-1398-4c9d-a681-39a8c807b635) | Custom field | This stores the TLS details of the Windows agent. |
| [Enabled TLS Version Audit](/docs/c5ae7def-4145-4f7b-82eb-8f4bfda66c41) | Group | This group shows the agents where the "TLS Enabled List Audit" script is executed to collect the enabled TLS versions audit list. |

## Implementation

- Create the [Custom field - cPVAL TLS Client Enabled](/docs/c7b4badf-49a8-40b7-a6a0-db908b1c0694)
- Create the [Custom field - cPVAL TLS Server Enabled](/docs/0c4cb75a-bc62-4d44-9701-812237e94a36)
- Create the [Custom field - cPVAL TLS Details](/docs/37aaa27b-1398-4c9d-a681-39a8c807b635) 
- Create the [Group - Enabled TLS Version Audit](/docs/c5ae7def-4145-4f7b-82eb-8f4bfda66c41)
- Create the [Script - TLS Enabled List Audit](/docs/a19fe079-7179-4bdd-9572-248e1a48fb53) 
- Schedule the script to the target organization/location/group to collect the detail.

## Changelog

- Initial version of the document