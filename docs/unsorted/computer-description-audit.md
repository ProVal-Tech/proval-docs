---
id: '81645955-50e9-45e6-b635-e6780aefc390'
slug: /81645955-50e9-45e6-b635-e6780aefc390
title: 'Computer Description Audit'
title_meta: 'Computer Description Audit'
keywords: ['computer', 'description', 'report', 'sql', 'agent']
description: 'This document provides a detailed overview of the Computer Description Data Report, including its dependencies, columns, and SQL representation for fetching computer description messages set on agents within the RMM.'
tags: ['database', 'report', 'sql']
draft: true
unlisted: false
---

## Summary

This dataview will show the computer description message set on the agent.

## Dependencies

[Computer Description Data Report](/docs/065ba00b-a1d0-4c99-9d2f-e606e60867d8)

## Columns

| Column               | Description                                                       |
|----------------------|-------------------------------------------------------------------|
| Client Name          | Client Name of an agent                                           |
| Location Name        | Location Name of an agent                                         |
| Computer Name        | Agent Name                                                       |
| Last Contact         | Last contact of an agent with the RMM                           |
| Operating System     | Operating system of an agent.                                    |
| Computer Description  | Computer description set information message.                     |
| Script Execution Date | When the last script ran on the agent to fetch the computer description message read check. |
