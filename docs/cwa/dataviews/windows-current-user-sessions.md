---
id: 'ea5d1545-a2d7-4c9e-a61e-b89e43da2b9c'
slug: /ea5d1545-a2d7-4c9e-a61e-b89e43da2b9c
title: 'Windows - Current User Sessions'
title_meta: 'Windows - Current User Sessions'
keywords: ['user', 'session', 'audit', 'dataview', 'agent', 'computer', 'status', 'location', 'client', 'logon']
description: 'This document provides an overview of the User Session Audit Dataview, detailing the information displayed about existing user sessions on audited machines, as well as the dependencies and columns involved in the dataview.'
tags: []
draft: false
unlisted: false
---

## Summary

This dataview displays information about existing user sessions on audited machines.

The information displayed in this dataview is populated into the custom table `@plugin_proval_usersessions` by the script `@User Session Audit`.

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
| Agent Type                   | Information about whether the agent is a workstation, laptop, or server.                     |
| Agent Asset Tag              | Asset tag information, if found                                                              |
| Friendly Name                | Friendly name information of the agent, if provided.                                         |
| Manufacturer                 | Manufacturer of the computer                                                                  |
| Agent OS                     | Operating System information of the agent.                                                  |
| OS Version                   | OS version of the agent                                                                       |
| Status                       | Indicates whether the agent is online or offline.                                            |
| Master PC                    | Information about whether the agent is a Master PC or not.                                   |
| Probe PC                     | Information about whether the agent is a Probe or not.                                       |
| Logged in User               | Detailed list of all logged-in users on the agent during the execution of the dependent script. |
| Session State                | Provides information about whether the logged-in user is active or disconnected.              |
| Logon Date                   | The last logon date of the user.                                                             |
| Session Length (Minutes)     | The active session duration of the user.                                                    |
| Timestamp                    | The date and time when the script was executed.                                             |
| Contact (All Possible Columns) | Contains all possible contact details in the script such as contact email, password set, last name, first name, etc. |
| Location (All Possible Columns) | This dataview includes all possible location details such as location address, location phone number, etc. |
| Client (All Possible Columns) | Contains all possible client details such as client city, client phone, etc.                 |
| Computer (All Possible Columns) | Contains all possible computer details such as Computer OS Build, Type, Manufacturer, etc.  |
