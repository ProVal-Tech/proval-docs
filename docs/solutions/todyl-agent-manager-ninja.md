---
id: '01e0e3c8-adc5-4035-84d5-9266e5af0760'
slug: /01e0e3c8-adc5-4035-84d5-9266e5af0760
title: 'Todyl Agent Manager'
title_meta: 'Todyl Agent Manager'
keywords: ['todyl','agent','windows','deployment']
description: 'Solution to automate the installation and uninstallation of the Todyl Agent across endpoints.'
tags:  ['windows']
draft: false
unlisted: false
last_update:
  date: 2026-05-20
---

## Purpose

Solution to automate the installation and uninstallation of the Todyl Agent across endpoints.

## Associated Content

| Content                                             | Type                                                      | Function                                               |
|-----------------------------------------------------|-----------------------------------------------------------|--------------------------------------------------------|
| [cPVAL Todyl Deployment](/docs/7f24e5c5-4609-4f82-a932-5e34f63b6cc3)    | Custom Field  | Custom Field to install/unintall todyl solution. |
| [cPVAL Todyl Desktop Policy Key](/docs/19338eed-96f4-4788-9618-76bf85f8c369)    | Custom Field  | Todyl Deployment Key for Desktop Agents. |
| [cPVAL Todyl Laptop Policy Key](/docs/360cd317-be72-47d7-adae-3ed1c00d88b0)    | Custom Field  | Todyl Deployment Key for laptop Agents. |
| [cPVAL Todyl Server Policy Key](/docs/1a1c87f0-71c8-42c3-8d57-756a4d455b6c)    | Custom Field  | Todyl Deployment Key for Servers. |
| [Todyl Deployment](/docs/3ed0cf6e-1e51-419e-8fd3-5d689ef6f629)    | Script  | Installs Todyl Agent on windows machines. |
| [Todyl Uninstaller](/docs/f4086020-bdd6-498d-adac-2eeacfbd6ed9)    | Script | Uninstalls Todyl Agent on windows machines. |
| [Todyl Deployment - Workstations](/docs/737b576e-d7ac-48ec-ae04-14d7aa5f6d45) | Compound Condition | Triggers the [Todyl Deployment](/docs/3ed0cf6e-1e51-419e-8fd3-5d689ef6f629) automation on Windows workstations where deployment is enabled. |
| [Todyl Deployment - Servers](/docs/ffa0e6db-0345-493f-a7aa-2566c551880e) | Compound Condition | Triggers the [Todyl Deployment](/docs/3ed0cf6e-1e51-419e-8fd3-5d689ef6f629) automation on Windows Servers where deployment is enabled. |
| [Uninstall Todyl](/docs/5b111cc6-38fc-4197-848f-fe0f74bc5794) | Compound Condition | Triggers the [Todyl Uninstaller](/docs/f4086020-bdd6-498d-adac-2eeacfbd6ed9) automation on Windows servers/workstations where uninstallation is enabled. |

## Implementation

- Create the following custom fields:
  - [cPVAL Todyl Deployment](/docs/7f24e5c5-4609-4f82-a932-5e34f63b6cc3)
  - [cPVAL Todyl Desktop Policy Key](/docs/19338eed-96f4-4788-9618-76bf85f8c369)
  - [cPVAL Todyl Laptop Policy Key](/docs/360cd317-be72-47d7-adae-3ed1c00d88b0) 
  - [cPVAL Todyl Server Policy Key](/docs/1a1c87f0-71c8-42c3-8d57-756a4d455b6c)
- Create the following Scripts:
  - [Todyl Deployment](/docs/3ed0cf6e-1e51-419e-8fd3-5d689ef6f629)
  - [Todyl Uninstaller](/docs/f4086020-bdd6-498d-adac-2eeacfbd6ed9)
- Create the following Compound Conditions:
  - [Todyl Deployment - Workstations](/docs/737b576e-d7ac-48ec-ae04-14d7aa5f6d45)
  - [Todyl Deployment - Servers](/docs/ffa0e6db-0345-493f-a7aa-2566c551880e)
  - [Uninstall Todyl](/docs/5b111cc6-38fc-4197-848f-fe0f74bc5794) 


## Changelog

### 2026-05-20

- Initial version of the document
