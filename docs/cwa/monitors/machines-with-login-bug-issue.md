---
id: '9c3ebf70-921b-46e4-bdab-409e06e17a5f'
slug: /9c3ebf70-921b-46e4-bdab-409e06e17a5f
title: 'Machines with Login Bug Issue'
title_meta: 'Machines with Login Bug Issue'
keywords: ['monitor', 'login', 'issue', 'reboot', 'agent']
description: 'This document outlines the Login Bug Monitor designed to detect agents with login issues that have not been rebooted for over 7 days, as part of the EPM - Windows Configuration solution. It includes dependencies, target information, ticketing details, and alert templates.'
tags: ['ticketing', 'windows']
draft: false
unlisted: false
---

## Summary

This internal monitor is part of the [EPM - Windows Configuration - Solution - User Prompt for Reboot](/docs/32d2254e-c2a4-4f2d-a029-b74f6d3c8b1a) and is designed to detect agents with Login Bug Issues. It has been more than 7 days since the issue was detected, and the machine still has not been rebooted.

## Dependencies

[EPM - Windows Configuration - Solution - User Prompt for Reboot](/docs/32d2254e-c2a4-4f2d-a029-b74f6d3c8b1a)

## Target

This monitor is a global monitor.

## Ticketing

**Subject:** `Login Bug Issue detected on %COMPUTERNAME%/%CLIENTNAME%`

**Body:** `It has been over 7 days since the Login Bug Issue was identified on %COMPUTERNAME%/%CLIENTNAME%. The machine has not yet been rebooted. Please proceed with a manual reboot at your earliest convenience, as this machine is currently in need of a reboot. Thank you!`

## Alert Template

`△ Custom - Ticket Creation - Computer`
