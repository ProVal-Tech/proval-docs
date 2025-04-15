---
id: '485b29e0-cf9e-4933-846c-bb83b52b115d'
slug: /485b29e0-cf9e-4933-846c-bb83b52b115d
title: 'Denied Patch Audit'
title_meta: 'Denied Patch Audit'
keywords: ['patches', 'denied', 'approval', 'hotfix', 'kb', 'devices']
description: 'This document provides a detailed overview of the denied patches within the environment, including relevant approval policies, hotfix IDs, and affected devices.'
tags: ['patching']
draft: false
unlisted: false
---

## Summary

This dataview displays the list of denied patches in the environment.

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