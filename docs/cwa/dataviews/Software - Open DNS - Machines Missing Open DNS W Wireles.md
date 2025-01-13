---
id: 'cwa-open-dns-dataview'
title: 'Open DNS Dataview for Endpoint Management'
title_meta: 'Open DNS Dataview for Endpoint Management'
keywords: ['open', 'dns', 'dataview', 'endpoint', 'management']
description: 'This document provides a dataview to identify machines with Open DNS (Umbrella Agent) installed and checks for the presence of a wireless network card. It aims to help in finding devices unnecessarily using Open DNS when configured at the router/firewall level. By identifying endpoints without wireless capabilities, organizations can reduce costs associated with the Open DNS solution.'
tags: ['networking', 'security', 'software', 'report', 'windows']
draft: false
unlisted: false
---
## Summary

This dataview will show machines that have Open DNS (Umbrella Agent) installed on their machines and it will also list if they have a wireless network card. The purpose of this dataview is to find devices using Open DNS unnecessarily. When Open DNS is configured at the router/firewall level it is unnecessary to have the Open DNS agent installed on the endpoint as the filtering will come from the router/firewall level. If an agent does not have a wireless card then it does not need to have Open DNS installed and the agent can be deprecated, reducing the overall cost of the Open DNS solution.

## Dependencies

None

## Columns

| Column        | Description                                                                                     |
|---------------|-------------------------------------------------------------------------------------------------|
| Client        | The name of the client                                                                          |
| Location      | The name of the location                                                                        |
| Computer      | The name of the endpoint                                                                        |
| Portable      | If the machine is a laptop or a desktop. (Portable = Laptop)                                   |
| Machine Type  | The type of machine. Server|Workstation|Mac|Linux                                              |
| Wireless card  | Will look to see if any of the cards connected to the endpoint are wireless compatible        |
| Umbrella Agent | If the Open DNS/Umbrella Agent is installed on the endpoint                                   |


