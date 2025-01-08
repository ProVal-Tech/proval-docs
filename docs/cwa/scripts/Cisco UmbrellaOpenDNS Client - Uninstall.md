---
id: 'cwa-remove-opendns-umbrella-client'
title: 'Remove OpenDNS Umbrella Roaming Client'
title_meta: 'Remove OpenDNS Umbrella Roaming Client'
keywords: ['opendns', 'umbrella', 'client', 'uninstall', 'ticket']
description: 'This document provides a detailed overview of a script designed to silently remove the OpenDNS Umbrella Roaming Client. It includes sample run visuals, global parameters, and process steps for effective uninstallation.'
tags: ['uninstallation', 'software', 'configuration', 'security']
draft: false
unlisted: false
---
## Summary

This Script can be used for removing OpenDNS Umbrella Roaming Client silently.

## Sample Run

![Sample Run](5078775/docs/13948043/images/20091846)

#### Global Parameters

| Name            | Example | Required | Description                                                                                         |
|-----------------|---------|----------|-----------------------------------------------------------------------------------------------------|
| TicketCreation   | 1       | False    | If set to 1, then a ticket will be created if the script failed to uninstall the OpenDNS Umbrella Client |

## Process

- Import the script from the plugin.
- Schedule it on the agents where the OpenDNS Umbrella client is required to be uninstalled.

## Output

- Script log
- Ticket

