---
id: 'cwa-active-computers-ad'
title: 'Active Computers in Active Directory'
title_meta: 'Active Computers in Active Directory - Dataview Summary'
keywords: ['active', 'computers', 'directory', 'ad', 'last', 'logged', 'days']
description: 'This document provides a summary of a dataview that displays a list of active computers in Active Directory that have logged in within the last 30 days. It includes details about dependencies, columns, and descriptions of each data point.'
tags: ['active-directory', 'report', 'windows', 'networking']
draft: false
unlisted: false
---
## Summary

This dataview shows the list of Active Computers in AD, which has last logged in within 30 days.

## Dependencies

The Active directory plugin must be installed and configured properly to detect machines.

## Columns

| Column                     | Description                                             |
|---------------------------|---------------------------------------------------------|
| Client                     | Displays the name of the client                        |
| Location                   | Displays the name of the location                      |
| DomainName                 | Displays the name of the domain                        |
| Domain Controller          | Display the name of the Domain Controller              |
| Computer Name              | Displays the name of the computer                      |
| OS                        | Display the OS installed on the machine                |
| Last Contact With RMM      | Displays the Description of the machine if anything is there |
| Last logon                | Displays the Last Login date and time                  |



