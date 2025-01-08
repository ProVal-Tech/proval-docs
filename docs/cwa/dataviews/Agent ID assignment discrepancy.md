---
id: 'cwa-agent-name-changes'
title: 'Agent Name Change Tracker'
title_meta: 'Agent Name Change Tracker - Monitor Agent Name Changes'
keywords: ['agent', 'name', 'changes', 'monitor', 'tracker', 'computerid']
description: 'This document provides a dataview that displays information about agents that have changed their names five times or more in the last 30 days, including details such as computer ID, client name, location, and more.'
tags: ['report', 'windows', 'networking', 'performance']
draft: false
unlisted: false
---
## Summary

This dataview will show information on any Agent that has changed its name 5 times or more in the last 30 days. This data will be presented as one row per computerid.

## Columns

| Column                     | Description                                           |
|---------------------------|-------------------------------------------------------|
| Computerid                | Computerid                                           |
| Client Name               | Client Name                                          |
| Location Name             | Location Name                                        |
| Current Name              | Current Name                                         |
| Number of PC Name Changes | Total number of times the name has changed           |
| PCs Affected              | Record of all distinct names                         |
| Recent Change Date        | Recent Change Date                                   |
| Days Since Name Changed    | Days Since Name Changed for the last time           |
| MAC Address               | Current MAC Address                                  |
| IP Address                | Current Private IP Address                           |
| Serial Number             | Current Serial Number                                |
| Manufacturer              | Manufacturer                                         |
| Operating System          | Current Operating System                             |
| Last Contact              | Last Contact with RMM                                |
| Days Since Last Contact   | Days Since Last Contact                              |
| Last User                 | Last Logged In User                                  |


