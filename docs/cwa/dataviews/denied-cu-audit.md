---
id: '63ec0e5f-417c-452b-88fd-1c95969ac25c'
title: 'Denied CU Audit'
title_meta: 'Denied CU Audit'
keywords: ['cu', 'cumulative', 'patches', 'denied', 'approval', 'hotfix', 'kb', 'devices']
description: 'This document provides a detailed overview of the denied cumulative updates within the environment, including relevant approval policies, hotfix IDs, and affected devices.'
tags: ['patching']
draft: false
unlisted: false
---

## Summary

This dataview displays the list of denied cumulative updates in the environment.

## Columns

| Column             | Description                                                      |
|--------------------|------------------------------------------------------------------|
| HotfixID           | Hotfix ID of the patch (Hidden)                                   |
| Title              | Title of the patch                                             |
| KB                 | KB ID of the patch                                              |
| Manufacturer       | Manufacturer of the patch                                       |
| Category           | Category of the patch                                          |
| Patching Stage     | Current patching stage of the patch (Test/Pilot/Production)    |
| Set By              | Describes who set the patch to denied state                     |
| Set Time           | Time of the patch denial                                        |
| Operating System   | Affected Operating System                                        |
| Approval Policy Count | Number of Approval Policies it is denied into.                |
| Approval Policies    | Name of the approval policies where the patch is denied          |
| Affected computers    | Number of devices on which this patch is denied                 |