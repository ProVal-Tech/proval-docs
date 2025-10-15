---
id: '9b37f47d-5f34-410c-b091-e12e22d0d6f6'
slug: /9b37f47d-5f34-410c-b091-e12e22d0d6f6
title: 'QuickPass Uninstallation'
title_meta: 'QuickPass Uninstallation'
keywords: ['quickpass','installation','windows','script']
description: 'This script can be used to silently remove the QuickPass Agent from Windows machines.'
tags: ['software','ticketing','windows']
draft: False
unlisted: false
---

## Summary
This script can be used to silently remove the QuickPass Agent from Windows machines.

## Sample Rum

![Sample Run](../../../static/img/docs/9b37f47d-5f34-410c-b091-e12e22d0d6f6/image1.webp)

## Output
- Script Logs
- Ticketing


## Ticketing

Tickets will be generated only if the `TicketCreationCategory` value is greater than 0. Make sure to use the correct `TicketCreationCategory` to direct the tickets to the right board.

**Subject:** `QuickPass Uninstallation Failed for %ClientName%\%ComputerName% at %LocationName%`

**Ticket Body:** `Failed to uninstall QuickPass agent` .
 `Command Result: %shellresult%`