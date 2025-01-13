---
id: 'cwa-user-session-audit'
title: 'User Session Audit Dataview'
title_meta: 'User Session Audit Dataview'
keywords: ['user', 'session', 'audit', 'dataview', 'agent', 'computer', 'status', 'location', 'client', 'logon']
description: 'This document provides an overview of the User Session Audit Dataview, detailing the information displayed about existing user sessions on audited machines, as well as the dependencies and columns involved in the dataview.'
tags: ['audit', 'dataview', 'agent', 'computer', 'status', 'location', 'client', 'logon']
draft: false
unlisted: false
---
## Summary

This dataview displays information about existing user sessions on audited machines.

The information that this dataview displays is populated into the custom table `@plugin_proval_usersessions` by the script `@User Session Audit`.

## Dependencies

- `@plugin_proval_usersessions` -- Table
- `@User Session Audit [DV]` -- Script

## Columns

| Column                       | Description                                                                                   |
|------------------------------|-----------------------------------------------------------------------------------------------|
| Client                       | Client Name                                                                                  |
| Location                     | Location Name                                                                                |
| Computer Name                | Computer Name                                                                                |
| User                         | Last logged in user                                                                          |
| Agent Type                   | Information about whether workstation, laptop or Server.                                     |
| Agent Asset Tag              | Asset tag information if found                                                                |
| Friendly Name                | Friendly name information of the agent if provided.                                          |
| Manufacturer                 | Manufacturer of the computer                                                                  |
| Agent OS                     | Operating System information of the agent.                                                  |
| OS Version                   | OS version of the agent                                                                       |
| Status                       | Ensure whether agent is online or offline.                                                  |
| Master PC                    | Info about whether agent is Master PC or not.                                               |
| Probe PC                     | Info about whether agent is Probe or not.                                                   |
| Logged in User               | Detail list of all logged in user on the agent during dependent script ran.                 |
| Session State                | This provides info about whether the logged in user is active or disconnected.              |
| Logon Date                   | The last logon date of the user.                                                             |
| Session Length (Minute)      | The active session duration of the user.                                                    |
| Timestamp                    | The script ran date and time.                                                                |
| Contact (All possible Column) | It has all possible contact details in the script such as contact email, password set, last name, first name etc. |
| Location (All Possible Column) | This dataview has all possible location details such as location address, location phone number etc. |
| Client (All Possible Column) | It contains all possible client details such as client city, client phone etc.              |
| Computer (All Possible Column)| It contains all possible computer details such as Computer OS Build, Type, Manufacturer etc. |


