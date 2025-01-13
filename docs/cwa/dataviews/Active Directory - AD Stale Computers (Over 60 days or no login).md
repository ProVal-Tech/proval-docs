---
id: 'cwa-active-directory-dataview'
title: 'Active Directory Dataview for Automate'
title_meta: 'Active Directory Dataview for Automate'
keywords: ['automate', 'active', 'directory', 'dataview', 'monitoring', 'endpoint']
description: 'This document details a dataview that displays data from Automate and the Active Directory Plugin, focusing on the last contact status of agents. It assists in verifying if a machine is offline by checking its last communication with either system.'
tags: ['active-directory', 'monitoring', 'report', 'update', 'software']
draft: false
unlisted: false
---
## Summary

This dataview will display data from Automate and the Active Directory Plugin. Specifically, data related to when an agent last contacted Automate or Active Directory. This dataview may help verify that a machine is offline if it is not checking in to either system.

## Dependencies

The active directory plugin must be installed, configuring, and updating properly.

## Columns

| Column                  | Description                                                                                                                       |
|------------------------|-----------------------------------------------------------------------------------------------------------------------------------|
| Client Name            | The name of the client                                                                                                           |
| Location Name          | The name of the location                                                                                                         |
| Domain                 | The name of the domain associated to the client in the Active Directory Plugin                                                   |
| Domain Controller      | The name of the Domain Controller associated with the Active Directory Plugin in Automate                                        |
| Computer Name          | The name of the endpoint that has not connected to Active Directory within the last 60 days. If the AD plugin and Automate have a matching SID, this should match the name of the device in Automate. |
| Operating System       | The detected Operating System in Active Directory                                                                                 |
| Last Contact with RMM  | If there is a matching SID in Automate, this column will display the last contact for the endpoint in Automate                     |
| Last Logon             | The last time the machine was seen online in Active Directory. If a machine has never logged into Active Directory Automate will display a default value. (Typically the year will be either 0001 or 1600) |



