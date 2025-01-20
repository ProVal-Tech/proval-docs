---
id: '678aae65-bd97-4ec6-812f-47b57018ec21'
title: 'Bitlocker Recovery Keys Dataview'
title_meta: 'Bitlocker Recovery Keys Dataview'
keywords: ['bitlocker', 'recovery', 'keys', 'dataview', 'endpoint']
description: 'This document provides a summary of a dataview that displays Bitlocker recovery keys collected by the Bitlocker - Key Retrieval script. It outlines dependencies, the columns included in the dataview, and their descriptions, helping users to understand the data presented.'
tags: ['database', 'report', 'security', 'windows']
draft: false
unlisted: false
---
## Summary

This dataview will display Bitlocker recovery keys that have been collected by the [Bitlocker - Key Retrieval](<../scripts/Bitlocker - Key Retrieval.md>) script.

## Dependencies

[Bitlocker - Key Retrieval](<../scripts/Bitlocker - Key Retrieval.md>)

## Columns

| Column        | Description                                                                                      |
|---------------|--------------------------------------------------------------------------------------------------|
| Client        | The name of the client                                                                           |
| Location      | The name of the location                                                                         |
| Computer Name | The name of the endpoint                                                                         |
| Drive Letter  | The drive letter that has been encrypted with Bitlocker                                         |
| Recovery Key  | The recovery key for Bitlocker                                                                   |
| Last Updated  | The last time that script was run to gather the data. Old LastUpdated dates may indicate outdated information. |














