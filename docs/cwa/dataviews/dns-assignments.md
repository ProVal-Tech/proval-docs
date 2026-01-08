---
id: '8e53a0ed-4b8a-4aec-9d92-99423964f53c'
slug: /8e53a0ed-4b8a-4aec-9d92-99423964f53c
title: 'DNS Assignments'
title_meta: 'DNS Assignments'
keywords: ['network', 'adapter', 'settings', 'dns', 'ipaddress', 'gateway', 'status']
description: 'This document provides a detailed overview of the active network adapter settings for devices, including information on IP addresses, gateways, and adapter types. It outlines the necessary dependencies and describes the columns used in the data display, offering insights into network configurations and statuses.'
tags: ['dns', 'networking']
draft: false
unlisted: false
---

## Summary

This document provides a display of a device's active network adapter and its associated settings.

## Dependencies

- [Custom Table - pvl_network_Adapter](/docs/5a5463d0-0ce3-4c09-bd41-39da28e16d0f)
- [Script - Get - DNS Assignments](/docs/3bf7ea38-4bea-426b-bc6d-f480ba0b895d)
- [Solution - DNS Assignments](/docs/6b898ed0-2dfd-447c-9a40-5cc9ce05ea9b)

## Columns

| Column          | Description                                          |
|-----------------|------------------------------------------------------|
| DateUpdated     | The date the data was updated.                       |
| ComputerID      | The computer ID                                      |
| Client Name     | The Client Name.                                     |
| Location Name   | The Location Name.                                   |
| Computer Name   | The Computer Name.                                   |
| PnPDeviceID     | The PnP Device ID as found on the target computer.  |
| Description      | The description of the network device.               |
| AdapterType     | The Adapter type.                                    |
| IpAddress       | The adapter IP address.                              |
| IPv6            | The adapter IPv6 address.                            |
| NetMask         | The Network mask for the adapter.                    |
| Gateway         | The gateway of the adapter.                          |
| Speed           | The speed of the adapter.                            |
| RoutingEnabled  | 0 or 1 depending on if routing is enabled.          |
| Mac             | The MAC address of the adapter if known.             |
| Status          | The adapter's current status.                        |
| DNS Type        | DHCP or Static.                                     |
| DHCPEnabled     | 0 or 1 depending on the DHCP enabled state.        |
| DNS Setting     | The current DNS setting in a comma-separated list.   |
| MTU             | The found MTU for the adapter.                       |
| Bytes Sent      | The number of bytes sent as seen on the adapter.     |
| Bytes Rec       | The number of bytes received on the adapter.         |