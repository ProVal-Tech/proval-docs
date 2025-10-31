---
id: 'ffbbe3fe-f579-4521-a95a-1eb772d93ac7'
slug: /ffbbe3fe-f579-4521-a95a-1eb772d93ac7
title: 'New Domain Admin Detected'
title_meta: 'New Domain Admin Detected'
keywords: ['domain', 'administrators', 'windows', 'alerts']
description:  'The purpose of this solution is to detect the user or group of users if its promoted to domain administrator on a Windows domain controller.'
tags: ['security', 'setup', 'windows']
draft: false
unlisted: false
---


## Purpose

The purpose of this solution is to detect the user or group of users if its promoted to domain administrator on a Windows domain controller. This solution has to be executed against Infrastructure masters only

## Associated Content

| Content                                             | Type                                                      | Function                                               |
|-----------------------------------------------------|-----------------------------------------------------------|--------------------------------------------------------|
| [Custom Field : cPval Excluded Domain Admins](/docs/32a5e5bb-b72e-4597-beae-8f2d8a2eb1c0)   | Custom field | Stores the usernames to exclude from generating the new domain admin detected ticket |
| [Script : New Domain Admin Detected](/docs/a818ac38-9841-4049-9fda-1b87fa1bd19a)   | Script |   Detects the user or group of users if its promoted to domain administrator on a Windows domain controller. |
| [Ticket Template : New Domain Admin Detected](/docs/355a03b6-61f8-45c4-92f9-43f13b5dd7ac)  | Ticket Template |  configures how a ConnectWise Manage ticket will be generated for New domain admin accounts |
| [Condition : New Domain Admin Detected](/docs/b300f17d-63ee-4c31-b29b-a9fb92a69a89)  | Condition |  Runs the [New Domain Admin Detected](/docs/54cb9acb-d11d-4a88-a0ca-92032b46fe23) automation every 04 hours on Infrastructure masters |
| [Custom Field : cPVAL New Domain Admin Monitoring](/docs/28f66783-6f12-4091-abe0-6aa41f7cfd9a)   | Custom field | Custom field to enable/disable the solution |

## Implementation

- Create the [Custom Field : cPval Excluded Domain Admins](/docs/32a5e5bb-b72e-4597-beae-8f2d8a2eb1c0) using the implementation instruction provided in the document.
- Create the [Custom Field : cPVAL New Domain Admin Monitoring](/docs/28f66783-6f12-4091-abe0-6aa41f7cfd9a)  using the implementation instruction provided in the document.
- Create the [Script : New Domain Admin Detected](/docs/a818ac38-9841-4049-9fda-1b87fa1bd19a) (/docs/54cb9acb-d11d-4a88-a0ca-92032b46fe23) using the implementation instruction provided in the document.
- Create the  [Ticket Template : New Domain Admin Detected](/docs/355a03b6-61f8-45c4-92f9-43f13b5dd7ac) using the implementation instruction provided in the document.
- Create the [Condition : New Domain Admin Detected](/docs/b300f17d-63ee-4c31-b29b-a9fb92a69a89) using the implementation instruction provided in the document.
