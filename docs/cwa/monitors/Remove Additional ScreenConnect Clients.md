---
id: 'cwa-remove-additional-screenconnect-clients'
title: 'Remove Additional ScreenConnect Clients'
title_meta: 'Remove Additional ScreenConnect Clients'
keywords: ['screenconnect', 'monitor', 'client', 'edf', 'detection', 'removal']
description: 'This document outlines how to identify and remove additional ScreenConnect clients installed on Windows machines. It details the process of activating the monitor set for clients and excluding specific locations or computers from detection, ensuring a streamlined management of ScreenConnect instances.'
tags: ['monitoring', 'client', 'screenconnect', 'edf', 'removal']
draft: false
unlisted: false
---
## Summary

The monitor set identifies Windows machines with additional ScreenConnect clients installed. Additional ScreenConnect clients are those not installed from the integrated instance or from whitelisted instances, which are stored in the client-level EDF `Other Permitted SC Instances`.

To activate the monitor set for a client, mark the client-level EDF `Remove Additional SC Clients`. Similarly, to exclude a location or computer from the monitor set's detection, mark the location and computer level EDFs `Exclude - Additional SC Removal` respectively.

## Dependencies

[CWM - Automate - Script - Remove - All But My - ScreenConnect Client Installations](https://proval.itglue.com/DOC-5078775-14767921)

## Target

Global

## Alert Template

**Name:** `△ Custom - Remove Additional ScreenConnect Clients`

