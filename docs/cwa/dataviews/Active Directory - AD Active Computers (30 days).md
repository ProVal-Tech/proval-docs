---
id: '57536cce-bb4f-4ece-a29f-cdad67f4a870'
title: 'Active Directory - AD Active Computers (30 days)'
title_meta: 'Active Directory - AD Active Computers (30 days)'
keywords: ['active', 'computers', 'directory', 'ad', 'last', 'logged', 'days']
description: 'This document provides a summary of a dataview that displays a list of active computers in Active Directory that have logged in within the last 30 days. It includes details about dependencies, columns, and descriptions of each data point.'
tags: ['active-directory', 'networking', 'report', 'windows']
draft: false
unlisted: false
---

## Summary

This dataview shows the list of active computers in Active Directory that have last logged in within the last 30 days.

## Dependencies

The Active Directory plugin must be installed and configured properly to detect machines.

## Columns

| Column                     | Description                                             |
|---------------------------|---------------------------------------------------------|
| Client                     | Displays the name of the client                        |
| Location                   | Displays the name of the location                      |
| Domain Name                | Displays the name of the domain                        |
| Domain Controller          | Displays the name of the Domain Controller              |
| Computer Name              | Displays the name of the computer                      |
| OS                         | Displays the OS installed on the machine                |
| Last Contact With RMM      | Displays the description of the machine if any details are available |
| Last Logon                | Displays the last login date and time                  |



