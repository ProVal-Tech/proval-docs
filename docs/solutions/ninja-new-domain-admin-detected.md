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
| [cPval Excluded Domain Admins](/docs/32a5e5bb-b72e-4597-beae-8f2d8a2eb1c0)   | Script | Stores the usernames to exclude from generating the new domain admin detected ticket |
| [Script : Domain Admin Account LockOut](/docs/54cb9acb-d11d-4a88-a0ca-92032b46fe23)   | Script |   Detects the user or group of users if its promoted to domain administrator on a Windows domain controller. |
| [Ticket Template : New Domain Admin Detected](/docs/355a03b6-61f8-45c4-92f9-43f13b5dd7ac)  | Ticket Template |  configures how a ConnectWise Manage ticket will be generated for New domain admin accounts |
| [Condition : New Domain Admin Detected](/docs/b300f17d-63ee-4c31-b29b-a9fb92a69a89)  | Condition |  Runs the [New Domain Admin Detected](/docs/54cb9acb-d11d-4a88-a0ca-92032b46fe23) automation every 04 hours on Infrastructure masters |

## Implementation

- Create the [cPval Excluded Domain Admins](/docs/32a5e5bb-b72e-4597-beae-8f2d8a2eb1c0) using the implementation instruction provided in the document.
- Create the [Script : Domain Admin Account LockOut](/docs/54cb9acb-d11d-4a88-a0ca-92032b46fe23) using the implementation instruction provided in the document.
- Create the  [Ticket Template : Domain Admin Account LockOut](/docs/4583116e-e1b9-42bc-826d-61ec2785e532) using the implementation instruction provided in the document.
- Create the [Condition : Domain Admin Account LockOut](/docs/588b31d4-04a3-4b39-af8c-6c1f24da0710) using the implementation instruction provided in the document.
