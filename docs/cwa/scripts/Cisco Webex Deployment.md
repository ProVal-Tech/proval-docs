---
id: 'cwa-cisco-webex-installation'
title: 'Cisco Webex Installation Script'
title_meta: 'Cisco Webex Installation Script for Windows Machines'
keywords: ['cisco', 'webex', 'installation', 'windows', 'script']
description: 'This document provides a detailed overview of a script designed to install User Based Cisco Webex on Windows machines, including sample runs, output logs, and ticketing information for installation failures.'
tags: ['installation', 'windows', 'ticketing', 'software']
draft: false
unlisted: false
---
## Summary

This script installs User Based Cisco Webex on Windows Machines.

## Sample Run

![Sample Run](../../../static/img/Cisco-Webex-Deployment/image_1.png)

## Output

- Script Logs
- Tickets

## Ticketing

The tickets will be generated only if TicketCreationCategory value is greater than 0. Make sure to use the correct ticketcreationcategory in order to direct the tickets to the right board.

Subject: `Cisco Webex Installation Failed for %ClientName%/%ComputerName% at %LocationName%`

Ticket Body: `Failed to install Cisco Webex.<br> Command Result: %shellresult%<br>`

when script fails to download the installer

`Failed to download Cisco Webex installer.<br>Please ensure that the following download URL is reachable from the computer: <br>[https://binaries.webex.com/WebexTeamsDesktop-Windows-Gold/Webex.msi](https://binaries.webex.com/WebexTeamsDesktop-Windows-Gold/Webex.msi)<br>`



