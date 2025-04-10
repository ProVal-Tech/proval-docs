---
id: '0dac9234-cf2a-4649-aab5-dfbc08c1765d'
slug: /0dac9234-cf2a-4649-aab5-dfbc08c1765d
title: 'Frequent Logon Users'
title_meta: 'Frequent Logon Users'
keywords: ['logon', 'user', 'script', 'data', 'workstation']
description: 'This document provides an overview of the dataview that stores logon username, logon user count, and script run date data detected via the script for Windows Workstations. It details the dependencies and the columns included in the dataview.'
tags: ['database', 'report', 'windows']
draft: false
unlisted: false
---

## Summary

This dataview stores the logon username, logon user count, and script run date data detected via the script [CWM - Automate - Script - Stitching Frequent Logon User (Set Computer Contact)](/docs/bef87782-0d9d-40f0-96c5-d30b589b57b4) for Windows Workstations.

## Dependencies

[CWM - Automate - Script - Stitching Frequent Logon User (Set Computer Contact)](/docs/bef87782-0d9d-40f0-96c5-d30b589b57b4)

## Columns

| Column                        | Description                                                                                                           |
|-------------------------------|-----------------------------------------------------------------------------------------------------------------------|
| Client                        | Client name of the agent.                                                                                            |
| Location                      | Location name of the agent.                                                                                          |
| Computer                      | Computer name of the agent.                                                                                          |
| Operating System              | The operating system name of the agent.                                                                              |
| Last Contact                  | Last contact of the agent with the CW Automate.                                                                     |
| Frequent Logon User Name      | Frequent logon user name detected by the script [CWM - Automate - Script - Stitching Frequent Logon User (Set Computer Contact)](/docs/bef87782-0d9d-40f0-96c5-d30b589b57b4). |
| Frequent Logon User Count      | Frequent logon user count number detected by the script [CWM - Automate - Script - Stitching Frequent Logon User (Set Computer Contact)](/docs/bef87782-0d9d-40f0-96c5-d30b589b57b4). |
| Script Ran Date               | Date when the script was last run, indicating when the last user was detected.                                     |


