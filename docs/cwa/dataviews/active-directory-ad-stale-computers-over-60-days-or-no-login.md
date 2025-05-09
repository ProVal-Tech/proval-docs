---
id: '484df8a2-9bfd-4594-b0c7-5887542556a5'
slug: /484df8a2-9bfd-4594-b0c7-5887542556a5
title: 'Active Directory - AD Stale Computers (Over 60 days or no login)'
title_meta: 'Active Directory - AD Stale Computers (Over 60 days or no login)'
keywords: ['automate', 'active', 'directory', 'dataview', 'monitoring', 'endpoint']
description: 'This document details a dataview that displays data from Automate and the Active Directory Plugin, focusing on the last contact status of agents. It assists in verifying if a machine is offline by checking its last communication with either system.'
tags: ['active-directory', 'report', 'software', 'update']
draft: false
unlisted: false
---

## Summary

This dataview displays data from Automate and the Active Directory Plugin. Specifically, it presents information related to when an agent last contacted Automate or Active Directory. This dataview may help verify that a machine is offline if it is not checking in to either system.

## Dependencies

The Active Directory Plugin must be installed, configured, and updated properly.

## Columns

| Column                  | Description                                                                                                                                                                                                 |
|------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Client Name            | The name of the client.                                                                                                                                                                                    |
| Location Name          | The name of the location.                                                                                                                                                                                  |
| Domain                 | The name of the domain associated with the client in the Active Directory Plugin.                                                                                                                        |
| Domain Controller      | The name of the Domain Controller associated with the Active Directory Plugin in Automate.                                                                                                               |
| Computer Name          | The name of the endpoint that has not connected to Active Directory within the last 60 days. If the AD Plugin and Automate have a matching SID, this should match the name of the device in Automate.      |
| Operating System       | The detected Operating System in Active Directory.                                                                                                                                                         |
| Last Contact with RMM  | If there is a matching SID in Automate, this column will display the last contact for the endpoint in Automate.                                                                                           |
| Last Logon             | The last time the machine was seen online in Active Directory. If a machine has never logged into Active Directory, Automate will display a default value (typically the year will be either 0001 or 1600). |