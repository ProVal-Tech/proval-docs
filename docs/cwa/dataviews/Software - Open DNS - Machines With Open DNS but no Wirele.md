---
id: '9bb7d6a2-5e10-47d7-98cc-78b8e5cdd10c'
title: 'Audit Open DNS Machines without Wireless Card'
title_meta: 'Audit Open DNS Machines without Wireless Card'
keywords: ['audit', 'opendns', 'agent', 'wireless', 'msp']
description: 'This document provides a dataview to help Managed Service Providers (MSPs) audit machines that have the OpenDNS agent installed but lack a wireless card. It aims to assist in identifying unnecessary agents and determining the need for Umbrella agents, ultimately aiding in license management for clients.'
tags: ['client', 'location', 'computer', 'portable', 'machine', 'status', 'licensing']
draft: false
unlisted: false
---
## Summary

This dataview helps you audit machines with an Open DNS agent but no wireless card.

Many MSPs set up OpenDNS on the LAN so all workstations connected via Ethernet (desktops) may not need the actual agent installed on the device because the network is handling the DNS filtering. The goal behind having this data is to remove agents where unnecessary or to find machines that might need the Umbrella agent so if that machine leaves the network it will still be protected. This should overall help with licensing and deciding how many licenses to provide for each client.

## Columns

| Column          | Description                                    |
|-----------------|------------------------------------------------|
| Client          | Displays the name of the client                |
| Location        | Displays the location of the client            |
| Computer        | Displays the name of the computer              |
| Portable        | Displays whether the machine is a laptop or desktop |
| Machine Type    | Displays whether it's a server or a workstation |
| Wireless card    | Displays the wireless card status              |
| Umbrella Agent  | Displays the Umbrella agent status              |






