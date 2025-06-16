---
id: '31025444-7b65-4fa5-9ca3-89d2f5b06a55'
slug: /31025444-7b65-4fa5-9ca3-89d2f5b06a55
title: 'Devices Opted for Network Adapter Solution'
title_meta: 'Devices Opted for Network Adapter Solution'
keywords: ['DHCP','windows','networking','Protocol','IPV4','IPv6','Script','Automate']
description: 'This group contains the machines where `Enable Network Adapter Solution` custom filed is opted and Action Custom field is not set to `Enable Network Adapter Solution` at client, Site or endpoint level'
tags: ['windows','networking']
draft: False
unlisted: false
---

## Summary
This group contains the machines where `Enable Network Adapter Solution` custom filed is opted and Action Custom field is not set to `Enable Network Adapter Solution` at client, Site or endpoint level

## Dependencies

- [Manage - Network Adapter Solutions Custom Field](/docs/97f24a5e-9b01-4a3c-8288-0aef911bf2ad)
- [Task - Manage - Network Adapter Protocols](/docs/97f24a5e-9b01-4a3c-8288-0aef911bf2ad)

## Details

| Field Name                 | Type of Field (Machine or Organization) | Description                                                                                                                                                                                                                                                                                                                                                                         |
|----------------------------|-----------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Devices Opted for Network Adapter Solution    | Dynamic Group | This group contains the machines where `Enable Network Adapter Solution` custom field is opted and Action Custom field is not set to `Enable Network Adapter Solution` at client, Site or endpoint level. |

## Group Creation

### 1. Create Dynamic Groups:

![Create Dynamic Groups](../../../static/img/docs/9be930d0-0f3e-40c2-8135-3a77e59a1e9e/image_1.webp)

### 2. Reboot Pending Servers

![Reboot Pending Servers](../../../static/img/docs/31025444-7b65-4fa5-9ca3-89d2f5b06a55/image1.webp)

**Criteria:**

- `Enable Network Adapter Solution` custom field equals True.
- `OS` does not not contains unsupported machines.
- The agent available equals True.
- `Action(Site)` does not contain `Exclude From the Solution`
- `Action(Endpoint)` does not contain `Exclude From the Solution`