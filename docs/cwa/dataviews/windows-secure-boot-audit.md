---
id: '380e59d8-81c8-41e8-a117-ee55867cd324'
slug: /380e59d8-81c8-41e8-a117-ee55867cd324
title: 'Windows Secure Boot Audit [Role]'
title_meta: 'Windows Secure Boot Audit [Role]'
keywords: ['audit','bios','certificates','secureboot','windows']
description: 'Dataview to display the status of certificate and configurations needed for secure boot'
tags: ['bios','certificates','secureboot','windows']
draft: false
unlisted: false
---

## Summary

This dataview displays the status of key certificate and configurations that will be needed before the current secure boot certificates expire. The current expiration is scheduled for June 2026.

## Dependencies

[Windows Secure Boot](/docs/263a9e69-95ea-4189-b4c7-f2be7f074872)
[Windows Telemetry](/docs/53371c3c-92ce-468b-8017-cacce1921b26)
[Windows DB Certificate](/docs/046378db-8236-470b-b6d3-dc6955a19e9a)
[Windows KEK Certificate](/docs/22cf1518-f97f-49cd-a95d-7ea1816714a7)

## Columns

| Column                  | Description                                     |
| ----------------------- | ----------------------------------------------- |
| Client                  | Client name of an agent                         |
| Location                | Location name of an agent                       |
| Computer                | Agent name                                      |
| OS                      | Operating system of the agent                   |
| Last Contact            | Date an time of last agent checkin              |
| Secure Boot             | Status of secure boot (enabled/disabled)        |
| Windows Telemetry       | Status of Windows Telemetry (enabled/disabled)  |
| Windows DB Certificate  | Status of DB certificate (updated/out of date)  |
| Windows KEK Certificate | Status of KEK certificate (updated/out of date) |