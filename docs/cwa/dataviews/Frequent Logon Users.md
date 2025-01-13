---
id: 'cwa-stitching-frequent-logon-user'
title: 'Stitching Frequent Logon User Data'
title_meta: 'Stitching Frequent Logon User Data'
keywords: ['logon', 'user', 'script', 'data', 'workstation']
description: 'This document provides an overview of the dataview that stores logon username, logon user count, and script run date data detected via the script for Windows Workstations. It details the dependencies and the columns included in the dataview.'
tags: ['database', 'report', 'windows', 'configuration', 'client']
draft: false
unlisted: false
---
## Summary

This dataview stores the logonusername, logonusercount, and script run date data detected via script [CWM - Automate - Script - Stitching Frequent Logon User (Set Computer Contact)](https://proval.itglue.com/DOC-5078775-16300164) of the Windows Workstations.

## Dependencies

[CWM - Automate - Script - Stitching Frequent Logon User (Set Computer Contact)](https://proval.itglue.com/DOC-5078775-16300164)

## Columns

| Column                        | Description                                                                                                           |
|-------------------------------|-----------------------------------------------------------------------------------------------------------------------|
| Client                        | Client Name of the agent.                                                                                            |
| Location                      | Location Name of the agent.                                                                                          |
| Computer                      | Computer Name of the agent.                                                                                          |
| Operating System              | The operating system name of the agent.                                                                              |
| LastContact                   | Last contact of the agent with the CW Automate.                                                                     |
| Frequent Logon User Name      | Frequent logon user name detected by the script [CWM - Automate - Script - Stitching Frequent Logon User (Set Computer Contact)](https://proval.itglue.com/DOC-5078775-16300164). |
| Frequent Logon User Count      | Frequent logon user count number detected by the script [CWM - Automate - Script - Stitching Frequent Logon User (Set Computer Contact)](https://proval.itglue.com/DOC-5078775-16300164). |
| Script Ran Date               | Script last ran date to show when the last user was detected.                                                       |



