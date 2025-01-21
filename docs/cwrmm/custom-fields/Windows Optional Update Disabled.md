---
id: 'a2035a6f-bcbc-41a2-ace1-fc08b7ad2511'
title: 'Windows Optional Update Disabled Status'
title_meta: 'Windows Optional Update Disabled Status'
keywords: ['windows', 'update', 'disabled', 'endpoint', 'task']
description: 'This document explains how the status of Windows optional updates is stored when the Disable Windows Optional/Automatic Updates task is executed in ConnectWise RMM. It outlines the dependencies and details regarding the field that indicates whether the updates are disabled.'
tags: ['update']
draft: false
unlisted: false
---

## Summary

This document stores "Disabled" if the Windows optional update is disabled by the Disable Windows Optional/Automatic Updates task.

## Dependencies

[CW RMM - Task - Disable Windows Optional/Automatic Updates](<../tasks/Disable Windows OptionalAutomatic Updates.md>)

## Details

| Field Name                        | Level      | Type  | Default | Editable | Description                                                                                  |
|-----------------------------------|------------|-------|---------|----------|----------------------------------------------------------------------------------------------|
| Windows Optional Update Disabled   | EndPoint   | Text  | NA      | No       | This field stores "Disabled" if the Windows optional update is disabled by the Disable Windows Optional/Automatic Updates task. |

