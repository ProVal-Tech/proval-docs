---
id: 'cwa-global-dataview-windows-machines'
title: 'Global Dataview for Windows Machines'
title_meta: 'Global Dataview for Windows Machines'
keywords: ['windows', 'dns', 'umbrella', 'msp', 'licensing']
description: 'This document provides an overview of the Global Dataview that displays every Windows machine in the environment and indicates whether the Umbrella_RC service is installed, which suggests that Open DNS is being utilized. It aims to assist Managed Service Providers (MSPs) in optimizing their licensing and deployment of the Umbrella agent based on the machines’ connectivity and requirements.'
tags: ['windows', 'networking', 'security', 'report', 'setup']
draft: false
unlisted: false
---
## Summary

The Global dataview will show every Windows machine in the environment and if the machine has the Umbrella_RC service on the machine, implying that Open DNS is installed on that device.

Many MSPs set up OpenDNS on the LAN so all workstations connected via Ethernet (desktops) may not need the actual agent installed on the device because the network is handling the DNS filtering. The goal behind having this data is to remove agents where unnecessary or to find machines that might need the Umbrella agent so if that machine leaves the network it will still be protected. This should overall help with licensing and deciding how many licenses to provide for each client.

## Columns

| Column          | Description                                          |
|-----------------|------------------------------------------------------|
| Client          | Displays the name of the client                      |
| Location        | Displays the name of the location                    |
| Computer        | Displays the name of the computer                    |
| Portable        | Displays whether the machine is portable or a desktop|
| Machine Type    | Displays whether the machine is a workstation or a server |
| Wireless Card    | Displays whether the machine has a wireless card installed or not |
| Umbrella Agent  | Displays whether the machine has an umbrella agent installed |




