---
id: '838ecfa5-0526-4c5d-845a-be4f21898c86'
slug: /838ecfa5-0526-4c5d-845a-be4f21898c86
title: 'Windows Search Protocol Registry Key Audit ScriptRole'
title_meta: 'Windows Search Protocol Registry Key Audit ScriptRole'
keywords: ['workaround', 'vulnerability', 'windows', 'search', 'protocol', 'monitor', 'script', 'tracking']
description: 'This document provides a detailed overview of the dataview that tracks the progress of the Workaround for the Windows Search Protocol Vulnerability script and monitor set. It outlines the necessary dependencies and describes the various columns used in the tracking process.'
tags: ['setup', 'vulnerability', 'windows']
draft: false
unlisted: false
---

## Summary

This dataview tracks the progress of the [Workaround - Windows Search Protocol Vulnerability [Param][Autofix][DV]](/docs/af9266ed-a796-49b5-b497-944836e23b8c) script and [ProVal - Development - Workaround - Windows Search Protocol Vulnerability [G]](/docs/d097987d-79c7-4a2f-a57a-ed959c676b20) monitor set.

## Dependencies

- [Search-MS Registry Key](/docs/174939f4-d7d5-4c92-9813-308db2c2b0c3)
- [ProVal - Development - Workaround - Windows Search Protocol Vulnerability [G]](/docs/d097987d-79c7-4a2f-a57a-ed959c676b20)
- [Workaround - Windows Search Protocol Vulnerability [Param][Autofix][DV]](/docs/f6426cb7-b51d-4acb-a602-8fb620474a97)
- [Windows Search Protocol Vulnerability - Workarounds](/docs/4af66a7d-ddf7-485c-b284-b73a2a5d2de1)

## Columns

| Column                        | Description                                                                                           |
|-------------------------------|-------------------------------------------------------------------------------------------------------|
| computerid                    | Unique identifier for the computer.                                                                  |
| Client Name                   | Name of the client.                                                                                  |
| Location Name                 | Name of the location.                                                                                 |
| Computer Name                 | Name of the computer.                                                                                 |
| Operating System              | Operating system installed on the computer.                                                          |
| lastcontact                   | Last contact time with the computer.                                                                  |
| Search-MS Registry Status      | Value of the script state; indicates the Search-MS Registry Status.                                   |
| Search-MS Registry Key Role    | Indicates whether the role is active, inactive, or has never been detected. Active: The registry key is currently present on the computer. Inactive: The registry key was once present on the computer, but the script has removed it. Not Detected: Either the registry key was not present on the computer from the beginning or the computer is not accepting the role. |