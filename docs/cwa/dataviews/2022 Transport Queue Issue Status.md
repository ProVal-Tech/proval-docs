---
id: 'cwa-email-impact-summary'
title: 'Email Flow Impact Summary'
title_meta: 'Email Flow Impact Summary'
keywords: ['email', 'flow', 'impact', 'exchange', 'server', 'status', 'monitoring']
description: 'This document provides a summary of agents where email flow has been impacted and subsequently corrected by the specified script. It includes details about the Exchange server, its location, operating system, and the status of email processing. Useful for monitoring email flow issues in Exchange environments.'
tags: ['exchange', 'monitoring', 'status', 'server', 'email']
draft: false
unlisted: false
---
## Summary

Displays agents where Email flow has been impacted and corrected by the script [RSM - Exchange - Script - Exchange - Reset Scan Engine Version](https://proval.itglue.com/DOC-5078775-9004743).

Ref:  
[https://techcommunity.microsoft.com/t5/exchange-team-blog/email-stuck-in-exchange-on-premises-transport-queues/ba-p/3049447](https://techcommunity.microsoft.com/t5/exchange-team-blog/email-stuck-in-exchange-on-premises-transport-queues/ba-p/3049447)

## Dependencies

[RSM - Exchange - Script - Exchange - Reset Scan Engine Version](https://proval.itglue.com/DOC-5078775-9004743)

## Columns

| Column            | Description                                           |
|-------------------|-------------------------------------------------------|
| Client Name       | Client name of the Exchange server                    |
| Location Name     | Location name of the Exchange server                  |
| Computer Name     | Exchange server name                                  |
| Operating System   | Operating system of the Exchange server               |
| LastContact       | Last contact of server with RMM                       |
| Email Status      | Script status return: fixed, not fixed or wasn't impacted |


