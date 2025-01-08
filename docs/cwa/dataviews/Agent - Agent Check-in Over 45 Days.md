---
id: 'cwa-agent-checkin-summary'
title: 'Agent Check-In Summary for RMM'
title_meta: 'Agent Check-In Summary for RMM'
keywords: ['agents', 'checkin', 'rmm', 'status', 'os', 'location', 'client', 'contact']
description: 'This document provides a comprehensive overview of agents that have not checked in for 45 days, detailing their status, operating system, and various attributes related to their location and client information.'
tags: ['report', 'status', 'windows', 'networking', 'performance']
draft: false
unlisted: false
---
## Summary

This dataview shows information about agents that have not checked in for 45 days.

## Columns

| Column                   | Description                                                                                     |
|-------------------------|-------------------------------------------------------------------------------------------------|
| Client Name             | Agent name                                                                                      |
| Location Name           | Location of the agent                                                                           |
| Computer Name           | Client name of the agent                                                                        |
| Agent Last Contact Date  | Agent last contact date with RMM                                                                |
| Agent Type              | Agent type whether laptop, workstation or server                                               |
| Days Since LC          | Days count since last contacted with RMM                                                       |
| Agent OS                | Agent operating system                                                                          |
| Status                  | Status of an agent whether offline or online                                                   |
| All Agent Detail        | This dataview has all computer detail including Agent manufacturer, Agent IP, MAC address etc. |
| All Location Detail     | This dataview has complete location detail including address, city detail, router address etc. |
| All Client Detail       | This dataview has detail of client brief description about city, state, country, geo time etc. |
| All Contact Detail      | Dataview contains all the contact detail of the agent such as email address, phone number, full name etc. |


