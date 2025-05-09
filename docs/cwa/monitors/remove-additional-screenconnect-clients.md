---
id: '7803bfd7-52e0-482d-805a-29aca6cadf04'
slug: /7803bfd7-52e0-482d-805a-29aca6cadf04
title: 'Remove Additional ScreenConnect Clients'
title_meta: 'Remove Additional ScreenConnect Clients'
keywords: ['screenconnect', 'monitor', 'client', 'edf', 'detection', 'removal']
description: 'This document outlines how to identify and remove additional ScreenConnect clients installed on Windows machines. It details the process of activating the monitor set for clients and excluding specific locations or computers from detection, ensuring streamlined management of ScreenConnect instances.'
tags: ['screenconnect']
draft: false
unlisted: false
---

## Summary

The monitor set identifies Windows machines with additional ScreenConnect clients installed. Additional ScreenConnect clients are those not installed from the integrated instance or from whitelisted instances, which are stored in the client-level EDF `Other Permitted SC Instances`.

To activate the monitor set for a client, mark the client-level EDF `Remove Additional SC Clients`. Similarly, to exclude a location or computer from the monitor set's detection, mark the location and computer-level EDFs `Exclude - Additional SC Removal`, respectively.

## Dependencies

[CWM - Automate - Script - Remove - All But My - ScreenConnect Client Installations](/docs/50779f68-4329-4d15-b069-c50fcba00614)

## Target

Global

## Alert Template

**Name:** `△ Custom - Remove Additional ScreenConnect Clients`