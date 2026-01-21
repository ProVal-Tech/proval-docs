---
id: 'e30843b6-3891-4793-b1a2-f18a749ac4f5'
slug: /e30843b6-3891-4793-b1a2-f18a749ac4f5
title: 'cPVAL Network Adapter Details'
title_meta: 'cPVAL Network Adapter Details'
keywords: ['network','adapter']
description: 'Displays all custom fields related to the network adapter, including DHCP status, IP type, and DNS server addresses.'
tags: ['networking','auditing','windows']
draft: false
unlisted: false
---

## Summary

This device group displays all machines where the custom fields related to DHCP status, IP type, and DNS server addresses are populated.

## Details

| Name | Description |
| ---------- | ----------- |
| cPVAL Network Adapter Details | This device group displays all machines where the custom fields related to DHCP status, IP type, and DNS server addresses are populated. |

## Dependencies

- [cPVAL DNS Server](/docs/050b6b01-ec88-4c11-8e37-f5f34df0daa3)
- [cPVAL Dhcp Status](/docs/ce67cff7-8ff2-42a6-8b05-c9dc22bd3392)
- [cPVAL IP Type](/docs/9e7a6f5f-f8c7-483d-9b0a-c04dc10f7cb4)
- [Solution - Network Adapter Details](/docs/81d8fa31-72c7-4339-a107-4a41a3e489f5)

## Group Creation

[Group Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/groups/cpval-network-adapter-details.toml)

## Group View

Please follow the steps below to add the necessary custom fields to the view.

- Create the group and ensure it is saved successfully.
- Open the newly created group for editing.
- Navigate to the Table Settings option.
- Update the table layout to include the required custom fields.
- Save the changes to apply the updated group view.

## URL TO THE GUIDE

- [How-to Guide URL](/docs/71f3f71d-d6d1-4563-8476-92bbe9df55fa)

Below Custom fields that needs to add under the Group View:
 
 1. `cPVAL DNS Server`
 2. `cPVAL Dhcp Status`
 3. `cPVAL IP Type`

## Group Screenshot

This is how the group should looks like after adding the custom fields:

![Group View](../../../static/img/docs/e30843b6-3891-4793-b1a2-f18a749ac4f5/group%20View.webp)