---
id: 'b1c9c471-676c-4bd6-a2a0-c1417a5b4169'
title: 'Uncategorized Monitors Report in ConnectWise'
title_meta: 'Uncategorized Monitors Report in ConnectWise'
keywords: ['monitors', 'tickets', 'connectwise', 'report', 'serviceboard']
description: 'This document provides a detailed overview of a dataview that lists all monitors in the ConnectWise environment that are uncategorized. It highlights the implications for ticket routing to the default board and the importance of ensuring proper ticket management in ConnectWise Manage.'
tags: ['connectwise', 'monitoring', 'report', 'ticketing', 'serviceboard']
draft: false
unlisted: false
---
## Summary

This dataview will show all monitors in the environment that are uncategorized. Indicating which monitors will send tickets to the default board. This data is useful to ensure that tickets are being routed to the proper board in CW Manage.

## Dependencies

ConnectWise Manage Plugin must be installed and configured with imported service boards.

## Columns

| Column          | Description                                                                                             |
|-----------------|---------------------------------------------------------------------------------------------------------|
| Monitor Name    | The name of the monitor                                                                                 |
| Monitor Type    | The type of monitor that is unmapped. (Remote | Internal)                                              |
| Ticket Category  | The current ticket category assigned to the monitor or if the monitor category is Not Set              |
| Description     | The description of the ticket category                                                                  |
| Service Board   | The service board the ticket category is mapped to (This should be blank if the filters are working properly) |
| Priority        | The priority the ticket category is mapped to in CW Manage (This should be blank if the filters are working properly) |
| Service Type    | The service type the ticket category is mapped to in CW Manage (This should be blank if the filters are working properly) |
| Sub Type        | The sub-type ticket category is mapped to in CW Manage (This should be blank if the filters are working properly) |
| Item            | The item the ticket category is mapped to in CW Manage (This should be blank if the filters are working properly) |
| Work Type       | The work type the ticket category is mapped to in CW Manage (This should be blank if the filters are working properly) |






