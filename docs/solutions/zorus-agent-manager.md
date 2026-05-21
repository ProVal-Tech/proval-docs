---
id: '3b1dee7b-3bbb-4122-b33c-da6caa2a2d56'
slug: /3b1dee7b-3bbb-4122-b33c-da6caa2a2d56
title: 'Zorus Agent Manager'
title_meta: 'Zorus Agent Manager'
keywords: ['Zorus','Agent','Windows','Deployment']
description: 'Ninja solution to automate the installation and uninstallation of the Zorus Agent across endpoints.'
tags:  ['windows']
draft: false
unlisted: false
last_update:
  date: 2026-05-21
---

## Purpose

Ninja solution to automate the installation and uninstallation of the Zorus Agent across endpoints.

## Associated Content

| Content                                             | Type                                                      | Function                                               |
|-----------------------------------------------------|-----------------------------------------------------------|--------------------------------------------------------|
| [Custom Field - cPVAL Zorus Deployment](/docs/4e8f3cb1-f05c-46a2-9cf3-1ae0170f0cd3)    | Custom Field  | Custom Field to install/unintall Zorus agent. |
| [Custom Field - cPVAL Zorus Token Key](/docs/a3bdf78e-b4fd-499e-9e30-3eb49f6653cd)    | Custom Field  | Custom field to store Deployment token generated within the Zorus portal for deploying the Zorus agent. |
| [Custom Field - cPVAL Zorus Uninstallation Password](/docs/360cd317-be72-47d7-adae-3ed1c00d88b0)    | Custom Field  | Cutsom field to store Zorus uninstallation Password |
| [Automation - Zorus Deployment](/docs/da444ba9-ae51-48f8-8913-35f206579b04)    | Automation | Installs Zorus Agent on windows machines. |
| [Automation - Uninstall Zorus Agent](/docs/8e9cb6d7-76ed-41b1-999b-e7178007c77b)    | Automation| Uninstalls Zorus Agent on windows machines. |
| [Compound Condition - Zorus Deployment Workstations](/docs/cf3c9ade-4a3b-42b5-9a79-13235dde86ee) | Compound Condition | Triggers the [Zorus Deployment](/docs/da444ba9-ae51-48f8-8913-35f206579b04) automation on Windows workstations where deployment is enabled. |
| [Compound Condition - Zorus Deployment Servers](/docs/65acbc53-b954-4c02-b397-9d4c641e759c) | Compound Condition |Triggers the [Zorus Deployment](/docs/da444ba9-ae51-48f8-8913-35f206579b04) automation on Windows servers where deployment is enabled. |
| [Compound Condition - Uninstall Zorus](/docs/0b345a9b-c5ef-4f3b-8f47-cc87a736432a) | Compound Condition | Triggers the [Uninstall Zorus Agent](/docs/8e9cb6d7-76ed-41b1-999b-e7178007c77b) automation on Windows servers/workstations where uninstallation is enabled. |

## Implementation

- Create the following custom fields:
  - 
- Create the following Scripts:
  - [Custom Field - cPVAL Zorus Deployment](/docs/4e8f3cb1-f05c-46a2-9cf3-1ae0170f0cd3)
  - [Custom Field - cPVAL Zorus Token Key](/docs/a3bdf78e-b4fd-499e-9e30-3eb49f6653cd)  
  - [Custom Field - cPVAL Zorus Uninstallation Password](/docs/360cd317-be72-47d7-adae-3ed1c00d88b0) 
- Create the following Scripts:
  - [Automation - Zorus Deployment](/docs/da444ba9-ae51-48f8-8913-35f206579b04) 
  - [Automation - Uninstall Zorus Agent](/docs/8e9cb6d7-76ed-41b1-999b-e7178007c77b)
- Create the following Compound Conditions:
  - [Compound Condition - Zorus Deployment Workstations](/docs/cf3c9ade-4a3b-42b5-9a79-13235dde86ee)
  -  [Compound Condition - Zorus Deployment Servers](/docs/65acbc53-b954-4c02-b397-9d4c641e759c)
  - [Compound Condition - Zorus Deployment Servers](/docs/65acbc53-b954-4c02-b397-9d4c641e759c)

## Changelog

### 2026-05-21

- Initial version of the document