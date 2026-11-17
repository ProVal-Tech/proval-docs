---
id: '5fb04030-9205-438e-8076-afcb74bce288'
slug: /5fb04030-9205-438e-8076-afcb74bce288
title: 'Intune Enrollment Status [Role]'
title_meta: 'Intune Enrollment Status [Role]'
keywords: ['intune', 'enrollment', 'entra', 'joined', 'role', 'audit', 'dataview']
description: 'This dataview shows the Intune enrollment status and Entra join status of Windows agents, based on the IntuneEnrolled and Microsoft - Entra Joined roles.'
tags: ['auditing', 'security', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-11-13
---

## Summary

This dataview shows whether each Windows agent is enrolled in Intune and joined to Entra. Use it to find Entra joined devices that are not yet enrolled in Intune.

## Dependencies

- [Role - IntuneEnrolled](/docs/ec741594-23b2-4d0c-bf8d-337eefb44e83)
- [Role - Microsoft - Entra Joined](/docs/4da626c5-0cec-454e-a517-fc7bf22f80f2)
- [Solution - Intune Enrollment for Entra Joined Devices](/docs/7446369f-7970-49d6-9edd-ac68378165b6)

## Columns

| Column          | Description                                                                                                        |
| --------------- | ------------------------------------------------------------------------------------------------------------------ |
| Client          | Client name of the agent                                                                                           |
| Location        | Location name of the agent                                                                                         |
| Computer        | Computer name of the agent                                                                                         |
| OS              | Operating system of the agent                                                                                      |
| LastContact     | Date and time the agent last checked in with Automate                                                              |
| Intune Enrolled | Shows whether the agent is enrolled in Intune, as detected by the [IntuneEnrolled](/docs/ec741594-23b2-4d0c-bf8d-337eefb44e83) role |
| Entra Joined    | Shows whether the agent is Entra joined, as detected by the [Microsoft - Entra Joined](/docs/4da626c5-0cec-454e-a517-fc7bf22f80f2) role |

## Changelog

### 2026-11-13

- Initial version of the document
