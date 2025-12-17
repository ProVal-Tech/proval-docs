---
id: '28bf69eb-dfb9-42c7-9ea8-7f906551da9c'
slug: /28bf69eb-dfb9-42c7-9ea8-7f906551da9c
title: 'Uninstall Ninja RMM Agent'
title_meta: 'Uninstall Ninja RMM Agent'
keywords: ['ninja-one', 'ninjarmm', 'agent', 'uninstall-ninja', 'remove-ninja', 'uninstall-ninjaone-agent']
description:  'The purpose of this solution is to uninstall Ninja RMM agent from windows machines.'
tags: ['uninstallation', 'application']
draft: false
unlisted: false
---

## Purpose

The purpose of this solution is to uninstall Ninja RMM agent from Windows machines. 

## Associated Content

| Content                                             | Type                                                      | Function                                               |
|-----------------------------------------------------|-----------------------------------------------------------|--------------------------------------------------------|
| [Uninstall NinjaOne Agent](/docs/1efc6b0c-bfd0-4d80-b4c5-e32defa31bc6)     | Script | Uninstalls the Ninja Rmm Agent|
| [cPVAL Uninstalled Ninja Agent ](/docs/fa1632f1-0fd8-4cc7-88da-7b2e20e122c0)     | Custom Field| This is populated by the [Uninstall NinjaOne Agent](/docs/1efc6b0c-bfd0-4d80-b4c5-e32defa31bc6) after the agent has been removed, providing confirmation that the uninstall process completed successfully |
| [cPVAL Uninstalled Ninja Agent](/docs/8e58201e-54e2-428d-b38e-d3aedb54ae47)     | Group | Contains the machines where Ninja RMM agent has  been successfully uninstalled by [Uninstall NinjaOne Agent](/docs/1efc6b0c-bfd0-4d80-b4c5-e32defa31bc6) |

## Implementation

- Create the [Custom Field : cPVAL Uninstall Ninja Agent ](/docs/fa1632f1-0fd8-4cc7-88da-7b2e20e122c0) using the implementation instruction provided in the document.  
- Create the [Script : Uninstall NinjaOne Agent](/docs/1efc6b0c-bfd0-4d80-b4c5-e32defa31bc6) using the implementation instruction provided in the document.
- Create the [Group : cPVAL Uninstalled Ninja Agent ](/docs/fa1632f1-0fd8-4cc7-88da-7b2e20e122c0)  using the implementation instruction provided in the document.
