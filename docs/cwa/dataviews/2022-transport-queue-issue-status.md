---
id: 7479e987-3a7d-455d-a912-d5cfddb71c06
slug: /7479e987-3a7d-455d-a912-d5cfddb71c06
title: '2022 Transport Queue Issue Status'
title_meta: '2022 Transport Queue Issue Status'
keywords: ['email', 'flow', 'impact', 'exchange', 'server', 'status', 'monitoring']
description: 'This document provides a summary of agents where email flow has been impacted and subsequently corrected by the specified script. It includes details about the Exchange server, its location, operating system, and the status of email processing. This document is useful for monitoring email flow issues in Exchange environments.'
tags: ['email', 'exchange']
draft: false
unlisted: false
---

## Summary

This document displays agents where email flow has been impacted and corrected by the script [RSM - Exchange - Script - Exchange - Reset Scan Engine Version](/docs/f699ae53-3ba7-42bd-864d-a670aca7ab0b).

Reference:  
[Email Stuck in Exchange On-Premises Transport Queues](https://techcommunity.microsoft.com/t5/exchange-team-blog/email-stuck-in-exchange-on-premises-transport-queues/ba-p/3049447)

## Dependencies

[RSM - Exchange - Script - Exchange - Reset Scan Engine Version](/docs/f699ae53-3ba7-42bd-864d-a670aca7ab0b)

## Columns

| Column            | Description                                           |
|-------------------|-------------------------------------------------------|
| Client Name       | Client name of the Exchange server                    |
| Location Name     | Location name of the Exchange server                  |
| Computer Name     | Exchange server name                                  |
| Operating System   | Operating system of the Exchange server               |
| Last Contact      | Last contact of the server with RMM                   |
| Email Status      | Script status return: fixed, not fixed, or not impacted |