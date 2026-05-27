---
id: '3b1dee7b-3bbb-4122-b33c-da6caa2a2d56'
slug: /3b1dee7b-3bbb-4122-b33c-da6caa2a2d56
title: 'Zorus Agent Manager'
title_meta: 'Zorus Agent Manager'
keywords: ['zorus','agent','windows','deployment']
description: 'Ninja solution to automate the installation and uninstallation of the Zorus Agent across endpoints.'
tags:  ['windows']
draft: false
unlisted: false
last_update:
  date: 2026-05-27
---

## Purpose

Ninja solution to automate the installation and uninstallation of the Zorus Agent across endpoints.

## Associated Content

| Content                                             | Type                                                      | Function                                               |
|-----------------------------------------------------|-----------------------------------------------------------|--------------------------------------------------------|
| [cPVAL Zorus Deployment](/docs/4e8f3cb1-f05c-46a2-9cf3-1ae0170f0cd3)    | Custom Field  | Custom Field to install/unintall Zorus agent. |
| [cPVAL Zorus Token Key](/docs/a3bdf78e-b4fd-499e-9e30-3eb49f6653cd)    | Custom Field  | Custom field to store Deployment token generated within the Zorus portal for deploying the Zorus agent. |
| [cPVAL Zorus Uninstallation Password](/docs/a5be5729-cb20-4ab6-834e-d18d361cee97)    | Custom Field  | Cutsom field to store Zorus uninstallation Password |
| [Zorus Deployment](/docs/da444ba9-ae51-48f8-8913-35f206579b04)    | Automation | Installs Zorus Agent on windows machines. |
| [Uninstall Zorus Agent](/docs/8e9cb6d7-76ed-41b1-999b-e7178007c77b)    | Automation| Uninstalls Zorus Agent on windows machines. |
| [Zorus Deployment Workstations](/docs/cf3c9ade-4a3b-42b5-9a79-13235dde86ee) | Compound Condition | Triggers the [Zorus Deployment](/docs/da444ba9-ae51-48f8-8913-35f206579b04) automation on Windows workstations where deployment is enabled. |
| [Zorus Deployment Servers](/docs/65acbc53-b954-4c02-b397-9d4c641e759c) | Compound Condition |Triggers the [Zorus Deployment](/docs/da444ba9-ae51-48f8-8913-35f206579b04) automation on Windows servers where deployment is enabled. |
| [Uninstall Zorus](/docs/0b345a9b-c5ef-4f3b-8f47-cc87a736432a) | Compound Condition | Triggers the [Uninstall Zorus Agent](/docs/8e9cb6d7-76ed-41b1-999b-e7178007c77b) automation on Windows servers/workstations where uninstallation is enabled. |

## Implementation

- Create the following custom fields:
  - [cPVAL Zorus Deployment](/docs/4e8f3cb1-f05c-46a2-9cf3-1ae0170f0cd3)
  - [cPVAL Zorus Token Key](/docs/a3bdf78e-b4fd-499e-9e30-3eb49f6653cd)  
  - [cPVAL Zorus Uninstallation Password](/docs/a5be5729-cb20-4ab6-834e-d18d361cee97) 
- Create the following Scripts:
  - [Zorus Deployment](/docs/da444ba9-ae51-48f8-8913-35f206579b04) 
  - [Uninstall Zorus Agent](/docs/8e9cb6d7-76ed-41b1-999b-e7178007c77b)
- Create the following Compound Conditions:
  - [Zorus Deployment Workstations](/docs/cf3c9ade-4a3b-42b5-9a79-13235dde86ee)
  - [Zorus Deployment Servers](/docs/65acbc53-b954-4c02-b397-9d4c641e759c)
  - [Uninstall Zorus](/docs/0b345a9b-c5ef-4f3b-8f47-cc87a736432a)

## Changelog

### 2026-05-27

- Initial version of the document