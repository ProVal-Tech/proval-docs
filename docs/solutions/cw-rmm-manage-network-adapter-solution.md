---
id: '0d47f7f9-c0f9-42f1-9bc9-23b6d5cb6220'
slug: /0d47f7f9-c0f9-42f1-9bc9-23b6d5cb6220
title: 'Manage Network Adapter Solution'
title_meta: 'Manage Network Adapter Solution'
keywords: ['DHCP','windows','networking','Protocol','IPV4','IPv6','Script','Automate']
description: 'RMM version of Network Adapter Solution. It manages network protocols on Windows machines, including enabling, disabling, and configuring them to use DHCP.'
tags: ['windows','networking']
draft: False
unlisted: false
---

## Purpose

RMM version of Network Adapter Solution. It manages network protocols on Windows machines, including enabling, disabling, and configuring them to use DHCP.

## Associated Content

| Content                                             | Type                                                      | Function                                               |
|-----------------------------------------------------|-----------------------------------------------------------|--------------------------------------------------------|
| [Manage - Network Adapter Solutions Custom Field](/docs/97f24a5e-9b01-4a3c-8288-0aef911bf2ad)   | Custom Fields | Custom Fields required for the solution |
| [Dynamic Group - Devices Opted for Network Adapter Solution](/docs/31025444-7b65-4fa5-9ca3-89d2f5b06a55)    | Group | It contains the machines where `Enable Network Adapter Solution` is enabled|
| [Task - Manage - Network Adapter Protocols](/docs/97f24a5e-9b01-4a3c-8288-0aef911bf2ad)     | Task | It allows you to manage network protocols on Windows machines, |


## Implementation
- Import all the custom fields from [Manage - Network Adapter Solutions Custom Field](/docs/97f24a5e-9b01-4a3c-8288-0aef911bf2ad)  
- Create Dynamic Group [Dynamic Group - Devices Opted for Network Adapter Solution](/docs/31025444-7b65-4fa5-9ca3-89d2f5b06a55)  
- create the Custom Field [Task - Manage - Network Adapter Protocols](/docs/97f24a5e-9b01-4a3c-8288-0aef911bf2ad)  
