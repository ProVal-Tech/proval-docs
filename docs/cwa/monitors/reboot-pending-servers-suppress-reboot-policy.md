---
id: '3cdacc81-3702-454d-b8db-7a1bd6cf5bd9'
slug: /3cdacc81-3702-454d-b8db-7a1bd6cf5bd9
title: 'Reboot Pending - Servers - Suppress Reboot Policy'
title_meta: 'Reboot Pending - Servers - Suppress Reboot Policy'
keywords: ['ticket', 'reboot', 'patch', 'server', 'alert']
description: 'This document outlines a monitor that creates a ticket for servers with the Suppress Reboot and Alert reboot behavior applied. It details how the monitor functions after a successful patch installation, replacing the default feature in the patch manager.'
tags: ['ticketing']
draft: false
unlisted: false
---

## Summary

This monitor creates a ticket for the servers that have the `Suppress Reboot and Alert` reboot behavior applied using any custom suppress reboot policy and shows the reboot flag after a successful patch installation.

This is a replacement for the default feature of `Suppress Reboot and Alert` in the patch manager.

**Alert template -** △ Custom - Ticket Creation - Computer

## Dependencies

A reboot policy that has `Suppress Reboot and Alert` reboot behavior set up and applied to any computer.

## Target

Global - Should be run without explicitly defined targets.

## Ticketing

**Subject:**  
`SVR - Reboot Pending - %COMPUTERNAME%`

**Body:**  
**Failure:**  
The server %COMPUTERNAME% is currently reporting that it is pending a reboot. Please schedule a time to reboot this server when possible.

**Success:**  
Server %COMPUTERNAME% is no longer reporting that it is pending a reboot. Closing the ticket.