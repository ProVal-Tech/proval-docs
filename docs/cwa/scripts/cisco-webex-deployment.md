---
id: 'e7c04bf5-d525-4755-a883-dd87a0a65909'
slug: /e7c04bf5-d525-4755-a883-dd87a0a65909
title: 'Cisco Webex Deployment'
title_meta: 'Cisco Webex Deployment'
keywords: ['cisco', 'webex', 'installation', 'windows', 'script']
description: 'This document provides a detailed overview of a script designed to install User-Based Cisco Webex on Windows machines, including sample runs, output logs, and ticketing information for installation failures.'
tags: ['installation', 'software', 'ticketing', 'windows']
draft: false
unlisted: false
---

## Summary

This script installs User-Based Cisco Webex on Windows machines.

## Sample Run

![Sample Run](../../../static/img/docs/e7c04bf5-d525-4755-a883-dd87a0a65909/image_1.webp)

## Output

- Script Logs
- Tickets

## Ticketing

Tickets will be generated only if the `TicketCreationCategory` value is greater than 0. Make sure to use the correct `TicketCreationCategory` to direct the tickets to the right board.

**Subject:** `Cisco Webex Installation Failed for %ClientName%/%ComputerName% at %LocationName%`

**Ticket Body:** `Failed to install Cisco Webex. Command Result: %shellresult%`

This occurs when the script fails to download the installer:

`Failed to download Cisco Webex installer. Please ensure that the following download URL is reachable from the computer: [https://binaries.webex.com/WebexTeamsDesktop-Windows-Gold/Webex.msi](https://binaries.webex.com/WebexTeamsDesktop-Windows-Gold/Webex.msi)`