---
id: '678aae65-bd97-4ec6-812f-47b57018ec21'
slug: /678aae65-bd97-4ec6-812f-47b57018ec21
title: 'Windows - Bitlocker Recovery Keys'
title_meta: 'Windows - Bitlocker Recovery Keys'
keywords: ['bitlocker', 'recovery', 'keys', 'dataview', 'endpoint']
description: 'This document provides a summary of a dataview that displays Bitlocker recovery keys collected by the Bitlocker - Key Retrieval script. It outlines dependencies, the columns included in the dataview, and their descriptions, helping users to understand the data presented.'
tags: ['database', 'report', 'security', 'windows']
draft: false
unlisted: false
---

## Summary

This dataview displays Bitlocker recovery keys that have been collected by the [Bitlocker - Key Retrieval](/docs/bc22877d-262a-47f7-8d2f-7e69f07c92e5) script.

## Dependencies

[Bitlocker - Key Retrieval](/docs/bc22877d-262a-47f7-8d2f-7e69f07c92e5)

## Columns

| Column        | Description                                                                                      |
|---------------|--------------------------------------------------------------------------------------------------|
| Client        | The name of the client                                                                           |
| Location      | The name of the location                                                                         |
| Computer Name | The name of the endpoint                                                                         |
| Drive Letter  | The drive letter that has been encrypted with Bitlocker                                         |
| Recovery Key  | The recovery key for Bitlocker                                                                   |
| Last Updated  | The last time that the script was run to gather the data. Old Last Updated dates may indicate outdated information. |


