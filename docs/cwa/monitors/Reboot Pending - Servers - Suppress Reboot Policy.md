---
id: 'cwa-monitor-suppress-reboot-alert'
title: 'Monitor for Suppress Reboot and Alert Behavior'
title_meta: 'Monitor for Suppress Reboot and Alert Behavior'
keywords: ['ticket', 'reboot', 'patch', 'server', 'alert']
description: 'This document outlines a monitor that creates a ticket for servers with the Suppress Reboot and Alert reboot behavior applied. It details how the monitor functions after a successful patch installation, replacing the default feature in the patch manager.'
tags: ['ticketing', 'monitoring', 'patch', 'server', 'alert']
draft: false
unlisted: false
---
## Summary

This monitor creates a ticket for the servers that has `Suppress Reboot and Alert` reboot behavior applied using any custom suppress reboot policy and shows reboot flag after a successful patch installation.

This is replacement for the default feature of `Suppress Reboot and Alert` in patch manager.

**Alert template -** △ Custom - Ticket Creation - Computer

## Dependencies

A reboot policy that has `Suppress Reboot and Alert` reboot behavior setup and applied to any computer.

## Target

Global - Should be run without explicitly defined targets.

## Ticketing

**Subject:**  
`SVR - Reboot Pending - %COMPUTERNAME%`

**Body:**  
**Failure:**  
The server %computername% is currently reporting that it is pending a reboot. Please schedule a time to reboot this server when possible.

**Success:**  
Server %COMPUTERNAME% is no longer reporting it is pending a reboot. Closing the ticket.



