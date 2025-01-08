---
id: 'cwa-active-directory-dataview'
title: 'Active Directory Dataview for Automate'
title_meta: 'Active Directory Dataview for Automate'
keywords: ['active-directory', 'automate', 'dataview', 'integration', 'agent']
description: 'This document provides a detailed overview of the Active Directory Dataview for Automate, including the columns displayed and the information retrieved from the Active Directory Plugin. It covers machine detection based on agent installation, last logon details, and more.'
tags: ['active-directory', 'integration', 'agent', 'report', 'software']
draft: false
unlisted: false
---
## Summary

This Dataview displays any machines found within the Active Directory integration if the Automate agent is installed on the machine or not. It also displays when the agent was installed, AD's last logon, last contact in RMM, etc. This Dataview pulls from the Active Directory Plugin. The active directory plugin must be installed and configured to properly detect this information.

## Columns

| Column                   | Description                                         |
|--------------------------|-----------------------------------------------------|
| Client                   | Displays the name of the client                     |
| Location                 | Displays the name of the location                   |
| AD Computer Name         | Displays the name of computer in AD                 |
| Operating System         | Display the name of the operating system            |
| Agent Installed          | Displays whether an agent is installed or not       |
| Agent Installed Date     | Displays the date when was agent installed          |
| Since Last AD Logon     | Displays the date Since Last AD Logon               |
| AD Last Login            | Displays the date of the AD last login              |
| LastContact With RMM     | Displays the last contact of the machine in RMM     |
| Last User Automate       | Displays the last user logged in if there is any    |
| ParentDN                | Displays if the ParentDN is enabled or disabled     |
| ObjectClasses            | Displays the object class of the machine            |
| ObjectType               | Displays the object type of the machine             |

