---
id: '813b9d8d-8c30-4595-a700-740fd65b3942'
slug: /813b9d8d-8c30-4595-a700-740fd65b3942
title: 'Automation Time Saved Initialize'
title_meta: 'Automation Time Saved Initialize'
keywords: ['customfields', 'automation', 'database', 'implementation', 'tracking']
description: 'This document provides a detailed overview of the process to set both Custom Fields (CFs) to 0 for ease of implementation. It includes an example agent procedure log, dependencies, and the output expected from this process.'
tags: ['database', 'setup']
draft: false
unlisted: false
---

## Summary

This document outlines the process of setting both Custom Fields (CFs) to 0.

## Example Agent Procedure Log

| Time                      | Action                                | Status                                       | User                          |
|---------------------------|---------------------------------------|----------------------------------------------|-------------------------------|
| 2:55:31 pm 18-Oct-22      | Automation Time Init                  | Success THEN                                 | provaltech.com/dan.hicks     |
| 2:55:24 pm 18-Oct-22      | Run Now - Automation Time Init        | Admin provaltech.com/dan.hicks scheduled procedure Run Now - Automation Time Init to run at Oct 18 2022 2:55 PM |

## Dependencies

- [VSA - VSA Configuration - Solution - Automation Time Saved Tracking](<../../solutions/Automation Time Saved Tracking.md>)

## Process

The process involves setting both CFs to 0 for ease of implementation, as empty Custom Fields cannot be polled with Database Views.

## Output

The expected output is the updated Custom Fields.



