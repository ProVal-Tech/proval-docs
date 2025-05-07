---
id: 'b1c9c471-676c-4bd6-a2a0-c1417a5b4169'
slug: /b1c9c471-676c-4bd6-a2a0-c1417a5b4169
title: 'Monitor - Unmapped Monitors in CWM'
title_meta: 'Monitor - Unmapped Monitors in CWM'
keywords: ['monitors', 'tickets', 'connectwise', 'report', 'serviceboard']
description: 'This document provides a detailed overview of a dataview that lists all monitors in the ConnectWise environment that are uncategorized. It highlights the implications for ticket routing to the default board and the importance of ensuring proper ticket management in ConnectWise Manage.'
tags: ['connectwise', 'report', 'ticketing']
draft: false
unlisted: false
---

## Summary

This dataview shows all monitors in the environment that are uncategorized, indicating which monitors will send tickets to the default board. This data is useful to ensure that tickets are being routed to the proper board in ConnectWise Manage.

## Dependencies

The ConnectWise Manage Plugin must be installed and configured with imported service boards.

## Columns

| Column          | Description                                                                                             |
|-----------------|---------------------------------------------------------------------------------------------------------|
| Monitor Name    | The name of the monitor                                                                                 |
| Monitor Type    | The type of monitor that is unmapped (Remote | Internal)                                              |
| Ticket Category  | The current ticket category assigned to the monitor, or if the monitor category is Not Set              |
| Description     | The description of the ticket category                                                                  |
| Service Board   | The service board the ticket category is mapped to (This should be blank if the filters are working properly) |
| Priority        | The priority the ticket category is mapped to in ConnectWise Manage (This should be blank if the filters are working properly) |
| Service Type    | The service type the ticket category is mapped to in ConnectWise Manage (This should be blank if the filters are working properly) |
| Sub Type        | The sub-type the ticket category is mapped to in ConnectWise Manage (This should be blank if the filters are working properly) |
| Item            | The item the ticket category is mapped to in ConnectWise Manage (This should be blank if the filters are working properly) |
| Work Type       | The work type the ticket category is mapped to in ConnectWise Manage (This should be blank if the filters are working properly) |

