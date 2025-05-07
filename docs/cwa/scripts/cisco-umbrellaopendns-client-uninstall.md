---
id: '98d2c1fc-cac4-41a6-b0e4-29f7eb813197'
slug: /98d2c1fc-cac4-41a6-b0e4-29f7eb813197
title: 'Cisco UmbrellaOpenDNS Client - Uninstall'
title_meta: 'Cisco UmbrellaOpenDNS Client - Uninstall'
keywords: ['opendns', 'umbrella', 'client', 'uninstall', 'ticket']
description: 'This document provides a detailed overview of a script designed to silently remove the OpenDNS Umbrella Roaming Client. It includes sample run visuals, global parameters, and process steps for effective uninstallation.'
tags: ['security', 'software', 'uninstallation']
draft: false
unlisted: false
---

## Summary

This script can be used to silently remove the OpenDNS Umbrella Roaming Client.

## Sample Run

![Sample Run](../../../static/img/docs/98d2c1fc-cac4-41a6-b0e4-29f7eb813197/image_1.png)

#### Global Parameters

| Name            | Example | Required | Description                                                                                         |
|-----------------|---------|----------|-----------------------------------------------------------------------------------------------------|
| TicketCreation   | 1       | False    | If set to 1, a ticket will be created if the script fails to uninstall the OpenDNS Umbrella Client. |

## Process

- Import the script from the plugin.
- Schedule it on the agents where the OpenDNS Umbrella Client needs to be uninstalled.

## Output

- Script log
- Ticket

