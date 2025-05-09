---
id: '03c01cc8-d3e1-4fcb-b816-3c4292cb747e'
slug: /03c01cc8-d3e1-4fcb-b816-3c4292cb747e
title: 'AD Agent List Report'
title_meta: 'AD Agent List Report'
keywords: ['active-directory', 'automate', 'dataview', 'integration', 'agent']
description: 'This document provides a detailed overview of the Active Directory Dataview for Automate, including the columns displayed and the information retrieved from the Active Directory Plugin. It covers machine detection based on agent installation, last logon details, and more.'
tags: ['active-directory', 'report', 'software']
draft: false
unlisted: false
---

## Summary

This Dataview displays any machines found within the Active Directory integration, regardless of whether the Automate agent is installed on the machine. It also shows when the agent was installed, Active Directory's last logon, last contact in RMM, and more. This Dataview pulls from the Active Directory Plugin, which must be installed and configured to properly detect this information.

## Columns

| Column                   | Description                                         |
|--------------------------|-----------------------------------------------------|
| Client                   | Displays the name of the client                     |
| Location                 | Displays the name of the location                   |
| AD Computer Name         | Displays the name of the computer in Active Directory |
| Operating System         | Displays the name of the operating system           |
| Agent Installed          | Displays whether an agent is installed or not       |
| Agent Installed Date     | Displays the date when the agent was installed      |
| Since Last AD Logon     | Displays the date since the last AD logon           |
| AD Last Login            | Displays the date of the last AD login              |
| Last Contact with RMM    | Displays the last contact of the machine in RMM     |
| Last User Automate       | Displays the last user logged in, if there is any   |
| Parent DN                | Displays whether the Parent DN is enabled or disabled |
| Object Classes           | Displays the object class of the machine            |
| Object Type              | Displays the object type of the machine             |
