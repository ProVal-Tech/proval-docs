---
id: 'ee9ae5d4-3ab4-462b-8d90-63a5604a18a4'
slug: /ee9ae5d4-3ab4-462b-8d90-63a5604a18a4
title: 'Software - Open DNS - Global Agent Audit'
title_meta: 'Software - Open DNS - Global Agent Audit'
keywords: ['windows', 'dns', 'umbrella', 'msp', 'licensing']
description: 'This document provides an overview of the Global Dataview that displays every Windows machine in the environment and indicates whether the Umbrella_RC service is installed, suggesting that OpenDNS is being utilized. It aims to assist Managed Service Providers (MSPs) in optimizing their licensing and deployment of the Umbrella agent based on the machines’ connectivity and requirements.'
tags: ['networking', 'report', 'security', 'setup', 'windows']
draft: false
unlisted: false
---

## Summary

The Global Dataview shows every Windows machine in the environment and indicates if the machine has the Umbrella_RC service installed, implying that OpenDNS is active on that device.

Many MSPs set up OpenDNS on the LAN, so all workstations connected via Ethernet (desktops) may not need the actual agent installed on the device because the network is handling the DNS filtering. The goal behind having this data is to remove agents where unnecessary or to identify machines that might need the Umbrella agent, ensuring that if those machines leave the network, they will still be protected. This should overall help with licensing and determining how many licenses to provide for each client.

## Columns

| Column          | Description                                          |
|-----------------|------------------------------------------------------|
| Client          | Displays the name of the client                      |
| Location        | Displays the name of the location                    |
| Computer        | Displays the name of the computer                    |
| Portable        | Displays whether the machine is portable or a desktop|
| Machine Type    | Displays whether the machine is a workstation or a server |
| Wireless Card    | Displays whether the machine has a wireless card installed or not |
| Umbrella Agent  | Displays whether the machine has an Umbrella agent installed |