---
id: 'cwa-login-bug-monitor'
title: 'Login Bug Monitor for EPM'
title_meta: 'Login Bug Monitor for EPM'
keywords: ['monitor', 'login', 'issue', 'reboot', 'agent']
description: 'This document outlines the Login Bug Monitor designed to detect agents with login issues that have not been rebooted for over 7 days, as part of the EPM - Windows Configuration solution. It includes dependencies, target information, ticketing details, and alert templates.'
tags: ['monitoring', 'ticketing', 'alert', 'global', 'epm', 'windows']
draft: false
unlisted: false
---
## Summary

This internal monitor is a part of [EPM - Windows Configuration - Solution - User Prompt for Reboot](https://proval.itglue.com/DOC-5078775-9088563) and is designed to detect the agents with Login Bug Issues. It has been more than 07 days since its detection, and the machine has still not been rebooted.

## Dependencies

[EPM - Windows Configuration - Solution - User Prompt for Reboot](https://proval.itglue.com/DOC-5078775-9088563)

## Target

This Monitor is a Global Monitor.

## Ticketing

**Subject:** `Login Bug Issue detected on %COMPUTERNAME%/%CLIENTNAME%`

**Body:** `It has been over 7 days since the Login Bug Issue was identified on %COMPUTERNAME%/%CLIENTNAME%. The machine has not yet been rebooted. Please proceed with a manual reboot at your earliest convenience, as this machine is currently in need of a Reboot. Thank you...!!`

## Alert Template

`△ Custom - Ticket Creation - Computer`



